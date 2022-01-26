<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')

	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'name', 
		'title' => 'Nome', 
		'value' => (isset($depoiment) ? $depoiment->name : null),
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'content',
		'title' => 'Descrição',
		'class' => 'required',
		'value' => (isset($depoiment) ? $depoiment->content : null),
		'required' => true
	])

	@include('includes.components.form.select', [
		'name' => 'visible', 
		'title' => 'Visibilidade',
		'value' => (isset($depoiment) ? $depoiment->visible : 0),
		'options' => [
			1 => 'Visível',
			0 => 'Invisivel'
		],
		'class' => 'required',
		'required' => true
	])

	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>