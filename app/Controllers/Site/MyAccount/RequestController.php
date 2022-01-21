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

        return view('site.myaccount.requests.show', compact('requestmodel'));
	}
}