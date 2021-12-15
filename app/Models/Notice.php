<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notice extends Model{
	public $table = 'notices';
	protected $fillable = ['title', 'slug', 'tags', 'visible', 'visit', 'description', 'content', 'user_id'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'title' 		=> "required|min:1|max:191|unique:{$this->table},title",
			'description' 	=> 'required|min:1',
			'content' 		=> 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'title' 		=> "required|min:1|max:191|unique:{$this->table},title,{$this->title}",
			'description' 	=> 'required|min:1',
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
			'title.required' 		=> 'O preenchimento do campo titulo é obrigatório!',
			'title.min' 			=> 'O campo titulo deve conter no mínimo %min% caracteres!',
			'title.max' 			=> 'O campo titulo deve conter no máximo %max% caracteres!',
			'title.unique' 			=> 'Este título já está sendo utilizado, Tente outro titulo!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $page = 0, $filter = ''){
		$limit = config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('title', 'LIKE', "%{$filter}%")
					->orWhere('slug', 'LIKE', "%{$filter}%")
					->orWhere('tags', 'LIKE', "%{$filter}%")
					->orWhere('description', 'LIKE', "%{$filter}%")
					->orWhere('content', 'LIKE', "%{$filter}%")
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

	public function author(){
		return $this->belongsTo(User::class, 'user_id', 'id');
	}

	public function comments(){
		return $this->hasMany(Comment::class, 'notice_id', 'id');
	}

	public function categories(){
		return $this->belongsToMany(Category::class, 'notices_categories');
	}
}