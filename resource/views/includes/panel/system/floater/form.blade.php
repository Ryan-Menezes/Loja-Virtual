<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem', 
		'accept' => 'image/*'
	])

	@include('includes.components.form.input', [
		'type' => 'url', 
		'name' => 'link', 
		'title' => 'Link', 
		'value' => (isset($system) && $system->floater ? $system->floater->link : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>