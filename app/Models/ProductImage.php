<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model{
	public $table = 'product_images';
	protected $fillable = ['source', 'product_color_id'];
	public $timestamps = false;

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function color(){
		return $this->belongsTo(ProductColor::class, 'product_color_id', 'id');
	}
}