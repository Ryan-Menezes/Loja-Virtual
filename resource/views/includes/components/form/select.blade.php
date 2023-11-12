@php
	$value = old($name) ?? ($value ?? null);
	$id = rand(0, 10000);
@endphp

<div class="form-group mb-3">
	<label class="form-label" for="{{ $name }}-{{ $id }}"><strong>{{ $title }}:</strong></label>
	<select name="{{ $name }}" id="{{ $name }}-{{ $id }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}" data-noniceselect>
		@foreach($options as $key => $option)
			@if(isset($value) && !is_null($value) && $value == $key)
			<option value="{{ $key }}" selected>{{ $option }}</option>
			@else
			<option value="{{ $key }}">{{ $option }}</option>
			@endif
		@endforeach
	</select>
</div>