<div class="form-group mb-2">
	<label class="form-label">{{ $title }}:</label>
	<select name="{{ $name }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">
		@foreach($options as $key => $option)
			@if(isset($value) && !is_null($value) && $value == $key)
			<option value="{{ $key }}" selected>{{ $option }}</option>
			@else
			<option value="{{ $key }}">{{ $option }}</option>
			@endif
		@endforeach
	</select>
</div>