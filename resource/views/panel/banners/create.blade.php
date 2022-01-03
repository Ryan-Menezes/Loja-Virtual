@extends('templates.panel')

@section('title', 'Novo Banner')

@section('container')
<div class="container-main">
	@include('includes.panel.banners.form', ['action' => route('panel.banners.store'), 'method' => 'POST'])
</div>
@endsection