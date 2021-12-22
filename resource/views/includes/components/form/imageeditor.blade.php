<div class="form-group content-group mb-2 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="IMAGEEDITOR">
	<div class="row mb-2">
		@if(!isset($nottitle))
		<div class="col-md-11">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => isset($id) ? "title-images-{$id}[]" : 'title-images[]', 
				'title' => 'Titulo da Imagem',
				'value' => $title ?? null
			])
		</div>
		<div class="col-md-1">
			@if(!isset($notoptions))
			<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento" data-remove="{{ $imageRemove ?? null }}"><i class="fas fa-trash-alt"></i></button>
			@endif
		</div>
		@else
		<div class="col-md-12">
			@if(!isset($notoptions))
			<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento" data-remove="{{ $imageRemove ?? null }}"><i class="fas fa-trash-alt"></i></button>
			@endif
		</div>
		@endif
	</div>
	@php
		$idfile = md5(uniqid() . time());	
	@endphp
	<label class="label-img" for="img{{ $idfile }}">
		<img src="{{ $image ?? public_path('assets/img/panel/upload.png') }}" data-default="{{ $image ?? public_path('assets/img/panel/upload.png') }}" title="Selecione uma Imagem" alt="Selecione uma Imagem" class="img-fluid border">
	</label>

	<input type="file" name="{{ isset($id) ? "images-{$id}[]" : 'images[]' }}" accept="image/*" id="img{{ $idfile }}" class="image-upload" required hidden>
</div>