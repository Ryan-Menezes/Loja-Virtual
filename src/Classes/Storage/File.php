<?php
namespace Src\Classes\Storage;

class File extends Upload{
	private $file;

	/**
	  * Method that initializes parameters
	  *
	  * @return void
	  */
	public function __construct(array $file){
		$this->file = $file;

		if(array_key_exists('name', $this->file)){
			$this->file['extension'] = pathinfo($this->file['name'], PATHINFO_EXTENSION);
		}

		parent::__construct($this);
	}

	/**
	  * Method that returns the requested value
	  * 
	  * @param string
	  *
	  * @return string|int
	  */
	public function __get(string $key){
		if(!array_key_exists($key, $this->file))
			return null;

		return $this->file[$key];
	}
}