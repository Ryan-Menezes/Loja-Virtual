<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Classes\Cart;
use App\Models\{
	Client,
	ClientAddress,
	ClientCard
};

class MyAccountController extends Controller{
	private $client;

	public function __construct(){
		$this->client = Client::get()->firstOrFail();
	}

	public function index(){;
		$cart = new Cart();
		$client = $this->client;

		return view('site.myaccount.index', compact('client', 'cart'));
	}
}