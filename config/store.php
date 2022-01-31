<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'reference_prefix'					=> 'request_',
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
		'checkout_transparent'			=> (bool)$system->store->payment_checkout_transparent,
		'types' => [
			'pagseguro'					=> (bool)($system->store->payment_type == 'PS'),
			'mercadopago'				=> (bool)($system->store->payment_type == 'MP')
		],
		'methods' => [
			'credit_card' 				=> (bool)$system->store->payment_credit_card,
			'debit_card' 				=> (bool)$system->store->payment_debit_card,
			'balance'					=> (bool)$system->store->payment_balance,
			'bolet' 					=> (bool)$system->store->payment_bolet,
			'deposit'					=> (bool)$system->store->payment_deposit,
			'debit_online' 				=> (bool)$system->store->payment_debit_online,
			'bank_transfer'				=> (bool)$system->store->payment_bank_transfer,
			'pix'						=> (bool)$system->store->payment_pix
		],
		'credentials' => [
			'pagseguro' => [
				'active'				=> $system->store->pagseguro->active,
				'email' 				=> $system->store->pagseguro->email,
				'token' 				=> $system->store->pagseguro->token,
				'app_id'				=> $system->store->pagseguro->app_id,
				'app_key'				=> $system->store->pagseguro->app_key,
				'checkouts' => [
					'redirect'			=> (bool)($system->store->pagseguro->type_checkout == 'LR'),
					'lightbox'			=> (bool)($system->store->pagseguro->type_checkout == 'LB')
				]
			],
			'mercadopago' => [
				'active'				=> $system->store->mercadopago->active,
				'public_key'			=> $system->store->mercadopago->public_key,
				'access_token' 			=> $system->store->mercadopago->access_token,
				'checkouts' => [
					'redirect'			=> (bool)($system->store->mercadopago->type_checkout == 'LR'),
					'lightbox'			=> (bool)($system->store->mercadopago->type_checkout == 'LB')
				],
				'header_color'			=> $system->store->mercadopago->header_color,
				'elements_color'		=> $system->store->mercadopago->elements_color
			],
			'paypal' => [
				'active'				=> $system->store->paypal->active,
				'secret_key'			=> $system->store->paypal->secret_key,
				'email' 				=> $system->store->paypal->email,
				'client_id'				=> $system->store->paypal->client_id
			],
			'picpay' => [
				'active'				=> $system->store->picpay->active,
				'token' 				=> $system->store->picpay->token,
				'seller_token'			=> $system->store->picpay->seller_token,
				'expiration_minutes'	=> $system->store->picpay->expiration_minutes
			]
		]
	]
];