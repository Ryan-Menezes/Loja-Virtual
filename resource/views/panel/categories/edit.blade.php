@extends('templates.panel')

@section('title', 'Editar Categoria')

@section('container')
<div class="container-main">
	@include('includes.panel.categories.form', ['action' => route('panel.categories.update', ['id' => $category->id]), 'method' => 'PUT'])
</div>
@endsection