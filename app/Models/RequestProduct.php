<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RequestProduct extends Model{
	public $table = 'requests_products';
	protected $fillable = ['price', 'quantity', 'request_id', 'product_size_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'price' 	=> 'required|numeric',
			'quantity'	=> 'required|numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'price' 	=> 'required|numeric',
			'quantity'	=> 'required|numeric'
		];
	}

	public function request(){
		return $this->hasOne(Request::class, 'request_id', 'id');
	}

	public function size(){
		return $this->belongsTo(ProductSize::class, 'product_size_id', 'id');
	}
}