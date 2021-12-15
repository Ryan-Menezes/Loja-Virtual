<?php
namespace Src\Classes\Storage;

class Storage{
	/**
	  * Method that initializes parameters
	  *
	  * @return void
	  */
	public static function dir() : string{
		$dirname = config('upload.dir');
		$directories = config('upload.directories');
		
		$dir = dirname(__DIR__, 3) . '/' . trim($directories[$dirname], '/');

		if(!is_dir($dir)){
			mkdir($dir, 0777, true);
		}

		return $dir;
	}

	/**
	  * Method that checks if a file exists inside the storage folder
	  *
	  * @param string
	  *
	  * @return bool
	  */
	public static function exists(string $filename) : bool{
		return file_exists(self::dir() . '/' . $filename);
	}

	/**
	  * Method removes a file from storage folder
	  *
	  * @param string
	  *
	  * @return void
	  */
	public static function delete(string $filename) : void{
		if(self::exists($filename)){
			unlink(self::dir() . '/' . $filename);
		}
	}
}