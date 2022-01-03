@extends('templates.panel')

@section('title', 'Novo Usuário')

@section('container')
<div class="container-main">
	@include('includes.panel.users.form', ['action' => route('panel.users.store'), 'method' => 'POST'])
</div>
@endsection