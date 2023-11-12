@php
	$id = rand(0, 10000);
@endphp

<div class="form-group mb-3">
	<label class="form-label" for="{{ $name }}-{{ $id }}"><strong>{{ $title }}:</strong></label>
	<textarea name="{{ $name }}" id="{{ $name }}-{{ $id }}" placeholder="{{ $title }}" rows="{{ $rows ?? 5 }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">{{ old($name) ?? ($value ?? null) }}</textarea>
</div>