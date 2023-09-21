@extends('templates.site')

@section('title', 'Pagamento por checkout seguro do pagSeguro para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.checkout', ['id' => $requestmodel->id]))

@if(isset($code) && !empty($code))
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                <h1 style="margin-top: 20px;">Pagamento pelo PagSeguro</h1><hr />
                <p>Ao clicar no botão abaixo você será redirecionado ao checkout seguro do pagseguro, e por lá efetuará o seu pagamento.</p>

                @if(config('store.payment.production'))
                <a href="https://pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}" title="Efetuar Pagamento do Pedido" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="margin: 30px 0px; padding: 15px; width: 100%;"><strong>Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}</strong></a>
                @else
                <a href="https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}" title="Efetuar Pagamento do pedido" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="margin: 30px 0px; padding: 15px; width: 100%;"><strong>Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}</strong></a>
                @endif

                <img src="//assets.pagseguro.com.br/ps-integration-assets/banners/pagamento/todos_animado_550_50.gif" alt="Logotipos de meios de pagamento do PagSeguro" title="Este site aceita pagamentos com as principais bandeiras e bancos, saldo em conta PagSeguro e boleto." style="width: 80%; margin-left: 10%; margin-bottom: 20px;" />

                <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
                @include('includes.site.requests.body')
            </div>
        </div>
    </section>
    @endsection

    @if(config('store.payment.credentials.pagseguro.checkouts.lightbox'))
        @section('scripts')
            @if(config('store.payment.production'))
            <script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
            @else
            <script type="text/javascript" src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
            @endif

            <script type="text/javascript">
                $('.btn-payment').click(function(){
                    event.preventDefault();

                    /* Chamada do lightbox passando o código de checkout e os comandos para o callback */
                    let isOpenLightbox = PagSeguroLightbox('{{ $code }}', {
                        success: function(transactionCode) {
                            window.document.location.reload(true);
                        },
                        abort: function(){}
                    });

                    /* Redireciona o comprador, caso o navegador não tenha suporte ao Lightbox */
                    if(!isOpenLightbox){
                        @if(config('store.payment.production'))
                        window.open('https://pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}', '_blank');
                        @else
                        window.open('https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}', '_blank');
                        @endif
                    }
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