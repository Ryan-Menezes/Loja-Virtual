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
			$dirComplete = Storage::dir() . '/' . trim($dir, '/') . '/';

			if(!is_dir($dirComplete))
				mkdir($dirComplete, 0777, true);

			if(move_uploaded_file($this->file->tmp_name, $dirComplete . $filename)){
				return (trim($dir, '/') . '/' . $filename);
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