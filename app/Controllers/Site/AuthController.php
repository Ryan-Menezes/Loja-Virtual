<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	Category
};

class AuthController extends Controller{
	public function index(){;
		$categories = Category::all();

		return view('site.auth.index', compact('categories'));
	}

	public function create(){;
		$categories = Category::all();

		return view('site.auth.create', compact('categories'));
	}
}