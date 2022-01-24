<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem',
		'value' => (isset($banner) && $banner->image ? url('storage/app/public/' . $banner->image, config('ftp.active')) : null), 
		'accept' => 'image/*',
		'class' => (!isset($banner) ? 'required' : null)
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'title', 
		'title' => 'Titulo', 
		'class' => 'required',
		'value' => (isset($banner) ? $banner->title : null),
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'class' => 'required',
		'value' => (isset($banner) ? $banner->description : null),
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'url', 
		'name' => 'link', 
		'title' => 'Link', 
		'class' => 'required',
		'value' => (isset($banner) ? $banner->link : null),
		'required' => true
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>