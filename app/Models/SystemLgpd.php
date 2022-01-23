<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemLgpd extends Model{
	public $table = 'system_lgpd';
	protected $fillable = ['active', 'privacy_policy', 'terms_conditions', 'return_policy'];
	public $timestamps = false;

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_lgpd_id', 'id');
	}
}