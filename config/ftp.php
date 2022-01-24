<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'active'		=> $system->ftp->active,
	'url' 	        => $system->ftp->url,
	'server'	    => $system->ftp->server,
	'port'	    	=> $system->ftp->port,
	'username'	    => $system->ftp->username,
    'password'	    => $system->ftp->password,
    'directory'	    => $system->ftp->directory
];