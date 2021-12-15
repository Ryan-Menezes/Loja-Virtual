<div class="form-group content-group mb-2 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="TITLEEDITOR">
	<div class="row">
		<div class="col-md-10">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'titles[]', 
				'title' => 'Titulo',
				'value' => $value ?? null
			])
		</div>
		<div class="col-md-1">
			@include('includes.components.form.select', [
				'name' => 'titles-tag[]', 
				'title' => 'Tipo',
				'value' => $tag ?? null,
				'options' => [
					'h2' => 'h2', 
					'h3' => 'h3', 
					'h4' => 'h4', 
					'h5' => 'h5', 
					'h6' => 'h6'
				],
				'class' => 'required'
			])
		</div>
		<div class="col-md-1">
			<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>
		</div>
	</div>
</div>