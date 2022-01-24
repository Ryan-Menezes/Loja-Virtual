<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductRelated extends Model{
	public $table = 'products_related';
	protected $fillable = ['product_id', 'product_related_id'];
	public $timestamps = false;

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function product(){
		return $this->belongsTo(Product::class, 'product_id', 'id');
	}

    public function productRelated(){
		return $this->belongsTo(Product::class, 'product_related_id', 'id');
	}
}