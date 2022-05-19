<?php
namespace Src\Classes;

use Illuminate\Database\Capsule\Manager as DB;

class Validator{
	/** @var array */
	private static $roles = [
		'required',
		'email',
		'numeric',
		'min',
		'max',
		'unique'
	];

	/** @var array */
	private static $messages = [
		'required' 	=> 'O campo %key% é de preenchimento obrigatório!',
		'email' 	=> 'O campo %key% deve ser um email válido!',
		'numeric' 	=> 'O campo %key% deve ser do tipo numérico',
		'min' 		=> 'O campo %key% deve conter no minímo %min% caracteres',
		'max' 		=> 'O campo %key% deve conter no máximo %max% caracteres',
		'unique' 	=> 'O campo %key% já está existe, Tente outro valor!'
	];

	/** @var array */
	private static $messagesErrors = [];

	/**
	  * Method that validates form data
	  * 
	  * @param array
	  * @param array
	  * @param array
	  *
	  * @return bool
	  */
	public static function make(array $data, array $roles, array $messages = []) : bool{;
		if(!empty($messages))
			self::$messages = array_merge(self::$messages, $messages);

		foreach($data as $name => $value){
			if(array_key_exists($name, $roles)){
				$role = $roles[$name];

				if(is_string($role))
					$role = explode('|', $role);

				foreach($role as $roleDef){
					$parameters = [];

					// Dividing to fetch parameters
					$roleDef = explode(':', $roleDef);

					// Get parameters
					if(count($roleDef) == 2)
						$parameters = explode(',', $roleDef[1]);

					$roleDef = $roleDef[0];

					if(in_array($roleDef, self::$roles) && method_exists(new static, $roleDef)){
						if(empty($parameters))
							self::$roleDef($name, $value);
						else
							self::$roleDef($name, $value, ...$parameters);
					}
				}
			}
		}

		return empty(self::errors());
	}

	/**
	  * Method that adds a new error message
	  * 
	  * @param string
	  *
	  * @return void
	  */
	private static function addMessage(string $message) : void{
		self::$messagesErrors[] = $message;
	}

	/**
	  * Method that returns all errors caught during execution
	  *
	  * @return array
	  */
	public static function errors() : array{
		return self::$messagesErrors;
	}

	/**
	  * Method that validates mandatory fields
	  * 
	  * @param string
	  * @param string|numeric
	  *
	  * @return void
	  */
	private static function required(string $key, $value) : void{
		$search  = ['%key%'];
		$replace = [$key];

		if(empty($value) && mb_strlen($value) == 0){
			if(array_key_exists("{$key}.required", self::$messages)){
				$message = str_ireplace($search, $replace, self::$messages["{$key}.required"]);
			}else{
				$message = str_ireplace($search, $replace, self::$messages['required']);
			}

			self::addMessage($message);
		}
	}

	/**
	  * Method that validates email fields
	  * 
	  * @param string
	  * @param string|numeric
	  *
	  * @return void
	  */
	private static function email(string $key, $value) : void{
		$search  = ['%key%'];
		$replace = [$key];

		if(mb_strlen($value) > 0 && !filter_var($value, FILTER_VALIDATE_EMAIL)){
			if(array_key_exists("{$key}.email", self::$messages)){
				$message = str_ireplace($search, $replace, self::$messages["{$key}.email"]);
			}else{
				$message = str_ireplace($search, $replace, self::$messages['email']);
			}

			self::addMessage($message);
		}
	}

	/**
	  * Method that validates numeric fields
	  * 
	  * @param string
	  * @param string|numeric
	  *
	  * @return void
	  */
	private static function numeric(string $key, $value) : void{
		$search  = ['%key%'];
		$replace = [$key];

		if(mb_strlen($value) > 0 && !is_numeric($value)){
			if(array_key_exists("{$key}.numeric", self::$messages)){
				$message = str_ireplace($search, $replace, self::$messages["{$key}.numeric"]);
			}else{
				$message = str_ireplace($search, $replace, self::$messages['numeric']);
			}

			self::addMessage($message);
		}
	}

	/**
	  * Method that validates fields with specified minimum length
	  * 
	  * @param string
	  * @param string|numeric
	  * @param int
	  *
	  * @return void
	  */
	private static function min(string $key, $value, int $min) : void{
		$search  = ['%key%', '%min%'];
		$replace = [$key, $min];

		if(mb_strlen($value) > 0 && mb_strlen($value) < $min){
			if(array_key_exists("{$key}.min", self::$messages)){
				$message = str_ireplace($search, $replace, self::$messages["{$key}.min"]);
			}else{
				$message = str_ireplace($search, $replace, self::$messages['min']);
			}

			self::addMessage($message);
		}
	}

	/**
	  * Method that validates fields with specified maximum length
	  * 
	  * @param string
	  * @param string|numeric
	  * @param int
	  *
	  * @return void
	  */
	private static function max(string $key, $value, int $max) : void{
		$search  = ['%key%', '%max%'];
		$replace = [$key, $max];

		if(mb_strlen($value) > $max){
			if(array_key_exists("{$key}.max", self::$messages)){
				$message = str_ireplace($search, $replace, self::$messages["{$key}.max"]);
			}else{
				$message = str_ireplace($search, $replace, self::$messages['max']);
			}

			self::addMessage($message);
		}
	}

	/**
	  * Method that validates whether a field already exists in a column of a table in the database
	  * 
	  * @param string
	  * @param string|numeric
	  * @param string
	  * @param string
	  * @param string|null
	  * @param string|null
	  *
	  * @return void
	  */
	private static function unique(string $key, $value, string $table, string $column, ?string $ignore = null, ?string $column_ignore = null) : void{
		$search  = ['%key%'];
		$replace = [$key];

		$query = DB::table($table)->where($column, $value);

		if(!is_null($ignore)){
			$query->where($column_ignore ?? $column, '!=', $ignore);
		}

		if($query->exists()){
			if(array_key_exists("{$key}.unique", self::$messages)){
				$message = str_ireplace($search, $replace, self::$messages["{$key}.unique"]);
			}else{
				$message = str_ireplace($search, $replace, self::$messages['unique']);
			}

			self::addMessage($message);
		}
	}
}