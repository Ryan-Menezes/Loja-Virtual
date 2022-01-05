<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductSize extends Model{
	public $table = 'product_sizes';
	protected $fillable = ['description', 'price', 'price_previous', 'quantity', 'width', 'height', 'depth', 'weight', 'product_color_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'description' 		=> 'required|min:1',
			'price'				=> 'required|numeric',
			'price_previous' 	=> 'numeric',
			'quantity'			=> 'required|numeric',
			'width'				=> 'required|numeric',
			'height'			=> 'required|numeric',
			'depth'				=> 'required|numeric',
			'weight'			=> 'required|numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'description' 		=> 'required|min:1',
			'price'				=> 'required|numeric',
			'price_previous' 	=> 'numeric',
			'quantity'			=> 'required|numeric',
			'width'				=> 'required|numeric',
			'height'			=> 'required|numeric',
			'depth'				=> 'required|numeric',
			'weight'			=> 'required|numeric'
		];
	}

	public function getMessagesAttribute(){
		return [
			'description.required' 		=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 			=> 'O campo descrição deve conter no mínimo %min% caracteres!',
			'price.required'			=> 'O preenchimento do campo preço é obrigatório!',
			'price.numeric'				=> 'O campo preço deve ser numérico!',
			'price_previous.numeric'	=> 'O campo preço antigo deve ser numérico!',
			'quantity.required'			=> 'O preenchimento do campo quantidade é obrigatório!',
			'quantity.numeric'			=> 'O campo quantidade deve ser numérico!',
			'width.required'			=> 'O preenchimento do campo largura é obrigatório!',
			'width.numeric'				=> 'O campo largura deve ser numérico!',
			'height.required'			=> 'O preenchimento do campo altura é obrigatório!',
			'height.numeric'			=> 'O campo altura deve ser numérico!',
			'depth.required'			=> 'O preenchimento do campo profundidade é obrigatório!',
			'depth.numeric'				=> 'O campo profundidade deve ser numérico!',
			'weight.required'			=> 'O preenchimento do campo peso é obrigatório!',
			'weight.numeric'			=> 'O campo peso deve ser numérico!'
		];
	}

	public function getPriceFormatAttribute(){
		if(empty($this->price))
			return null;

		return number_format($this->price, 2, ',', '.');
	}

	public function getPricePreviousFormatAttribute(){
		if(empty($this->price_previous))
			return null;

		return number_format($this->price_previous, 2, ',', '.');
	}

	public function getValueDiscount(int $installment){
		return $this->price * ($this->color->product->getDiscount($installment) / 100);
	}

	public function getPriceDiscount(int $installment){
		return $this->price - $this->getValueDiscount($installment);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function color(){
		return $this->belongsTo(ProductColor::class, 'product_color_id', 'id');
	}
}