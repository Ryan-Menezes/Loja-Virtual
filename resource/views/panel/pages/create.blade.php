@extends('templates.panel')

@section('title', 'Nova Página')

@section('container')
<div class="container-main">
	@include('includes.panel.pages.form', ['action' => route('panel.pages.store'), 'method' => 'POST'])
</div>
@endsection