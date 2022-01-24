@extends('templates.panel')

@section('title', 'Configurações')

@section('container')
<div class="container-main">
	@include('includes.messages')

	@if(can('all.system'))
	<div class="mt-2">
		@include('includes.panel.system.form', ['action' => route('panel.system.update'), 'method' => 'PUT'])
	</div>
	@endif

	<div class="cards-container mt-4 p-4 bg-white border">
		@if(can('all.system.address'))
			@include('includes.components.card', ['title' => 'Endereço', 'link' => route('panel.system.address'), 'class' => 'text-danger', 'amount' => 'Endereço', 'icon' => 'fas fa-map-marker-alt'])
		@endif

		@if(can('all.system.contact'))
			@include('includes.components.card', ['title' => 'Contato', 'link' => route('panel.system.contact'), 'class' => 'text-warning', 'amount' => 'Contato', 'icon' => 'fas fa-phone-alt'])
		@endif

		@if(can('all.system.social'))
			@include('includes.components.card', ['title' => 'Redes Sociais', 'link' => route('panel.system.social'), 'class' => 'text-primary', 'amount' => 'Redes Sociais', 'icon' => 'fas fa-network-wired'])
		@endif

		@if(can('all.system.store'))
			@include('includes.components.card', ['title' => 'Loja Virtual', 'link' => route('panel.system.store'), 'class' => 'text-success', 'amount' => 'Loja Virtual', 'icon' => 'fas fa-store'])
		@endif

		@if(can('all.system.lgpd'))
			@include('includes.components.card', ['title' => 'LGPD', 'link' => route('panel.system.lgpd'), 'class' => 'text-black', 'amount' => 'LGPD', 'icon' => 'fas fa-lock'])
		@endif

		@if(can('all.system.floater'))
			@include('includes.components.card', ['title' => 'Floater', 'link' => route('panel.system.floater'), 'class' => 'text-info', 'amount' => 'Floater', 'icon' => 'fas fa-exclamation-circle'])
		@endif

		@if(can('all.system.ftp'))
			@include('includes.components.card', ['title' => 'FTP', 'link' => route('panel.system.ftp'), 'class' => 'text-black', 'amount' => 'FTP', 'icon' => 'fas fa-network-wired'])
		@endif
	</div>
</div>
@endsection