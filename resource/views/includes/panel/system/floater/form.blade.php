<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.select', [
		'name' => 'active', 
		'title' => 'Situação',
		'value' => (isset($system) && $system->floater ? $system->floater->active : 0),
		'options' => [
			1 => 'Ativado',
			0 => 'Desativado'
		],
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'image', 
		'title' => 'Imagem',
		'value' => (isset($system) && $system->floater && $system->floater->image ? url('storage/app/public/' . $system->floater->image, config('ftp.active')) : null), 
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