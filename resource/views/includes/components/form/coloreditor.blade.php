@php
	$id = $id ?? md5(uniqid() . time());
@endphp
<div class="card content-group mb-2 p-0 {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="COLOREDITOR">
	<input type="hidden" name="id-colors[]" value="{{ $id }}">

	@if(!isset($notoptions))
	<div class="card-header">
		<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>
	</div>
	@endif
	<div class="card-body form-group">
		<div class="row">
			<div class="col-md-1">
				@include('includes.components.form.input', [
					'type' => 'color', 
					'name' => 'hex-colors[]', 
					'title' => 'Cor',
					'value' => $hex ?? null,
					'class' => 'required',
					'required' => true
				])
			</div>
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
		</div>
		
		<div class="accordion">
			<h3>Imagens</h3>
			<div id="product-images-{{ $id }}" class="product-images row">
				@if(isset($images) && (is_array($images) || is_object($images)))
					@foreach($images as $image)
						@include('includes.components.form.imageeditor', [
							'nottitle' => 'true',
							'description' => $image->description,
							'image' => url('storage/app/public/' . $image->source, config('ftp.active')),
							'imageRemove' => $image->source,
							'id' => $id,
							'class' => 'col-md-6'
						])
					@endforeach
	
					<input type="hidden" name="images-remove">
				@endif
			</div>
	
			<h3>Tamanhos</h3>
			<div id="product-sizes-{{ $id }}" class="product-sizes row">
				@if(isset($sizes) && (is_array($sizes) || is_object($sizes)))
					@foreach($sizes as $size)
						@include('includes.components.form.sizeeditor', [
							'id_size' => $size->id,
							'description' => $size->description,
							'price' => $size->price,
							'price_previous' => $size->price_previous,
							'quantity' => $size->quantity,
							'width' => $size->width,
							'height' => $size->height,
							'depth' => $size->depth,
							'weight' => $size->weight,
							'id' => $id,
							'class' => 'col-md-6'
						])
					@endforeach
				@endif
			</div>
		</div>
	
		<div class="row text-center mt-5">
			<div class="col-md-6 text-center p-4 bg-danger text-white" style="cursor: pointer;" title="Clique aqui para adicionar uma nova imagem" data-urlajax="{{ $urlimage }}" data-nottitle="true" data-container="#product-images-{{ $id }}" data-id="{{ $id }}" data-class="col-md-6">NOVA IMAGEM <i class="fas fa-image"></i></div>
			<div class="col-md-6 text-center p-4 bg-success text-white" style="cursor: pointer;" title="Clique aqui para adicionar um novo tamanho" data-urlajax="{{ $urlsize }}" data-container="#product-sizes-{{ $id }}" data-id="{{ $id }}" data-class="col-md-6">NOVO TAMANHO <i class="fas fa-search"></i></div>
		</div>
	</div>
</div>