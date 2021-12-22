<div class="form-group content-group mb-2 border p-2 bg-light {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="YOUTUBEEDITOR">
	<div class="row mb-2">
		<div class="col-md-11">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'urls-video[]', 
				'title' => 'Url do Video',
				'value' => $texturl ?? null,
				'class' => 'youtube-url-video required'
			])
		</div>
		<div class="col-md-1">
			@if(!isset($notoptions))
				<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>

				<button type="button" class="btn btn-sm btn-dark btn-duplicate-element float-end" title="Duplicar Elemento"><i class="fas fa-clone"></i></button>
			@endif
		</div>
	</div>
	<label class="label-img">
		@include('includes.components.youtube.player')
	</label>
</div>