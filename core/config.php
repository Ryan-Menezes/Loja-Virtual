<?php
use Src\Classes\Database;

// Starts a database connection
Database::start();

// Start the session 
if(!isset($_SESSION))
	session_start();

// Disable display of all errors
if(!config('app.debug'))
	error_reporting(0);

// Set the local date
date_default_timezone_set(config('app.timezone'));