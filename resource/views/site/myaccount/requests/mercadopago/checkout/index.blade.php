@extends('templates.site')

@section('title', 'Pagamento por checkout seguro do pagSeguro para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.checkout', ['id' => $requestmodel->id]))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@if(isset($preference))
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                <h1 style="margin-top: 20px;">Pagamento pelo Mercado Pago</h1><hr />
                <p>Ao clicar no botão abaixo você será redirecionado ao checkout seguro do mercado pago, e por lá efetuará o seu pagamento.</p>

                <div class="btn-payment" style="margin: 30px 0px;">
                    @if(!config('store.payment.credentials.mercadopago.checkouts.lightbox'))
                    <a href="{{ $preference->init_point }}" title="Finalizar Pagamento do Pedido" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="padding: 15px;">Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}</a>
                    @endif
                </div>

                <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
                @include('includes.site.requests.body')
            </div>
        </div>
    </section>
    @endsection

    @if(config('store.payment.credentials.mercadopago.checkouts.lightbox'))
        @section('scripts')
        <script src="https://sdk.mercadopago.com/js/v2"></script>
        <script>
            $(document).ready(function(){
                // Adicione as credenciais do SDK
                const mp = new MercadoPago("{{ config('store.payment.credentials.mercadopago.public_key') }}", {
                    locale: 'pt-BR'
                })

                const checkout = mp.checkout({
                    preference: {
                        id: '{{ $preference->id }}'
                    },
                    render: {
                        container: '.btn-payment',
                        label: "Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}"
                    },
                    theme: {
                        elementsColor: '#449D44',
                        headerColor: '#449D44'
                    }
                })
            })
        </script>
        @endsection
    @endif
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