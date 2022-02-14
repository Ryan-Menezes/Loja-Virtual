@php
	$value = old($name) ?? ($value ?? null);
@endphp

<div class="form-group mb-3">
	<label class="form-label"><strong>{{ $title }}:</strong></label>
	<select name="{{ $name }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}" data-noniceselect>
		@foreach($options as $key => $option)
			@if(isset($value) && !is_null($value) && $value == $key)
			<option value="{{ $key }}" selected>{{ $option }}</option>
			@else
			<option value="{{ $key }}">{{ $option }}</option>
			@endif
		@endforeach
	</select>
</div>