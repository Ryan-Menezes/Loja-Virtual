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
use App\Classes\Payment\{
	PagSeguro,
	PicPay
};

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

		$requests = $client->requests()->orderBy('id', 'DESC')->offset($page)->limit($limit)->get();

		return view('site.myaccount.requests.index', compact('client', 'requests', 'pages', 'builder'));
	}

    public function show($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

		if(config('store.types.pagseguro') || $requestmodel->payment->type == 'PS'){
			// Objeto do pagseguro
			$email = config('store.payment.credentials.pagseguro.email');
			$token = config('store.payment.credentials.pagseguro.token');
			$production = config('store.payment.production');

			$pagseguro = new PagSeguro($email, $token, !$production);

			// Verifica se a transação para este pedido já foi feita
			update_payment_request_pagseguro($pagseguro, $requestmodel);
		}
		
		if(config('store.methods.pix') || $requestmodel->payment->type == 'PC'){
			// Objeto do picpay
            $token = config('store.payment.credentials.picpay.token');
            $seller_token = config('store.payment.credentials.picpay.seller_token');
            $production = config('store.payment.production');

            $picpay = new PicPay($token, $seller_token);

			// Verifica se a transação para este pedido já foi feita
			update_payment_request_picpay($picpay, $requestmodel);
		}

        return view('site.myaccount.requests.show', compact('requestmodel'));
	}

	public function cancel($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

		if($requestmodel->status == 'AP'){
			if($requestmodel->payment->code){
				if($requestmodel->payment->type == 'PS'){
					// Objeto do pagseguro
					$email = config('store.payment.credentials.pagseguro.email');
					$token = config('store.payment.credentials.pagseguro.token');
					$production = config('store.payment.production');

					$pagseguro = new PagSeguro($email, $token, !$production);

					// Cancela a transação
					$response = $pagseguro->cancel($requestmodel->payment->code);

					// Verifica se a transação para este pedido já foi feita
					update_payment_request_pagseguro($pagseguro, $requestmodel);
					
					if(!empty($response) && !isset($response->error)){
						$requestmodel->status = 'CA';
						$requestmodel->save();

						redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso!']);
					}
				}
			}else if($requestmodel->payment->type == 'PC'){
				// Objeto do picpay
				$token = config('store.payment.credentials.picpay.token');
				$seller_token = config('store.payment.credentials.picpay.seller_token');
				$production = config('store.payment.production');

				$picpay = new PicPay($token, $seller_token);

				// Cancela a transação
				$response = $picpay->cancel($requestmodel->id);

				// Verifica se a transação para este pedido já foi feita
				update_payment_request_picpay($picpay, $requestmodel);
				
				if(!empty($response) && isset($response->cancellationId)){
					$requestmodel->status = 'CA';
					$requestmodel->save();

					redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso!']);
				}
			}else{
				$requestmodel->status = 'CA';
				$requestmodel->save();

				redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso!']);
			}
		}

		redirect(route('site.myaccount.requests'), ['error' => 'Não foi possível cancelar seu pedido, Caso o cancelamento seja urgente, favor entrar em contato conosco!']);
	}

	public function refund($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

		if($requestmodel->status == 'PA'){
			if($requestmodel->payment->code){
				if($requestmodel->payment->type == 'PS'){
					// Objeto do pagseguro
					$email = config('store.payment.credentials.pagseguro.email');
					$token = config('store.payment.credentials.pagseguro.token');
					$production = config('store.payment.production');

					$pagseguro = new PagSeguro($email, $token, !$production);

					// Cancela a transação
					$response = $pagseguro->refund($requestmodel->payment->code);

					// Verifica se a transação para este pedido já foi feita
					update_payment_request_pagseguro($pagseguro, $requestmodel);
					
					if(!empty($response) && !isset($response->error)){
						$requestmodel->status = 'CA';
						$requestmodel->save();

						redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso e o valor reembolsado!']);
					}
				}
			}else{
				$requestmodel->status = 'CA';
				$requestmodel->save();

				redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso!']);
			}
		}

		redirect(route('site.myaccount.requests'), ['error' => 'Não foi possível reembolsar o valor do pedido e cancelá-lo, Caso o reembolso seja urgente, favor entrar em contato conosco!']);
	}
}