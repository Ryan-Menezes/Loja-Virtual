<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemPaypal extends Model{
	public $table = 'system_paypal';
	protected $fillable = ['active', 'secret_key', 'email', 'client_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'secret_key' => 'min:1|max:191',
            'email' => 'email|min:1|max:191',
			'client_id' => 'min:1|max:191'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'secret_key' => 'min:1|max:191',
            'email' => 'email|min:1|max:191',
			'client_id' => 'min:1|max:191'
		];
	}

	public function getMessagesAttribute(){
		return [
			'secret_key.min' 	=> 'O campo chave secreta deve conter no mínimo %min% caracteres!',
			'secret_key.max' 	=> 'O campo chave secreta deve conter no máximo %max% caracteres!',
            'email.email' 		=> 'O campo email é deve ser um email válido!',
			'email.min' 		=> 'O campo email deve conter no mínimo %min% caracteres!',
			'email.max' 		=> 'O campo email deve conter no máximo %max% caracteres!',
			'client_id.min'     => 'O campo id do cliente deve conter no mínimo %min% caracteres!',
			'client_id.max' 	=> 'O campo id do cliente deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function store(){
		return $this->hasOne(SystemStore::class, 'system_paypal_id', 'id');
	}
}