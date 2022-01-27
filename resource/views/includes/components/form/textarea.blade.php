<div class="form-group mb-3">
	<label class="form-label"><strong>{{ $title }}:</strong></label>
	<textarea name="{{ $name }}" placeholder="{{ $title }}" rows="{{ $rows ?? 5 }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">{{ old($name) ?? ($value ?? null) }}</textarea>
</div>