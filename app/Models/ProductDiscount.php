<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductDiscount extends Model{
	public $table = 'product_discounts';
	protected $fillable = ['installment', 'percent', 'expiration', 'product_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'installment' => 'required|numeric',
			'percent' => 'required|numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'installment' => 'required|numeric',
			'percent' => 'required|numeric'
		];
	}

	public function getMessagesAttribute(){
		return [
			'installment.required' 	=> 'O preenchimento do campo parcela é obrigatório!',
			'installment.numeric' 	=> 'O campo parcela deve ser do tipo numérico!',
			'percent.required' 	=> 'O preenchimento do campo porcentagem é obrigatório!',
			'percent.numeric' 	=> 'O campo porcentagem deve ser do tipo numérico!'
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
}