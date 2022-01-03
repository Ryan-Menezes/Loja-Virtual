@extends('templates.panel')

@section('title', 'Nova Categoria')

@section('container')
<div class="container-main">
	@include('includes.panel.categories.form', ['action' => route('panel.categories.store'), 'method' => 'POST'])
</div>
@endsection