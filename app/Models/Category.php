<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Collection;

class Category extends Model{
	public $table = 'categories';
	protected $fillable = ['name', 'slug', 'description'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'name' 	=> "required|min:1|max:100|unique:{$this->table},name",
			'description' => 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 	=> "required|min:1|max:100|unique:{$this->table},name,{$this->id},id",
			'description' => 'required|min:1'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'name.unique' 			=> 'Este nome já está sendo utilizado, Tente outro nome!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('name', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function subcategories(){
		return $this->hasMany(SubCategory::class, 'category_id', 'id');
	}

	public function notices(){
		$subcategories = $this->subcategories;
		$notices = new Collection();

		foreach($subcategories as $subcategory) {
			$notices = $notices->merge($subcategory->notices);
		}

		return $notices;
	}

	public function products(){
		$subcategories = $this->subcategories;
		$products = new Collection();

		foreach($subcategories as $subcategory) {
			$products = $products->merge($subcategory->products);
		}

		return $products;
	}
}