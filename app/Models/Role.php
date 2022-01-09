<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model{
	public $table = 'roles';
	protected $fillable = ['name', 'description'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'name' 			=> "required|min:1|max:100|unique:{$this->table},name",
			'description' 	=> 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 			=> "required|min:1|max:100|unique:{$this->table},name,{$this->id},id",
			'description' 	=> 'required|min:1'
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
					->orWhere('description', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function permissions(){
		return $this->belongsToMany(Permission::class, 'roles_permissions');
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}
}