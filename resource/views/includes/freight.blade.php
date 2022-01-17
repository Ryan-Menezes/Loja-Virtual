<div class="frete-info">
	@if(!isset($select))
	<input type="radio" name="freight" value="{{ $value }}" id="{{ $value }}" checked required>
	@endif
	<label for="{{ $value }}">{{ $title }} - {{ $days }} {{ ($days == 1 ? 'Dia' : 'Dias') }} - R${{ $price }}</label>

	@if(isset($message) && !empty($message))
	<p class="m-0 p-0" style="margin-top: 10px;">{{ $message }}</p>
	@endif
</div>