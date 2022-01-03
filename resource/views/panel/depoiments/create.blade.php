@extends('templates.panel')

@section('title', 'Novo Depoimento')

@section('container')
<div class="container-main">
	@include('includes.panel.depoiments.form', ['action' => route('panel.depoiments.store'), 'method' => 'POST'])
</div>
@endsection