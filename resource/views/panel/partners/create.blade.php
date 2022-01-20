@extends('templates.panel')

@section('title', 'Novo Parceiro')

@section('container')
<div class="container-main">
	@include('includes.panel.partners.form', ['action' => route('panel.partners.store'), 'method' => 'POST'])
</div>
@endsection