<?php
use Src\Classes\{
	Route,
	View,
	Session,
	Request
};

ob_start();

require_once __DIR__ . '/../core/helpers.php';
require_once __DIR__ . '/../core/config.php';
require_once __DIR__ . '/../routes/web.php';

Route::dispatch();
Session::clearFlash();

ob_end_flush();