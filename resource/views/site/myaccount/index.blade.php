@extends('templates.site')

@section('title', 'Minha Conta')
@section('url', route('site.myaccount'))

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <h1>Seja bem vindo(a) {{ $client->name }}</h1><hr/>

            <div class="cards">
                @include('includes.components.card', ['title' => 'Pedidos', 'link' => route('site.myaccount.requests'), 'class' => 'text-primary', 'amount' => $client->requests->count(), 'icon' => 'fa fa-list'])
                @include('includes.components.card', ['title' => 'Carrinho de Compras', 'link' => route('site.cart'), 'class' => 'text-warning', 'amount' => $cart->quantity(), 'icon' => 'fa fa-shopping-cart'])
                @include('includes.components.card', ['title' => 'Endereços', 'link' => route('site.myaccount.adresses'), 'class' => 'text-info', 'amount' => $client->adresses->count(), 'icon' => 'fa fa-map-marker'])
                @include('includes.components.card', ['title' => 'Favoritos', 'link' => route('site.myaccount.favorites'), 'class' => 'text-danger', 'amount' => $client->favorites->count(), 'icon' => 'fa fa-heart'])
            </div>
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection