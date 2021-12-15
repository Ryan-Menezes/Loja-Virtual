<?php
namespace App\Middlewares;

use Src\Classes\Auth;

class Authenticate{
	/**
	  * Method that checks for logged in users
	  *
	  * @return void
	  */
	public function redirectTo(){
		if(!Auth::hasAuthenticate()){
			redirect(route('panel.login'));
		}
	}
}