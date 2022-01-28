<?php
namespace Src\Classes;

use PDOException;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Events\Dispatcher;
use Illuminate\Container\Container;

class Database{
	/** @var array */
	private static $errors;

	/**
	  * Method that initiates the database connection
	  *
	  * @return void
	  */
	public static function start() : void{
		try{
			$capsule = new Capsule;

			$driver = config('database.driver');

			$capsule->addConnection([
			    'driver' 	=> $driver,
			    'host' 		=> config("database.{$driver}.{$driver}.host"),
			    'database' 	=> config("database.{$driver}.database"),
			    'username' 	=> config("database.{$driver}.username"),
			    'password' 	=> config("database.{$driver}.password"),
			    'charset' 	=> config("database.{$driver}.charset"),
			    'collation' => config("database.{$driver}.collation"),
			    'prefix' 	=> '',
			]);

			// Set the event dispatcher used by Eloquent models... (optional)
			$capsule->setEventDispatcher(new Dispatcher(new Container));

			// Make this Capsule instance available globally via static methods... (optional)
			$capsule->setAsGlobal();

			// Setup the Eloquent ORM... (optional; unless you've used setEventDispatcher())
			$capsule->bootEloquent();
		}catch(PDOException $error){
			self::addError($error->getCode(), $error->getMessage(), $error->getLine(), $error->getFile());
		}
	}

	/**
	  * Method that returns all errors
	  *
	  * @return array
	  */
	public static function errors() : array{
		return (array) self::$errors;
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
}