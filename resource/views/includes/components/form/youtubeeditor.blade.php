<div class="card content-group mb-2 p-0 {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="YOUTUBEEDITOR">

	@if(!isset($notoptions))
	<div class="card-header">
		<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>
		<button type="button" class="btn btn-sm btn-dark btn-duplicate-element float-end" title="Duplicar Elemento"><i class="fas fa-clone"></i></button>
	</div>
	@endif
	<div class="card-body form-group">
		<div class="col-md-12">
			@isset($required)
				@include('includes.components.form.input', [
					'type' => 'text', 
					'name' => $name ?? 'urls-video[]',
					'title' => 'Url do Video',
					'value' => $texturl ?? null,
					'class' => 'youtube-url-video required nosortable',
					'required' => true
				])
			@else
				@include('includes.components.form.input', [
					'type' => 'text', 
					'name' => $name ?? 'urls-video[]',
					'title' => 'Url do Video',
					'value' => $texturl ?? null,
					'class' => 'youtube-url-video'
				])
			@endisset
		</div>
		<label class="label-img">
			@include('includes.components.youtube.player')
		</label>
	</div>
</div>