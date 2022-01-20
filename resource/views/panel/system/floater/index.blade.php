@extends('templates.panel')

@section('title', 'Configurações do Floater')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="accordion mt-2">
		@include('includes.panel.system.floater.form', ['action' => route('panel.system.floater.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection