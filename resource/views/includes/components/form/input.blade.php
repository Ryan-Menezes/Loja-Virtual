<div class="form-group mb-2">
	<label class="form-label"><strong>{{ $title }}:</strong></label>
	<input type="{{ $type }}" name="{{ $name }}" placeholder="{{ $title }}" value="{{ old($name) ?? ($value ?? null) }}" @if($type == 'number') min="{{ $min ?? null }}" max="{{ $max ?? null }}" @endif @if(isset($required)) required @endif class="form-control {{ $class ?? null }}" @if(isset($disabled)) disabled readonly @endif>
</div>