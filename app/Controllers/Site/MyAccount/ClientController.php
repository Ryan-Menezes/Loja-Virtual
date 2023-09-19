<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Client;

class ClientController extends Controller{
	private $client;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			redirect(route('site.login'));
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
		
		$first_name = $data['first_name'] ?? '';
		$last_name = $data['last_name'] ?? '';
		$data['name'] = "{$first_name} {$last_name}";
		$data['cell'] = preg_replace('/[^\d]/i', '', $data['cell']);
		$data['telephone'] = preg_replace('/[^\d]/i', '', $data['telephone']);
		$data['cpf'] = preg_replace('/[^\d]/i', '', $data['cpf']);
		$data['cnpj'] = preg_replace('/[^\d]/i', '', $data['cnpj']);
		
		unset($data['email']);
		if(isset($data['password'])){
			unset($data['password']);
		}

		$this->validator($data, $this->client->rolesUpdate, $this->client->messages);

		if($this->client->update($data)){
			redirect(route('site.myaccount.client'), ['success' => 'Dados pessoais editados com sucesso']);
		}

		redirect(route('site.myaccount.client'), ['error' => 'Dados pessoais NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function updatePassword(){
		$data = (new Request())->all();

		if(!isset($data['password']) || !isset($data['npassword']) || !isset($data['rnpassword'])){
			redirect(route('site.myaccount.client'), ['error' => 'É necessário que todos os campos sejam preenchidos!'], true);
		}
		
		$this->validator($data, $this->client->rolesUpdate, $this->client->messages);

		if(!password_verify($data['password'], $this->client->password)){
			redirect(route('site.myaccount.client'), ['error' => 'A senha atual informada é inválida!'], true);
		}

		if($data['npassword'] != $data['rnpassword']){
			redirect(route('site.myaccount.client'), ['error' => 'As senha informadas são diferentes!'], true);
		}

		$this->client->password = password_hash($data['npassword'], PASSWORD_DEFAULT);
		$this->client->save();

		redirect(route('site.myaccount.client'), ['success' => 'Senha alterada com sucessos!']);
	}
}