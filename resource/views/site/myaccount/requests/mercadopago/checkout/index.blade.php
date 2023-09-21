@extends('templates.site')

@section('title', 'Pagamento por checkout seguro do pagSeguro para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.checkout', ['id' => $requestmodel->id]))

@if(isset($preference))
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                <h1 style="margin-top: 20px;">Pagamento pelo Mercado Pago</h1><hr />
                <p>Ao clicar no botão abaixo você será redirecionado ao checkout seguro do mercado pago, e por lá efetuará o seu pagamento.</p>

                <div class="btn-payment" style="margin: 30px 0px;">
                    <a href="{{ $preference->init_point }}" title="Finalizar Pagamento do Pedido" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="padding: 15px; width: 100%;"><strong>Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}</strong></a>
                </div>

                <img src="https://imgmp.mlstatic.com/org-img/MLB/MP/BANNERS/tipo2_735X40.jpg?v=1" alt="Mercado Pago - Meios de pagamento" title="Mercado Pago - Meios de pagamento" style="width: 80%; margin-left: 10%; margin-bottom: 20px;"/>

                <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
                @include('includes.site.requests.body')
            </div>
        </div>
    </section>
    @endsection

    @if(config('store.payment.credentials.mercadopago.checkouts.lightbox'))
        @section('scripts')
        <script src="https://sdk.mercadopago.com/js/v2"></script>
        <script type="text/javascript" src="{{ public_path('assets/js/site/mercadopago.js') }}"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                setPublicKey("{{ config('store.payment.credentials.mercadopago.public_key') }}");

                const checkout = mp.checkout({
                    preference: {
                        id: '{{ $preference->id }}'
                    },
                    /*
                    render: {
                        container: '.btn-payment',
                        label: "Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}"
                    },
                    */
                    theme: {
                        headerColor: "{{ config('store.payment.credentials.mercadopago.header_color') }}",
                        elementsColor: "{{ config('store.payment.credentials.mercadopago.elements_color') }}"
                    }
                });

                $('.btn-payment').click(function(){
                    event.preventDefault();

                    checkout.open();
                });
            });
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