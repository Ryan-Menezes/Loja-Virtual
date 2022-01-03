@extends('templates.panel')

@section('title', 'Editar Função')

@section('container')
<div class="container-main">
	@include('includes.panel.roles.form', ['action' => route('panel.roles.update', ['id' => $role->id]), 'method' => 'PUT'])
</div>
@endsection