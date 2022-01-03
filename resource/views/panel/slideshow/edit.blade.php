@extends('templates.panel')

@section('title', 'Editar Slide')

@section('container')
<div class="container-main">
	@include('includes.panel.slideshow.form', ['action' => route('panel.slideshow.update', ['id' => $slideshow->id]), 'method' => 'PUT'])
</div>
@endsection