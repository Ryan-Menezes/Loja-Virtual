<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'postal_code', 
		'title' => 'CEP', 
		'value' => (isset($address) ? $address->postal_code : null),
		'class' => 'required cep-mask',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'street', 
				'title' => 'Logradouro', 
				'value' => (isset($address) ? $address->street : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'number', 
				'title' => 'Número', 
				'value' => (isset($address) ? $address->number : null),
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'district', 
		'title' => 'Bairro', 
		'value' => (isset($address) ? $address->district : null),
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'city', 
				'title' => 'Cidade', 
				'value' => (isset($address) ? $address->city : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'state', 
				'title' => 'Estado', 
				'value' => (isset($address) ? $address->state : null),
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.textarea', [
		'name' => 'complement',
		'title' => 'Complemento',
		'value' => (isset($address) ? $address->complement : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fa fa-save"></i></button>
</form>