<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Product;

class ProductController extends Controller{
	private $product;

	public function __construct(){
		$this->product = new Product();
	}

	public function index(){
		return view('site.products.index');
	}
}