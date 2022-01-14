<div class="frete-info">
	@if(!isset($select))
	<input type="radio" name="freight" value="{{ $value }}" id="{{ $value }}" checked required>
	@endif
	<label for="{{ $value }}">{{ $title }} - {{ $days }} {{ ($days == 1 ? 'Dia' : 'Dias') }} - R${{ $price }}</label>
</div>