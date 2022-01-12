<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'production' 			=> (bool)$system->store->payment_production,
	'types' => [
		'pagseguro'			=> (bool)($system->store->payment_type == 'PS'),
		'mercadopago'		=> (bool)($system->store->payment_type == 'MP'),
		'palypal'			=> (bool)($system->store->payment_type == 'PP')
	],
	'methods' => [
		'credit_card' 		=> (bool)$system->store->payment_credit_card,
		'debit_card' 		=> (bool)$system->store->payment_debit_card,
		'bolet' 			=> (bool)$system->store->payment_bolet,
		'debit_online' 		=> (bool)$system->store->payment_debit_online,
		'pix'				=> (bool)$system->store->payment_pix,
		'paypal'			=> (bool)$system->store->payment_paypal
	],
	'credentials' => [
		'pagseguro' => [
			'email' 		=> $system->store->pagseguro->email,
			'token' 		=> $system->store->pagseguro->token
		]
	]
];