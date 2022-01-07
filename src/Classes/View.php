<?php
namespace Src\Classes;

use Jenssegers\Blade\Blade;

class View{
	/** @var Jenssegers\Blade\Blade */
	private $blade;

	/**
	  * Method that boots the blade
	  * 
	  * @param string
	  * @param string
	  *
	  * @return void
	  */
	public function __construct(string $dir, string $cache){
		$this->blade = new Blade($dir, $cache);
	}

	/**
	  * Method that renders a view
	  * 
	  * @param string
	  * @param array
	  *
	  * @return string
	  */
	public function render(string $view, array $parameters = []) : string{
		if(session()->has('redirect') && is_array(session('redirect')) && array_key_exists('parameters', session('redirect'))){
			$parameters = array_merge($parameters, session('redirect')['parameters']);
			session()->remove('redirect');
		}

		return $this->blade->render($view, $parameters);
	}

	/**
	  * Method that redirects to a route
	  * 
	  * @param string
	  * @param array
	  *
	  * @return void
	  */
	public function redirect(string $url, array $parameters = [], bool $old = false) : void{
		session()->set('redirect', [
			'url' => $url,
			'parameters' => $parameters
		]);

		if($old){
			session()->flash('old', (new Request())->all());
		}

		header("location: {$url}");
		die();
	}
}