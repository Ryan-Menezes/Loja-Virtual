<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.select', [
		'name' => 'active', 
		'title' => 'Tipo de Pagamento',
		'value' => (isset($system) && $system->store ? $system->store->payment_debit_card : 1),
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
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>