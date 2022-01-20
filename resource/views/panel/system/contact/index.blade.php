@extends('templates.panel')

@section('title', 'Configurações de Contato')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="mt-2">
		@include('includes.panel.system.contact.form', ['action' => route('panel.system.contact.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection