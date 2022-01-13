<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemStore extends Model{
	public $table = 'system_store';
	protected $fillable = ['cart_promotion', 'cart_amount_promotion', 'cart_discount_percent_promotion', 'cart_freight_free_promotion', 'payment_type', 'payment_production', 'payment_credit_card', 'payment_debit_card', 'payment_bolet', 'payment_debit_online', 'payment_pix', 'payment_paypal'];

	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'cart_amount_promotion' 			=> 'numeric',
			'cart_discount_percent_promotion'	=> 'numeric',
			'payment_type' 						=> 'required|min:2|max:2'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'cart_amount_promotion' 			=> 'numeric',
			'cart_discount_percent_promotion'	=> 'numeric',
			'payment_type' 						=> 'required|min:2|max:2'
		];
	}

	public function getMessagesAttribute(){
		return [
			'cart_amount_promotion.numeric'				=> 'O Valor da Promoção da promoção deve ser do tipo numérico!',
			'cart_discount_percent_promotion.numeric'	=> 'O Desconto Aplicado Na Compra da promoção deve ser do tipo numérico!',
			'payment_type.required' 					=> 'O preenchimento do campo tipo de pagamento é obrigatório!',
			'payment_type.min' 							=> 'O campo tipo de pagamento deve conter no mínimo %min% caracteres!',
			'payment_type.max' 							=> 'O campo tipo de pagamento deve conter no máximo %max% caracteres!'
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