<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductColor extends Model{
	public $table = 'product_colors';
	protected $fillable = ['description', 'product_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'description' 	=> 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'description' 	=> 'required|min:1'
		];
	}

	public function getMessagesAttribute(){
		return [,
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
}