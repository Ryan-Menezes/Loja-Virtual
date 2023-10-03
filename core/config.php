<?php
use Src\Classes\Database;

// Session settings
ini_set('session.referer_check', 'TRUE');
ini_set('session.gc_maxlifetime', 84600); // 84600 - 1 Day
ini_set('session.cookie_lifetime', 84600);

// Starts a database connection
Database::start();

// Start the session 
if(!isset($_SESSION))
	session_start();

// Disable display of all errors
if(!config('app.debug')) {
	error_reporting(0);
} else {
	error_reporting(E_ALL ^ E_DEPRECATED);
}

// Set the local date
date_default_timezone_set(config('app.timezone'));
