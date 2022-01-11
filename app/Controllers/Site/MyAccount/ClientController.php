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

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
	}

	public function index(){;
		$client = $this->client;
		$adresses = [];
		foreach($client->adresses()->get() as $address){
			$adresses[$address->id] = mask($address->postal_code, '#####-###') . ', ' . $address->street . ' - ' . $address->number . ', ' . $address->district . ', ' . $address->city . ' - ' . $address->state;
		}

		return view('site.myaccount.client.index', compact('client', 'adresses'));
	}

	public function update(){
		$request = new Request();
		$data = $request->all();
		$data['cell'] = preg_replace('/[^\d]/i', '', $data['cell']);
		$data['telephone'] = preg_replace('/[^\d]/i', '', $data['telephone']);
		$data['cpf'] = preg_replace('/[^\d]/i', '', $data['cpf']);
		$data['cnpj'] = preg_replace('/[^\d]/i', '', $data['cnpj']);
		unset($data['email']);
		if(empty($data['password'])){
			unset($data['password']);
		}

		$this->validator($data, $this->client->rolesUpdate, $this->client->messages);

		if($this->client->update($data)){
			redirect(route('site.myaccount.client'), ['success' => 'Dados pessoais editados com sucesso']);
		}

		redirect(route('site.myaccount.client'), ['error' => 'Dados pessoais NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}
}