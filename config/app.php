<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'name' 			=> $system->name,
	'url' 			=> 'http://localhost/Loja-Virtual/',
	'domain' 		=> 'localhost',
	'timezone' 		=> 'America/Sao_Paulo',
	'charset'		=> 'utf-8',
	'lang' 			=> 'pt-br',
	'debug'			=> true,
	'description' 	=> $system->description,
	'keywords' 		=> $system->keywords,
	'social'		=> [
		'facebook' 	=> $system->social->facebook,
		'instagram' => $system->social->instagram,
		'twitter' 	=> $system->social->twitter,
		'linkedin' 	=> $system->social->linkedin,
		'youtube' 	=> $system->social->youtube,
		'twitch' 	=> $system->social->twitch,
		'discord' 	=> $system->social->discord,
		'whatsapp' 	=> $system->social->whatsapp
	],
	'contact' => [
		'email'	=> $system->contact->email,
		'phone' => $system->contact->telephone,
		'cell' 	=> $system->contact->cell
	],
	'address' => [
		'postal_code'	=> $system->address->postal_code,
		'street' 		=> $system->address->street,
		'number'		=> $system->address->number,
		'district' 		=> $system->address->district,
		'city'			=> $system->address->city,
		'state'			=> $system->address->state,
		'country'		=> 'BRA',
		'latitude'		=> $system->address->latitude,
		'longitude'		=> $system->address->longitude,
		'complement'	=> $system->address->complement
	]
];
