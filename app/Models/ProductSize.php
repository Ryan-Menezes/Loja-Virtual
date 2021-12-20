<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductSize extends Model{
	public $table = 'product_sizes';
	protected $fillable = ['description', 'price', 'price_previous', 'quantity', 'product_color_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'description' 		=> 'required|min:1',
			'price'				=> 'required|numeric',
			'price_previous' 	=> 'numeric',
			'quantity'			=> 'required|numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'description' 		=> 'required|min:1',
			'price'				=> 'required|numeric',
			'price_previous' 	=> 'numeric',
			'quantity'			=> 'required|numeric'
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
			'quantity.numeric'			=> 'O campo quantidade deve ser numérico!'
		];
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