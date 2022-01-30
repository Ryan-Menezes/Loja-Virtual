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

		if(is_null($client) || !password_verify($data['password'], $client->password)){
			redirect(route('site.login'), ['error' => 'Não foi possível autenticar, E-Mail ou senha inválidos!'], true);
		}

		if(password_needs_rehash($client->password, PASSWORD_DEFAULT)){
			$client->password = password_hash($data['password'], PASSWORD_DEFAULT);
			$client->save();
		}

		if(!$client->validated){
			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('mail.to'), config('app.name'))
					->subject('Parabéns por criar sua conta em nosso site, agora basta validá-la!: ' . config('app.name'))
					->message(view('mail.account.validate', compact('client')))
					->send($client->email, $client->name);

			redirect(route('site.login'), ['error' => 'Esta conta não está validada, Verique seu e-mail e veja se tem um link de validação!'], true);
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
		$address = new ClientAddress();

		$request = new Request();
		$data = $request->all();
		$data['cell'] = preg_replace('/[^\d]/i', '', $data['cell']);
		$data['telephone'] = preg_replace('/[^\d]/i', '', $data['telephone']);

		if(isset($data['cpf'])){
			$data['cpf'] = preg_replace('/[^\d]/i', '', $data['cpf']);
		}else if(isset($data['cnpj'])){
			$data['cnpj'] = preg_replace('/[^\d]/i', '', $data['cnpj']);
		}

		$data['postal_code'] = preg_replace('/[^\d]/i', '', $data['postal_code']);
		$redirect = $data['redirect'] ?? 'pf';

		$this->validator($data, $this->client->rolesCreate, $this->client->messages);
		$this->validator($data, $address->rolesCreate, $address->messages);

		if(!isset($data['terms_conditions']) && !$data['terms_conditions']){
			redirect(route('site.account.' . $redirect . '.create'), ['error' => 'É necessário aceitar os termos e condições para criar sua conta em nosso site!'], true);
			return;
		}

		$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
		$data['token'] = md5(sha1(password_hash(implode(',', $data), PASSWORD_DEFAULT)));
		$client = $this->client->create($data);

		if($client){
			$address = $client->adresses()->create($data);

			$client->shipping_address_id = $address->id;
			$client->billing_address_id = $address->id;
			$client->save();

			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('mail.to'), config('app.name'))
					->subject('Parabéns por criar sua conta em nosso site, agora basta validá-la!: ' . config('app.name'))
					->message(view('mail.account.validate', compact('client')))
					->send($data['email'], $data['name']);

			redirect(route('site.account.' . $redirect . '.create'), ['success' => 'Sua conta foi criada com sucesso, enviamos um link de validação para seu e-mail, Verifique seu e-mail e sua caixa de spam!']);
		}

		redirect(route('site.account.' . $redirect . '.create'), ['error' => 'Não foi possível criar sua conta em nosso site, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function validate($token){
		$client = $this->client->where('token', $token)->where('validated', true)->firstOrFail();

		$client->token = null;
		$client->validated = true;
		$client->save();

		redirect(route('site.login'), ['success' => 'Sua conta foi validada com sucesso, Agora basta se logar e aproveita nossos serviços!']);
	}

	public function forget(){
		return view('site.auth.forget.index');
	}

	public function forgetStore(){
		$request = new Request();

		if(!$request->has('email')){
			redirect(route('site.forget'), ['error' => 'Informe o e-mail vinculado a sua conta, Para dar início ao processo de recuperação!'], true);
		}

		$client = $this->client->where('email', $request->input('email'))->where('validated', true)->first();

		if(!$client){
			redirect(route('site.forget'), ['error' => 'Não existe nenhuma conta vinculada ao e-mail informado ou a conta informda ainda não foi validada!'], true);
		}

		$client->token = md5(sha1(password_hash(json_encode($client), PASSWORD_DEFAULT)));
		$client->save();

		Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('mail.to'), config('app.name'))
					->subject('Recuperação de senha: ' . config('app.name'))
					->message(view('mail.account.forget', compact('client')))
					->send($client->email, $client->name);

		redirect(route('site.forget'), ['success' => 'Enviamos um link de recuperação para o e-mail informado, Por favor verifque sua caixa de entrada e spam!']);
	}

	public function forgetPassword($token){
		$client = $this->client->where('token', $token)->where('validated', true)->firstOrFail();

		return view('site.auth.forget.password', compact('client'));
	}

	public function forgetPasswordUpdate($token){
		$client = $this->client->where('token', $token)->where('validated', true)->firstOrFail();

		$data = (new Request())->all();

		if(!isset($data['password']) || !isset($data['rpassword'])){
			redirect(route('site.auth.forget.password.update', ['token' => $client->token]), ['error' => 'É necessário que todos os campos sejam preenchidos!'], true);
		}

		$this->validator($data, $this->client->rolesCreate, $this->client->messages);

		if($data['password'] != $data['rpassword']){
			redirect(route('site.auth.forget.password.update', ['token' => $client->token]), ['error' => 'As senha informadas são diferentes!'], true);
		}

		$client->token = null;
		$client->password = password_hash($data['password'], PASSWORD_DEFAULT);
		$client->save();

		redirect(route('site.login'), ['success' => 'Parabéns sua senha foi alterada com sucesso, Agora basta se logar com sua nova senha!']);
	}
}