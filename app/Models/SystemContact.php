<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemContact extends Model{
	public $table = 'system_contact';
	protected $fillable = ['email', 'telephone', 'cell'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'email' 	=> "email|min:1|max:191",
			'telephone' => 'numeric|min:10|max:10',
			'cell' 		=> 'numeric|min:11|max:11'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'email' 	=> "email|min:1|max:191",
			'telephone' => 'numeric|min:10|max:10',
			'cell' 		=> 'numeric|min:11|max:11'
		];
	}

	public function getMessagesAttribute(){
		return [
			'email.email' 			=> 'Informe um email válido!',
			'email.min' 			=> 'O campo email deve conter no mínimo %min% caracteres!',
			'email.max' 			=> 'O campo email deve conter no máximo %max% caracteres!',
			'telephone.numeric' 	=> 'O telefone deve ser composto somente por números!',
			'telephone.min' 		=> 'O campo telefone deve conter no mínimo %min% caracteres!',
			'telephone.max' 		=> 'O campo telefone deve conter no máximo %max% caracteres!',
			'cell.numeric' 			=> 'O celular deve ser composto somente por números!',
			'cell.min' 				=> 'O campo celular deve conter no mínimo %min% caracteres!',
			'cell.max' 				=> 'O campo celular deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_contact_id', 'id');
	}
}