<div class="form-group content-group mb-2 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="SIZEEDITOR">
	<div class="row mb-2">
		<div class="col-md-12">
			@if(!isset($notoptions))
			<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>

			<button type="button" class="btn btn-sm btn-dark btn-duplicate-element float-end" title="Duplicar Elemento"><i class="fas fa-clone"></i></button>
			@endif
		</div>

		<div class="col-md-12">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => isset($id) ? "description-size-{$id}[]" : 'description-size[]', 
				'title' => 'Descrição do Tamanho',
				'value' => $description ?? null,
				'class' => 'required',
				'required' => true
			])

			<div class="row">
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "price-size-{$id}[]" : 'price-size[]', 
						'title' => 'Preço',
						'value' => $price ?? null,
						'class' => 'required',
						'required' => true
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "price-previous-size-{$id}[]" : 'price-previous-size[]', 
						'title' => 'Preço Antigo',
						'value' => $price_previous ?? null,
						'class' => 'required',
						'required' => true
					])
				</div>
			</div>

			@include('includes.components.form.input', [
				'type' => 'number', 
				'name' => isset($id) ? "quantity-size-{$id}[]" : 'quantity-size[]', 
				'title' => 'Quantidade em Estoque',
				'min' => 0,
				'max' => 999999,
				'value' => $quantity ?? null,
				'class' => 'required',
				'required' => true
			])

			<h3 class="mt-4">Informações da embalagem para cálculo do frete:</h3>
			<p><small>Este informação não será apresentada para os clientes, somente será usado para calcular o frete de entrega</small></p><hr>
			<div class="row">
				<div class="col-md-4">
					@include('includes.components.form.input', [
						'type' => 'number', 
						'name' => isset($id) ? "width-size-{$id}[]" : 'width-size[]', 
						'title' => 'Largura(centímetros)',
						'value' => $width ?? null,
						'min' => 1,
						'max' => 999999,
						'class' => 'required',
						'required' => true
					])
				</div>
				<div class="col-md-4">
					@include('includes.components.form.input', [
						'type' => 'number', 
						'name' => isset($id) ? "height-size-{$id}[]" : 'height-size[]', 
						'title' => 'Altura(centímetros)',
						'value' => $height ?? null,
						'min' => 1,
						'max' => 999999,
						'class' => 'required',
						'required' => true
					])
				</div>
				<div class="col-md-4">
					@include('includes.components.form.input', [
						'type' => 'number', 
						'name' => isset($id) ? "depth-size-{$id}[]" : 'depth-size[]', 
						'title' => 'Profundidade(centímetros)',
						'value' => $depth ?? null,
						'min' => 1,
						'max' => 999999,
						'class' => 'required',
						'required' => true
					])
				</div>
			</div>

			@include('includes.components.form.input', [
				'type' => 'number', 
				'name' => isset($id) ? "weight-size-{$id}[]" : 'weight-size[]', 
				'title' => 'Peso(gramas)',
				'value' => $weight ?? null,
				'min' => 1,
				'max' => 999999,
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>
</div>