@extends('templates.panel')

@section('title', 'Editar Depoimento')

@section('container')
<div class="container-main">
	@include('includes.panel.depoiments.form', ['action' => route('panel.depoiments.update', ['id' => $depoiment->id]), 'method' => 'PUT'])
</div>
@endsection