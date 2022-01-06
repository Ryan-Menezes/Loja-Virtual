<div class="form-group mb-2">
	<label class="form-label"><strong>{{ $title }}:</strong></label>

	@if(isset($value) && $value)
	<p><a href="{{ $value }}" title="Ver Arquivo" target="_blank" class="mb-2">{{ $value }} <i class="fas fa-external-link-alt"></i></a></p>
	@endif

	<input type="{{ $type }}" name="{{ $name }}" accept="{{ $accept }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">
</div>