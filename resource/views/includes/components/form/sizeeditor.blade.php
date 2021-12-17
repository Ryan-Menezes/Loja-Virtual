<div class="form-group content-group mb-2 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="SIZEEDITOR">
	<div class="row mb-2">
		<div class="col-md-11">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => isset($id) ? "description-size-{$id}[]" : 'description-size[]', 
				'title' => 'Descrição do Tamanho',
				'value' => $description ?? null
			])

			<div class="row">
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "price-size-{$id}[]" : 'price-size[]', 
						'title' => 'Preço',
						'value' => $price ?? null
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "price-previous-size-{$id}[]" : 'price-previous-size[]', 
						'title' => 'Preço Antigo',
						'value' => $price_previous ?? null
					])
				</div>
			</div>
		</div>
		<div class="col-md-1">
			<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento" data-remove="{{ $imageRemove ?? null }}"><i class="fas fa-trash-alt"></i></button>
		</div>
	</div>
</div>