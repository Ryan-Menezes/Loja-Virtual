<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	<h3>Promoção para o Carrinho</h3><hr />

	@include('includes.components.form.select', [
		'name' => 'cart_promotion', 
		'title' => 'Promoção para o Carrinho',
		'value' => (isset($system) && $system->store ? $system->store->cart_promotion : 0),
		'options' => [
			1 => 'Ativado',
			0 => 'Desativado'
		],
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'text',
		'name' => 'cart_amount_promotion', 
		'title' => 'Valor da Promoção(Caso o total do carrinho últrapasse esse valor, será aplicado um desconto por porcentagem ou frete grátis)',
		'value' => (isset($system) && $system->store ? $system->store->cart_amount_promotion : 0),
		'class' => 'required float-mask',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'number',
				'name' => 'cart_discount_percent_promotion', 
				'title' => 'Desconto Aplicado Na Compra(%)',
				'value' => (isset($system) && $system->store ? $system->store->cart_discount_percent_promotion : 0),
				'min' => 0,
				'max' => 100,
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'cart_freight_free_promotion', 
				'title' => 'Frete Grátis Disponível',
				'value' => (isset($system) && $system->store ? $system->store->cart_freight_free_promotion : 0),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	<br /><h3>Configurações do Frete</h3><hr />

	@include('includes.components.form.select', [
		'name' => 'type', 
		'title' => 'Tipo de Pagamento',
		'value' => (isset($system) && $system->store && $system->store->freight ? $system->store->freight->type : 'C'),
		'options' => [
			'C' => 'Correios',
			'P' => 'Personalizado'
		],
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'postal_code_origin', 
		'title' => 'CEP de Origem(Para o frete dos correios)', 
		'value' => (isset($system) && $system->store && $system->store->freight ? $system->store->freight->postal_code_origin : null),
		'class' => 'required cep-mask',
		'required' => true
	])

	@php
		$freight_range = '';

		if(isset($system) && $system->store && $system->store->freight){
			foreach($system->store->freight->freight_customized as $freight){
				$freight_range .= "{$freight->postal_code_min};{$freight->postal_code_max};{$freight->value};{$freight->days}\n";
			}
		}
	@endphp

	@include('includes.components.form.textarea', [
		'name' => 'freight_range',
		'title' => 'Faixa de Cep(Para o frete personalizado)',
		'value' => $freight_range,
		'class' => 'required freight_range',
		'required' => true
	])
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalFreightRange">Adicionar Faixa <i class="fas fa-plus-circle"></i></button>

	<br /><br /><span><small>OBS: cep minímo;cep máximo;valor(R$);dias para à entega</small></span>

	<br /><br /><h3>Configurações de Pagamentos</h3><hr />

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_type', 
				'title' => 'Tipo de Pagamento',
				'value' => (isset($system) && $system->store ? $system->store->payment_type : 'PS'),
				'options' => [
					'PS' => 'PagSeguro',
					'MP' => 'Mercado Pago',
					'PP' => 'PayPal'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_type_checkout', 
				'title' => 'Tipo de Checkout',
				'value' => (isset($system) && $system->store ? $system->store->payment_type_checkout : 'CT'),
				'options' => [
					'CT' => 'Checkout Transparente',
					'LR' => 'Link de Redirecionamento',
					'LB' => 'LightBox'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.select', [
		'name' => 'payment_production', 
		'title' => 'Modo de Produção',
		'value' => (isset($system) && $system->store ? $system->store->payment_production : 0),
		'options' => [
			1 => 'Ativado',
			0 => 'Desativado'
		],
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_credit_card', 
				'title' => 'Cartão de Crédito',
				'value' => (isset($system) && $system->store ? $system->store->payment_credit_card : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_debit_card', 
				'title' => 'Cartão de Débito',
				'value' => (isset($system) && $system->store ? $system->store->payment_debit_card : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_balance', 
				'title' => 'Saldo',
				'value' => (isset($system) && $system->store ? $system->store->payment_balance : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_bolet', 
				'title' => 'Boleto',
				'value' => (isset($system) && $system->store ? $system->store->payment_bolet : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_deposit', 
				'title' => 'Depósito',
				'value' => (isset($system) && $system->store ? $system->store->payment_deposit : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_debit_online', 
				'title' => 'Débito Online',
				'value' => (isset($system) && $system->store ? $system->store->payment_debit_online : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_pix', 
				'title' => 'PIX',
				'value' => (isset($system) && $system->store ? $system->store->payment_pix : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'payment_paypal', 
				'title' => 'PayPal',
				'value' => (isset($system) && $system->store ? $system->store->payment_paypal : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	<br /><h3>Credenciais PagSeguro</h3><hr />
	
	@include('includes.components.form.input', [
		'type' => 'email', 
		'name' => 'email', 
		'title' => 'E-Mail', 
		'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->email : null)
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'token', 
		'title' => 'Token', 
		'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->token : null)
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'app_id', 
				'title' => 'Id da Aplicação', 
				'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->app_id : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'app_key', 
				'title' => 'Chave da Aplicação', 
				'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->app_key : null)
			])
		</div>
	</div>
	<br />
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>