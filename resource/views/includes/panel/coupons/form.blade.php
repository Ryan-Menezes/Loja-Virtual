<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'code', 
		'title' => 'Código', 
		'value' => (isset($coupon) ? $coupon->code : null),
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'number', 
				'name' => 'percent',
				'title' => 'Porcentagem',
				'value' => (isset($coupon) ? $coupon->percent : null),
				'min' => 1,
				'max' => 100,
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'only_one_time', 
				'title' => 'Usar somente uma vez',
				'value' => (isset($coupon) ? $coupon->only_one_time : 1),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.input', [
		'type' => 'date', 
		'name' => 'expiration', 
		'title' => 'Data de Expiração', 
		'value' => (isset($coupon) ? $coupon->expiration : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>