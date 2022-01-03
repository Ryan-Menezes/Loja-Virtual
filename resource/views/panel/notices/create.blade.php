@extends('templates.panel')

@section('title', 'Novo Artigo')

@section('container')
<div class="container-main">
	@include('includes.panel.notices.form', ['action' => route('panel.notices.store'), 'method' => 'POST'])
</div>
@endsection