<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	<input type="hidden" name="_method" value="{{ $method }}">

	@include('includes.components.form.select', [
		'name' => 'active', 
		'title' => 'Situação',
		'value' => (isset($system) && $system->lgpd ? $system->lgpd->active : 1),
		'options' => [
			1 => 'Ativado',
			0 => 'Desativado'
		],
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'privacy_policy', 
		'title' => 'Política de Privacidade', 
		'value' => (isset($system) && $system->lgpd && $system->lgpd->privacy_policy ? url('storage/app/public/' . $system->lgpd->privacy_policy, config('ftp.active')) : null),
		'accept' => 'application/pdf'
	])

	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'terms_conditions', 
		'title' => 'Termos e Condições', 
		'value' => (isset($system) && $system->lgpd && $system->lgpd->terms_conditions ? url('storage/app/public/' . $system->lgpd->terms_conditions, config('ftp.active')) : null),
		'accept' => 'application/pdf'
	])

	@include('includes.components.form.file', [
		'type' => 'file', 
		'name' => 'return_policy', 
		'title' => 'Política de Devolução', 
		'value' => (isset($system) && $system->lgpd && $system->lgpd->return_policy ? url('storage/app/public/' . $system->lgpd->return_policy, config('ftp.active')) : null),
		'accept' => 'application/pdf'
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>