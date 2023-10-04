@extends('templates.site')

@section('title', 'Pagamento por cartão de crédito para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.credit_card', ['id' => $requestmodel->id]))

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <h1 style="margin-top: 20px;">Pagamento por cartão de crédito</h1><hr />
            <p style="margin-bottom: 40px;">Informe os dados de seu cartão de crédito para finalizar o pagamento e enviarmos seu pedido para entrega:</p>

            <div class="alert alert-danger" id="message-request" style="display: none;"></div>

            <form action="{{ route('site.myaccount.requests.show.credit_card.store', ['id' => $requestmodel->id]) }}" method="POST" id="form-payment" style="margin-top: 20px;" class="form-validate">
                <input type="hidden" name="credit_card_token" id="credit_card_token">
                <input type="hidden" name="brand" id="brand">
                <input type="hidden" name="issuer" id="issuer">

                <div class="row">
                    <div class="col-md-6">
                        @include('includes.components.form.input', [
                            'type' => 'text', 
                            'name' => 'name', 
                            'title' => 'Nome', 
                            'class' => 'required',
                            'required' => true
                        ])
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label"><strong>Número:</strong></label>
                            <div class="input-group">
                                <input type="text" name="number" class="form-control required credit-number-mask number_card" placeholder="Número" required />
                                <span class="input-group-addon brand-card"></span>
                            </div>
                        </div>
                    </div>
                </div>

                @include('includes.components.form.input', [
                    'type' => 'text', 
                    'name' => 'cvv', 
                    'title' => 'CVV', 
                    'class' => 'required cvv-mask',
                    'required' => true
                ])

                <div class="row">
                    <div class="col-md-6">
                        @include('includes.components.form.select', [
                            'name' => 'month', 
                            'title' => 'Mês de Validade',
                            'options' => array_combine(range(1, 12), range(1, 12)),
                            'required' => true
                        ])
                    </div>
                    <div class="col-md-6">
                        @include('includes.components.form.select', [
                            'name' => 'year', 
                            'title' => 'Ano de Validade', 
                            'options' => array_combine(range(date('y'), date('y') + 50), range(date('Y'), date('Y') + 50)),
                            'class' => 'required',
                            'required' => true
                        ])
                    </div>
                </div>

                @include('includes.components.form.select', [
                    'name' => 'installments', 
                    'title' => 'Parcelas',
                    'options' => [],
                    'class' => 'required installments_card',
                    'required' => true
                ])

                <br /><h3>Dados do dono do cartão</h3><hr />

                <div class="row">
                    <div class="col-md-6" style="margin-bottom: 20px;">
                        @include('includes.components.form.select', [
                            'name' => 'type_document', 
                            'title' => 'Tipo do Documento', 
                            'options' => [],
                            'class' => 'required col-md-5 document_type',
                            'required' => true
                        ])
                    </div>         
                    <div class="col-md-6" style="margin-bottom: 20px;">
                        @include('includes.components.form.input', [
                            'type' => 'text', 
                            'name' => 'document', 
                            'title' => 'Documento do dono do cartão', 
                            'class' => 'required cpf-mask col-md-6 document_number',
                            'required' => true
                        ])
                    </div>
                </div>

                <br>
                <button type="submit" title="Efetuar Pagamento do Pedido" class="btn btn-success btn-payment" target="_blank" data-linkdisable="true" style="margin: 30px 0px; padding: 15px; width: 100%;"><strong>Efetuar Pagamento R$ {{ number_format($requestmodel->payment->amountFormat, 2, ',', '.') }}</strong></button>
            </form>

            <h2 style="margin-top: 40px;">Pedido #{{ $requestmodel->id }}</h2><hr />
            @include('includes.site.requests.body')
        </div>
    </div>
</section>
@endsection

@section('scripts')
<script src="https://sdk.mercadopago.com/js/v2"></script>
<script type="text/javascript" src="{{ public_path('assets/js/site/mercadopago.js') }}"></script>

<script type="text/javascript">
    const amount = Number({{ $requestmodel->payment->amountFormat }});

    $(document).ready(function(){
        setPublicKey("{{ config('store.payment.credentials.mercadopago.public_key') }}");

        const documents = getIdentificationTypes();

        if(documents){
            $('.document_type').empty();

            documents
                .then((response) => {
                    response.forEach((value) => {
                        $('.document_type').append(`<option value="${value.id}">${value.name}</option>`);
                    });
                });
        }

        $('.document_type').change(function(){
            const document = $(this).val();

            $('.document_number')
                .removeClass('cpf-mask')
                .removeClass('cnpj-mask');

            $('.document_number').val('');

            if(document == 'CPF'){
                $('.document_number').addClass('cpf-mask');
            }else if(document == 'CNPJ'){
                $('.document_number').addClass('cnpj-mask');
            }
        });

        $('.number_card').keyup(function(){
            $('#brand').val('');
            $('.brand-card').empty();
            $('.installments_card').empty();
            $('#message-request').empty().hide();

            const number = $(this).val().replace(/\D/ig, '');

            if(number.length >= 6){
                const paymentMethods = getPaymentMethods(number);

                if(paymentMethods){
                    paymentMethods
                        .then((response) => {
                            response = response.results[0];

                            $('#brand').val(response.id);
                            $('#issuer').val(response.issuer.id);
                            $('.brand-card').html(`<img src="${response.secure_thumbnail}" alt="${response.issuer.name}" title="${response.issuer.name}" />`);

                            const installments = getInstallments(amount, number);

                            if(installments){
                                installments
                                    .then((response) => {
                                        response.forEach((value) => {
                                            if(value.payment_method_id == $('#brand').val()){
                                                value.payer_costs.forEach((value) => {
                                                    $('.installments_card').append(optionInstallment(value.installments, value.total_amount, value.installment_amount, !Boolean(value.installment_rate)));
                                                });
                                            }
                                        });
                                    })
                                    .catch((error) => {
                                        $('#message-request').text('OCORREU UM ERRO AO TENTAR CARREGAR AS PARCELAS DESTE CARTÃO, POR FAVOR INFORME O NÚMERO DO CARTÃO NOVAMENTE!').show();
                                    });
                            }
                        })
                        .catch((error) => {
                            $('#message-request').text('O CARTÃO INFORMADO É INVÁLIDO!').show();
                        });
                }else{
                    $('#message-request').text('O CARTÃO INFORMADO É INVÁLIDO!').show();
                }
            }
        });

        /* Gera o token do cartão e executa o pagamento */
        $('#form-payment').submit(function(){
            event.preventDefault();

            const form            = this;
            const brand           = $('#brand').val();
            const name            = $(form).find('input[name=name]').val();
            const number          = $(form).find('input[name=number]').val().replace(/\D/ig, '');
            const cvv             = $(form).find('input[name=cvv]').val();
            const month           = $(form).find('select[name=month]').val();
            const year            = $(form).find('select[name=year]').val();
            const document        = $(form).find('input[name=document]').val().replace(/\D/ig, '');
            const installments    = $(form).find('select[name=installments]').val();

            if(brand && name && number.length >= 15 && cvv.length >= 3 && month && year && document.length >= 11 && installments){
                const cardToken = getCardToken(number, name, cvv, month, year, $('.document_type').val(), document);

                if(cardToken){
                    cardToken
                        .then((response) => {
                            $('#credit_card_token').val(response.id);

                            $.ajax({
                                url: form.action,
                                method: form.method,
                                data: $(form).serialize(),
                                dataType: 'json',
                                processData: false,
                                beforeSend: function(){
                                    showLoad('Validando Pagamento, aguarde...');
                                },
                                success: function(response){
                                    if(response.result){
                                        $('.cont-content').html('<h2>Os dados do cartão foram enviados com sucesso!</h2>');
                                        $('.cont-content').append(`<p>${response.message}</p>`);
                                        $('.cont-content').append(`<a href="{{ route('site.myaccount.requests.show', ['id' => $requestmodel->id]) }}" title="Voltar Para o Pedido" class="btn btn-success" style="margin-top: 20px;">Voltar Para o Pedido</a>`);
                                    }else{
                                        $('#message-request').text(response.message).show();
                                    }
                                },
                                error: function(response){
                                    $('#message-request').text('NÃO FOI POSSÍVEL EXECUTAR O PAGAMENTO, POR FAVOR VERIFIQUE SE OS DADOS DO CARTÃO ESTÃO CORRETOS!').show();
                                },
                                complete: function(response){
                                    hideLoad();
                                }
                            });
                        })
                        .catch((error) => {
                            $('#message-request').text('NÃO FOI POSSÍVEL EXECUTAR O PAGAMENTO, POR FAVOR VERIFIQUE SE OS DADOS DO CARTÃO ESTÃO CORRETOS!').show();
                        });
                }else{
                    $('#message-request').text('NÃO FOI POSSÍVEL EXECUTAR O PAGAMENTO, POR FAVOR TENTE EXECUTAR O FORMULÁRIO NOVAMENTE!').show();
                }
            }else{
                $('#message-request').text('PREENCHA TODOS OS CAMPOS CORRETAMENTE!').show();
            }
        });
    });

    function optionInstallment(quantity, totalAmount, installmentAmount, interestFree, discount = 0){
        return `<option value="${quantity}">${quantity} ${quantity > 1 ? 'parcelas' : 'parcela'} de ${installmentAmount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })} = ${totalAmount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}${discount ? (' com ' + (String(discount).replace('.', ',')) + '% desconto') : ''} - ${interestFree ? 'Sem' : 'Com'} Juros</option>`;
    }
</script>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection