<div class="form-group mb-2">
	<label class="form-label">{{ $title }}:</label>
	<input type="{{ $type }}" name="{{ $name }}" placeholder="{{ $title }}" value="{{ $value ?? null }}" @if($type == 'number') min="{{ $min ?? null }}" max="{{ $max ?? null }}" @endif @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">
</div>