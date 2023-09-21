@extends('templates.site')

@section('title', 'Pagamento por transferência bancária para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.bolet', ['id' => $requestmodel->id]))

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            @if($discount_percent > 0)
            <div class="alert alert-success"><strong>Ao efetuar o pagamento por transferência bancária, você terá {{ number_format($discount_percent, 2, ',', '.') }}% de desconto na compra</strong></div>
            @endif

            <h1 style="margin-top: 20px;">Pagamento por transferência bancária</h1><hr />
            <p>Ao clicar no botão abaixo você dará início ao pagamento por transferência bancária:</p>

            <div class="alert alert-danger" id="message-request" style="display: none;"></div>

            <form action="{{ route('site.myaccount.requests.show.bank_transfer.store', ['id' => $requestmodel->id]) }}" method="POST" id="form-payment">
                <button type="submit" title="Iniciar transferência bancária" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="margin: 30px 0px; padding: 15px; width: 100%;"><strong>Iniciar transferência bancária R$ {{ number_format($requestmodel->payment->amountFormat - ($requestmodel->payment->amountFormat * ($discount_percent / 100)), 2, ',', '.') }}</strong></button>
            </form>

            <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
            @include('includes.site.requests.body')
        </div>
    </div>
</section>
@endsection

@section('scripts')
<script type="text/javascript">
    $(document).ready(function(){
        $('#form-payment').submit(function(){
            event.preventDefault();

            let form = this;

            $.ajax({
                url: form.action,
                method: form.method,
                data: $(form).serialize(),
                dataType: 'json',
                processData: false,
                beforeSend: function(){
                    showLoad('Validando dados, aguarde...');
                },
                success: function(response){
                    if(response.result){
                        $('.cont-content').html('<h2>Pagamento por transferência bancária</h2>');
                        $('.cont-content').append('<p>Você selecionou o pagamento por transferência bancária, para que seu pedido seja confirmado para entrega, efetue o pagamento, para mais informações clique no botão abaixo:</p>');
                        $('.cont-content').append(`<a href="${response.paymentLink}" target="_blank" title="Mais informações sobre à transferência bancária" class="btn btn-success" style="margin-top: 20px;">Mais informações sobre à transferência bancária <i class="fa fa-external-link"></i></a>`);
                    }else{
                        $('#message-request').text(response.message).show();
                    }
                },
                error: function(response){
                    $('#message-request').text('OCORREU UM ERRO AO TENTAR GERAR O SEU BOLETO, FAVOR TENTAR NOVAMENTE!').show();
                },
                complete: function(){
                    hideLoad();
                }
            });
        });
    });
</script>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection