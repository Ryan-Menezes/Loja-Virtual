@extends('templates.panel')

@section('title', 'Configurações da Loja Virtual')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="mt-2">
		@include('includes.panel.system.lgpd.form', ['action' => route('panel.system.lgpd.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection