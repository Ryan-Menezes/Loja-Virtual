<div class="form-group mb-3">
	<label class="form-label"><strong>{{ $title }}:</strong></label>
	<div class="container-check">
		@foreach($values as $key => $value)
			<div>
				@if(isset($checks) && is_array($checks) && in_array($key, $checks))
					<input type="checkbox" name="{{ $name }}" value="{{ $key }}" id="id{{ $key }}" checked>
				@else
					<input type="checkbox" name="{{ $name }}" value="{{ $key }}" id="id{{ $key }}">
				@endif
				<label for="id{{ $key }}">{{ $value }}</label>
			</div>
		@endforeach
	</div>
</div>