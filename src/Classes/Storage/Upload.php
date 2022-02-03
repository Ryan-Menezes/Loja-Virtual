<?php
namespace Src\Classes\Storage;

class Upload{
	/** @var \Src\Classes\File */
	private $file;

	/**
	  * Method that initializes parameters
	  *
	  * @param \Src\Classes\File
	  *
	  * @return void
	  */
	public function __construct(File $file){
		$this->file = $file;
	}

	/**
	  * Method that uploads a file
	  *
	  * @param string
	  * @param string
	  *
	  * @return string|bool
	  */
	public function storeAs(string $dir, string $filename){
		if(mb_strlen($dir) > 0){
			// Caso o FTP estiver ligado será upado o arquivo para o servidor informado
			if(config('ftp.active') && !empty(config('ftp.server')) && !empty(config('ftp.username')) && !empty(config('ftp.password'))){
				$server = config('ftp.server');
				$port = empty(config('ftp.port')) ? 21 : config('ftp.port');
				$username = config('ftp.username');
				$password = config('ftp.password');
				$directory = empty(trim(config('ftp.directory'), '/')) ? '/' : trim(config('ftp.directory'), '/');

				$dirname = config('upload.dir');
				$directories = config('upload.directories');
				$dirComplete = '/' . $directory . '/' .trim($directories[$dirname], '/') . '/' . trim($dir, '/') . '/';

				$ftp = ftp_connect($server, $port);

				if($ftp && ftp_login($ftp, $username, $password)){
					if(ftp_nlist($ftp, $dirComplete) !== false){
						ftp_mkdir($ftp, $dirComplete);
					}

					if(ftp_put($ftp, $dirComplete . $filename, $this->file->tmp_name, FTP_BINARY)){
						return (trim($dir, '/') . '/' . $filename);
					}
				}

				if($ftp){
					ftp_close($ftp);
				}
			}
			// Faz o upload do arquivo no servidor
			else{
				$dirComplete = Storage::dir() . '/' . trim($dir, '/') . '/';

				if(!is_dir($dirComplete)){
					mkdir($dirComplete, 0777, true);
				}

				if(move_uploaded_file($this->file->tmp_name, $dirComplete . $filename)){
					return (trim($dir, '/') . '/' . $filename);
				}
			}
		}
		
		return false;
	}

	/**
	  * Method that uploads a file
	  *
	  * @param string
	  *
	  * @return string|bool
	  */
	public function store(string $dir){
		do{
			$filename = md5(md5($this->file->name) . uniqid() . time()) . '.' . $this->file->extension;
		}while(Storage::exists($filename));

		return $this->storeAs($dir, $filename);
	}
}