<?php
use Src\Classes\{
	Route,
	Session
};

require_once __DIR__ . '/../core/helpers.php';
require_once __DIR__ . '/../core/config.php';
require_once __DIR__ . '/../routes/web.php';

ob_start('sanitize_output');

Route::dispatch();
Session::clearFlash();

ob_end_flush();