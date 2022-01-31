<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemMercadopago extends Model{
	public $table = 'system_mercadopago';
	protected $fillable = ['active', 'access_token', 'public_key', 'type_checkout', 'header_color', 'elements_color'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'public_key' => 'min:1|max:191',
            'access_token' => 'min:1|max:191',
			'header_color' => 'min:7|max:7', 
			'elements_color' => 'min:7|max:7', 
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'public_key' => 'min:1|max:191',
            'access_token' => 'min:1|max:191',
			'header_color' => 'min:7|max:7', 
			'elements_color' => 'min:7|max:7', 
		];
	}

	public function getMessagesAttribute(){
		return [
            'public_key.min' 	=> 'O campo chave pública deve conter no mínimo %min% caracteres!',
			'public_key.max' 	=> 'O campo chave pública deve conter no máximo %max% caracteres!',
			'access_token.min' 	=> 'O campo token de acesso deve conter no mínimo %min% caracteres!',
			'access_token.max' 	=> 'O campo token de acesso deve conter no máximo %max% caracteres!',
			'header_color.min' 	=> 'O campo cor do cabeçalho deve conter no mínimo %min% caracteres!',
			'header_color.max' 	=> 'O campo cor do cabeçalho deve conter no máximo %max% caracteres!',
			'elements_color.min' 	=> 'O campo cor dos elementos deve conter no mínimo %min% caracteres!',
			'elements_color.max' 	=> 'O campo cor dos elementos deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function store(){
		return $this->hasOne(SystemStore::class, 'system_mercadopago_id', 'id');
	}
}