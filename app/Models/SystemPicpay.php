<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemPicpay extends Model{
	public $table = 'system_picpay';
	protected $fillable = ['active', 'token', 'seller_token', 'expiration_minutes'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'token' => 'min:1|max:191',
			'seller_token' => 'min:1|max:191',
			'expiration_minutes' => 'numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'token' => 'min:1|max:191',
			'seller_token' => 'min:1|max:191',
			'expiration_minutes' => 'numeric'
		];
	}

	public function getMessagesAttribute(){
		return [
			'token.min' 		            => 'O campo token deve conter no mínimo %min% caracteres!',
			'token.max' 		            => 'O campo token deve conter no máximo %max% caracteres!',
			'seller_token.min'              => 'O campo token do vendedor deve conter no mínimo %min% caracteres!',
			'seller_token.max' 	            => 'O campo token do vendedor deve conter no máximo %max% caracteres!',
            'expiration_minutes.numeric'    => 'O campo minutos para expirar o pagamento deve ser do tipo numérico!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function store(){
		return $this->hasOne(SystemStore::class, 'system_picpay_id', 'id');
	}
}