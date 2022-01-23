<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Galery extends Model{
	public $table = 'galleries';
	protected $fillable = ['title', 'slug', 'description'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'title' 		=> "required|min:1|max:100",
			'description' 	=> "min:1",
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'title' 		=> "required|min:1|max:100",
			'description' 	=> "min:1"
		];
	}

	public function getMessagesAttribute(){
		return [
			'title.required' 		=> 'O preenchimento do campo titulo é obrigatório!',
			'title.min' 			=> 'O campo titulo deve conter no mínimo %min% caracteres!',
			'title.max' 			=> 'O campo titulo deve conter no máximo %max% caracteres!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('title', 'LIKE', "%{$filter}%")
					->orWhere('description', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function images(){
        return $this->hasMany(GaleryImage::class, 'galery_id', 'id');
    }
}