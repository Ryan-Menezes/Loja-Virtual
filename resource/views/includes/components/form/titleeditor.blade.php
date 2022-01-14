<div class="form-group content-group mb-3 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="TITLEEDITOR">
	<div class="row">
		<div class="col-md-10">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'titles[]', 
				'title' => 'Titulo',
				'class' => 'required',
				'value' => $value ?? null,
				'required' => true
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
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-1">
			@if(!isset($notoptions))
			<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>

			<button type="button" class="btn btn-sm btn-dark btn-duplicate-element float-end" title="Duplicar Elemento"><i class="fas fa-clone"></i></button>
			@endif
		</div>
	</div>
</div>