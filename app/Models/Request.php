<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Request extends Model{
	public $table = 'requests';
	protected $fillable = ['status', 'client_id', 'request_address_id', 'request_payment_id'];
	public $timestamps = true;
	public $_status = [
		'AP' => 'Aguardando Pagamento',
		'PA' => 'Pago', 
		'EN' => 'Enviado para a entrega', 
		'CO' => 'Concluído',
		'CA' => 'Cancelado'
	];

	public function getRolesCreateAttribute(){
		return [
			'status' => 'required|min:2|max:2'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'status' => 'required|min:2|max:2'
		];
	}

	public function getMessagesAttribute(){
		return [
			'status.required' 	=> 'O preenchimento do campo status é obrigatório!',
			'status.min' 		=> 'O campo status deve conter no mínimo %min% caracteres!',
			'status.max' 		=> 'O campo status deve conter no máximo %max% caracteres!'
		];
	}

	public function getCreatedAtFormatAttribute(){
		if(empty($this->created_at))
			return null;

		return date('d/m/Y H:i:s', strtotime($this->created_at));
	}

	public function getUpdatedAtFormatAttribute(){
		if(empty($this->updated_at))
			return null;

		return date('d/m/Y H:i:s', strtotime($this->updated_at));
	}

	public function getStatusFormatAttribute(){
		if(empty($this->status))
			return null;

		return $this->_status[$this->status];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->where('status', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function client(){
		return $this->belongsTo(Client::class, 'client_id', 'id');
	}

	public function address(){
		return $this->belongsTo(RequestAddress::class, 'request_address_id', 'id');
	}

	public function payment(){
		return $this->belongsTo(RequestPayment::class, 'request_payment_id', 'id');
	}

	public function products(){
		return $this->hasMany(RequestProduct::class, 'request_id', 'id');
	}
}