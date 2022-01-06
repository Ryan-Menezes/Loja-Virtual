@extends('templates.site')

@section('title', 'Criar Conta')
@section('url', route('site.account.pf.create'))
@section('description', 'Criar Conta')
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
	@include('includes.site.auth.form', ['type' => 1])
</section>
@endsection