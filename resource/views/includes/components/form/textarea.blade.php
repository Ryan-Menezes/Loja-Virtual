<div class="form-group mb-2">
	<label class="form-label"><strong>{{ $title }}:</strong></label>
	<textarea name="{{ $name }}" placeholder="{{ $title }}" rows="{{ $rows ?? 5 }}" @if(isset($required)) required @endif class="form-control {{ $class }}">{{ old($name) ?? ($value ?? null) }}</textarea>
</div>