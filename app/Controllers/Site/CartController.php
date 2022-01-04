<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Classes\Cart;
use App\Models\{
	Product,
	ProductColor,
	ProductImage,
	ProductSize
};

class CartController extends Controller{
	private $cart;

	public function __construct(){
		$this->cart = new Cart();
	}

	public function index(){
		//$this->cart->clear();
		//$this->add(34, 101);
		$products = $this->cart->all();

		return view('site.cart.index', compact('products'));
	}

	public function create(){

	}

	public function add($product_id, $size_id = null){
		$product = Product::findOrFail($product_id);
		$size = null;

		if($size_id){
			$size = $product->sizes->find($size_id);
		}

		$this->cart->add($product, $size);

		return [
			'success' => true,
			'message' => 'Produto adicionado ao carrinho!'
		];
	}

	public function remove($id){
		$this->cart->remove($id);

		return [
			'success' => true,
			'message' => 'Produto removido ao carrinho!'
		];
	}
}