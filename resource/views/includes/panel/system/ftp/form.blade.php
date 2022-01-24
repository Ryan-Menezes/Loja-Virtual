<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.select', [
		'name' => 'active', 
		'title' => 'Situação',
		'value' => (isset($system) && $system->ftp ? $system->ftp->active : 1),
		'options' => [
			1 => 'Ativado',
			0 => 'Desativado'
		],
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'url', 
		'title' => 'URL', 
		'value' => (isset($system) && $system->ftp ? $system->ftp->url : null)
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'server', 
				'title' => 'Servidor', 
				'value' => (isset($system) && $system->ftp ? $system->ftp->server : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'number', 
				'name' => 'port', 
				'title' => 'Porta', 
				'value' => (isset($system) && $system->ftp ? $system->ftp->port : null),
				'min' => 0,
				'max' => 65536
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'username', 
				'title' => 'Username', 
				'value' => (isset($system) && $system->ftp ? $system->ftp->username : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'password', 
				'title' => 'Senha', 
				'value' => (isset($system) && $system->ftp ? $system->ftp->password : null)
			])
		</div>
	</div>

	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'directory', 
		'title' => 'Diretório', 
		'value' => (isset($system) && $system->ftp ? $system->ftp->directory : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>