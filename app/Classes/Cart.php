<?php
namespace App\Classes;

use App\Models\{
	Product,
	ProductSize
};

class Cart{
	private const KEY = 'cart';
	private $cart;

	public function __construct(){
		if(session()->has(self::KEY)){
			$this->cart = session(self::KEY);
		}else{
			$this->cart = [];
		}
	}

	public function add(Product $product, ProductSize $size = null, int $quantity = 1) : void{
		if($product->visible && $product->sizes->where('quantity', '>', 0)->count()){
			if(is_null($size)){
				$size = $product->sizes->where('quantity', '>', 0)->first();
			}

			if($size && $size->quantity > 0){
				if(!array_key_exists($size->id, $this->cart)){
					$this->cart[$size->id] = new \stdClass();

					$this->cart[$size->id]->product = $product;
					$this->cart[$size->id]->size = $size;
					$this->cart[$size->id]->quantity = $quantity;
				}else{
					$this->cart[$size->id]->quantity += $quantity;
				}

				if($this->cart[$size->id]->quantity > $this->cart[$size->id]->size->quantity){
					$this->cart[$size->id]->quantity = $this->cart[$size->id]->size->quantity;
				}

				session(self::KEY, $this->cart);
			}
		}
	}

	public function remove(int $id) : void{
		if(array_key_exists($id, $this->cart)){
			unset($this->cart[$id]);
		}

		session(self::KEY, $this->cart);
	}

	public function amount() : float{
		$amount = 0;
		foreach($this->cart as $cart){
			$amount += $cart->quantity * $cart->size->price;
		}

		return $amount;
	}

	public function quantity() : int{
		$quantity = 0;
		foreach($this->cart as $cart){
			$quantity += $cart->quantity;
		}

		return $quantity;
	}

	public function all() : array{
		foreach($this->cart as $cart){
			if(!ProductSize::find($cart->size->id)){
				$this->remove($cart->size->id);
			}
		}
		session(self::KEY, $this->cart);

		return $this->cart;
	}

	public function clear(){
		$this->cart = [];
		session(self::KEY, $this->cart);
	}

	public function weight(){
		$weight = 0;

		foreach($this->cart as $cart){
			$weight += $cart->size->weight * $cart->quantity;
		}
		
		return $weight < 0.1 ? 0.1 : $weight; // Mínimo 0.1 kg
	}
	
	public function width(){
		$min = 11;
		$max = 105;
		$width = 0;

		foreach($this->cart as $cart){
			$width += ($cart->size->width + $cart->size->height + $cart->size->depth) * $cart->quantity;
		}

		return max($min, min($max, round(pow($width, 1/3), 2)));
	}

	public function height(){
		$min = 2;
		$max = 105;
		$height = 0;

		foreach($this->cart as $cart){
			$height += ($cart->size->width + $cart->size->height + $cart->size->depth) * $cart->quantity;
		}

		return max($min, min($max, round(pow($height, 1/3), 2)));
	}

	public function depth(){
		$min = 16;
		$max = 105;
		$depth = 0;

		foreach($this->cart as $cart){
			$depth += ($cart->size->width + $cart->size->height + $cart->size->depth) * $cart->quantity;
		}

		return max($min, min($max, round(pow($depth, 1/3), 2)));
	}
}