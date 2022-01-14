<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Classes\Cart;
use App\Models\{
	Request as RequestModel,
	RequestPayment,
	RequestAddress,
	RequestProduct,
	Product,
	ProductColor,
	ProductImage,
	ProductSize,
	Coupon
};

class CartController extends Controller{
	private $cart;
	private $client;

	public function __construct(){
		$this->cart = new Cart();
		$this->client = auth('site');
	}

	public function index(){
		$cart = $this->cart;
		$products = $this->cart->all();
		$client = $this->client;

		return view('site.cart.index', compact('products', 'cart', 'client'));
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
			abort(404);
		}

		return freight($data['postal_code'], 1, 20, 20, 20, $freight_free);
	}

	public function couponValidate(){
		$request = new Request();
		$data = $request->all();

		if(isset($data['code'])){
			$coupon = Coupon::where('code', mb_strtoupper($data['code']))->first();

			if($coupon){
				return "PARABÉNS O VOCÊ RECEBEU {$coupon->percent}% DE DESCONTO EM SUA COMPRA, PARA QUE O DESCONTO SEJA APLICADO, BASTA FINALIZAR O PEDIDO!";
			}			
		}
		
		return 'O CUPOM INFORMADO É INVÁLIDO!';
	}

	public function storeRequest(){
		$request = new Request();
		$data = $request->all();

		if(!$this->client){
			redirect(route('site.login'), ['success' => 'Para finalizar o seu pedido, Primeiro você deve estar logado em sua conta ou criar uma nova!']);
		}

		$cart = new Cart();
		$freight = explode($data['freight'], '-');
		$freight_type = $freight[0];
		$freight_free = (isset($freight[1]) && $freight[1] == 'FG');

		$payment = RequestPayment::create([
			'amount' 			=> number_format($cart->amount(), 2, '.', ''),
			'shipping_type'		=> $freight_type,
			'shipping_value'	=> 0,
			'shipping_days'		=> 1
		]);


	}
}