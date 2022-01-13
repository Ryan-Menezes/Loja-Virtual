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
		$cart = $this->cart;
		$products = $this->cart->all();

		return view('site.cart.index', compact('products', 'cart'));
	}

	public function store($product_id, $size_id = null){
		$request = new Request();
		$data = $request->all();

		$quantity = $data['quantity'] ?? 1;

		$result = json_decode($this->add($product_id, $size_id, $quantity));

		if($result->success){
			redirect(route('site.cart'), ['success' => $result->message]);
		}

		redirect(route('site.cart'), ['error' => $result->message], true);
	}

	public function update(){
		$request = new Request();
		$data = $request->all();

		if(isset($data['id']) && isset($data['size']) && isset($data['quantity'])){
			$id = $data['id'];
			$size = ProductSize::find($data['size']);
			$quantity = $data['quantity'] ?? 1;

			if($size){
				$this->cart->remove($id);
				$this->cart->add($size->color->product, $size, $quantity);
			}
		}	

		redirect(route('site.cart'), ['success' => 'Carrinho atualizado com sucesso!']);
	}

	public function clear(){
		$this->cart->clear();

		redirect(route('site.cart'), ['success' => 'Carrinho limpo com sucesso!']);
	}

	public function destroy($id){
		$result = json_decode($this->remove($id));

		if($result->success){
			redirect(route('site.cart'), ['success' => $result->message]);
		}

		redirect(route('site.cart'), ['error' => $result->message], true);
	}

	public function add($product_id, $size_id = null, $quantity = 1){
		$product = Product::find($product_id);
		if($product){
			$size = null;

			if($size_id){
				$size = $product->sizes->find($size_id);
			}

			$this->cart->add($product, $size, $quantity);

			return json_encode([
				'success' => true,
				'message' => 'Produto adicionado ao carrinho com sucesso!'
			]);
		}
		
		return json_encode([
			'success' => false,
			'message' => 'O produto que ia ser adicionado ao carrinho não existe!'
		]);
	}

	private function remove($id){
		$this->cart->remove($id);

		return json_encode([
			'success' => true,
			'message' => 'Produto removido do carrinho com sucesso!'
		]);
	}

	public function freight(){
		$request = new Request();
		$data = $request->all();
		$freight_free = (config('store.cart.promotion') && config('store.cart.freight_free_promotion'));

		if(!isset($data['postal_code'])){
			abort(404)
		}

		return freight($data['postal_code'], 1, 20, 20, 20, $freight_free);
	}
}