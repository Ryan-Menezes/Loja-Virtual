<?php
namespace App\Middlewares;

use Src\Classes\Request;
use App\Models\Lgpd as LgpdModel;

class Lgpd{
	public function redirectTo(){
		$request = new Request();
		$server = $request->server();
		$url = trim($server['SERVER_NAME'] . $server['REQUEST_URI'], '/');
		$ip = $server['REMOTE_ADDR'];
		$user_agent = $server['HTTP_USER_AGENT'];

		LgpdModel::create([
			'url' 		=> $url,
			'ip' 		=> $ip,
			'browser' 	=> browser($user_agent),
			'device' 	=> device($user_agent),
			'so' 		=> so($user_agent),
			'server' 	=> json_encode($server)
		]);
 	}
}