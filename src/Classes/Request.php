<?php
namespace Src\Classes;

use Src\Classes\Storage\File;

class Request{
	/** @var array */
	private $data;

	/** @var array */
	private $files;

	/** @var array */
	private $server;

	/**
	  * Method that initializes parameters
	  *
	  * @return void
	  */
	public function __construct(){
		$files = [];

		foreach($_FILES as $name => $file){
			if(is_array($file['type'])){
				for($i = 0; $i < count($file['type']); $i++){
					foreach(array_keys($file) as $key){
						$files[$name][$i][$key] = $file[$key][$i];
					}

					$files[$name][$i] = new File($files[$name][$i]);
				}
			}else{
				$files[$name] = new File($file);
			}
		}

		$this->files = $files;
		$this->server = $_SERVER;
		$this->data = array_merge($_REQUEST, $this->files);
	}

	/**
	  * Method that returns the requested value
	  * 
	  * @param string
	  *
	  * @return array|string|null|object
	  */
	public function __get(string $key){
		if(array_key_exists($key, $this->server))
			return $this->server[$key];

		if(array_key_exists($key, $this->files))
			return $this->files[$key];

		if(array_key_exists($key, $this->data))
			return $this->data[$key];

		return null;
	}

	/**
	  * Method returns server
	  *
	  * @return array
	  */
	public function server() : array{
		return $this->server;
	}

	/**
	  * Method that checks whether a given value exists
	  * 
	  * @param string
	  *
	  * @return bool
	  */
	public function has(string $key) : bool{
		return array_key_exists($key, $this->data);
	}

	/**
	  * Method fetches and returns a value
	  * 
	  * @param string
	  *
	  * @return array|string|null|object
	  */
	public function input(string $key){
		if(!array_key_exists($key, $this->data))
			return null;

		return $this->data[$key];
	}

	/**
	  * Method fetches and returns a value
	  * 
	  * @param string
	  *
	  * @return array|string|null|object
	  */
	public function file(string $key){
		if(!array_key_exists($key, $this->data))
			return null;

		return $this->files[$key];
	}

	/**
	  * Method that checks the type of the request method
	  * 
	  * @param string
	  *
	  * @return bool
	  */
	public function isMethod(string $method) : bool{
		return($this->server['REQUEST_METHOD'] == $method);
	}

	/**
	  * Method that returns all values ​​passed by "request"
	  *
	  * @return array
	  */
	public function all() : array{
		return $this->except('route');
	}

	/**
	  * Method that returns all values ​​passed by "request"
	  * 
	  * @param array|string
	  *
	  * @return array
	  */
	public function except($keys) : array{
		$data = $this->data;

		if(is_string($keys)){
			$keys = ['route', $keys];
		}else if(is_array($keys)){
			$keys[] = 'route';
		}

		foreach($keys as $key){
			if(array_key_exists($key, $data)){
				unset($data[$key]);
			}
		}

		return $data;
	}

	/**
	  * Method that validates form data
	  * 
	  * @param array
	  * @param array
	  *
	  * @return array
	  */
	public function validator(array $roles, array $messages = []) : array{
		return validator($this->all(), $roles, $messages);
	}
}