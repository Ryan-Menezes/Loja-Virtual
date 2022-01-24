<div class="card content-group mb-2 p-0 {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="SIZEEDITOR">

	@if(!isset($notoptions))
	<div class="card-header">
		<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>
		<button type="button" class="btn btn-sm btn-dark btn-duplicate-element float-end" title="Duplicar Elemento"><i class="fas fa-clone"></i></button>
	</div>
	@endif
	<div class="card-body form-group">
		<div class="col-md-12">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => isset($id) ? "description-size-{$id}[]" : 'description-size[]', 
				'title' => 'Descrição do Tamanho',
				'value' => $description ?? null,
				'class' => 'required',
				'required' => true
			])

			<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script> 

			<div class="row">
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "price-size-{$id}[]" : 'price-size[]', 
						'title' => 'Preço',
						'value' => $price ?? null,
						'class' => 'required float-mask',
						'required' => true
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "price-previous-size-{$id}[]" : 'price-previous-size[]', 
						'title' => 'Preço Anterior',
						'value' => $price_previous ?? null,
						'class' => 'required float-mask',
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
			<p><small>Esta informação não será apresentada para os clientes, somente será usado para calcular o frete de entrega</small></p><hr>
			<div class="row">
				<div class="col-md-4">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "width-size-{$id}[]" : 'width-size[]', 
						'title' => 'Largura(centímetros)',
						'value' => $width ?? null,
						'min' => 1,
						'max' => 999999,
						'class' => 'required float-mask',
						'required' => true
					])
				</div>
				<div class="col-md-4">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "height-size-{$id}[]" : 'height-size[]', 
						'title' => 'Altura(centímetros)',
						'value' => $height ?? null,
						'min' => 1,
						'max' => 999999,
						'class' => 'required float-mask',
						'required' => true
					])
				</div>
				<div class="col-md-4">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => isset($id) ? "depth-size-{$id}[]" : 'depth-size[]', 
						'title' => 'Profundidade(centímetros)',
						'value' => $depth ?? null,
						'min' => 1,
						'max' => 999999,
						'class' => 'required float-mask',
						'required' => true
					])
				</div>
			</div>

			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => isset($id) ? "weight-size-{$id}[]" : 'weight-size[]', 
				'title' => 'Peso(quilogramas)',
				'value' => $weight ?? null,
				'min' => 1,
				'max' => 999999,
				'class' => 'required float-mask',
				'required' => true
			])
		</div>
	</div>
</div>