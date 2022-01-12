<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	
	@include('includes.components.form.select', [
		'name' => 'status', 
		'title' => 'Status do Pedido',
		'value' => (isset($requestmodel) ? $requestmodel->status : 'AP'),
		'options' => $requestmodel->_status,
		'class' => 'required',
		'required' => true
	])
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>