<div class="card content-group p-0 mb-2 {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="IMAGEEDITOR">
	
	@if(!isset($notoptions))
	<div class="card-header">
		<span>O ideal seria uma imagem de até 300kb que no máximo tenha 1200x1200 de resolução</span>
		<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento" data-remove="{{ $imageRemove ?? null }}"><i class="fas fa-trash-alt"></i></button>
	</div>
	@endif
	<div class="card-body form-group">
		@if(!isset($nottitle))
		<div class="col-md-12">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => isset($id) ? "title-images-{$id}[]" : 'title-images[]', 
				'title' => 'Titulo da Imagem',
				'value' => $title ?? null,
				'class' => 'nosortable'
			])
		</div>
	@endif

	@php
		$idfile = md5(uniqid() . time());	
	@endphp

	<label class="label-img" for="img{{ $idfile }}">
		<img src="{{ $image ?? public_path('assets/img/panel/upload.png') }}" data-default="{{ $image ?? public_path('assets/img/panel/upload.png') }}" title="Selecione uma Imagem" alt="Selecione uma Imagem" class="img-fluid border">
	</label>

	<input type="file" name='{{ isset($id) ? "images-{$id}[]": "images[]" }}' accept="image/*" id="img{{ $idfile }}" class="image-upload" required hidden>
	</div>
</div>