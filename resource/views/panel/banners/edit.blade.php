@extends('templates.panel')

@section('title', 'Editar Banner')

@section('container')
<div class="container-main">
	@include('includes.panel.banners.form', ['action' => route('panel.banners.update', ['id' => $banner->id]), 'method' => 'PUT'])
</div>
@endsection