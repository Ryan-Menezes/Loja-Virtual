<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	ClientAddress,
	ClientCard,
    Request as RequestModel
};
use App\Classes\Payment\PagSeguro;

class RequestController extends Controller{
	private $client;
	private $requestmodel;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
		
		$this->requestmodel = new RequestModel();
	}

	public function index(){;
		$request = new Request();

		$client = $this->client;

		$builder = $request->except('page');
		$limit = config('paginate.limit');
		$page = (($request->input('page') ?? 1) - 1) * $limit;
		$pages = ceil($client->requests->count() / $limit);

		$requests = $client->requests()->offset($page)->limit($limit)->get();

		return view('site.myaccount.requests.index', compact('client', 'requests', 'pages', 'builder'));
	}

    public function show($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        return view('site.myaccount.requests.show', compact('requestmodel'));
    }

	public function checkout($id){
		$requestmodel = $this->client->requests()->findOrFail($id);
		$client = $requestmodel->client;
		$address = $requestmodel->address;
		$payment = $requestmodel->payment;
		$products = $requestmodel->products;
		$shipping_types = [
			'PC' => PagSeguro::SHIPPING_PAC,
			'SX' => PagSeguro::SHIPPING_SEDEX,
			'PE' => PagSeguro::SHIPPING_ALT
		];
		$groups = [];
		$excludes = [];

		// Parcelas do cartão sem juros
		$installment_no_interest = 0;
		foreach($products as $product){
			$product = $product->product;

			if($product){
				$installment_no_interest += $product->installment_no_interest;
			}
		}

		if($installment_no_interest > 1){
			$groups['CREDIT_CARD'] = [
				'MAX_INSTALLMENTS_NO_INTEREST' => $installment_no_interest
			];
		}

		// Excluir meios de pagamento
		if(!config('store.payment.methods.credit_card')){
			$excludes['groups'][] = 'CREDIT_CARD';
		}

		if(!config('store.payment.methods.balance')){
			$excludes['groups'][] = 'BALANCE';
		}

		if(!config('store.payment.methods.bolet')){
			$excludes['groups'][] = 'BOLETO';
		}

		if(!config('store.payment.methods.deposit')){
			$excludes['groups'][] = 'DEPOSIT';
		}

		if(!config('store.payment.methods.debit_online')){
			$excludes['groups'][] = 'EFT';
		}

		// Desconto pelo método de pagamento
		$discount_percent = 0;
		foreach($products as $product){
			$product = $product->product;
			$discount = $product->discounts->where('installment', 1)->first();

			if($discount){
				$discount_percent += $discount->percent;
			}
		}

		if($discount_percent > 0){
			$discount_percent = number_format($discount_percent / $products->count(), 2, '.', '');

			$groups['BOLETO'] = [
				'DISCOUNT_PERCENT' => $discount_percent
			];

			$groups['DEPOSIT'] = [
				'DISCOUNT_PERCENT' => $discount_percent
			];

			$groups['EFT'] = [
				'DISCOUNT_PERCENT' => $discount_percent
			];
		}

		// Objeto do pagseguro
		$email = config('store.payment.credentials.pagseguro.email');
		$token = config('store.payment.credentials.pagseguro.token');
		$production = config('store.payment.production');

		$pagseguro = new PagSeguro($email, $token, !$production);

		$pagseguro->setReceiverEmail($email);
		$pagseguro->setCurrency('BRL');
		$pagseguro->setExtraAmount(-($requestmodel->payment->discount_cart + $requestmodel->payment->discount_installment + $requestmodel->payment->discount_coupon));
		$pagseguro->setNotificationURL(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
		$pagseguro->setReference($requestmodel->id);
		$pagseguro->setSender($client->name, $client->cpf, $client->telephone, $client->email);
		$pagseguro->setShippingAddress(true, $shipping_types[$payment->shipping_type], $payment->shipping_value, $address->postal_code, $address->street, $address->number, $address->district, $address->city, $address->state, $address->complement);

		// Produtos do pedido
		foreach($products as $product){
			$pagseguro->addItem(md5($product->id . $product->product->id), $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size, $product->price, $product->quantity);
		}

		$response = $pagseguro->checkout(route('site.myaccount.requests.show', ['id' => $requestmodel->id]), $groups, $excludes);
		
		$code = $response->code ?? null;
		return view('site.myaccount.requests.pagseguro.checkout.index', compact('requestmodel', 'code'));
	}
}