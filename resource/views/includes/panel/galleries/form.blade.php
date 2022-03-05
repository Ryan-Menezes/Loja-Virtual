<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'title', 
		'title' => 'Titulo', 
		'class' => 'required',
		'value' => (isset($galery) ? $galery->title : null),
		'required' => true
	])

	@include('includes.components.form.textarea', [
		'name' => 'description',
		'title' => 'Descrição',
		'value' => (isset($galery) ? $galery->description : null)
	])

	<div class="product-images row">
		@if(isset($galery))
			@foreach($galery->images as $image)
				@include('includes.components.form.imageeditor', [
					'nottitle' => 'true',
					'image' => url('storage/app/public/' . $image->source, config('ftp.active')),
					'imageRemove' => $image->source,
					'class' => 'col-md-4'
				])
			@endforeach
		@endif

		<input type="hidden" name="images-remove">
	</div>

	<div class="row">
		<div class="col-md-12 text-center p-4 bg-primary text-white" style="cursor: pointer;" title="Clique aqui para adicionar uma nova imagem" alt="Adicionar nova imagem" data-urlajax="{{ route('panel.galleries.component', ['name' => 'form.imageeditor']) }}" data-nottitle="true" data-container=".product-images" data-class="col-md-4">NOVA IMAGEM <i class="fas fa-plus-circle"></i></div>
	</div>

	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>