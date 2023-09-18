<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Client;

class RequestController extends Controller{
	private $client;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			redirect(route('site.login'));
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

		update_payment($requestmodel);

        return view('site.myaccount.requests.show', compact('requestmodel'));
	}

	public function cancel($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

		if(cancel_payment($requestmodel)){
			redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso!']);
		}

		redirect(route('site.myaccount.requests'), ['error' => 'Não foi possível cancelar seu pedido, Caso o cancelamento seja urgente, favor entrar em contato conosco!']);
	}

	public function refund($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

		if(refund_payment($requestmodel)){
			redirect(route('site.myaccount.requests'), ['success' => 'Seu pedido foi cancelado com sucesso e o valor pago foi reembolsado!']);
		}

		redirect(route('site.myaccount.requests'), ['error' => 'Não foi possível reembolsar o valor do pedido e cancelá-lo, Caso o reembolso seja urgente, favor entrar em contato conosco!']);
	}
}