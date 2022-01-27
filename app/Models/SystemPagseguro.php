<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemPagseguro extends Model{
	public $table = 'system_pagseguro';
	protected $fillable = ['active', 'email', 'token', 'app_id', 'app_key', 'type_checkout'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'email' => 'email|min:1|max:191',
			'token' => 'min:1|max:191',
			'app_id' => 'min:1|max:191',
			'app_key' => 'min:1|max:191'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'email' => 'email|min:1|max:191',
			'token' => 'min:1|max:191',
			'app_id' => 'min:1|max:191',
			'app_key' => 'min:1|max:191'
		];
	}

	public function getMessagesAttribute(){
		return [
			'email.email' 		=> 'O campo email é deve ser um email válido!',
			'email.min' 		=> 'O campo email deve conter no mínimo %min% caracteres!',
			'email.max' 		=> 'O campo email deve conter no máximo %max% caracteres!',
			'token.min' 		=> 'O campo token deve conter no mínimo %min% caracteres!',
			'token.max' 		=> 'O campo token deve conter no máximo %max% caracteres!',
			'app_id.min' 		=> 'O campo id da aplicação deve conter no mínimo %min% caracteres!',
			'app_id.max' 		=> 'O campo id da aplicação deve conter no máximo %max% caracteres!',
			'app_key.min' 		=> 'O campo chave da aplicação deve conter no mínimo %min% caracteres!',
			'app_key.max' 		=> 'O campo chave da aplicação deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function store(){
		return $this->hasOne(SystemStore::class, 'system_pagseguro_id', 'id');
	}
}