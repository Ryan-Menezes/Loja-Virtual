<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemAddress extends Model{
	public $table = 'system_address';
	protected $fillable = ['postal_code', 'street', 'number', 'district', 'city', 'state', 'latitude', 'longitude', 'complement'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'postal_code' 	=> 'required|min:8|max:8',
			'street'		=> 'required|min:8|max:191',
			'number'		=> 'required|min:1|max:10',
			'district'		=> 'required|min:1|max:191',
			'city'			=> 'required|min:1|max:191',
			'state'			=> 'required|min:2|max:2',
			'latitude'		=> 'min:1|max:191',
			'longitude'		=> 'min:1|max:191',
			'complement'	=> 'min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'postal_code' 	=> 'required|min:8|max:8',
			'street'		=> 'required|min:8|max:191',
			'number'		=> 'required|min:1|max:10',
			'district'		=> 'required|min:1|max:191',
			'city'			=> 'required|min:1|max:191',
			'state'			=> 'required|min:2|max:2',
			'latitude'		=> 'min:1|max:191',
			'longitude'		=> 'min:1|max:191',
			'complement'	=> 'min:1'
		];
	}

	public function getMessagesAttribute(){
		return [
			'postal_code.required' 	=> 'O preenchimento do campo cep é obrigatório!',
			'postal_code.min' 		=> 'O campo cep deve conter no mínimo %min% caracteres!',
			'postal_code.max' 		=> 'O campo cep deve conter no máximo %max% caracteres!',
			'street.required' 		=> 'O preenchimento do campo logradouro é obrigatório!',
			'street.min' 			=> 'O campo logradouro deve conter no mínimo %min% caracteres!',
			'street.max' 			=> 'O campo logradouro deve conter no máximo %max% caracteres!',
			'number.required' 		=> 'O preenchimento do campo número é obrigatório!',
			'number.min' 			=> 'O campo número deve conter no mínimo %min% caracteres!',
			'number.max' 			=> 'O campo número deve conter no máximo %max% caracteres!',
			'district.required' 	=> 'O preenchimento do campo bairro é obrigatório!',
			'district.min' 			=> 'O campo bairro deve conter no mínimo %min% caracteres!',
			'district.max' 			=> 'O campo bairro deve conter no máximo %max% caracteres!',
			'city.required' 		=> 'O preenchimento do campo cidade é obrigatório!',
			'city.min' 				=> 'O campo cidade deve conter no mínimo %min% caracteres!',
			'city.max' 				=> 'O campo cidade deve conter no máximo %max% caracteres!',
			'state.required' 		=> 'O preenchimento do campo estado é obrigatório!',
			'state.min' 			=> 'O campo estado deve conter no mínimo %min% caracteres!',
			'state.max' 			=> 'O campo estado deve conter no máximo %max% caracteres!',
			'latitude.min' 			=> 'O campo latitude deve conter no mínimo %min% caracteres!',
			'latitude.max' 			=> 'O campo latitude deve conter no máximo %max% caracteres!',
			'longitude.min' 		=> 'O campo longitude deve conter no mínimo %min% caracteres!',
			'longitude.max' 		=> 'O campo longitude deve conter no máximo %max% caracteres!',
			'complement.min' 		=> 'O campo complemento deve conter no mínimo %min% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_address_id', 'id');
	}
}