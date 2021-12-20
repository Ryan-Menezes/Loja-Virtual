<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Product,
	Category
};

class ProductController extends Controller{
	private $product;

	public function __construct(){
		$this->product = new Product();
	}

	public function index(){
		$categories = Category::all();

		return view('site.products.index', compact('categories'));
	}

	public function show($slug){
		$product = $this->product->where('visible', true)->where('slug', $slug)->firstOrFail();
		$categories = Category::all();

		return view('site.products.show', compact('product', 'categories'));
	}
}