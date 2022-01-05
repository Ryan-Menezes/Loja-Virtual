<?php
namespace App\Classes;

use App\Models\{
	Product,
	ProductColor,
	ProductImage,
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

			if($size->quantity > 0){
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

	public function modify(int $id, int $quantity) : void{
		if(array_key_exists($id, $this->cart) && $quantity <= $this->cart[$id]->size->quantity){
			$this->cart[$id]->quantity = $quantity;

			if($this->cart[$id]->quantity > $this->cart[$id]->size->quantity){
				$this->cart[$id]->quantity = $this->cart[$id]->size->quantity;
			}

			session(self::KEY, $this->cart);
		}
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

	public function subtotal(int $id) : float{
		$subtotal = 0;
		if(array_key_exists($id, $this->cart)){
			$cart = $this->cart[$id];

			$subtotal = $cart->quantity * $cart->size->price;
		}

		return $subtotal;
	}

	public function all() : array{
		return $this->cart;
	}

	public function clear(){
		$this->cart = [];
		session(self::KEY, $this->cart);
	}
}