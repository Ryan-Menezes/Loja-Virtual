<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')

	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem',
		'value' => (isset($category) && $category->image ? url('storage/app/public/' . $category->image, config('ftp.active')) : null), 
		'accept' => 'image/*',
		'class' => (!isset($category) ? 'required' : null)
	])

	@include('includes.components.form.select', [
		'name' => 'emphasis', 
		'title' => 'Estará em destaque',
		'value' => (isset($category) ? $category->emphasis : 0),
		'options' => [
			1 => 'Sim',
			0 => 'Não'
		],
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'name', 
		'title' => 'Nome', 
		'value' => (isset($category) ? $category->name : null),
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'class' => 'required',
		'value' => (isset($category) ? $category->description : null),
		'required' => true
	])

	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>