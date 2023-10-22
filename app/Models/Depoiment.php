<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Depoiment extends Model{
	public $table = 'depoiments';
	protected $fillable = ['name', 'content', 'visible'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'name' 	=> "required|min:1|max:191",
			'content' => 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 	=> "required|min:1|max:191",
			'content' => 'required|min:1'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'name.unique' 			=> 'Este nome já está sendo utilizado, Tente outro nome!',
			'content.required' 		=> 'O preenchimento do campo descrição é obrigatório!',
			'content.min' 			=> 'O campo descrição deve conter no mínimo %min% caracteres!'
		];
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('name', 'LIKE', "%{$filter}%")
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

	public static function cached()
	{
		return cache()->rememberForever('site-depoiments', fn () => self::where('visible', true)->get());
	}

	protected static function booted(): void
    {
		$fn = fn () => cache()->forget('site-depoiments');

        static::created($fn);
		static::deleted($fn);
		static::updated($fn);
    }
}