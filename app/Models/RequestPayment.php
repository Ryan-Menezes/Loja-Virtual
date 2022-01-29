<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RequestPayment extends Model{
	public $table = 'request_payment';
	protected $fillable = ['code', 'type', 'method', 'status', 'status_type', 'installments', 'installment_no_interest', 'amount', 'discount_coupon', 'discount_installment', 'discount_cart', 'shipping_type', 'shipping_value', 'shipping_days', 'shipping_message', 'link', 'qrcode', 'qrcode_hash', 'details'];
	public $timestamps = true;
	private $types = [
		'PS' => 'PagSeguro',
		'MP' => 'Mercado Pago',
		'PP' => 'PayPal',
		'PC' => 'PicPay'
	];
	private $methods = [
		'CC' => 'Cartão de Crédito',
		'CD' => 'Cartão de Débito',
		'BA' => 'Saldo',
		'BO' => 'Boleto',
		'DE' => 'Depósito',
		'DO' => 'Débito Online',
		'PX' => 'PIX',
		'PP' => 'PayPal',
		'TB' => 'Transferência Bancária'
	];
 	private $_status = [
		'AP' => 'Aguardando Pagamento',
		'EA' => 'Em Análise', 
		'PA' => 'Paga', 
		'DI' => 'Disponível', 
		'ED' => 'Em Disputa',
		'DE' => 'Devolvida',
		'CA' => 'Cancelada'
	];
	private $shipping_types = [
		'PC' => 'PAC',
		'SX' => 'SEDEX',
		'PE' => 'Personalizado'
	];

	public function getRolesCreateAttribute(){
		return [
			'code' 						=> 'required|min:1|max:191',
			'type'						=> 'required|min:2|max:2',
			'method'					=> 'required|min:2|max:2',
			'status'					=> 'required|min:1|max:191',
			'status_type'				=> 'required|min:2|max:2',
			'shipping_type'				=> 'required|min:2|max:2',
			'shipping_value'			=> 'required|numeric',
			'shipping_days'				=> 'required|numeric', 
			'installments'				=> 'required|numeric', 
			'installment_no_interest'	=> 'required|numeric', 
			'amount'					=> 'required|numeric', 
			'disount_coupon'			=> 'required|numeric', 
			'discount_installment'		=> 'required|numeric',
			'discount_ store'			=> 'required|numeric',
			'link'						=> 'min:1|max:191', 
			'qrcode'					=> 'min:1',
			'qrcode_hash'				=> 'min:1|max:191',
			'details'					=> 'min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'code' 						=> 'required|min:1|max:191',
			'type'						=> 'required|min:2|max:2',
			'method'					=> 'required|min:2|max:2',
			'status'					=> 'required|min:1|max:191',
			'status_type'				=> 'required|min:2|max:2',
			'shipping_type'				=> 'required|min:2|max:2',
			'shipping_value'			=> 'required|numeric',
			'shipping_days'				=> 'required|numeric', 
			'installments'				=> 'required|numeric', 
			'installment_no_interest'	=> 'required|numeric', 
			'amount'					=> 'required|numeric', 
			'disount_coupon'			=> 'required|numeric', 
			'discount_installment'		=> 'required|numeric',
			'discount_ store'			=> 'required|numeric',
			'link'						=> 'min:1|max:191', 
			'qrcode'					=> 'min:1',
			'qrcode_hash'				=> 'min:1|max:191',
			'details'					=> 'min:1'
		];
	}

	public function getTypeFormatAttribute(){
		if(empty($this->type))
			return null;

		return $this->types[$this->type];
	}

	public function getMethodFormatAttribute(){
		if(empty($this->method))
			return null;

		return $this->methods[$this->method];
	}

	public function getStatusTypeFormatAttribute(){
		if(empty($this->status_type))
			return null;

		return $this->_status[$this->status_type];
	}

	public function getShippingTypeFormatAttribute(){
		if(empty($this->shipping_type))
			return null;

		return $this->shipping_types[$this->shipping_type];
	}

	public function getAmountFormatAttribute(){
		return $this->amount - $this->discount_cart - $this->discount_installment - $this->discount_coupon + $this->shipping_value;
	}

	public function request(){
		return $this->hasOne(Request::class, 'request_payment_id', 'id');
	}
}