<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model{
	public $table = 'ratings';
	protected $fillable = ['stars', 'content', 'visible', 'product_id', 'client_id'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'stars' 		=> 'required|numeric',
			'content' 		=> 'required|min:1'
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

	public function getMessagesAttribute(){
		return [
			'stars.required' 		=> 'Informe o número de estrleas da avaliação!',
			'stars.numeric'			=> 'As estrelas da avaliação devem ser do tipo numérico!',
			'content.required' 		=> 'O preenchimento do campo descrição é obrigatório!',
			'content.min' 			=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('stars', 'LIKE', "%{$filter}%")
					->orWhere('content', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function product(){
		return $this->belongsTo(Product::class, 'product_id', 'id');
	}

	public function client(){
		return $this->belongsTo(Client::class, 'client_id', 'id');
	}
}