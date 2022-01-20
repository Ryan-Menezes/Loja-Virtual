<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'installments_amount' 				=> 18,
	'cart' => [
		'promotion'						=> $system->store->cart_promotion,
		'amount_promotion'				=> $system->store->cart_amount_promotion,
		'discount_percent_promotion'	=> $system->store->cart_discount_percent_promotion,
		'freight_free_promotion'		=> $system->store->cart_freight_free_promotion
	],
	'freight' => [
		'type'							=> $system->store->freight->type,
		'origin' 						=> $system->store->freight->postal_code_origin,
		'customized'					=> $system->store->freight->freight_customized
	],
	'payment' => [
		'production' 					=> (bool)$system->store->payment_production,
		'types' => [
			'pagseguro'					=> (bool)($system->store->payment_type == 'PS'),
			'mercadopago'				=> (bool)($system->store->payment_type == 'MP'),
			'paypal'					=> (bool)($system->store->payment_type == 'PP')
		],
		'checkouts' => [
			'transparent'				=> (bool)($system->store->payment_type_checkout == 'CT'),
			'redirect'					=> (bool)($system->store->payment_type_checkout == 'LR'),
			'lightbox'					=> (bool)($system->store->payment_type_checkout == 'LB')
		],
		'methods' => [
			'credit_card' 				=> (bool)$system->store->payment_credit_card,
			'debit_card' 				=> (bool)$system->store->payment_debit_card,
			'balance'					=> (bool)$system->store->payment_balance,
			'bolet' 					=> (bool)$system->store->payment_bolet,
			'deposit'					=> (bool)$system->store->payment_deposit,
			'debit_online' 				=> (bool)$system->store->payment_debit_online,
			'pix'						=> (bool)$system->store->payment_pix,
			'paypal'					=> (bool)$system->store->payment_paypal
		],
		'credentials' => [
			'pagseguro' => [
				'email' 				=> $system->store->pagseguro->email,
				'token' 				=> $system->store->pagseguro->token,
				'app_id'				=> $system->store->pagseguro->app_id,
				'app_key'				=> $system->store->pagseguro->app_key
			]
		]
	]
];