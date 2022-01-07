@extends('templates.site')

@section('title', 'Editar Cartão')
@section('url', route('site.myaccount'))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
        	<h1>Editar Cartão</h1><hr />

            @include('includes.site.cards.form', ['action' => route('site.myaccount.cards.update', ['id' => $card->id]), 'method' => 'PUT'])
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection