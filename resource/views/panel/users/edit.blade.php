@extends('templates.panel')

@section('title', 'Editar Usuário')

@section('container')
<div class="container-main">
	@include('includes.panel.users.form', ['action' => route('panel.users.update', ['id' => $user->id]), 'method' => 'PUT'])
</div>
@endsection