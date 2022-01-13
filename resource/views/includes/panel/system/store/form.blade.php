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

	<br /><h3>Configurações de Pagamentos</h3><hr />

	@include('includes.components.form.select', [
		'name' => 'active', 
		'title' => 'Tipo de Pagamento',
		'value' => (isset($system) && $system->store ? $system->store->payment_debit_card : 'PS'),
		'options' => [
			'PS' => 'PagSeguro',
			'MP' => 'Mercado Pago',
			'PP' => 'PayPal'
		],
		'class' => 'required',
		'required' => true
	])

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
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>