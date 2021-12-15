<?php
namespace Src\Classes;

class Web{
	/**
	  * Method that returns the current route
	  *
	  * @return string
	  */
	static public function getRoute() : string{
		if(isset($_GET['route'])) return trim($_GET['route'], '/');

		return '';
	}
}