<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemFloater extends Model{
	public $table = 'system_floater';
	protected $fillable = ['active', 'image', 'link'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'link' => "min:1|max:191"
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'link' => "min:1|max:191"
		];
	}

	public function getMessagesAttribute(){
		return [
			'link.min' => 'O campo link deve conter no mínimo %min% caracteres!',
			'link.max' => 'O campo link deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_floater_id', 'id');
	}
}