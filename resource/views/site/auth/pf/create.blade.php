@extends('templates.site')

@section('title', 'Criar Conta')
@section('url', route('site.account.pf.create'))
@section('description', 'Criar Conta')

@section('container')
<section class="container">
	@include('includes.site.auth.form', ['type' => 1])
</section>
@endsection