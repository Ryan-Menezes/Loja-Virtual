@extends('templates.panel')

@section('title', 'Configurações')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="accordion mt-2">
		<h2>Geral</h2>
		@include('includes.panel.system.form', ['action' => route('panel.system.update'), 'method' => 'PUT'])
	</div>
	<div class="accordion mt-2">
		<h2>Endereço</h2>
		@include('includes.panel.system.address.form', ['action' => route('panel.system.address.update'), 'method' => 'PUT'])
	</div>
	<div class="accordion mt-2">
		<h2>Contato</h2>
		@include('includes.panel.system.contact.form', ['action' => route('panel.system.contact.update'), 'method' => 'PUT'])
	</div>
	<div class="accordion mt-2">
		<h2>Redes Sociais</h2>
		@include('includes.panel.system.social.form', ['action' => route('panel.system.social.update'), 'method' => 'PUT'])
	</div>
	<div class="accordion mt-2">
		<h2>Loja</h2>
		<div></div>
	</div>
	<div class="accordion mt-2">
		<h2>Floater</h2>
		@include('includes.panel.system.floater.form', ['action' => route('panel.system.floater.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection