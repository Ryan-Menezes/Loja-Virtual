<div class="form-group mb-2">
	<label class="form-label">{{ $title }}:</label>
	<textarea name="{{ $name }}" placeholder="{{ $title }}" rows="{{ $rows ?? 5 }}" @if(isset($required)) required @endif class="form-control {{ $class }}">{{ $value ?? null }}</textarea>
</div>