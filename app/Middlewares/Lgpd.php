<?php
namespace App\Middlewares;

use Src\Classes\Request;
use App\Models\Lgpd as LgpdModel;

class Lgpd{
	public function redirectTo(){
		$request = new Request();
		$server = $request->server();
		$url = (isset($server['HTTPS']) && $server['HTTPS'] === 'on' ? "https" : "http") . '://' . $server['HTTP_HOST'] . $server['REQUEST_URI'];
		$method = $server['REQUEST_METHOD'];
		$ip = $server['REMOTE_ADDR'];
		$user_agent = $server['HTTP_USER_AGENT'];
		$referer = $server['HTTP_REFERER'] ?? 'Acesso Direto';

		if(!preg_match('/\.(css|js|jpg|jpeg|gif|png)$/mi', $url)){
			LgpdModel::create([
				'url' 		=> $url,
				'method'	=> $method,
				'ip' 		=> $ip,
				'browser' 	=> browser($user_agent),
				'device' 	=> device($user_agent),
				'so' 		=> so($user_agent),
				'referer' 	=> $referer,
				'server' 	=> json_encode($server)
			]);
		}
 	}
}