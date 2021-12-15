<?php
namespace Src\Classes;

class Session{
	/** @var array */
	private static $session;

	/** @var string */
	private const FLASH = 'flash';

	/**
	  * Method creates a new session
	  *
	  * @return void
	  */
	private static function createSession() : void{
		$_SESSION[config('session.name')] = [
			self::FLASH => []
		];
	}

	/**
	  * Method fetches the created session
	  *
	  * @return void
	  */
	private static function getSession() : void{
		$key = config('session.name');

		if(!array_key_exists($key, $_SESSION))
			self::createSession();

		self::$session = $_SESSION[$key];
	}

	/**
	  * Method sets new values ​​to created session
	  *
	  * @return void
	  */
	private static function setSession() : void{
		$_SESSION[config('session.name')] = self::$session;
	}

	/**
	  * Method adds a value in the session
	  * 
	  * @param string
	  * @param string|array|object|null|callable
	  *
	  * @return \Src\Classes\Session
	  */
	public static function set(string $key, $value) : Session{
		self::getSession();
		self::$session[$key] = $value;
		self::setSession();

		return new static;
	}

	/**
	  * Method fetches and returns a value in the session
	  * 
	  * @param string
	  *
	  * @return string|array|object|null|callable
	  */
	public static function get(string $key){
		self::getSession();

		if(!array_key_exists($key, self::$session))
			return null;
		
		return self::$session[$key];
	}

	/**
	  * Checks if a particular field exists in the session
	  * 
	  * @param string
	  *
	  * @return bool
	  */
	public static function has(string $key) : bool{
		self::getSession();

		return array_key_exists($key, self::$session);
	}

	/**
	  * Method fetches and returns all session values
	  *
	  * @return array|null
	  */
	public static function all() : ?array{
		self::getSession();
		
		return self::$session;
	}

	/**
	  * Method removes a value from the session
	  * 
	  * @param string
	  *
	  * @return \Src\Classes\Session
	  */
	public static function remove(string $key) : Session{
		self::getSession();

		if(array_key_exists($key, self::$session))
			unset(self::$session[$key]);

		self::setSession();

		return new static;
	}

	/**
	  * Method a temporary value in the session
	  * 
	  * @param string
	  * @param string|array|object|null|callable
	  *
	  * @return \Src\Classes\Session
	  */
	public static function flash(string $key, $value) : Session{
		self::getSession();
		self::$session[$key] = $value;
		self::$session[self::FLASH][$key] = $value;
		self::setSession();

		return new static;
	}

	/**
	  * Method that clears all session values
	  * 
	  * @return \Src\Classes\Session
	  */
	public static function clear() : Session{
		self::createSession();
		self::getSession();
		self::setSession();

		return new static;
	}

	/**
	  * Method that clears all temporary values ​​from the session
	  * 
	  * @return \Src\Classes\Session
	  */
	public static function clearFlash() : Session{
		self::getSession();
		
		foreach(self::$session as $key => $value){
			if(array_key_exists($key, self::$session[self::FLASH])){
				unset(self::$session[$key]);
			}
		}
		
		self::$session[self::FLASH] = [];
		self::setSession();

		return new static;
	}
}