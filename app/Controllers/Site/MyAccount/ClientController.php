<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	ClientAddress,
	ClientCard
};

class ClientController extends Controller{
	private $client;

	public function __construct(){
		$this->client = auth('site');

		if(!$this->client)
			abort(404);
	}

	public function index(){;
		$client = $this->client;

		return view('site.myaccount.client.index', compact('client'));
	}

	public function update(){
		$request = new Request();
		$data = $request->all();
		$data['cell'] = preg_replace('/[^\d]/i', '', $data['cell']);
		$data['telephone'] = preg_replace('/[^\d]/i', '', $data['telephone']);
		$data['cpf'] = preg_replace('/[^\d]/i', '', $data['cpf']);
		$data['cnpj'] = preg_replace('/[^\d]/i', '', $data['cnpj']);

		$this->validator($data, $client->rolesUpdate, $client->messages);

		if($client->update($data)){
			redirect(route('site.myaccount.client'), ['success' => 'Dados pessoais editados com sucesso']);
		}

		redirect(route('site.myaccount.client'), ['error' => 'Dados pessoais NÃO editado, Ocorreu um erro no processo de edição!']);
	}
}