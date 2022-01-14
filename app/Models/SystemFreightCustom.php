<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemFreightCustom extends Model{
	public $table = 'system_freight_custom';
	protected $fillable = ['postal_code_min', 'postal_code_max', 'value', 'days', 'system_freight_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'postal_code_min' 	=> 'required|min:8|max:8',
			'postal_code_max' 	=> 'required|min:8|max:8',
			'value' 			=> 'required|numeric',
			'days' 				=> 'required|numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'postal_code_min' 	=> 'required|min:8|max:8',
			'postal_code_max' 	=> 'required|min:8|max:8',
			'value' 			=> 'required|numeric',
			'days' 				=> 'required|numeric'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function freight(){
		return $this->belongsTo(SystemFreight::class, 'system_freight_id', 'id');
	}
}