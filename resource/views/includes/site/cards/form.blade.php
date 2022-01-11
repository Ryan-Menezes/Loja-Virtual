<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.select', [
		'name' => 'type', 
		'title' => 'Tipo', 
		'value' => (isset($card) ? $card->type : null),
		'options' => [
			'C' => 'Crédito',
			'D' => 'Débito'
		],
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'name', 
				'title' => 'Nome', 
				'value' => (isset($card) ? $card->name : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'number', 
				'title' => 'Número', 
				'value' => (isset($card) ? $card->number : null),
				'class' => 'required credit-number-mask',
				'required' => true
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'month', 
				'title' => 'Mês de Validade',
				'value' => (isset($card) ? $card->month : null),
				'options' => array_combine(range(1, 12), range(1, 12)),
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'year', 
				'title' => 'Ano de Validade', 
				'value' => (isset($card) ? $card->year : null),
				'options' => array_combine(range(date('y'), date('y') + 50), range(date('Y'), date('Y') + 50)),
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'cvv', 
		'title' => 'CVV', 
		'value' => (isset($card) ? $card->cvv : null),
		'class' => 'required cvv-mask',
		'required' => true
	])

	<div class="row">
		<div class="col-md-4">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'cpf', 
				'title' => 'CPF do Dono do Cartão', 
				'value' => (isset($card) ? $card->cpf : null),
				'class' => 'required cpf-mask',
				'required' => true
			])
		</div>
		<div class="col-md-4">
			@include('includes.components.form.input', [
				'type' => 'date', 
				'name' => 'birth', 
				'title' => 'Nascimento do Dono do Cartão', 
				'value' => (isset($card) ? $card->birth : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-4">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'telephone', 
				'title' => 'Telefone do Dono do Cartão', 
				'value' => (isset($card) ? $card->telephone : null),
				'class' => 'required phone-mask',
				'required' => true
			])
		</div>
	</div>
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fa fa-save"></i></button>
</form>