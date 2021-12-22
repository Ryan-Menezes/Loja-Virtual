@php
	$id = $id ?? md5(uniqid() . time());
@endphp
<div class="form-group content-group mb-2 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="COLOREDITOR">
	<input type="hidden" name="id-colors[]" value="{{ $id }}">
	<div class="row mb-2">
		<div class="col-md-11">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'description-colors[]', 
				'title' => 'Descrição da Cor',
				'value' => $description ?? null,
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
	
	<div class="accordion">
		<h3>Imagens</h3>
		<div id="product-images-{{ $id }}" class="product-images sortable row">
			@if(isset($images) && (is_array($images) || is_object($images)))
				@foreach($images as $image)
					@include('includes.components.form.imageeditor', [
						'nottitle' => 'true',
						'description' => $image->description,
						'image' => url('storage/app/public/' . $image->source),
						'imageRemove' => $image->source,
						'id' => $id,
						'class' => 'col-md-6'
					])
				@endforeach

				<input type="hidden" name="images-remove">
			@endif
		</div>

		<h3>Tamanhos</h3>
		<div id="product-sizes-{{ $id }}" class="product-sizes sortable">
			@if(isset($sizes) && (is_array($sizes) || is_object($sizes)))
				@foreach($sizes as $size)
					@include('includes.components.form.sizeeditor', [
						'description' => $size->description,
						'price' => $size->price,
						'price_previous' => $size->price_previous,
						'quantity' => $size->quantity,
						'width' => $size->width,
						'height' => $size->height,
						'depth' => $size->depth,
						'weight' => $size->weight,
						'id' => $id
					])
				@endforeach
			@endif
		</div>
	</div>

	<div class="row text-center mt-5">
		<div class="col-md-12">
			<button type="button" class="btn border" data-urlajax="{{ $urlimage }}" data-nottitle="true" data-container="#product-images-{{ $id }}" data-id="{{ $id }}" data-class="col-md-6">Adicionar imagem <i class="fas fa-image"></i></button>

			<button type="button" class="btn border" data-urlajax="{{ $urlsize }}" data-container="#product-sizes-{{ $id }}" data-id="{{ $id }}">Adicionar tamanho <i class="fas fa-size"></i></button>
		</div>
	</div>
</div>