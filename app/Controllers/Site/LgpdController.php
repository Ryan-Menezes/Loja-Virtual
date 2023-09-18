<?php
namespace App\Controllers\Site;

use Src\Classes\Controller;

class LgpdController extends Controller{
	public function privacy_policy(){
		if(!config('lgpd.privacy_policy')){
			abort(404);
		}

		header('Content-Type: application/pdf');

		return file_get_contents(dirname(__DIR__, 3) . '/storage/app/public/' . config('lgpd.privacy_policy'));
	}

	public function terms_conditions(){
		if(!config('lgpd.terms_conditions')){
			abort(404);
		}

		header('Content-Type: application/pdf');

		return file_get_contents(dirname(__DIR__, 3) . '/storage/app/public/' . config('lgpd.terms_conditions'));
	}

	public function return_policy(){
		if(!config('lgpd.return_policy')){
			abort(404);
		}

		header('Content-Type: application/pdf');

		return file_get_contents(dirname(__DIR__, 3) . '/storage/app/public/' . config('lgpd.return_policy'));
	}
}