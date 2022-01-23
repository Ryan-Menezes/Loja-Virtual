<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GaleryImage extends Model{
	public $table = 'galery_images';
	protected $fillable = ['source', 'galery_id'];
	public $timestamps = false;

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function galery(){
		return $this->belongsTo(Galery::class, 'galery_id', 'id');
	}
}