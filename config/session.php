<?php
$request = new \Src\Classes\Request();

return [
	'name' => md5(sha1($request->server()['REMOTE_ADDR'] . url()))
];