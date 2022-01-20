@extends('templates.site')

@section('title', 'Pagamento Por Boleto Para o Pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.bolet', ['id' => $requestmodel->id]))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@if(isset($session_id) && !empty($session_id))
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                <h1 style="margin-top: 20px;">Pagamento por Boleto</h1><hr />
                <p>Ao clicar no botão abaixo você irá gerar o seu boleto de pagamento</p>

                <form action="{{ route('site.myaccount.requests.show.bolet.store', ['id' => $requestmodel->id]) }}" method="POST" id="form-payment">
                    <input type="hidden" name="session_id" id="session_id" value="{{ $session_id }}">
                    <input type="hidden" name="sender_hash" id="sender_hash">
                    <button type="submit" title="Gerar Boleto" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="margin: 30px 0px;">Gerar Boleto Para o Este Valor: R$ {{ number_format($requestmodel->payment->amount - $requestmodel->payment->discount_cart - $requestmodel->payment->discount_installment - $requestmodel->payment->discount_coupon + $requestmodel->payment->shipping_value, 2, ',', '.') }}</button>
                </form>

                <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
                @include('includes.site.requests.body')
            </div>
        </div>
    </section>
    @endsection

    @section('scripts')
        @if(config('store.payment.production'))
        <script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>
        @else
        <script type="text/javascript" src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>
        @endif

        <script type="text/javascript" src="{{ public_path('assets/js/site/pagseguro.js') }}"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                setSessionId($('#session_id').val())

                $('#form-payment').submit(function(){
                    event.preventDefault()

                    let form = this

                    getSenderHash(function(response){
                        if(response.status == 'error') {
                            console.log(response.message);
                            return false;
                        }

                        $('#sender_hash').val(response.senderHash);

                        $.ajax({
                            url: form.action,
                            method: form.method,
                            data: $(form).serialize(),
                            //dataType: 'json',
                            processData: false,
                            beforeSend: function(){
                                showLoad()
                            },
                            success: function(response){
                                console.log(response)
                            },
                            complete: function(){
                                hideLoad()
                            }
                        })
                    })
                })
            })
        </script>
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