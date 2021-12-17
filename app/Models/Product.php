<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model{
	public $table = 'products';
	protected $fillable = ['name', 'slug', 'description', 'promotion_percent', 'promotion_expiration', 'visible'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'name' 				=> "required|min:1|max:191|unique:{$this->table},name",
			'description' 		=> 'required|min:1',
			'promotion_percent' => 'numeric'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 			=> "required|min:1|max:191|unique:{$this->name},name,{$this->name}",
			'description' 	=> 'required|min:1',
			'promotion_percent' => 'numeric'
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
			'name.required' 			=> 'O preenchimento do campo titulo é obrigatório!',
			'name.min' 					=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 					=> 'O campo nome deve conter no máximo %max% caracteres!',
			'name.unique' 				=> 'Este nome já está sendo utilizado, Tente outro nome!',
			'description.required' 		=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 			=> 'O campo descrição deve conter no mínimo %min% caracteres!',
			'promotion_percent.numeric' => 'A porcentagem da promoção deve ser numérico!'
		];
	}

	public function scopeSearch($query, $page = 0, $filter = ''){
		$limit = config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('name', 'LIKE', "%{$filter}%")
					->orWhere('slug', 'LIKE', "%{$filter}%")
					->orWhere('description', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit)
					->get();
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function subcategories(){
		return $this->belongsToMany(SubCategory::class, 'products_subcategories', 'product_id', 'subcategory_id');
	}

	public function colors(){
		return $this->hasMany(ProductColor::class, 'product_id', 'id');
	}
}