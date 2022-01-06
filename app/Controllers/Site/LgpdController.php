<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	System,
	SystemLgpd
};

class LgpdController extends Controller{
	private $system;

	public function __construct(){
		$this->system = (new System())->firstOrFail();
	}

	public function privacy_policy(){
		$lgpd = $this->system->lgpd;

		if(!$lgpd || !$lgpd->privacy_policy){
			abort(404);
		}

		header('Content-Type: application/pdf');

		return file_get_contents(dirname(__DIR__, 3) . '/storage/app/public/' . $lgpd->privacy_policy);
	}

	public function terms_conditions(){
		$lgpd = $this->system->lgpd;

		if(!$lgpd || !$lgpd->terms_conditions){
			abort(404);
		}

		header('Content-Type: application/pdf');

		return file_get_contents(dirname(__DIR__, 3) . '/storage/app/public/' . $lgpd->terms_conditions);
	}
}