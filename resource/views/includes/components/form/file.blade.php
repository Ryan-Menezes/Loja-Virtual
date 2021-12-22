<div class="form-group mb-2">
	<label class="form-label">{{ $title }}:</label>
	<input type="{{ $type }}" name="{{ $name }}" accept="{{ $accept }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">
</div>