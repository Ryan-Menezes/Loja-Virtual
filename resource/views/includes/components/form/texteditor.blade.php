<div class="card content-group mb-2 p-0 {{ $class ?? null }}">
	<input type="hidden" name="elements[]" value="TEXTEDITOR">

	@if(!isset($notoptions))
	<div class="card-header">
		<button type="button" class="btn btn-sm btn-danger btn-remove-element float-end" title="Remover Elemento"><i class="fas fa-trash-alt"></i></button>
	</div>
	@endif
	<div class="card-body form-group">
		<div class="nosortable">
			<textarea name="{{ $name }}" placeholder="{{ $title }}" rows="{{ $rows ?? 5 }}" required class="textarea-editor form-control required nosortable">{{ old($name) ?? ($value ?? null) }}</textarea>
		</div>
	</div>
</div>