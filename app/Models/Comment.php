<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model{
	public $table = 'comments';
	protected $fillable = ['name', 'email', 'content', 'visible', 'notice_id'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'name' 			=> "required|min:1|max:100",
			'email' 		=> 'required|email|min:1|max:100',
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
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'email.required' 		=> 'O preenchimento do campo email é obrigatório!',
			'email.email' 			=> 'Informe um email válido!',
			'email.min' 			=> 'O campo email deve conter no mínimo %min% caracteres!',
			'email.max' 			=> 'O campo email deve conter no máximo %max% caracteres!',
			'content.required' 		=> 'O preenchimento do campo descrição é obrigatório!',
			'content.min' 			=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('name', 'LIKE', "%{$filter}%")
					->orWhere('email', 'LIKE', "%{$filter}%")
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

	public function notice(){
		return $this->belongsTo(Notice::class, 'notice_id', 'id');
	}

	public function subcomments(){
		return $this->hasMany(SubComment::class, 'comment_id', 'id');
	}
}