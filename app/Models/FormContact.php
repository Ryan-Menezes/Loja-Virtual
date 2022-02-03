<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FormContact extends Model{
	public $table = 'form_contact';
	protected $fillable = ['name', 'email', 'subject', 'content'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'name' => 'required|min:1|max:191',
			'email' => 'required|email|min:1|max:191',
			'subject' => 'required|min:1|max:191',
			'message' => 'required'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' => 'required|min:1|max:191',
			'email' => 'required|email|min:1|max:191',
			'subject' => 'required|min:1|max:191',
			'message' => 'required'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' => 'O campo nome é de preenchimento obrigatório!',
			'name.min' => 'O campo nome deve conter no mínimo %min% caracteres',
			'name.max' => 'O campo nome deve conter no máximo %max% caracteres',
			'email.required' => 'O campo e-mail é de preenchimento obrigatório!',
			'email.email' => 'No campo email deve-se informar um email válido!',
			'email.min' => 'O campo email deve conter no mínimo %min% caracteres',
			'email.max' => 'O campo email deve conter no máximo %max% caracteres',
			'subject.required' => 'O campo assunto é de preenchimento obrigatório!',
			'subject.min' => 'O campo assunto deve conter no mínimo %min% caracteres',
			'subject.max' => 'O campo assunto deve conter no máximo %max% caracteres',
			'message.required' => 'O campo mensagem é de preenchimento obrigatório!'
		];
	}
}