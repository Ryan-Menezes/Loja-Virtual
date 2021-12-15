<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'name', 
		'title' => 'Nome', 
		'value' => (isset($user) ? $user->name : null),
		'class' => 'required'
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'email', 
				'name' => 'email', 
				'title' => 'E-Mail',
				'value' => (isset($user) ? $user->email : null),
				'class' => 'required'
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'password', 
				'name' => 'password', 
				'title' => 'Senha',
				'class' => (!isset($user) ? 'required' : null)
			])
		</div>
	</div>

	@include('includes.components.form.select', [
		'name' => 'role', 
		'title' => 'Função',
		'value' => (isset($user) && !is_null($user->roles()->first()) ? $user->roles()->first()->id : null),
		'options' => $roles,
		'class' => 'required'
	])

	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>