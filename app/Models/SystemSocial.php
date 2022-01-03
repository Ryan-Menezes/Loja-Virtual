<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemSocial extends Model{
	public $table = 'system_social';
	protected $fillable = ['facebook', 'instagram', 'twitter', 'linkedin', 'youtube', 'twitch', 'discord', 'whatsapp'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'facebook' 	=> "min:1|max:191",
			'instagram' => "min:1|max:191",
			'twitter' 	=> "min:1|max:191",
			'linkedin' 	=> "min:1|max:191",
			'youtube' 	=> "min:1|max:191",
			'twitch' 	=> "min:1|max:191",
			'discord' 	=> "min:1|max:191",
			'whatsapp' 	=> "min:11|max:11"
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'facebook' 	=> "min:1|max:191",
			'instagram' => "min:1|max:191",
			'twitter' 	=> "min:1|max:191",
			'linkedin' 	=> "min:1|max:191",
			'youtube' 	=> "min:1|max:191",
			'twitch' 	=> "min:1|max:191",
			'discord' 	=> "min:1|max:191",
			'whatsapp' 	=> "min:11|max:11"
		];
	}

	public function getMessagesAttribute(){
		return [
			'facebook.min' 	=> 'O campo facebook deve conter no mínimo %min% caracteres!',
			'facebook.max' 	=> 'O campo facebook deve conter no máximo %max% caracteres!',
			'instagram.min' => 'O campo instagram deve conter no mínimo %min% caracteres!',
			'instagram.max' => 'O campo instagram deve conter no máximo %max% caracteres!',
			'twitter.min' 	=> 'O campo twitter deve conter no mínimo %min% caracteres!',
			'twitter.max' 	=> 'O campo twitter deve conter no máximo %max% caracteres!',
			'linkedin.min' 	=> 'O campo linkedin deve conter no mínimo %min% caracteres!',
			'linkedin.max' 	=> 'O campo linkedin deve conter no máximo %max% caracteres!',
			'youtube.min' 	=> 'O campo youtube deve conter no mínimo %min% caracteres!',
			'youtube.max' 	=> 'O campo youtube deve conter no máximo %max% caracteres!',
			'twitch.min' 	=> 'O campo twitch deve conter no mínimo %min% caracteres!',
			'twitch.max' 	=> 'O campo twitch deve conter no máximo %max% caracteres!',
			'discord.min' 	=> 'O campo discord deve conter no mínimo %min% caracteres!',
			'discord.max' 	=> 'O campo discord deve conter no máximo %max% caracteres!',
			'whatsapp.min' 	=> 'O campo whatsapp deve conter no mínimo %min% caracteres!',
			'whatsapp.max' 	=> 'O campo whatsapp deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_social_id', 'id');
	}
}