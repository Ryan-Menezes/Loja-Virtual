<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SystemFtp extends Model{
	public $table = 'system_ftp';
	protected $fillable = ['active', 'url', 'server', 'port', 'username', 'password', 'directory'];
	public $timestamps = false;

	public function getRolesCreateAttribute(){
		return [
			'url' 	        => 'min:1|max:191',
			'server' 	    => 'min:1|max:20',
			'port' 	    	=> 'numeric',
            'username' 	    => 'min:1|max:191',
            'password' 	    => 'min:1|max:191',
            'directory' 	=> 'min:1|max:191'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'url' 	        => 'min:1|max:191',
			'server' 	    => 'min:1|max:20',
			'port' 	    	=> 'numeric',
            'username' 	    => 'min:1|max:191',
            'password' 	    => 'min:1|max:191',
            'directory' 	=> 'min:1|max:191'
		];
	}

	public function getMessagesAttribute(){
		return [
			'url.min' 		    => 'O campo url deve conter no mínimo %min% caracteres!',
			'url.max' 		    => 'O campo url deve conter no máximo %max% caracteres!',
            'server.min' 	    => 'O campo servidor deve conter no mínimo %min% caracteres!',
			'server.max' 	    => 'O campo servidor deve conter no máximo %max% caracteres!',
			'port.numeric' 	    => 'O campo porta deve ser do tipo numérico!',
            'username.min' 	    => 'O campo username deve conter no mínimo %min% caracteres!',
			'username.max' 	    => 'O campo username deve conter no máximo %max% caracteres!',
            'password.min' 	    => 'O campo senha deve conter no mínimo %min% caracteres!',
			'password.max' 	    => 'O campo senha deve conter no máximo %max% caracteres!',
            'directory.min' 	=> 'O campo diretório deve conter no mínimo %min% caracteres!',
			'directory.max' 	=> 'O campo diretório deve conter no máximo %max% caracteres!'
		];
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function system(){
		return $this->hasOne(System::class, 'system_ftp_id', 'id');
	}
}