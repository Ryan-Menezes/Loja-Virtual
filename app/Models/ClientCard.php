<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ClientCard extends Model{
	public $table = 'client_cards';
	protected $fillable = ['name', 'number', 'cvv', 'month', 'year', 'brand', 'cpf', 'birth', 'telephone', 'type', 'client_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'name' 		=> 'required|min:1|max:191',
			'number' 	=> 'required|min:16|max:16',
			'cvv' 		=> 'required|min:3|max:3',
			'month' 	=> 'required|min:1|max:2',
			'year' 		=> 'required|min:2|max:2',
			'brand' 	=> 'required|min:1|max:191',
			'type'		=> 'required|min:1|max:1',
			'cpf'		=> 'required|min:11|max:11',
			'birth'		=> 'birth|min:10|max:10',
			'telephone'	=> 'required|min:10|max:11'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 		=> 'required|min:1|max:191',
			'number' 	=> 'required|min:16|max:16',
			'cvv' 		=> 'required|min:3|max:3',
			'month' 	=> 'required|min:1|max:2',
			'year' 		=> 'required|min:2|max:2',
			'brand' 	=> 'required|min:1|max:191',
			'type'		=> 'required|min:1|max:1',
			'cpf'		=> 'required|min:11|max:11',
			'birth'		=> 'birth|min:10|max:10',
			'telephone'	=> 'required|min:10|max:11'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'number.required' 		=> 'O preenchimento do campo número é obrigatório!',
			'number.min' 			=> 'O campo número deve conter no mínimo %min% caracteres!',
			'number.max' 			=> 'O campo número deve conter no máximo %max% caracteres!',
			'cvv.required' 			=> 'O preenchimento do campo cvv é obrigatório!',
			'cvv.min' 				=> 'O campo cvv deve conter no mínimo %min% caracteres!',
			'cvv.max' 				=> 'O campo cvv deve conter no máximo %max% caracteres!',
			'month.required' 		=> 'O preenchimento do campo mês de validade é obrigatório!',
			'month.min' 			=> 'O campo mês de validade deve conter no mínimo %min% caracteres!',
			'month.max' 			=> 'O campo mês de validade deve conter no máximo %max% caracteres!',
			'year.required' 		=> 'O preenchimento do campo ano de validade é obrigatório!',
			'year.min' 				=> 'O campo ano de validade deve conter no mínimo %min% caracteres!',
			'year.max' 				=> 'O campo ano de validade deve conter no máximo %max% caracteres!',
			'brand.required' 		=> 'O preenchimento do campo marca do cartão é obrigatório!',
			'brand.min' 			=> 'O campo marca do cartão deve conter no mínimo %min% caracteres!',
			'brand.max' 			=> 'O campo marca do cartão deve conter no máximo %max% caracteres!',
			'type.required' 		=> 'O preenchimento do campo tipo do cartão é obrigatório!',
			'type.min' 				=> 'O campo tipo do cartão deve conter no mínimo %min% caracteres!',
			'type.max' 				=> 'O campo tipo do cartão deve conter no máximo %max% caracteres!',
			'cpf.required' 			=> 'O preenchimento do campo cpf do dono do cartão é obrigatório!',
			'cpf.min' 				=> 'O campo cpf do dono do cartão deve conter no mínimo %min% caracteres!',
			'cpf.max' 				=> 'O campo cpf do dono do cartão deve conter no máximo %max% caracteres!',
			'birth.required' 		=> 'O preenchimento do campo data de nascimento do dono do cartão é obrigatório!',
			'birth.min' 			=> 'O campo data de nascimento do dono do cartão deve conter no mínimo %min% caracteres!',
			'birth.max' 			=> 'O campo data de nascimento do dono do cartão deve conter no máximo %max% caracteres!',
			'telephone.required' 	=> 'O preenchimento do campo telefone do dono do cartão é obrigatório!',
			'telephone.min' 		=> 'O campo telefone do dono do cartão deve conter no mínimo %min% caracteres!',
			'telephone.max' 		=> 'O campo telefone do dono do cartão deve conter no máximo %max% caracteres!'
		];
	}

	public function getTypeFormatAttribute(){
		$value = [
			'C' => 'Crédito',
			'D' => 'Débito'
		];

		if(empty($this->type))
			return null;

		return $value[$this->type];
	}

	public function client(){
		return $this->belongsTo(Client::class, 'client_id', 'id');
	}
}