<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller,
	Mail
};
use App\Models\{
	Client,
	ClientAddress
};

class AuthController extends Controller{
	private $client;

	public function __construct(){
		$this->client = new Client();
	}

	public function index(){
		return view('site.auth.index');
	}

	public function loginValidate(){
		$request = new Request();
		$data = $request->all();

		$client = $this->client->where('email', $data['email'])->first();

		if(is_null($client) || !password_verify($data['password'], $client->password))
			redirect(route('site.login'), ['error' => 'Não foi possível autenticar, E-Mail ou senha inválidos!'], true);

		if(password_needs_rehash($client->password, PASSWORD_DEFAULT)){
			$client = password_hash($data['password'], PASSWORD_DEFAULT);
			$client->save();
		}

		session(config('app.url'), ['client' => $client]);
		redirect(route('site.myaccount'));
	}

	public function createPF(){
		return view('site.auth.pf.create');
	}

	public function createPJ(){
		return view('site.auth.pj.create');
	}

	public function store(){
		$request = new Request();
		$data = $request->all();
		$data['cell'] = preg_replace('/[^\d]/i', '', $data['cell']);
		$data['telephone'] = preg_replace('/[^\d]/i', '', $data['telephone']);
		$data['cpf'] = preg_replace('/[^\d]/i', '', $data['cpf']);

		if(isset($data['cnpj']))
			$data['cnpj'] = preg_replace('/[^\d]/i', '', $data['cnpj']);

		$data['postal_code'] = preg_replace('/[^\d]/i', '', $data['postal_code']);
		$redirect = $data['redirect'] ?? 'pf';

		$this->validator($data, $this->client->rolesCreate, $this->client->messages);
		$this->validator($data, ClientAddress::$rolesCreate, ClientAddress::$messages);

		if(!isset($data['terms_conditions']) && !$data['terms_conditions']){
			redirect(route('site.account.' . $redirect . '.create'), ['error' => 'É necessário aceitar os termos e condições para criar sua conta em nosso site!'], true);
			return;
		}

		$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
		$data['token'] = md5(password_hash(implode($data, ','), PASSWORD_DEFAULT));
		$client = $this->client->create($data);

		if($client){
			$address = $client->adresses()->create($data);

			$client->shipping_address_id = $address->id;
			$client->billing_address_id = $address->id;
			$client->save();

			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('app.contact.email'), config('app.name'))
					->subject('Parabéns por criar sua conta em nosso site, agora basta validá-la!: ' . config('app.name'))
					->message(view('mail.account.validate', compact('client')))
					->send($data['email'], $data['name']);

			redirect(route('site.account.' . $redirect . '.create'), ['success' => 'Sua conta foi criada com sucesso, enviamos um link de validação para seu e-mail, Verifique seu e-mail e sua caixa de spam!']);
		}

		redirect(route('site.account.' . $redirect . '.create'), ['error' => 'Não foi possível criar sua conta em nosso site, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function validate($token){
		$client = $this->client->where('token', $token)->firstOrFail();

		$client->token = null;
		$client->validated = true;
		$client->save();

		redirect(route('site.login'), ['success' => 'Sua conta foi validada com sucesso, Agora basta se logar e aproveita nossos serviços!']);
	}
}