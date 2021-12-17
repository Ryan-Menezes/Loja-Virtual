@extends('templates.panel')

@section('title', 'Novo Produto')

@section('container')
	<div class="container-main">
		@include('includes.panel.products.form', ['action' => route('panel.products.store'), 'method' => 'POST'])
	</div>
@endsection