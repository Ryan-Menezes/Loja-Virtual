@extends('templates.site')

@section('title', 'Criar Conta')
@section('url', route('site.account.pj.create'))
@section('description', 'Criar Conta')

@section('container')
<section class="container">
	@include('includes.site.auth.form', ['type' => 2])
</section>
@endsection