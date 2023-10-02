<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SlideShow extends Model{
	public $table = 'slideshow';
	protected $fillable = ['title', 'description', 'link', 'image'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'title' 		=> "min:1|max:100",
			'description' 	=> "min:1",
			'link' 			=> "min:1|max:191"
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'title' 		=> "min:1|max:100",
			'description' 	=> "min:1",
			'link' 			=> "min:1|max:191"
		];
	}

	public function getMessagesAttribute(){
		return [
			'title.min' 			=> 'O campo titulo deve conter no mínimo %min% caracteres!',
			'title.max' 			=> 'O campo titulo deve conter no máximo %max% caracteres!',
			'description.required' 	=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 		=> 'O campo descrição deve conter no mínimo %min% caracteres!',
			'link.min' 				=> 'O campo link deve conter no mínimo %min% caracteres!',
			'link.max' 				=> 'O campo link deve conter no máximo %max% caracteres!'
		];
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
		return cache()->rememberForever('site-slideshow', fn () => self::all());
	}

	protected static function booted(): void
    {
		$fn = fn () => cache()->forget('site-slideshow');

        static::created($fn);
		static::deleted($fn);
		static::updated($fn);
    }
}