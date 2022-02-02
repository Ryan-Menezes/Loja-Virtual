@extends('templates.panel')

@section('title', 'Editar Produto')

@section('container')
<div class="container-main">
	@include('includes.panel.infofrete')
	@include('includes.panel.products.form', ['action' => route('panel.products.update', ['id' => $product->id]), 'method' => 'PUT'])
</div>
@endsection