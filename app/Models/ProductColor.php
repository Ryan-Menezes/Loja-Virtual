<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductColor extends Model{
	public $table = 'product_colors';
	protected $fillable = ['hex', 'description', 'product_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'hex' => 'required|min:7|max:7',
			'description' => 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'hex' => 'required|min:7|max:7',
			'description' => 'required|min:1'
		];
	}

	public function getMessagesAttribute(){
		return [
			'hex.required' 			=> 'O preenchimento do campo cor é obrigatório!',
			'hex.min' 				=> 'O campo cor deve conter no mínimo %min% caracteres!',
			'hex.max' 				=> 'O campo cor deve conter no máximo %max% caracteres!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function product(){
		return $this->belongsTo(Product::class, 'product_id', 'id');
	}

	public function images(){
		return $this->hasMany(ProductImage::class, 'product_color_id', 'id');
	}

	public function sizes(){
		return $this->hasMany(ProductSize::class, 'product_color_id', 'id');
	}
}