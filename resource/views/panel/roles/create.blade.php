@extends('templates.panel')

@section('title', 'Nova Função')

@section('container')
<div class="container-main">
	@include('includes.panel.roles.form', ['action' => route('panel.roles.store'), 'method' => 'POST'])
</div>
@endsection