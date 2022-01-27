<?php
namespace App\Controllers\Site\MyAccount;

use Exception;
use Src\Classes\{
	Request,
	Controller,
    Validator
};
use App\Models\{
	Client,
	ClientAddress,
	ClientCard,
    Request as RequestModel
};

class MercadoPagoController extends Controller{
	private $client;
	private $requestmodel;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
		
		$this->requestmodel = new RequestModel();

		\MercadoPago\SDK::setAccessToken(config('store.payment.credentials.mercadopago.access_token'));
	}

	public function checkout($id){
		$requestmodel = $this->client->requests()->findOrFail($id);
        $preference = null;

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            // Verifica se a transação para este pedido já foi feita
            // if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
            //     return json_encode([
            //         'result'	=> false,
            //         'data' 		=> null
            //     ]);
            // }

            // Desconto por pagamento à vista
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount(1);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

            $discount_installment = 0;
            if($discount_percent > 0){
                $discount_installment = ($payment->amountFormat * ($discount_percent / 100));
            }

            // Desconto total
            $discount = $payment->discount_cart + $discount_installment + $payment->discount_coupon;
            
            if($discount > $payment->amount){
                $discount = $payment->amount - 1;

                if($payment->shipping_value > 0){
                    $payment->shipping_value--;
                    $payment->save();
                }
            }
            
            // Configurando checkout
			$preference = new \MercadoPago\Preference();
			$preference->external_reference = config('store.reference_prefix') . $requestmodel->id;
			$preference->notification_url = route('site.notification.mercadopago');
			$preference->statement_descriptor = config('app.name');

			// Excluir meios de pagamento
			$excludes = [];

            if(!config('store.payment.methods.credit_card')){
                $excludes[] = [
					'id' => 'credit_card'
				];
            }

			if(!config('store.payment.methods.debit_card')){
                $excludes[] = [
					'id' => 'debit_card'
				];
            }

            if(!config('store.payment.methods.balance')){
                $excludes[] = [
					'id' => 'account_money'
				];
            }

            if(!config('store.payment.methods.bolet')){
                $excludes[] = [
					'id' => 'ticket'
				];
            }

			if(!config('store.payment.methods.paypal')){
                $excludes[] = [
					'id' => 'digital_wallet'
				];
            }

			if(!config('store.payment.picpay.active')){
                $excludes[] = [
					'id' => 'bank_transfer'
				];
            }

			// Excluindo outros meios
			$excludes[] = [
				'id' => 'atm'
			];
			$excludes[] = [
				'id' => 'digital_currency'
			];

			$preference->payment_methods = [
				'excluded_payment_types' => $excludes,
				"installments" => config('store.installments_amount')
			];

            // Produtos do pedido
			$items = [];

            foreach($products as $product){
				$item = new \MercadoPago\Item();
				$item->currency_id = 'BRL';
				$item->title = $product->product->name;
				$item->description = $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size;
				$item->quantity = $product->quantity;
				$item->unit_price = $product->price;

                $items[] = $item;
            }
			
			$preference->items = $items;

			// Cliente
			$payer = new \MercadoPago\Payer();
			$payer->name = $client->name;
			$payer->email = $client->email;
			$payer->date_created = date('Y-m-d', strtotime($client->created_at)) .'T' . date('H:i:s', strtotime($client->created_at)) . '-00:00';

			if(!empty($client->telephone)){
				$payer->phone = [
					'area_code' => mb_substr($client->telephone, 0, 2),
					'number' => mask(mb_substr($client->telephone, 2), '####-####')
				];
			}else{
				$payer->phone = [
					'area_code' => mb_substr($client->cell, 0, 2),
					'number' => mask(mb_substr($client->cell, 2), '#####-####')
				];
			}
			
			if(!empty($client->cpf)){
				$payer->identification = [
					'type' => 'CPF',
					'number' => $client->cpf
				];
			}else{
				$payer->identification = [
					'type' => 'CNPJ',
					'number' => $client->cnpj
				];
			}	
					
			$payer->address = array(
				'street_name' => $client->billing_address->street,
				'street_number' => $client->billing_address->number,
				'zip_code' => $client->billing_address->postal_code
			);

			$preference->payer = $payer;

			// URLS
			$preference->back_urls = [
				'success' => route('site.myaccount.requests.show', ['id' => $requestmodel->id]),
				'failure' => route('site.myaccount.requests.show', ['id' => $requestmodel->id]),
				'pending' => route('site.myaccount.requests.show', ['id' => $requestmodel->id])
			];

			$preference->auto_return = 'approved';

			$preference->save();
        }catch(Exception $e){
            $preference = null;
        }
		
		return view('site.myaccount.requests.mercadopago.checkout.index', compact('requestmodel', 'preference'));
	}
}