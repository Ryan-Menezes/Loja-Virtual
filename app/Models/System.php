<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class System extends Model{
	public $table = 'system';
	protected $fillable = ['name', 'keywords', 'description', 'maintenance', 'system_address_id', 'system_contact_id', 'system_social_id', 'system_lgpd_id', 'system_floater_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'name' 			=> 'required|min:1|max:100',
			'keywords' 		=> 'min:1',
			'description' 	=> 'min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 			=> 'required|min:1|max:100',
			'keywords' 		=> 'min:1',
			'description' 	=> 'min:1'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'keywords.min' 			=> 'O campo palavras chave deve conter no mínimo %min% caracteres!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function address(){
		return $this->belongsTo(SystemAddress::class, 'system_address_id', 'id');
	}

	public function contact(){
		return $this->belongsTo(SystemContact::class, 'system_contact_id', 'id');
	}

	public function social(){
		return $this->belongsTo(SystemSocial::class, 'system_social_id', 'id');
	}

	public function floater(){
		return $this->belongsTo(SystemFloater::class, 'system_floater_id', 'id');
	}

	public function lgpd(){
		return $this->belongsTo(SystemLgpd::class, 'system_lgpd_id', 'id');
	}
}