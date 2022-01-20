@extends('templates.panel')

@section('title', 'Configurações de Redes Sociais')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="mt-2">
		@include('includes.panel.system.social.form', ['action' => route('panel.system.social.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection