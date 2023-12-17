<?php
return [
    'host'          => 'smtp.example.com',
    'charset' 	    => 'utf-8',
    'from' 		    => config('app.contact.email'),
    'username'      => 'user@example.com',
    'password'      => 'secret',
    'port'          => '465',
    'encryption'    => 'ssl', // ssl | tls
];
