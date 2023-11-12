@php
	$id = rand(0, 10000);
@endphp

<div class="form-group mb-3">
	<label class="form-label" for="{{ $name }}-{{ $id }}"><strong>{{ $title }}:</strong></label>
	<span><small>O ideal seria um arquivo de até 300kb(Se for uma imagem que seja no máximo de 1200x1200 de resolução)</small></span>

	@if(isset($value) && $value)
	<p><a href="{{ $value }}" title="Ver Arquivo" target="_blank" class="mb-2">{{ $value }} <i class="fas fa-external-link-alt"></i></a></p>
	@endif

	<input type="{{ $type }}" name="{{ $name }}" id="{{ $name }}-{{ $id }}" accept="{{ $accept }}" @if(isset($required)) required @endif class="form-control {{ $class ?? null }}">
</div>