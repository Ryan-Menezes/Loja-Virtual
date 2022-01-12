<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemStore extends Model{
	public $table = 'system_store';
	protected $fillable = ['payment_type', 'payment_production', 'payment_credit_card', 'payment_debit_card', 'payment_bolet', 'payment_debit_online', 'payment_pix', 'payment_paypal'];

	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'payment_type' 	=> 'required|min:2|max:2'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'payment_type' 	=> 'required|min:2|max:2'
		];
	}

	public function getMessagesAttribute(){
		return [
			'payment_type.required' => 'O preenchimento do campo tipo de pagamento é obrigatório!',
			'payment_type.min' 		=> 'O campo tipo de pagamento deve conter no mínimo %min% caracteres!',
			'payment_type.max' 		=> 'O campo tipo de pagamento deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_store_id', 'id');
	}

	public function pagseguro(){
		return $this->belongsTo(SystemPagseguro::class, 'system_pagseguro_id', 'id');
	}
}