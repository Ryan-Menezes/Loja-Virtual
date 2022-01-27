@extends('templates.site')

@section('title', 'Pagamento por débito online para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.debit_online', ['id' => $requestmodel->id]))
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
                <h1 style="margin-top: 20px;">Pagamento por débito online</h1><hr />
                <p>Ao clicar no botão abaixo você irá gerar o link de pagamento para o banco selecionado:</p>

                <div class="alert alert-danger" id="message-request" style="display: none;"></div>

                <form action="{{ route('site.myaccount.requests.show.debit_online.store', ['id' => $requestmodel->id]) }}" method="POST" id="form-payment" style="margin-top: 20px;">
                    <input type="hidden" name="session_id" id="session_id" value="{{ $session_id }}">
                    <input type="hidden" name="sender_hash" id="sender_hash">

                    <label>Selecione o banco que executará o pagamento por débito online:</label>
                    <select name="bank" class="form-control" id="banks"></select>

                    <button type="submit" title="Gerar link de pagamento" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="margin: 30px 0px; padding: 15px;">Gerar link de pagamento para o valor: R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}</button>
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

                // Busca os bancos aceitos pelo pagamento por débito online
                getPaymentMethods({{ $requestmodel->payment->amountFormat }}, function(response){
                    if(response.error){
                        $('#message-request').text('OCORREU UM ERRO AO TENTAR CARREGAR OS BANCOS DISPONÍVEIS, POR FAVOR RECARREGUE A PÁGINA!').show()
                        return
                    }
                    
                    $.each(response.paymentMethods.ONLINE_DEBIT.options, function(index, value){
                        $('#banks').append(`<option value="${value.name}">${value.displayName}</option>`)
                    })
                },
                function(response){
                    $('#message-request').text('OCORREU UM ERRO AO TENTAR CARREGAR OS BANCOS DISPONÍVEIS, POR FAVOR RECARREGUE A PÁGINA!').show()
                })

                // Gera o hash do sender e executa a criação do link de pagamento
                $('#form-payment').submit(function(){
                    event.preventDefault()

                    let form = this

                    getSenderHash(function(response){
                        if(response.status == 'error') {
                            $('#message-request').text('OCORREU UM ERRO AO TENTAR GERAR O LINK DE PAGAMENTO, FAVOR TENTAR NOVAMENTE!').show()
                            return false;
                        }

                        $('#sender_hash').val(response.senderHash);

                        $.ajax({
                            url: form.action,
                            method: form.method,
                            data: $(form).serialize(),
                            dataType: 'json',
                            processData: false,
                            beforeSend: function(){
                                showLoad('Gerando link de pagamento, aguarde...')
                            },
                            success: function(response){
                                if(response.result){
                                    $('.cont-content').html('<h2>Link de Pagamento Gerado com Sucesso!</h2>')
                                    $('.cont-content').append('<p>Para finalmente finalizar a sua compra, efetue o seu pagamento por débito online pelo link abaixo:</p>')
                                    $('.cont-content').append(`<a href="${response.data.paymentLink}" target="_blank" title="Finalizar Pagamento Por Débito Online" class="btn btn-success" style="margin-top: 20px;">Finalizar Pagamento Por Débito Online <i class="fa fa-external-link"></i></a>`)
                                }else{
                                    $('#message-request').text('OCORREU UM ERRO AO TENTAR GERAR O LINK DE PAGAMENTO, FAVOR TENTAR NOVAMENTE!').show()
                                }
                            },
                            error: function(response){
                                $('#message-request').text('OCORREU UM ERRO AO TENTAR GERAR O LINK DE PAGAMENTO, FAVOR TENTAR NOVAMENTE!').show()
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