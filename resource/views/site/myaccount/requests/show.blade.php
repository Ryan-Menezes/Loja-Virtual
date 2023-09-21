@extends('templates.site')

@section('title', 'Pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show', ['id' => $requestmodel->id]))

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <h1>Pedido #{{ $requestmodel->id }}</h1><hr />

            @include('includes.site.requests.body')

            @if($requestmodel->status == 'AP' && empty($requestmodel->payment->code) && empty($requestmodel->payment->method))
            <h2 style="margin-top: 20px;">Pagamento</h2><hr />

            <div class="cards">
                @if(config('store.payment.checkout_transparent'))
                    @if(config('store.payment.methods.credit_card'))
                        @include('includes.components.card', ['title' => 'Cartão de Crédito', 'link' => route('site.myaccount.requests.show.credit_card', ['id' => $requestmodel->id]), 'class' => 'text-danger', 'amount' => 'Cartão de Crédito', 'icon' => 'fa fa-credit-card'])
                    @endif

                    @if(config('store.payment.methods.debit_card') && !config('store.payment.types.pagseguro') && !config('store.payment.types.mercadopago'))
                        @include('includes.components.card', ['title' => 'Cartão de Débito', 'link' => route('site.myaccount.requests.show.debit_card', ['id' => $requestmodel->id]), 'class' => 'text-info', 'amount' => 'Cartão de Débito', 'icon' => 'fa fa-credit-card'])
                    @endif

                    @if(config('store.payment.methods.bolet'))
                        @include('includes.components.card', ['title' => 'Boleto', 'link' => route('site.myaccount.requests.show.bolet', ['id' => $requestmodel->id]), 'class' => 'text-black', 'amount' => 'Boleto', 'icon' => 'fa fa-barcode'])
                    @endif
                    
                    @if(config('store.payment.methods.debit_online') && config('store.payment.types.pagseguro'))
                        @include('includes.components.card', ['title' => 'Débito Online', 'link' => route('site.myaccount.requests.show.debit_online', ['id' => $requestmodel->id]), 'class' => 'text-warning', 'amount' => 'Débito Online', 'icon' => 'fa fa-bank'])
                    @endif

                    @if(config('store.payment.methods.bank_transfer') && config('store.payment.types.mercadopago'))
                        @include('includes.components.card', ['title' => 'Transferência Bancária', 'link' => route('site.myaccount.requests.show.bank_transfer', ['id' => $requestmodel->id]), 'class' => 'text-success', 'amount' => 'Transferência Bancária', 'icon' => 'fa fa-bank'])
                    @endif
                @endif

                @if(config('store.payment.credentials.pagseguro.active'))
                    @include('includes.components.card', ['title' => 'PagSeguro', 'link' => route('site.myaccount.requests.show.pagseguro', ['id' => $requestmodel->id]), 'class' => 'text-black', 'amount' => 'Pagseguro', 'icon' => 'fa fa-money'])
                @endif

                @if(config('store.payment.credentials.mercadopago.active'))
                    @include('includes.components.card', ['title' => 'Mercado Pago', 'link' => route('site.myaccount.requests.show.mercadopago', ['id' => $requestmodel->id]), 'class' => 'text-black', 'amount' => 'Mercado Pago', 'icon' => 'fa fa-money'])
                @endif
        
                @if(config('store.payment.methods.pix') && (config('store.payment.credentials.picpay.active') || config('store.payment.credentials.mercadopago.active')))
                    @include('includes.components.card', ['title' => 'PIX', 'link' => route('site.myaccount.requests.show.pix', ['id' => $requestmodel->id]), 'class' => 'text-success', 'amount' => 'PIX', 'icon' => 'fa fa-qrcode'])
                @endif
            </div>
            @elseif($requestmodel->payment->status_type != 'PA' && $requestmodel->payment->status_type != 'CA' && $requestmodel->payment->status_type != 'DE')
                <h2 style="margin-top: 20px;">Pagamento</h2><hr />

                @if($requestmodel->payment->status_type == 'AP' && (!empty($requestmodel->payment->link) || !empty($requestmodel->payment->qrcode)))
                    @if($requestmodel->payment->method == 'BO')
                    <p>Você selecionou o pagamento por boleto, para que seu pedido seja confirmado para entrega, imprima seu boleto clicando no botão abaixo:</p>

                    <a style="margin-top: 20px;" href="{{ $requestmodel->payment->link }}" target="_blank" class="btn btn-success">Imprimir Boleto <i class="fa fa-print"></i></a>

                    <p style="margin-top: 20px;"><strong>Caso o pagamento não seja efetuado até a data de vencimento do boleto, seu pedido será cancelado!</strong></p>
                    @elseif($requestmodel->payment->method == 'DO')
                    <p>Você selecionou o pagamento por débito online, para que seu pedido seja confirmado para entrega, efetue o pagamento por clicando no botão abaixo:</p>

                    <a style="margin-top: 20px;" href="{{ $requestmodel->payment->link }}" target="_blank" class="btn btn-success">Finalizar o pagamento por débito online <i class="fa fa-external-link"></i></a>

                    <p style="margin-top: 20px;"><strong>Caso o pagamento não seja efetuado, seu pedido será cancelado!</strong></p>
                    @elseif($requestmodel->payment->method == 'TB')
                    <p>Você selecionou o pagamento por transferência bancária, para que seu pedido seja confirmado para entrega, efetue o pagamento, para mais informações clique no botão abaixo:</p>

                    <a style="margin-top: 20px;" href="{{ $requestmodel->payment->link }}" target="_blank" class="btn btn-success">Mais informações sobre à transferência bancária <i class="fa fa-external-link"></i></a>

                    <p style="margin-top: 20px;"><strong>Caso o pagamento não seja efetuado, seu pedido será cancelado!</strong></p>
                    @elseif($requestmodel->payment->method == 'PX')
                    <p>Você selecionou o pagamento por PIX, para que seu pedido seja confirmado para entrega, efetue o pagamento escaneando o qrcode abaixo:</p>

                    <a href="{{ $requestmodel->payment->link ?? 'javascript:void(0)' }}" target="_blank" title="Escaneie o qrcode para finalizar o pagamento"><img src="{{ $requestmodel->payment->qrcode }}" title="Escaneie o qrcode para finalizar o pagamento" alt="QRCode de Pagamento" style="width: 400px;" /></a>

                    @if(!empty($requestmodel->payment->qrcode_hash))
                        @include('includes.components.form.input', [
                            'type' => 'text', 
                            'name' => 'code', 
                            'title' => 'Copiar Hash', 
                            'value' => $requestmodel->payment->qrcode_hash
                        ])
                    @endif

                    <p style="margin-top: 20px;"><strong>Esse qrcode irá expirar em {{ config('store.payment.credentials.picpay.expiration_minutes') }} minutos, Caso o pagamento não seja efetuado, seu pedido será cancelado!</strong></p>
                    @endif
                @else
                <p>Estamos analisando o seu pagamento, caso esteja tudo correto vamos confirmar o seu pagamento e liberar seu pedido para entrega.</p>
                @endif
            @endif
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection