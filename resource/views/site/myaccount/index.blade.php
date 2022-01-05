@extends('templates.site')

@section('title', 'Minha Conta')
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
            <h2>Seja bem vindo(a) {{ $client->name }}</h2><hr/>

            <div class="cards">
                <a href="{{ route('site.myaccount.requests') }}" title="Pedidos">
                    <div class="card">
                        <h3 class="card-title">50</h3>
                        <i class="fa fa-list"></i>
                    </div>
                </a>

                <a href="{{ route('site.cart') }}" title="Carrinho de Compras">
                    <div class="card">
                        <h3 class="card-title">{{ $cart->quantity() }}</h3>
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                </a>

                <a href="{{ route('site.myaccount.adresses') }}" title="Endereços">
                    <div class="card">
                        <h3 class="card-title">{{ $client->adresses->count() }}</h3>
                        <i class="fa fa-map-marker"></i>
                    </div>
                </a>

                <a href="{{ route('site.myaccount.cards') }}" title="Cartões">
                    <div class="card">
                        <h3 class="card-title">{{ $client->cards->count() }}</h3>
                        <i class="fa fa-credit-card"></i>
                    </div>
                </a>

                <a href="{{ route('site.myaccount.cards') }}" title="Favoritos">
                    <div class="card">
                        <h3 class="card-title">50</h3>
                        <i class="fa fa-heart"></i>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection