<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemFreight extends Model{
	public $table = 'system_freight';
	protected $fillable = ['type', 'postal_code_origin'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'type' 					=> 'required|max:1|min:1',
			'postal_code_origin' 	=> 'required|min:8|max:8'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'type' 					=> 'required|max:1|min:1',
			'postal_code_origin' 	=> 'required|min:8|max:8'
		];
	}

	public function getMessagesAttribute(){
		return [
			'type.required' 				=> 'O preenchimento do campo Tipo do Frete é obrigatório!',
			'type.min' 						=> 'O campo Tipo do Frete deve conter no mínimo %min% caracteres!',
			'type.max' 						=> 'O campo Tipo do Frete deve conter no máximo %max% caracteres!',
			'postal_code_origin.required' 	=> 'O preenchimento do campo CEP de Origem é obrigatório!',
			'postal_code_origin.min' 		=> 'O campo CEP de Origem deve conter no mínimo %min% caracteres!',
			'postal_code_origin.max' 		=> 'O campo CEP de Origem deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function store(){
		return $this->hasOne(SystemStore::class, 'system_freight_id', 'id');
	}

	public function freight_customized(){
		return $this->hasMany(SystemFreightCustom::class, 'system_freight_id', 'id');
	}
}