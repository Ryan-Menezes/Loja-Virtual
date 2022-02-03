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
		// Caso o FTP estiver ligado será verificado o arquivo do servidor informado
		if(config('ftp.active') && !empty(config('ftp.server')) && !empty(config('ftp.username')) && !empty(config('ftp.password'))){
			$server = config('ftp.server');
			$port = empty(config('ftp.port')) ? 21 : config('ftp.port');
			$username = config('ftp.username');
			$password = config('ftp.password');
			$directory = empty(trim(config('ftp.directory'), '/')) ? '/' : trim(config('ftp.directory'), '/');

			$dirname = config('upload.dir');
			$directories = config('upload.directories');
			$dirComplete = '/' . $directory . '/' .trim($directories[$dirname], '/');

			$ftp = ftp_connect($server, $port);

			if($ftp && ftp_login($ftp, $username, $password)){
				return (ftp_size($ftp, $dirComplete . '/' . $filename) >= 0);
			}

			if($ftp){
				ftp_close($ftp);
			}
		}
		// Verifica se o arquivo existe
		else{
			return file_exists(self::dir() . '/' . $filename);
		}
	}

	/**
	  * Method removes a file from storage folder
	  *
	  * @param string
	  *
	  * @return void
	  */
	public static function delete(string $filename) : void{
		// Caso o FTP estiver ligado será deletado o arquivo do servidor informado
		if(config('ftp.active') && !empty(config('ftp.server')) && !empty(config('ftp.username')) && !empty(config('ftp.password'))){
			$server = config('ftp.server');
			$port = empty(config('ftp.port')) ? 21 : config('ftp.port');
			$username = config('ftp.username');
			$password = config('ftp.password');
			$directory = empty(trim(config('ftp.directory'), '/')) ? '/' : trim(config('ftp.directory'), '/');

			$dirname = config('upload.dir');
			$directories = config('upload.directories');
			$dirComplete = '/' . $directory . '/' .trim($directories[$dirname], '/');

			$ftp = ftp_connect($server, $port);

			if($ftp && ftp_login($ftp, $username, $password)){
				ftp_delete($ftp, $dirComplete . '/' . $filename);
			}

			if($ftp){
				ftp_close($ftp);
			}
		}
		// Deleta o arquivo do servidor atual
		else if(self::exists($filename)){
			unlink(self::dir() . '/' . $filename);
		}
	}
}