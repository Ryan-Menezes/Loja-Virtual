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

	public function add(Product $product, ProductSize $size = null) : void{
		if($product->visible && $product->sizes->where('quantity', '>', 0)->count()){
			if(is_null($size)){
				$size = $product->sizes->where('quantity', '>', 0)->first();
			}

			if($size->quantity > 0){
				if(!array_key_exists($size->id, $this->cart)){
					$this->cart[$size->id] = new \stdClass();

					$this->cart[$size->id]->product = $product;
					$this->cart[$size->id]->size = $size;
					$this->cart[$size->id]->quantity = 1;
				}else{
					$this->cart[$size->id]->quantity++;
				}

				session(self::KEY, $this->cart);
			}
		}
	}

	public function remove(int $id) : void{
		if(array_key_exists($id, $this->cart)){
			array_splice($this->cart, $id, 1);
		}

		session(self::KEY, $this->cart);
	}

	public function modify(int $id, int $quantity) : bool{
		if(array_key_exists($id, $this->cart) && $quantity <= $this->cart[$id]->size->quantity){
			$this->cart[$id]->quantity = $quantity;

			session(self::KEY, $this->cart);

			return true;
		}

		return false;
	}

	public function all() : array{
		return $this->cart;
	}

	public function clear(){
		$this->cart = [];
		session(self::KEY, $this->cart);
	}
}