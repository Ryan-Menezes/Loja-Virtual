<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model{
	public $table = 'coupons';
	protected $fillable = ['code', 'percent', 'expiration'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'code' 			=> "required|min:1|max:50|unique:{$this->table},code",
			'percent' 		=> 'required|numeric',
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'code' 			=> "required|min:1|max:50|unique:{$this->table},code,{$this->id},id",
			'percent' 		=> 'required|numeric'
		];
	}

	public function getMessagesAttribute(){
		return [
			'code.required'			=> 'O preenchimento do campo código é obrigatório!',
			'code.min' 				=> 'O campo código deve conter no mínimo %min% caracteres!',
			'code.max' 				=> 'O campo código deve conter no máximo %max% caracteres!',
			'code.unique'			=> 'O código informado já está em uso!',
			'percent.required' 		=> 'O preenchimento do campo porcentagem é obrigatório!',
			'percent.numeric' 		=> 'O campo porcentagem deve ser numérico'
		];
	}

	public function getExpirationFormatAttribute(){
		if(empty($this->expiration))
			return null;

		return date('d/m/Y', strtotime($this->expiration));
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('code', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function products(){
		return $this->belongsToMany(Product::class, 'coupons_products', 'coupon_id', 'product_id');
	}

	public function subcategories(){
		return $this->belongsToMany(SubCategory::class, 'coupons_subcategories', 'coupon_id', 'subcategory_id');
	}
}