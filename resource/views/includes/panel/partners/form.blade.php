<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem',
		'value' => (isset($partner) && $partner->image ? url('storage/app/public/' . $partner->image, config('ftp.active')) : null), 
		'accept' => 'image/*',
		'class' => (!isset($partner) ? 'required' : null)
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'title', 
		'title' => 'Titulo', 
		'class' => 'required',
		'value' => (isset($partner) ? $partner->title : null),
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'value' => (isset($partner) ? $partner->description : null)
	])

	@include('includes.components.form.input', [
		'type' => 'url', 
		'name' => 'link', 
		'title' => 'Link', 
		'value' => (isset($partner) ? $partner->link : null)
	])

	@include('includes.components.form.select', [
		'name' => 'type', 
		'title' => 'Tipo',
		'value' => (isset($partner) ? $partner->type : 'CO'),
		'options' => [
			'CL' => 'Cliente',
			'CO' => 'Colaborador',
			'LK' => 'Link Útil'
		],
		'class' => 'required',
		'required' => true
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>