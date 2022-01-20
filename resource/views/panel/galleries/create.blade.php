@extends('templates.panel')

@section('title', 'Nova Galeria')

@section('container')
<div class="container-main">
	@include('includes.panel.galleries.form', ['action' => route('panel.galleries.store'), 'method' => 'POST'])
</div>
@endsection