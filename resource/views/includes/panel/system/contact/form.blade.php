<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.input', [
		'type' => 'email', 
		'name' => 'email', 
		'title' => 'E-Mail', 
		'value' => (isset($system) && $system->contact ? $system->contact->email : null)
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'telephone', 
				'title' => 'Telefone', 
				'value' => (isset($system) && $system->contact ? $system->contact->telephone : null),
				'class' => 'phone-mask'
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'cell', 
				'title' => 'Celular', 
				'value' => (isset($system) && $system->contact ? $system->contact->cell : null),
				'class' => 'cell-mask'
			])
		</div>
	</div>
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>