<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'name', 
		'title' => 'Nome', 
		'value' => (isset($role) ? $role->name : null),
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'class' => 'required',
		'value' => (isset($role) ? $role->description : null),
		'required' => true
	])

	@include('includes.components.form.checkboxes', [
		'name' => 'permissions[]',
		'title' => 'Permissões',
		'values' => $permissions,
		'checks' => (isset($role) ? $role->permissions->pluck('id')->all() : null)
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>