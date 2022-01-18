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
            <h1 style="margin-top: 20px;">Pagamento pelo Pagseguro</h1><hr />
            <p>Ao clicar no botão abaixo você será redirecionado ao checkout seguro do pagseguro, e por lá efetuará o seu pagamento.</p>

            @if(config('store.payment.production'))
            <a href="https://pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}" title="Finalizar Pagamento do Pedido" class="btn btn-success btn-payment" target="_blank" style="margin: 30px 0px;">Pagar R$ {{ number_format($requestmodel->payment->amount - $requestmodel->payment->discount_cart - $requestmodel->payment->discount_installment - $requestmodel->payment->discount_coupon + $requestmodel->payment->shipping_value, 2, ',', '.') }}</a>
            @else
            <a href="https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}" title="Finalizar Pagamento do Pedido" class="btn btn-success btn-payment" target="_blank" style="margin: 30px 0px;">Pagar R$ {{ number_format($requestmodel->payment->amount - $requestmodel->payment->discount_cart - $requestmodel->payment->discount_installment - $requestmodel->payment->discount_coupon + $requestmodel->payment->shipping_value, 2, ',', '.') }}</a>
            @endif

            <h2>Pedido #{{ $requestmodel->id }}</h2><hr />
            @include('includes.site.requests.body')
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection

@if(config('store.payment.checkouts.lightbox'))
    @section('scripts')
        @if(config('store.payment.production'))
        <script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
        @else
        <script type="text/javascript" src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
        @endif

        <script type="text/javascript">
            $('.btn-payment').click(function(){
                event.preventDefault()

                // Chamada do lightbox passando o código de checkout e os comandos para o callback
                let isOpenLightbox = PagSeguroLightbox('{{ $code }}', {
                    success: function(transactionCode) {
                        console.log("Compra feita com sucesso, código de transação: " + transactionCode);
                    },
                    abort: function(){}
                })

                // Redireciona o comprador, caso o navegador não tenha suporte ao Lightbox
                if(!isOpenLightbox){
                    @if(config('store.payment.production'))
                    window.open('https://pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}', '_blank')
                    @else
                    window.open('https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code={{ $code }}', '_blank')
                    @endif
                }
            })
        </script>
    @endsection
@endif