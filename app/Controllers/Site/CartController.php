<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Classes\Cart;
use App\Classes\Correios\Frete\FreteCorreios;
use App\Models\{
	RequestPayment,
	RequestAddress,
	Product,
	ProductSize,
	Coupon,
	Client
};

class CartController extends Controller{
	private $cart;
	private $client;

	public function __construct(){
		$this->cart = new Cart();
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);
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

		$cart_products = $this->cart->all();

		$freight_free = false;
		if(count($cart_products)){
			$freight_free = (config('store.cart.promotion') && $this->cart->amount() > config('store.cart.amount_promotion') && config('store.cart.freight_free_promotion'));

			if(count($cart_products) == 1){
				$product = $cart_products[array_keys($cart_products)[0]];
				$freight_free = $product->product->freight_free;
			}
		}

		if(!isset($data['postal_code'])){
			abort(404);
		}

		return freight_format($data['postal_code'], $this->cart->weight(), $this->cart->width(), $this->cart->height(), $this->cart->depth(), $freight_free);
	}

	public function couponValidate(){
		$request = new Request();
		$data = $request->all();
		$cart_products = $this->cart->all();

		if(isset($data['code'])){
			$coupon = Coupon::where('code', mb_strtoupper($data['code']))->first();
			$valid = true;		

			if($coupon){
				if($coupon->subcategories->count() || $coupon->products->count()){
					foreach($cart_products as $cart_product){
						$product = $cart_product->product;

						// Valida produtos fora do desconto
						if($coupon->products()->where('coupons_products.product_id', $product->id)->exists()){
							$valid = false;
							break;
						}

						// Valida catagorias dos produtos
						if(!$coupon->subcategories->intersect($product->subcategories)->count()){
							$valid = false;
							break;
						}
					}
				}

				if(!$valid){
					return 'O CUPOM NÃO É VÁLIDO PARA OS PRODUTOS EM SEU CARRINHO!';
				}

				return "PARABÉNS O VOCÊ RECEBEU {$coupon->percent}% DE DESCONTO EM SUA COMPRA, PARA QUE O DESCONTO SEJA APLICADO, BASTA FINALIZAR O PEDIDO!";
			}
		}
		
		return 'O CUPOM INFORMADO É INVÁLIDO!';
	}

	public function storeRequest(){
		$request = new Request();
		$data = $request->all();
		
		$freight_types = [
			'PAC' 		=> 'PC',
			'SEDEX'		=> 'SX',
			'CUSTOM'	=> 'PE'
		];

		$cart = new Cart();
		$amount = $cart->amount();
		$cart_products = $this->cart->all();

		if(!count($cart_products)){
			redirect(route('site.cart'), ['error' => 'Para finalizar seu pedido é necessário que haja produtos no seu carrinho!']);
		}

		$freight_free_cart = false;
		$freight_free_cart = (config('store.cart.promotion') && $amount > config('store.cart.amount_promotion') && config('store.cart.freight_free_promotion'));

		if(count($cart_products) == 1){
			$product = $cart_products[array_keys($cart_products)[0]];
			$freight_free_cart = $product->product->freight_free;
		}

		// Verificando se há algum usuário logado
		if(!$this->client){
			redirect(route('site.login'), ['error' => 'Para finalizar o seu pedido, Primeiro você deve estar logado em sua conta ou criar uma nova!']);
		}

		// Verificando se o cliente utilizou um cupom de desconto
		$discount_coupon = 0;
		if(isset($data['code']) && !empty($data['code'])){
			$coupon = Coupon::where('code', mb_strtoupper($data['code']))->first();
			$valid = false;		

			if($coupon){
				if($coupon->subcategories->count()){
					foreach($cart_products as $cart_product){
						$product = $cart_product->product;
						foreach($coupon->subcategories as $subcategory){
							if($product->subcategories()->where('products_subcategories.subcategory_id', $subcategory->id)->exists() && !$coupon->products()->where('coupons_products.product_id', $product->id)->exists()){
								$valid = true;
								break;
							}
						}
					}
				}else{
					$valid = true;
				}
			}

			if($valid){
				$discount_coupon = $amount * ($coupon->percent / 100);
			}
		}

		// Verificando se o cliente teve um desconto no carrinho
		$discount_cart = 0;
		if(config('store.cart.promotion') && $amount > config('store.cart.amount_promotion')){
			$discount_cart = $amount * (config('store.cart.discount_percent_promotion') / 100);
		}

		// Verificando endereço
		$address = null;
		if(!isset($data['address_id'])){
			$address = $this->client->adresses->first();
		}else{
			$address = $this->client->adresses->find($data['address_id']);
		}

		if(!$address){
			redirect(route('site.cart'), ['error' => 'O endereço passado é inválido!']);
		}

		// Validando o frete
		$freights = freight($address->postal_code, $this->cart->weight(), $this->cart->width(), $this->cart->height(), $this->cart->depth());

		if(!isset($data['freight']) || empty($data['freight'])){
			redirect(route('site.cart'), ['error' => 'Por favor selecione o tipo de frete desejado!']);
		}
		
		if(strpos($data['freight'], '-')){
			$freight = explode('-', $data['freight']);
			$freight_type = $freight[0];
			$freight_free = (isset($freight[1]) && $freight[1] == 'FG' && $freight_free_cart);
		}else{
			$freight_type = $data['freight'];
			$freight_free = false;
		}
		
		if(!array_key_exists($freight_type, $freights) || $freights[$freight_type]['error']['code'] == FreteCorreios::ERROR_CODE){
			redirect(route('site.cart'), ['error' => 'Por favor selecione o tipo de frete que deseja!']);
		}

		// Obtendo o frete
		$freight = $freights[$freight_type];
	
		// Cadastrando o pagamento(inicialmente não tem nenhum)
		$payment = RequestPayment::create([
			'amount' 			=> number_format($amount, 2, '.', ''),
			'discount_coupon'	=> $discount_coupon,
			'discount_cart'		=> $discount_cart,
			'shipping_type'		=> $freight_types[$freight_type],
			'shipping_value'	=> $freight_free ? 0 : number_format(number($freight['price']), 2, '.', ''),
			'shipping_days'		=> $freight['days'],
			'shipping_message'	=> $freight['message'] ?? null
		]);

		if($payment){
			// Cadastrando o endereço do pedido
			$address = RequestAddress::create([
				'postal_code'	=> $address->postal_code,
				'street'		=> $address->street,
				'number'		=> $address->number,
				'district'		=> $address->district,
				'city'			=> $address->city,
				'state'			=> $address->state,
				'complement'	=> $address->complement
			]);

			if($address){
				// Cadastrando o pedido
				$requestmodel = $this->client->requests()->create([
					'request_address_id' => $address->id,	
					'request_payment_id' => $payment->id
				]);

				if($requestmodel){
					// Cadastrando produtos do pedido
					foreach($cart_products as $cart_product){
						$requestmodel->products()->create([
							'color'				=> $cart_product->size->color->description,
							'size'				=> $cart_product->size->description,
							'price' 			=> $cart_product->size->price, 
							'quantity'			=> $cart_product->quantity, 
							'product_id'		=> $cart_product->product->id
						]);

						$cart_product->size->quantity -= $cart_product->quantity;
						$cart_product->size->save();
					}

					$cart->clear();
					redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
				}else{
					$payment->delete();
					$address->delete();
				}
			}else{
				$payment->delete();
			}
		}
	}

	public function dropdown() {
		return view('includes.site.cart.dropdown');
	}
}