<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'name', 
				'title' => 'Nome da Aplicação', 
				'value' => (isset($system) ? $system->name : null),
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'maintenance', 
				'title' => 'Manutenção',
				'value' => (isset($system) ? $system->maintenance : 0),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>
	
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'cnpj', 
		'title' => 'CNPJ', 
		'value' => (isset($system) ? $system->cnpj : null),
		'class' => 'required cnpj-mask',
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'keywords',
		'title' => 'Palavras Chaves',
		'value' => (isset($system) ? $system->keywords : null)
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'value' => (isset($system) ? $system->description : null)
	])

	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>