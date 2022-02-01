<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model{
	public $table = 'subcategories';
	protected $fillable = ['name', 'slug', 'description', 'category_id'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'name' 	=> "required|min:1|max:100",
			'description' => 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 	=> "required|min:1|max:100",
			'description' => 'required|min:1'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $id, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->where('category_id', $id)
					->where('name', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function category(){
		return $this->belongsTo(Category::class, 'category_id', 'id');
	}

	public function notices(){
		return $this->belongsToMany(Notice::class, 'notices_subcategories', 'subcategory_id', 'notice_id');
	}

	public function products(){
		return $this->belongsToMany(Product::class, 'products_subcategories', 'subcategory_id', 'product_id');
	}
}