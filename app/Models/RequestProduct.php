<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RequestProduct extends Model{
	public $table = 'requests_products';
	protected $fillable = ['color', 'size', 'price', 'quantity', 'request_id', 'product_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'color' 	=> 'required|min:1|max191',
			'size' 		=> 'required|min:1|max191',
			'price' 	=> 'required|numeric',
			'quantity'	=> 'required|numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'color' 	=> 'required|min:1|max191',
			'size' 		=> 'required|min:1|max191',
			'price' 	=> 'required|numeric',
			'quantity'	=> 'required|numeric'
		];
	}

	public function request(){
		return $this->hasOne(Request::class, 'request_id', 'id');
	}

	public function product(){
		return $this->belongsTo(Product::class, 'product_id', 'id');
	}
}