@extends('templates.site')

@section('title', 'Favoritos')
@section('url', route('site.myaccount.favorites'))

@section('container')
@include('includes.site.modais.delete', [
    'title' => 'Remover Rroduto',
    'message' => 'Deseja realmente remover este produto do favoritos?',
    'btnmsg' => 'Remover'
])

<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <h1>Favoritos</h1><hr />

            @include('includes.messages')

            <div class="products_cards">
                @foreach($favorites as $product)
                <div class="product_card">
                    <div class="product_image">
                       <img src="{{ url('storage/app/public/' . $product->firstImage) }}" title="{{ $product->name }}" alt="{{ $product->name }}"> 
                    </div>
                    <div class="product_content">
                        <h2 class="product_title"><a href="{{ route('site.products.show', ['slug' => $product->slug]) }}" title="Ver mais sobre: {{ $product->name }}">{{ $product->name }}</a></h2>

                        <a  href="javascript:void(0)" class="btn btn-danger btn-delete" data-route="{{ route('site.myaccount.favorites.remove', ['id' => $product->id]) }}" data-toggle="modal" data-target="#modalDelete" title="Remover dos Favoritos">Remover <i class="fa fa-trash"></i></a>
                    </div>
                </div>
                @endforeach
            </div>
            
            @include('includes.site.paginator', ['route' => 'site.myaccount.favorites'])
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection