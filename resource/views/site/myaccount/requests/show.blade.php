@extends('templates.site')

@section('title', 'Pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show', ['id' => $requestmodel->id]))
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
            <h1>Pedido #{{ $requestmodel->id }}</h1><hr />

            @include('includes.site.requests.body')

            @if($requestmodel->status == 'AP' && empty($requestmodel->payment->method))
            <h2 style="margin-top: 20px;">Pagamento</h2><hr />

            <div class="cards">
                @if(config('store.payment.checkouts.transparent'))
                    @if(config('store.payment.methods.credit_card'))
                        @include('includes.components.card', ['title' => 'Cartão de Crédito', 'link' => route('site.requests.show.credit_card', ['id' => $requestmodel->id]), 'class' => 'text-danger', 'amount' => 'Cartão de Crédito', 'icon' => 'fa fa-credit-card'])
                    @endif

                    @if(config('store.payment.methods.debit_card'))
                        @include('includes.components.card', ['title' => 'Cartão de Débito', 'link' => route('site.requests.show.debit_card', ['id' => $requestmodel->id]), 'class' => 'text-info', 'amount' => 'Cartão de Débito', 'icon' => 'fa fa-credit-card'])
                    @endif

                    @if(config('store.payment.methods.bolet') && !config('store.payment.types.paypal'))
                        @include('includes.components.card', ['title' => 'Boleto', 'link' => route('site.requests.show.bolet', ['id' => $requestmodel->id]), 'class' => 'text-black', 'amount' => 'Boleto', 'icon' => 'fa fa-barcode'])
                    @endif
                    
                    @if(config('store.payment.methods.debit_online'))
                        @include('includes.components.card', ['title' => 'Débito Online', 'link' => route('site.requests.show.debit_online', ['id' => $requestmodel->id]), 'class' => 'text-warning', 'amount' => 'Débito Online', 'icon' => 'fa fa-bank'])
                    @endif
                @else
                    @include('includes.components.card', ['title' => 'Pagar Pedido', 'link' => route('site.myaccount.requests.show.checkout', ['id' => $requestmodel->id]), 'class' => 'text-black', 'amount' => 'Pagar Pedido', 'icon' => 'fa fa-money'])
                @endif
        
                @if(config('store.payment.methods.pix'))
                    @include('includes.components.card', ['title' => 'PIX', 'link' => route('site.requests.show.pix', ['id' => $requestmodel->id]), 'class' => 'text-success', 'amount' => 'PIX', 'icon' => 'fa fa-qrcode'])
                @endif
                
                @if(config('store.payment.methods.paypal'))
                    @include('includes.components.card', ['title' => 'PayPal', 'link' => route('site.requests.show.paypal', ['id' => $requestmodel->id]), 'class' => 'text-primary', 'amount' => 'PayPal', 'icon' => 'fa fa-paypal'])
                @endif
            </div>
            @endif
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection