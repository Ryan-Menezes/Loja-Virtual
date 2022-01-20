@extends('templates.panel')

@section('title', 'Editar Perceiro')

@section('container')
<div class="container-main">
	@include('includes.panel.partners.form', ['action' => route('panel.partners.update', ['id' => $partner->id]), 'method' => 'PUT'])
</div>
@endsection