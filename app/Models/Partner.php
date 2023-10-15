<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model{
	public $table = 'partners';
	protected $fillable = ['title', 'slug', 'description', 'link', 'type', 'image'];
	public $timestamps = false;
	public $_status = [
		'CL' => 'Cliente',
		'CO' => 'Colaborador',
		'LK' => 'Link Útil'
	];

	public function getRolesCreateAttribute(){
		return [
			'title' 		=> 'required|min:1|max:191',
			'description' 	=> 'min:1',
			'link' 			=> 'min:1|max:191',
			'type'			=> 'min:2|max:2'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'title' 		=> 'required|min:1|max:191',
			'description' 	=> 'min:1',
			'link' 			=> 'min:1|max:191',
			'type'			=> 'min:2|max:2'
		];
	}

	public function getMessagesAttribute(){
		return [
			'title.required' 		=> 'O preenchimento do campo titulo é obrigatório!',
			'title.min' 			=> 'O campo titulo deve conter no mínimo %min% caracteres!',
			'title.max' 			=> 'O campo titulo deve conter no máximo %max% caracteres!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!',
			'link.min' 				=> 'O campo link deve conter no mínimo %min% caracteres!',
			'link.max' 				=> 'O campo link deve conter no máximo %max% caracteres!',
			'type.min' 				=> 'O campo tipo deve conter no mínimo %min% caracteres!',
			'type.max' 				=> 'O campo tipo deve conter no máximo %max% caracteres!'
		];
	}

	public function getStatusFormatAttribute(){
		if(empty($this->status) || !array_key_exists($this->status, $this->$_status))
			return null;

		return $this->$_status[$this->status];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('title', 'LIKE', "%{$filter}%")
					->orWhere('description', 'LIKE', "%{$filter}%")
					->orWhere('link', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public static function cached()
	{
		return cache()->rememberForever('site-partners', fn () => self::all());
	}

	protected static function booted(): void
    {
		$fn = fn () => cache()->forget('site-partners');

        static::created($fn);
		static::deleted($fn);
		static::updated($fn);
    }
}