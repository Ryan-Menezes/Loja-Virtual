<?php
namespace Src\Classes;

use Exception;

class Route{
	/** @var string */
	private static $route;

	/** @var string */
	private static $controller;

	/** @var string|callable */
	private static $function;

	/** @var string|null */
	private static $prefix = null;

	/** @var array */
	private static $middlewares = [];

	/** @var array */
	private static $routes = [];

	/** @var array */
	private static $parameters = [];

	/** @var array */
	private static $errors = [];

	/**
	  * Method that adds a new route
	  *
	  * @param string
	  * @param string|array
	  * @param string $method
	  * 
	  * @return void
	  */
	private static function addRoute(string $route, $controller, string $method) : void{
		self::verifyRoute($route, $controller, self::$prefix);

		self::$routes[] = [
			'route' 		=> self::$route,
			'controller' 	=> self::$controller,
			'method' 		=> $method,
			'function'		=> self::$function,
			'name'			=> null,
			'middlewares'	=> self::$middlewares,
			'prefix'		=> self::$prefix,
			'parameters'	=> self::$parameters
		];

		self::$route = null;
		self::$controller = null;
		self::$function = null;
		self::$parameters = [];
	}

	/**
	  * Method that returns all routes
	  * 
	  * @return array
	  */
	public static function getRoutes() : array{
		return (array) self::$routes;
	}

	/**
	  * Method that checks whether a controller and its action is valid
	  * 
	  * @param string
	  * @param string|array
	  * @param string|null
	  *
	  * @return void
	  */
	private static function verifyRoute(string $route, $controller, ?string $prefix = null) : void{
		try{
			self::$route = trim($route, '/');

			self::setParameters(self::$route, self::$prefix);

			if(is_string($controller) && mb_stripos($controller, '@')){
				$controller = explode('@', $controller);
			}

			if(is_array($controller) && count($controller) == 2){
				self::$controller = $controller[0];
				self::$function = $controller[1];
			}else if(is_callable($controller)){
				self::$controller = null;
				self::$function = $controller;
			}else{
				throw new Exception('the controller informed is invalid', 1);
			}
		}catch(Exception $error){
			self::addError($error->getCode(), $error->getMessage(), $error->getLine(), $error->getFile());
		}
	}

	/**
	  * Method that adds a new parameter
	  * 
	  * @param string
	  * @param string|null
	  *
	  * @return void
	  */
	private static function addParameter(string $key, ?string $value) : void{
		self::$parameters[$key] = $value;
	}

	/**
	  * Method that validates and assigns each parameter passed by the route
	  * 
	  * @param string
	  * @param string|null
	  *
	  * @return void
	  */
	private static function setParameters(string $route, ?string $prefix = null) : void{
		if(!is_null($prefix))
			$route = trim(($prefix . '/' . $route), '/');

		$partsRoute = explode('/', $route);
		$partsRouteUrl = explode('/', Web::getRoute());
		$countRoute = count($partsRoute);
		$countRouteUrl = count($partsRouteUrl);

		for($i = 0; $i < $countRoute; $i++){
			$partRoute = $partsRoute[$i];

			if(mb_strlen($partRoute) > 0 && $partRoute[0] == '{' && $partRoute[mb_strlen($partRoute) - 1] == '}'){
				$paramKey = str_ireplace('?', '', trim($partRoute, '{}'));

				if(isset($partsRouteUrl[$i])){
					$paramValue = $partsRouteUrl[$i];
				}else{
					$paramValue = null;
				}

				self::addParameter($paramKey, $paramValue);
			}
		}
	}

	/**
	  * Method that adds GET method routes
	  * 
	  * @param string
	  * @param string|array
	  *
	  * @return \Src\Classes\Route
	  */
	public static function get(string $route, $controller) : Route{
		self::addRoute($route, $controller, 'GET');
		return new static;
	}

	/**
	  * Method that adds POST method routes
	  * 
	  * @param string
	  * @param string|array
	  *
	  * @return \Src\Classes\Route
	  */
	public static function post(string $route, $controller) : Route{
		self::addRoute($route, $controller, 'POST');
		return new static;
	}

	/**
	  * Method that adds PUT method routes
	  * 
	  * @param string
	  * @param string|array
	  *
	  * @return \Src\Classes\Route
	  */
	public static function put(string $route, $controller) : Route{
		self::addRoute($route, $controller, 'PUT');
		return new static;
	}

	/**
	  * Method that adds DELETE method routes
	  * 
	  * @param string
	  * @param string|array
	  *
	  * @return \Src\Classes\Route
	  */
	public static function delete(string $route, $controller) : Route{
		self::addRoute($route, $controller, 'DELETE');
		return new static;
	}

	/**
	  * Method that adds ANY method routes
	  * 
	  * @param string
	  * @param string|array
	  *
	  * @return \Src\Classes\Route
	  */
	public static function any(string $route, $controller) : Route{
		self::addRoute($route, $controller, 'ANY');
		return new static;
	}

	/**
	  * Method that sets a options to a route group
	  * 
	  * @param array
	  * @param callable
	  *
	  * @return void
	  */
	public static function group(array $options, callable $function) : void{
		$prefix = '/';
		if(array_key_exists('prefix', $options)){
			$prefix = $options['prefix'];
		}

		if(array_key_exists('middleware', $options)){
			if(is_string($options['middleware'])){
				self::$middlewares[] = $options['middleware'];
			}else if(is_array($options['middleware'])){
				foreach($options['middleware'] as $md){
					if(is_string($md)){
						self::$middlewares[] = $md;
					}
				}
			}
		}

		if(mb_strlen(self::$prefix) == 0){
			self::$prefix = trim($prefix, '/');
		}else{
			self::$prefix .= '/' . trim($prefix, '/');
		}

		$function();

		self::$prefix = trim(str_ireplace($prefix, '', self::$prefix), '/');

		if(array_key_exists('middleware', $options))
			self::$middlewares = [];
	}

