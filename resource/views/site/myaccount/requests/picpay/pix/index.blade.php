@extends('templates.site')

@section('title', 'Pagamento por pix para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.pix', ['id' => $requestmodel->id]))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@if(isset($paymentLink) && isset($qrcode))
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                <h1 style="margin-top: 20px;">Pagamento por PIX</h1><hr />
                <p>Você selecionou o pagamento por PIX, para que seu pedido seja confirmado para entrega, efetue o pagamento escaneando o qrcode abaixo:</p>

                <a href="{{ $requestmodel->payment->link }}" target="_blank" title="Escaneie o qrcode para finalizar o pagamento"><img src="{{ $requestmodel->payment->qrcode }}" title="Escaneie o qrcode para finalizar o pagamento" alt="QRCode de Pgamento" /></a>

                <p style="margin-top: 20px;"><strong>Esse qrcode irá expirar em {{ config('store.payment.credentials.picpay.expiration_minutes') }} minutos, Caso o pagamento não seja efetuado, seu pedido será cancelado!</strong></p>

                <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
                @include('includes.site.requests.body')
            </div>
        </div>
    </section>
    @endsection
@else
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                @include('includes.site.message', [
                    'title' => 'ERRO AO CARREGAR A PÁGINA',
                    'message' => 'Ocorreu um erro ao tentar carregar esta página por favor dé um refresh para recarregá-la novamente!',
                    'success' => false
                ])
            </div>
        </div>
    </section>
    @endsection
@endif

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection