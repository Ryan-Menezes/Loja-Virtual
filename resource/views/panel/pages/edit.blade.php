@extends('templates.panel')

@section('title', 'Editar Página')

@section('container')
<div class="container-main">
	@include('includes.panel.pages.form', ['action' => route('panel.pages.update', ['id' => $page->id]), 'method' => 'PUT'])
</div>
@endsection