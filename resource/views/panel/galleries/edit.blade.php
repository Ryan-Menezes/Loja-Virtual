@extends('templates.panel')

@section('title', 'Editar Galeria')

@section('container')
<div class="container-main">
	@include('includes.panel.galleries.form', ['action' => route('panel.galleries.update', ['id' => $galery->id]), 'method' => 'PUT'])
</div>
@endsection