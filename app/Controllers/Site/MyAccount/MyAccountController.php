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

class MyAccountController extends Controller{
	private $client;

	public function __construct(){
		$this->client = Client::get()->firstOrFail();
	}

	public function index(){;
		$client = $this->client;

		return view('site.myaccount.index', compact('client'));
	}
}