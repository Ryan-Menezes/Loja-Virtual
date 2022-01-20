<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'title', 
		'title' => 'Titulo', 
		'class' => 'required',
		'value' => (isset($galery) ? $galery->title : null),
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'class' => 'required',
		'value' => (isset($galery) ? $galery->description : null),
		'required' => true
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>