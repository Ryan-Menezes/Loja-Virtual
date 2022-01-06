@extends('templates.panel')

@section('title', 'Configurações')

@section('container')
<div class="container-main">
	@include('includes.messages')

	@if(can('all.system'))
	<div class="accordion mt-2">
		<h2>Geral</h2>
		@include('includes.panel.system.form', ['action' => route('panel.system.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.address'))
	<div class="accordion mt-2">
		<h2>Endereço</h2>
		@include('includes.panel.system.address.form', ['action' => route('panel.system.address.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.contact'))
	<div class="accordion mt-2">
		<h2>Contato</h2>
		@include('includes.panel.system.contact.form', ['action' => route('panel.system.contact.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.social'))
	<div class="accordion mt-2">
		<h2>Redes Sociais</h2>
		@include('includes.panel.system.social.form', ['action' => route('panel.system.social.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.store'))
	<div class="accordion mt-2">
		<h2>Loja</h2>
		<div></div>
	</div>
	@endif

	@if(can('all.system.lgpd'))
	<div class="accordion mt-2">
		<h2>LGPD</h2>
		@include('includes.panel.system.lgpd.form', ['action' => route('panel.system.lgpd.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.floater'))
	<div class="accordion mt-2">
		<h2>Floater</h2>
		@include('includes.panel.system.floater.form', ['action' => route('panel.system.floater.update'), 'method' => 'PUT'])
	</div>
	@endif
</div>
@endsection