	/**
	  * Method that Adds Alternate Name to Route
	  * 
	  * @param string
	  *
	  * @return \Src\Classes\Route
	  */
	public static function name(string $name) : Route{
		if(count(self::$routes) > 0) 
			self::$routes[count(self::$routes) - 1]['name'] = $name;

		return new static;
	}

	/**
	  * Method that adds a middleware
	  * 
	  * @param string
	  *
	  * @return \Src\Classes\Route
	  */
	public static function middleware($value) : Route{
		if(is_string($value)){
			self::$routes[count(self::$routes) - 1]['middlewares'][] = $value;
		}else if(is_array($value)){
			foreach($value as $md){
				if(is_string($md)){
					self::$routes[count(self::$routes) - 1]['middlewares'][] = $md;
				}
			}
		}

		return new static;
	}

	/**
	  * Method that add a route to history
	  *
	  * @param string
	  *
	  * @return void
	  */
	private static function addHistoric(string $route) : void{
		if(!session()->has('historic')){
			session('historic', [$route]);
		}else{
			$historic = session('historic');
			$historic[] = $route;
			session('historic', $historic);
		}
	}

	/**
	  * Method that returns browsing history
	  *
	  * @return array
	  */
	public static function historic() : array{
		return session('historic');
	}

	/**
	  * Method that adds a new error
	  * 
	  * @param string
	  * @param string
	  * @param string
	  * @param string
	  *
	  * @return void
	  */
	private static function addError(string $code, string $message, string $line, string $file) : void{
		self::$errors[] = "ERROR: {$message} on line 10 in {$file} file";
	}

	/**
	  * Method that returns all errors caught during route execution
	  *
	  * @return array
	  */
	public static function errors() : array{
		return (array) self::$errors;
	}

	/**
	  * Method that displays the first error
	  */
	public static function viewError(){
		if(!empty(self::errors())){
			if(config('app.debug')){
				foreach(self::errors() as $error){
					echo "{$error}<br>";
					die();
				}
			}else{
				abort(500);
			}
		}
	}

	/**
	  * Method verifies that a route is the same as the URL route
	  * 
	  * @param array
	  *
	  * @return bool
	  */
	private static function equalRoute(array $route) : bool{
		$routeComplete = $route['route'];

		if(!is_null($route['prefix']))
			$routeComplete = trim($route['prefix'] . '/' . $route['route'], '/');

		$partsRoute = explode('/', trim($routeComplete, '/'));
		$partsRouteUrl = explode('/', Web::getRoute());
		$countRoute = count($partsRoute);
		$countRouteUrl = count($partsRouteUrl);

		if($countRouteUrl > $countRoute) return false;

		for($i = 0; $i < $countRoute; $i++){
			$partRoute = $partsRoute[$i];

			if(mb_strlen($partRoute) > 0 && $partRoute[0] == '{' && $partRoute[mb_strlen($partRoute) - 1] == '}'){
				$paramKey = str_ireplace('?', '', trim($partRoute, '{}'));

				if(mb_strlen($route['parameters'][$paramKey]) == 0 && $partRoute[1] != '?'){
					return false;
				}
			}else if(!isset($partsRouteUrl[$i]) || $partRoute != $partsRouteUrl[$i]){
				return false;
			}
		}

		return true;
	}

	/**
	  * Method that checks which route has been selected and executes it
	  *
	  * @return void
	  */
	public static function dispatch() : void{
		try{
			self::viewError();
			$request = new Request();

			foreach(self::getRoutes() as $route){
				if(self::equalRoute($route) && ($route['method'] == 'ANY' || $request->isMethod($route['method']) || $request->input('_method') == $route['method'])){

					if(!empty($route['parameters'])){
						$parameters = array_values($route['parameters']);
					}else{
						$parameters = [];
					}
					
					if($route['method'] == 'GET'){
						self::addHistoric(Web::getRoute());
					}

					if(!empty($route['middlewares'])){
						foreach($route['middlewares'] as $md){
							if(is_string($md) && class_exists($md)){
								$obj = new $md();

								if(method_exists($obj, 'redirectTo')){
									$obj->redirectTo();
								}
							}
						}
					}

					if(!is_null($route['controller']) && !empty($route['controller'])){
						if(!class_exists($route['controller']))
							throw new Exception('the controller informed does not exist', 500);

						$controller = new $route['controller'];

						if(!method_exists($controller, $route['function']))
							throw new Exception("the '{$route['controller']}' class method does not exist", 500);

						$method = $route['function'];
								
						try{
							echo $controller->$method(...$parameters);
							return;
						}catch(Exception $error){
							if(!config('app.debug'))
								abort(404);
							
							self::addError($error->getCode(), $error->getMessage(), $error->getLine(), $error->getFile());
						}							
					}else{
						try{
							echo $route['function']();
							return;
						}catch(Exception $error){
							if(!config('app.debug'))
								abort(404);
							
							self::addError($error->getCode(), $error->getMessage(), $error->getLine(), $error->getFile());
						}
					}
				}
			}
		}catch(Exception $error){
			self::addError($error->getCode(), $error->getMessage(), $error->getLine(), $error->getFile());
		}

		self::viewError();

		abort(404);
	}
}