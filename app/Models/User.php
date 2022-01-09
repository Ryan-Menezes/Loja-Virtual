<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model{
	public $table = 'users';
	protected $fillable = ['name', 'email', 'password'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'name' 		=> 'required|min:1|max:100',
			'email' 	=> "required|email|min:1|max:100|unique:{$this->table},email",
			'password' 	=> 'required|min:8|max:100',
			'role'		=> 'required'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 		=> 'required|min:1|max:100',
			'email' 	=> "required|email|min:1|max:100|unique:{$this->table},email,{$this->id},id",
			'password' 	=> 'min:8|max:100',
			'role'		=> 'required'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'email.required' 		=> 'O preenchimento do campo email é obrigatório!',
			'email.email' 			=> 'Informe um email válido!',
			'email.min' 			=> 'O campo email deve conter no mínimo %min% caracteres!',
			'email.max' 			=> 'O campo email deve conter no máximo %max% caracteres!',
			'email.unique' 			=> 'Este email já está sendo utilizado, Tente outro email!',
			'password.required' 	=> 'O preenchimento do campo nome é obrigatório!',
			'password.min' 			=> 'O campo senha deve conter no mínimo %min% caracteres!',
			'password.max' 			=> 'O campo senha deve conter no máximo %max% caracteres!',
			'role.required' 		=> 'Selecione uma função que este usuário exercerá no sistema!'
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

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('name', 'LIKE', "%{$filter}%")
					->orWhere('email', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function roles(){
		return $this->belongsToMany(Role::class, 'users_roles');
	}

	public function notices(){
		return $this->hasMany(Notice::class);
	}

	public function can(string $permission) : bool{
		foreach($this->roles as $role){
			foreach($role->permissions as $perm){
				if($perm->name == $permission)
					return true;
			}
		}

		return false;
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}
}