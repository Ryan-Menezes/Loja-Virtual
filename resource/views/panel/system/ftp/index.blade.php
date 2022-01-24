@extends('templates.panel')

@section('title', 'Configurações de FTP')

@section('container')
<div class="container-main">
	@include('includes.messages')

	<div class="mt-2">
		@include('includes.panel.system.ftp.form', ['action' => route('panel.system.ftp.update'), 'method' => 'PUT'])
	</div>
</div>
@endsection