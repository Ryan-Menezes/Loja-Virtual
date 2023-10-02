<?php
use Src\Classes\{
	Web,
	Route,
	View,
	Session,
	Validator,
	Auth,
    Cache
};
use Src\Classes\SiteMap\{
	SiteMap,
	SiteMapImage
};
use App\Classes\Payment\{
	PagSeguro,
	MercadoPago,
	PicPay
};
use App\Classes\Correios\Frete\FreteCorreios;
use App\Classes\Correios\Frete\FreteExternoCorreios;
use App\Models\Permission;

if(!function_exists('config')){
	function config(string $config){
		$config = explode('.', $config);

		if(count($config) > 1){
			$file = $config[0];

			$values = include __DIR__ . '/../config/' . $file . '.php';

			for($i = 1; $i < count($config); $i++){
				$key = $config[$i];

				if(is_array($values) && array_key_exists($key, $values)){
					$values = $values[$key];
				}
			}	

			return $values;
		}else if(count($config) === 1){
			$file = $config[0];
			return include __DIR__ . '/../config/' . $file . '.php';
		}

		return null;
	}
}

if(!function_exists('view')){
	function view(string $file, array $parameters = []) : string{
		$v = __DIR__ . '/../' . trim(config('view.dir'), '/');
		$c = __DIR__ . '/../' . trim(config('view.cache'), '/');

		$view = new View($v, $c);

		return $view->render($file, $parameters);
	}
}

if(!function_exists('redirect')){
	function redirect(string $url, array $parameters = [], bool $old = false) : void{
		$v = __DIR__ . '/../' . trim(config('view.dir'), '/');
		$c = __DIR__ . '/../' . trim(config('view.cache'), '/');

		$view = new View($v, $c);

		$view->redirect($url, $parameters, $old);
	}
}

if(!function_exists('url')){
	function url(string $route = null, bool $ftp_url = false) : string{
		if($ftp_url){
			$url = trim(config('ftp.url'), '/');
		}else{
			$url = trim(config('app.url'), '/');
		}

		$route = trim($route, '/');

		return str_ireplace("\\", '/', $url . '/' . $route);
	}
}

if(!function_exists('public_path')){
	function public_path(string $route = null) : string{
		return url('public/' . trim($route, '/'));
	}
}

if(!function_exists('route')){
	function route(?string $name = null, array $parameters = []){
		if(!is_null($name)  && mb_strlen($name) > 0){
			$routes = Route::getRoutes();

			foreach($routes as $rou){
				if(!empty($rou['name']) && $rou['name'] === $name){
					if(!is_null($rou['prefix']))
						$rou['route'] = $rou['prefix'] . '/' . $rou['route'];

					$parts = explode('/', trim($rou['route'], '/'));

					for($i = 0; $i < count($parts); $i++){
						$part = $parts[$i];
						$key = str_replace(['?', '{', '}'], '', $part);

						if(isset($parameters[$key]) && $part[0] == '{' && $part[mb_strlen($part) - 1] == '}'){
							$parts[$i] = $parameters[$key];
						}
					}

					$parts = str_replace(['{', '}'], ['', ''], implode('/', $parts));
					$parts = preg_replace('/\?.*\/?/i', '', $parts);

					return url($parts);
				}
			}

			return null;
		}

		return Web::getRoute();
	}
}

if(!function_exists('dd')){
	function dd($value) : string{
		echo '<pre>';
		print_r($value);
		echo '</pre>';
		die();
	}
}

if(!function_exists('session')){
	function session($key = null, $value = null){
		if(!is_null($key) && is_null($value))
			return Session::get($key);

		if(!is_null($key) && !is_null($value))
			return Session::set($key, $value);

		return new Session();
	}
}

if(!function_exists('validator')){
	function validator(array $data, array $roles, array $messages = []) : array{
		Validator::make($data, $roles, $messages);

		return Validator::errors();
	}
}

if(!function_exists('auth')){
	function auth($type = 'panel'){
		if($type == 'site')
			return session(config('app.url')) ? session(config('app.url'))['client'] : null;

		return new Auth();
	}
}

if(!function_exists('can')){
	function can(string $permission) : bool{
		if(auth()->hasAuthenticate()){
			return auth()->user()->can($permission);
		}
		
		return false;
	}
}

if(!function_exists('abort')){
	function abort(int $code, ?string $message = null) : void{
		if(is_null($message)){
			$message = config("server.error.{$code}");

			if(!is_string($message))
				$message = null;
		}

		header("HTTP/1.1 {$code}");

		require __DIR__ . '/../storage/framework/views/error.php';
		die();
	}
}

if(!function_exists('sitemap')){
	function sitemap(array $urls, bool $generateFile = true) : string{
		$filename = config('sitemap.filename');
		$sitemap = new SiteMap();

		foreach($urls as $url){
			if(array_key_exists('loc', $url) && array_key_exists('changefreq', $url) && array_key_exists('priority', $url) && !in_array('', $url)){
				$sitemap->addUrl($url['loc'],  $url['changefreq'], $url['priority']);
			}
		}

		if($generateFile)
			$sitemap->generate($filename);

		return $sitemap->xml();
	}
}

if(!function_exists('sitemapImages')){
	function sitemapImages(bool $generateFile = true) : string{
		$filename = config('sitemap.images.filename');
		$directories = config('sitemap.images.directories');
		$global = dirname(__DIR__, 1);
		$sitemap = new SiteMapImage(url());
		$extensions = [
			'jpg',
			'jpeg',
			'png',
			'gif',
			'bmp',
			'svg',
			'psd',
			'tiff',
			'raw',
			'webp',
			'exif'	
		];

		foreach($directories as $directory){
			$dir = $global . '/' . trim($directory, '/');

			if(is_dir($dir)){
				foreach(scandir($dir) as $d){
					if(in_array(pathinfo($d, PATHINFO_EXTENSION), $extensions)){
						$fname = pathinfo($d, PATHINFO_FILENAME);

						$sitemap->addUrl(url($directory . '/' . $d), $fname, 'São Paulo, Brazil', $fname);
					}
				}
			}
		}


		if($generateFile)
			$sitemap->generate($filename);

		return $sitemap->xml();
	}
}

if(!function_exists('mask')){
	function mask(?string $value, ?string $mask) : ?string{
		if(!empty($value)){
			$j = 0;

			for($i = 0; $i < mb_strlen($mask); $i++){
				if($mask[$i] == '#' && $j < mb_strlen($value)){
					$mask[$i] = $value[$j++];
				}
			}

			return $mask;
		}
		
		return null;
	}
}

if(!function_exists('old')){
	function old(string $key){
		if(session()->has('old')){
			$old = session('old');

			if(is_array($old) && array_key_exists($key, $old)){
				return $old[$key];
			}
		}

		return null;
	}
}

if(!function_exists('device')){
	function device($user_agent) : string{
		if(preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i', $user_agent) || preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i', substr($user_agent, 0, 4))) {
		    return 'Mobile';
		}

		return 'Computer';
	}
}

if(!function_exists('so')){
	function so($user_agent) : string{
	    $so = 'Unknown';
	    $sos = [
	        '/windows nt 11/i'     	=>  'Windows 11',
	        '/windows nt 10/i'     	=>  'Windows 10',
	        '/windows nt 6.3/i'     =>  'Windows 8.1',
	        '/windows nt 6.2/i'     =>  'Windows 8',
	        '/windows nt 6.1/i'     =>  'Windows 7',
	        '/windows nt 6.0/i'     =>  'Windows Vista',
	        '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
	        '/windows nt 5.1/i'     =>  'Windows XP',
	        '/windows xp/i'         =>  'Windows XP',
	        '/windows nt 5.0/i'     =>  'Windows 2000',
	        '/windows me/i'         =>  'Windows ME',
	        '/win98/i'              =>  'Windows 98',
	        '/win95/i'              =>  'Windows 95',
	        '/win16/i'              =>  'Windows 3.11',
	        '/macintosh|mac os x/i' =>  'Mac OS X',
	        '/mac_powerpc/i'        =>  'Mac OS 9',
	        '/linux/i'              =>  'Linux',
	        '/ubuntu/i'             =>  'Ubuntu',
	        '/iphone/i'             =>  'iPhone',
	        '/ipod/i'               =>  'iPod',
	        '/ipad/i'               =>  'iPad',
	        '/android/i'            =>  'Android',
	        '/blackberry/i'         =>  'BlackBerry',
	        '/webos/i'              =>  'Mobile'
	    ];

	    foreach($sos as $regex => $value) {
	        if(preg_match($regex, $user_agent)){
	            $so = $value;;
	        }
	    }

	    return $so;
	}
}

if(!function_exists('browser')){
	function browser($user_agent) : string{
	    $browser = 'Unknown';
	    $browsers = [
	        '/msie/i'       =>  'Internet Explorer',
	        '/firefox/i'    =>  'Firefox',
	        '/safari/i'     =>  'Safari',
	        '/chrome/i'     =>  'Chrome',
	        '/edge/i'       =>  'Edge',
	        '/opera/i'      =>  'Opera',
	        '/netscape/i'   =>  'Netscape',
	        '/maxthon/i'    =>  'Maxthon',
	        '/konqueror/i'  =>  'Konqueror'
	    ];

	    foreach($browsers as $regex => $value) {
	        if(preg_match($regex, $user_agent)) {
	            $browser = $value;
	        }
	    }

	    return $browser;
	}
}

if(!function_exists('number')){
	function number($number) : float{
	   	$number = str_ireplace('.', ',', trim($number));

	   	$index = strrpos($number, ',');
	   	if($index){
	   		$number[$index] = '.';
	   	}

	   	return (float) str_ireplace(',', '', trim($number));
	}
}

if(!function_exists('generatePermissions')){
	function generatePermissions($actions, $tables){
		foreach($tables as $table){
			foreach($actions as $action){
				Permission::create([
					'name' => "{$action}.{$table}",
					'description' => "{$action}.{$table}"
				]);
			}
		}
	}
}

if(!function_exists('freight')){
	function freight($postal_code, $weight, $width, $height, $depth) : array{
		$postal_code = preg_replace('/[^\d]/i', '', $postal_code);

		$data = [];

		if(mb_strlen($postal_code) == 8){
			try{
				if(config('store.freight.type') == 'C'){
					$types = [
						FreteCorreios::PAC 		=> 'PAC',
						FreteCorreios::SEDEX 	=> 'SEDEX'
					];

					$freight = new FreteExternoCorreios(config('store.freight.origin'), $postal_code, $weight, $depth, $height, $width);

					foreach($types as $key => $value){
						$result = $freight->calculate($key);

						$data[$value] = [
							'type' 		=> $value,
							'name' 		=> $value,
							'price'		=> $result['Valor'],
							'days'		=> $result['PrazoEntrega'],
							'message'	=> $result['obsFim'] ?? '',
							'error'	=> [
								'code' 	=> $result['Erro'],
								'msg'  	=> $result['MsgErro']
							]
						];
					}
				}else{
					$customized = config('store.freight.customized');
					$postal_code = (int)$postal_code;

					foreach($customized as $custom){
						$min = (int)$custom->postal_code_min;
						$max = (int)$custom->postal_code_max;

						if($postal_code >= $min && $postal_code <= $max){
							$data['CUSTOM'] = [
								'type' 		=> 'Personalizado',
								'name' 		=> 'CUSTOM',
								'price'		=> number_format($custom->value, 2, ',', '.'),
								'days'		=> $custom->days,
								'message'	=> null,
								'error'	=> [
									'code' 	=> 0,
									'msg'  	=> null
								]
							];
						}
					}
				}
			}catch(Exception $error){
				return $data;
			}
		}

		return $data;
	}
}

if(!function_exists('freight_format')){
	function freight_format($postal_code, $weight, $width, $height, $depth, $freight_free, $select = true) : string{
		$postal_code = preg_replace('/[^\d]/i', '', $postal_code);

		if(mb_strlen($postal_code) == 8){
			try{
				$html = '';

				$freights = freight($postal_code, $weight, $width, $height, $depth);
				$error = false;

				foreach($freights as $freight){
					if($freight['error']['code'] == FreteCorreios::ERROR_CODE){
						$error = true;
						continue;
					}

					if($select){
						$html .= view('includes.freight', [
							'title'		=> $freight['type'],
							'value'		=> $freight['name'],
							'price' 	=> $freight['price'],
							'days' 		=> $freight['days'],
							'message'	=> $freight['message']
						]);
					}else{
						$html .= view('includes.freight', [
							'title'		=> $freight['type'],
							'value'		=> $freight['name'],
							'price' 	=> $freight['price'],
							'days' 		=> $freight['days'],
							'message'	=> $freight['message'],
							'select'	=> false
						]);
					}

					if($freight_free){
						$freight['type'] 	= 'Frete Grátis - ' . $freight['type'];
						$freight['name'] 	= $freight['name'] . '-FG';
						$freight['price'] 	= '0,00';

						if($select){
							$html .= view('includes.freight', [
								'title'		=> $freight['type'],
								'value'		=> $freight['name'],
								'price' 	=> $freight['price'],
								'days' 		=> $freight['days'],
								'message'	=> $freight['message']
							]);
						}else{
							$html .= view('includes.freight', [
								'title'		=> $freight['type'],
								'value'		=> $freight['name'],
								'price' 	=> $freight['price'],
								'days' 		=> $freight['days'],
								'message'	=> $freight['message'],
								'select'	=> false
							]);
						}
					}
				}

				if(empty($freights) || empty($html)){
					if($error){
						$html = 'NÃO FOI POSSÍVEL CALCULAR O FRETE, OU O CEP INFORMADO É INVÁLIDO, OU OS PRODUTOS DO CARRINHO ÚLTRAPASSARAM OS LIMITES DE TAMANHO E PESO PERMITIDO PELOS CORREIOS!';
					}else{
						$html = 'NÃO FAZEMOS ENTREGA PARA O CEP INFORMADO, POR FAVOR ENTRE EM CONTATO CONOSCO PARA RESOLVERMOS ESTE PROBLEMA!';
					}
				}

				return $html;
			}catch(Exception $error){
				return 'NÃO FOI POSSÍVEL CALCULAR O FRETE, OCORREU UM ERRO NO CÁLCULO!';
			}
		}

		return 'O CEP INFORMADO É INVÁLIDO PARA CALCULAR O FRETE!';
	}
}

if(!function_exists('parse_object')){
	function parse_object($value){
		return ((array)$value)[0];
	}
}

if(!function_exists('update_payment_request_pagseguro')){
	function update_payment_request_pagseguro($pagseguro, $requestmodel): bool{
		$response = $pagseguro->transaction(config('store.reference_prefix') . $requestmodel->id);
		if($response && isset($response->transactions) && !empty($response->transactions)){
			$transaction = $response->transactions->transaction;
			
			$transaction = $pagseguro->transactionDetails($transaction->code);
			if($transaction->code){
				$status = [
					'AP',
					'EA', 
					'PA',
					'DI', 
					'ED',
					'DE',
					'CA'
				];
				$methods = [
					1 => 'CC',
					2 => 'BO',
					3 => 'DO',
					4 => 'BA',
					7 => 'DE'
				];

				$discount_installment = 0;
				if($transaction->discountAmount > 0){
					$discount_installment = $transaction->discountAmount;
				}else{
					$discount_installment = abs(abs((float)parse_object($transaction->extraAmount)) - ($requestmodel->payment->discount_coupon + $requestmodel->payment->discount_cart));
				}

				$requestmodel->payment->update([
					'code' 					=> parse_object($transaction->code),
					'type' 					=> 'PS',
					'method'				=> $methods[parse_object($transaction->paymentMethod->type)] ?? null,
					'status'				=> parse_object($transaction->status),
					'status_type'			=> $status[parse_object($transaction->status) - 1],
					'installments'			=> parse_object($transaction->installmentCount),
					'discount_installment'	=> $discount_installment,
					'link'					=> (isset($transaction->paymentLink) ? parse_object($transaction->paymentLink) : null),
					'details'				=> json_encode($transaction)
				]);

				$sta = $status[parse_object($transaction->status) - 1];

				$status = [
					'AP' => 'AP',
					'PA' => 'PA',
					'CA' => 'CA'
				];

				if(array_key_exists($sta, $status) && $status[$sta] != $requestmodel->status){
					if($status[$sta] == 'PA' && $requestmodel->status == 'AP'){
						$requestmodel->update([
							'status' => $status[$sta]
						]);	
					}elseif($status[$sta] == 'AP' || $status[$sta] == 'CA'){
						$requestmodel->update([
							'status' => $status[$sta]
						]);
					}
				}

				return true;
			}
		}

		return false;
	}
}

if(!function_exists('update_payment_request_mercadopago')){
	function update_payment_request_mercadopago($requestmodel): bool{
		if(!config('store.payment.credentials.mercadopago.access_token')){
			return false;
		}

		$mercadopago = new MercadoPago(config('store.payment.credentials.mercadopago.access_token'));

		$response = $mercadopago->transaction(config('store.reference_prefix') . $requestmodel->id);
		if($response && isset($response->results) && !empty($response->results)){
			$transaction = end($response->results);	
			$transaction = $mercadopago->transactionDetails($transaction->id);

			if($transaction->id && parse_object($transaction->status) != 'rejected'){
				$status = [
					'pending'			=> 'AP',
					'in_process' 		=> 'EA', 
					'approved' 			=> 'PA',
					'refunded'			=> 'DE',
					'cancelled'			=> 'CA'
				];
				$methods = [
					'credit_card' 		=> 'CC',
					'debit_card'		=> 'CD',
					'ticket' => [
						'bolbradesco' 	=> 'BO',
						'pec' 			=> 'TB'
					],
					'account_money' 	=> 'BA',
					'bank_transfer' 	=> 'PX',
					'digital_wallet' 	=> 'PP'
				];

				$method = $methods[parse_object($transaction->payment_type_id)];
				if(is_array($method)){
					$method = $method[parse_object($transaction->payment_method_id)];
				}

				$requestmodel->payment->update([
					'code' 					=> parse_object($transaction->id),
					'type' 					=> 'MP',
					'method'				=> $method ?? null,
					'status'				=> parse_object($transaction->status),
					'status_type'			=> $status[parse_object($transaction->status)],
					'installments'			=> (isset($transaction->installments) ? parse_object($transaction->installments) : 1),
					'link'					=> (isset($transaction->transaction_details->external_resource_url) ? parse_object($transaction->transaction_details->external_resource_url) : null),
					'details'				=> json_encode($transaction)
				]);

				$sta = $status[parse_object($transaction->status)];

				$status = [
					'AP' => 'AP',
					'PA' => 'PA',
					'CA' => 'CA'
				];

				if(array_key_exists($sta, $status) && $status[$sta] != $requestmodel->status){
					if($status[$sta] == 'PA' && $requestmodel->status == 'AP'){
						$requestmodel->update([
							'status' => $status[$sta]
						]);	
					}elseif($status[$sta] == 'AP' || $status[$sta] == 'CA'){
						$requestmodel->update([
							'status' => $status[$sta]
						]);
					}
				}

				return true;
			}
		}

		return false;
	}
}

if(!function_exists('update_payment_request_picpay')){
	function update_payment_request_picpay($picpay, $requestmodel): bool{
		$response = $picpay->status(config('store.reference_prefix') . $requestmodel->id);

		if($response && isset($response->referenceId)){
			$transaction = $response;
			
			$status = [
				'created' 		=> 'AP',
				'expired' 		=> 'CA',
				'analysis' 		=> 'PA',
				'paid' 			=> 'PA',
				'completed' 	=> 'DI',
				'refunded' 		=> 'DE',
				'chargeback' 	=> 'PA'
			];

			$requestmodel->payment->update([
				'code' 					=> (isset($transaction->authorizationId)) ? parse_object($transaction->authorizationId) : null,
				'type' 					=> 'PC',
				'method'				=> 'PX',
				'status'				=> parse_object($transaction->status),
				'status_type'			=> $status[parse_object($transaction->status)],
				'installments'			=> 1,
				'details'				=> json_encode($transaction)
			]);

			$status = [
				'created' 		=> 'AP',
				'expired' 		=> 'CA',
				'analysis' 		=> 'PA',
				'paid' 			=> 'PA',
				'completed' 	=> 'PA',
				'refunded' 		=> 'CA',
				'chargeback' 	=> 'PA'
			];

			$sta = parse_object($transaction->status);

			if(array_key_exists($sta, $status) && $status[$sta] != $requestmodel->status){
				if($status[$sta] == 'PA' && $requestmodel->status == 'AP'){
					$requestmodel->update([
						'status' => $status[$sta]
					]);	
				}elseif($status[$sta] == 'AP' || $status[$sta] == 'CA'){
					$requestmodel->update([
						'status' => $status[$sta]
					]);
				}
			}

			return true;
		}

		return false;
	}
}

if(!function_exists('cancel_payment')){
	function cancel_payment($requestmodel): bool{
		if($requestmodel->status == 'AP'){
			if($requestmodel->payment->code){
				if($requestmodel->payment->type == 'PS'){
					// Objeto do pagseguro
					$email = config('store.payment.credentials.pagseguro.email');
					$token = config('store.payment.credentials.pagseguro.token');
					$production = config('store.payment.production');

					$pagseguro = new PagSeguro($email, $token, !$production);

					// Cancela a transação
					$response = $pagseguro->cancel($requestmodel->payment->code);

					// Verifica se a transação para este pedido já foi feita
					update_payment_request_pagseguro($pagseguro, $requestmodel);
					
					if(!empty($response) && !isset($response->error)){
						$requestmodel->status = 'CA';
						$requestmodel->save();

						return true;
					}
				}else if($requestmodel->payment->type == 'MP'){
					$mercadopago = new MercadoPago(config('store.payment.credentials.mercadopago.access_token'));
	
					$response = $mercadopago->cancel($requestmodel->payment->code);
	
					// Verifica se a transação para este pedido já foi feita
					update_payment_request_mercadopago($requestmodel);
					
					if($response){
						$requestmodel->status = 'CA';
						$requestmodel->save();
	
						return true;
					}
				}
			}else if($requestmodel->payment->type == 'PC'){
				// Objeto do picpay
				$token = config('store.payment.credentials.picpay.token');
				$seller_token = config('store.payment.credentials.picpay.seller_token');
				$production = config('store.payment.production');

				$picpay = new PicPay($token, $seller_token);

				// Cancela a transação
				$response = $picpay->cancel(config('store.reference_prefix') . $requestmodel->id);

				// Verifica se a transação para este pedido já foi feita
				update_payment_request_picpay($picpay, $requestmodel);
				
				if(!empty($response) && isset($response->cancellationId)){
					$requestmodel->status = 'CA';
					$requestmodel->save();

					return true;
				}
			}else{
				$requestmodel->status = 'CA';
				$requestmodel->save();

				return true;
			}
		}

		return false;
	}
}

if(!function_exists('refund_payment')){
	function refund_payment($requestmodel): bool{
		if($requestmodel->status == 'PA'){
			if($requestmodel->payment->code){
				if($requestmodel->payment->type == 'PS'){
					// Objeto do pagseguro
					$email = config('store.payment.credentials.pagseguro.email');
					$token = config('store.payment.credentials.pagseguro.token');
					$production = config('store.payment.production');

					$pagseguro = new PagSeguro($email, $token, !$production);

					// Cancela a transação
					$response = $pagseguro->refund($requestmodel->payment->code);

					// Verifica se a transação para este pedido já foi feita
					update_payment_request_pagseguro($pagseguro, $requestmodel);
					
					if(!empty($response) && !isset($response->error)){
						$requestmodel->status = 'CA';
						$requestmodel->save();

						return true;
					}
				}else if($requestmodel->payment->type == 'MP'){
					$mercadopago = new MercadoPago(config('store.payment.credentials.mercadopago.access_token'));
	
					$response = $mercadopago->refund($requestmodel->payment->code);
	
					// Verifica se a transação para este pedido já foi feita
					update_payment_request_mercadopago($requestmodel);
					
					if(!empty($response) && !isset($response->id)){
						$requestmodel->status = 'CA';
						$requestmodel->save();

						return true;
					}
				}
			}else{
				$requestmodel->status = 'CA';
				$requestmodel->save();

				return true;
			}
		}

		return false;
	}
}

if(!function_exists('update_payment')){
	function update_payment($requestmodel){
		if(config('store.types.pagseguro') || $requestmodel->payment->type == 'PS'){
			// Objeto do pagseguro
			$email = config('store.payment.credentials.pagseguro.email');
			$token = config('store.payment.credentials.pagseguro.token');
			$production = config('store.payment.production');

			$pagseguro = new PagSeguro($email, $token, !$production);

			// Verifica se a transação para este pedido já foi feita
			update_payment_request_pagseguro($pagseguro, $requestmodel);
		}

		if(config('store.types.mercadopago') || $requestmodel->payment->type == 'MP'){
			// Verifica se a transação para este pedido já foi feita
			update_payment_request_mercadopago($requestmodel);
		}
		
		if(config('store.methods.pix') || $requestmodel->payment->type == 'PC'){
			// Objeto do picpay
            $token = config('store.payment.credentials.picpay.token');
            $seller_token = config('store.payment.credentials.picpay.seller_token');
            $production = config('store.payment.production');

            $picpay = new PicPay($token, $seller_token);

			// Verifica se a transação para este pedido já foi feita
			update_payment_request_picpay($picpay, $requestmodel);
		}
	}
}

if(!function_exists('cache')) {
	function cache(): Cache {
		return new Cache();
	}
}

if(!function_exists('slugify')){
	function slugify(string $string, string $separator = '-') : string{
		$string = preg_replace('/[\t\n]/', ' ', $string);
    	$string = preg_replace('/\s{2,}/', ' ', $string);

		$list = [
			'Š' => 'S',
			'š' => 's',
			'Đ' => 'Dj',
			'đ' => 'dj',
			'Ž' => 'Z',
			'ž' => 'z',
			'Č' => 'C',
			'č' => 'c',
			'Ć' => 'C',
			'ć' => 'c',
			'À' => 'A',
			'Á' => 'A',
			'Â' => 'A',
			'Ã' => 'A',
			'Ä' => 'A',
			'Å' => 'A',
			'Æ' => 'A',
			'Ç' => 'C',
			'È' => 'E',
			'É' => 'E',
			'Ê' => 'E',
			'Ë' => 'E',
			'Ì' => 'I',
			'Í' => 'I',
			'Î' => 'I',
			'Ï' => 'I',
			'Ñ' => 'N',
			'Ò' => 'O',
			'Ó' => 'O',
			'Ô' => 'O',
			'Õ' => 'O',
			'Ö' => 'O',
			'Ø' => 'O',
			'Ù' => 'U',
			'Ú' => 'U',
			'Û' => 'U',
			'Ü' => 'U',
			'Ý' => 'Y',
			'Þ' => 'B',
			'ß' => 'Ss',
			'à' => 'a',
			'á' => 'a',
			'â' => 'a',
			'ã' => 'a',
			'ä' => 'a',
			'å' => 'a',
			'æ' => 'a',
			'ç' => 'c',
			'è' => 'e',
			'é' => 'e',
			'ê' => 'e',
			'ë' => 'e',
			'ì' => 'i',
			'í' => 'i',
			'î' => 'i',
			'ï' => 'i',
			'ð' => 'o',
			'ñ' => 'n',
			'ò' => 'o',
			'ó' => 'o',
			'ô' => 'o',
			'õ' => 'o',
			'ö' => 'o',
			'ø' => 'o',
			'ù' => 'u',
			'ú' => 'u',
			'û' => 'u',
			'ý' => 'y',
			'ý' => 'y',
			'þ' => 'b',
			'ÿ' => 'y',
			'Ŕ' => 'R',
			'ŕ' => 'r',
			','	=> $separator,
			'/' => $separator,
			' ' => $separator,
			'.' => $separator,
			'?' => $separator,
			'+' => $separator,
			'*' => $separator,
			'\\' => $separator,
			'=' => $separator,
			'{' => $separator,
			'}' => $separator,
			'º' => $separator,
			'ª' => $separator,
			']' => $separator,
			'[' => $separator,
			'`' => $separator,
			'´' => $separator,
			'&' => $separator,
			'%' => $separator,
			'$' => $separator,
			'#' => $separator,
			'@' => $separator,
			'!' => $separator,
			'"' => $separator,
			'\'' => $separator,
			'+' => $separator,
			';' => $separator,
			':' => $separator,
			'|' => $separator,
			'(' => $separator,
			')' => $separator,
		];

		$string = strtr($string, $list);
	    $string = preg_replace("/{$separator}{2,}/", $separator, $string);
	    $string = mb_strtolower($string);
		$string = trim($string, $separator);

	    return $string;
	}
}

if(!function_exists('sanitize_output')){
	function sanitize_output($buffer) {
		$search = array(
			'/\>[^\S ]+/s',     // strip whitespaces after tags, except space
			'/[^\S ]+\</s',     // strip whitespaces before tags, except space
			'/(\s)+/s',         // shorten multiple whitespace sequences
			'/<!--(.|\s)*?-->/' // Remove HTML comments
		);

		$replace = array(
			'>',
			'<',
			'\\1',
			''
		);

		$buffer = preg_replace($search, $replace, $buffer);
		return $buffer;
	}
}