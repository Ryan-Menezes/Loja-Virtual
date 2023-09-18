<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\Controller;
use App\Classes\Cart;
use App\Models\Client;

class MyAccountController extends Controller{
	private $client;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			redirect(route('site.login'));
	}

	public function index(){;
		$cart = new Cart();
		$client = $this->client;

		return view('site.myaccount.index', compact('client', 'cart'));
	}

	public function logout(){
		session()->remove(config('app.url'));
		redirect(route('site.login'));
	}
}