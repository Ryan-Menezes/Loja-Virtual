<?php
namespace Src\Classes;

abstract class Controller{
	/**
	  * Method that validates form data
	  * 
	  * @param array
	  * @param array
	  * @param array
	  *
	  * @return void
	  */
	public function validator(array $data, array $roles, array $messages = []) : void{
		$errors = validator($data, $roles, $messages);

		if(!empty($errors)){
			$historic = Route::historic();

			if(count($historic) >= 2)
				$url = url($historic[count($historic) - 2]);
			else
				$url = url($historic[count($historic) - 1]);

			redirect($url, ['errors' => $errors], true);
		}
	}
}