<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem', 
		'value' => (isset($slideshow) && $slideshow->image ? url('storage/app/public/' . $slideshow->image, config('ftp.active')) : null), 
		'accept' => 'image/*',
		'class' => (!isset($slideshow) ? 'required' : null)
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'title', 
		'title' => 'Titulo', 
		'value' => (isset($slideshow) ? $slideshow->title : null)
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'value' => (isset($slideshow) ? $slideshow->description : null)
	])

	@include('includes.components.form.input', [
		'type' => 'url', 
		'name' => 'link', 
		'title' => 'Link', 
		'value' => (isset($slideshow) ? $slideshow->link : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>