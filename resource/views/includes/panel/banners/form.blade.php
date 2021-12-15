<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem', 
		'accept' => 'image/*',
		'class' => (!isset($banner) ? 'required' : null)
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'title', 
		'title' => 'Titulo', 
		'class' => 'required',
		'value' => (isset($banner) ? $banner->title : null)
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'link', 
		'title' => 'Link', 
		'class' => 'required',
		'value' => (isset($banner) ? $banner->link : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>