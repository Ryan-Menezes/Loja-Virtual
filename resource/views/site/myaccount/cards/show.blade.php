@extends('templates.site')

@section('title', 'Cartão: ' . $card->name)
@section('url', route('site.myaccount.cards.show', ['id' => $card->id]))
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
            <h1>Cartão: {{ $card->name }}</h1><hr />

            <p><strong>Marca: </strong>{{ $card->brand }}</p>
            <p><strong>Número: </strong>{{ mask($card->number, '#### #### #### ####') }}</p>
            <p><strong>CVV: </strong>{{ $card->cvv }}</p>
            <p><strong>Validade: </strong>{{ $card->month }}/{{ $card->year }}</p>
            
            <h2 style="margin-top: 30px;">Dados do dono do cartão:</h2><hr />
            <p><strong>CPF: </strong>{{ mask($card->cpf, '###.###.###-##') }}</p>
            <p><strong>Telefone: </strong>{{ mask($card->telephone, '(##)####-####') }}</p>
            <p><strong>Data de Nascimento: </strong>{{ date('d/m/Y', strtotime($card->birth)) }}</p>
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection