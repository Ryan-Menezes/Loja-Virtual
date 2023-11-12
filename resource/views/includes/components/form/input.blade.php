@php
	$id = rand(0, 10000);
@endphp

<div class="form-group mb-3">
	<label class="form-label" for="{{ $name }}-{{ $id }}"><strong>{{ $title }}:</strong></label>
	<input type="{{ $type }}" name="{{ $name }}" id="{{ $name }}-{{ $id }}" placeholder="{{ $title }}" value="{{ old($name) ?? ($value ?? null) }}" @if($type == 'number') min="{{ $min ?? null }}" max="{{ $max ?? null }}" @endif @if(isset($required)) required @endif class="form-control {{ $class ?? null }}" @if(isset($disabled)) disabled readonly @endif>
</div>