<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client
};

class AuthController extends Controller{
	public function index(){;
		return view('site.auth.index');
	}

	public function create(){;
		return view('site.auth.create');
	}
}