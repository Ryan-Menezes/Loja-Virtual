@extends('templates.panel')

@section('title', 'Configurações de Endereço')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="mt-2">
		@include('includes.panel.system.address.form', ['action' => route('panel.system.address.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection