<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'postal_code', 
		'title' => 'CEP', 
		'value' => (isset($system) && $system->address ? $system->address->postal_code : null),
		'class' => 'required cep-mask postal-code-search',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'street', 
				'title' => 'Logradouro', 
				'value' => (isset($system) && $system->address ? $system->address->street : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'number', 
				'title' => 'Número', 
				'value' => (isset($system) && $system->address ? $system->address->number : null),
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'district', 
		'title' => 'Bairro', 
		'value' => (isset($system) && $system->address ? $system->address->district : null),
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'city', 
				'title' => 'Cidade', 
				'value' => (isset($system) && $system->address ? $system->address->city : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'title' => 'Estado',
				'name' => 'state',
				'options' => config('states.BRL'),
				'value' => (isset($system) && $system->address ? $system->address->state : null),
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'latitude', 
				'title' => 'Latitude', 
				'value' => (isset($system) && $system->address ? $system->address->latitude : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'longitude', 
				'title' => 'Longitude', 
				'value' => (isset($system) && $system->address ? $system->address->latitude : null)
			])
		</div>
	</div>

	@include('includes.components.form.textarea', [
		'name' => 'complement',
		'title' => 'Complemento',
		'value' => (isset($system) && $system->address ? $system->address->complement : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>