@extends('templates.site')

@section('title', 'Pagamento por cartão de crédito para o pedido #' . $requestmodel->id)
@section('url', route('site.myaccount.requests.show.credit_card', ['id' => $requestmodel->id]))

@if(isset($session_id) && !empty($session_id))
    @section('container')
    <section class="container">
        <div class="content">
            @include('includes.site.account.menu')
            <div class="cont-content">
                <h1 style="margin-top: 20px;">Pagamento por cartão de crédito</h1><hr />
                <p style="margin-bottom: 40px;">Informe os dados de seu cartão de crédito para finalizar o pagamento e enviarmos seu pedido para entrega:</p>

                <div class="alert alert-danger" id="message-request" style="display: none;"></div>

                <form action="{{ route('site.myaccount.requests.show.credit_card.store', ['id' => $requestmodel->id]) }}" method="POST" id="form-payment" style="margin-top: 20px;" class="form-validate">
                    <input type="hidden" name="session_id" id="session_id" value="{{ $session_id }}">
                    <input type="hidden" name="credit_card_token" id="credit_card_token">
                    <input type="hidden" name="sender_hash" id="sender_hash">
                    <input type="hidden" name="brand" id="brand">

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
                        <div class="col-md-12" style="margin-bottom: 20px;">
                            @include('includes.components.form.input', [
                                'type' => 'text', 
                                'name' => 'document', 
                                'title' => 'Documento do dono do cartão', 
                                'class' => 'required cpf-mask col-md-6',
                                'required' => true
                            ])
                        </div>
                        <div class="col-md-6">
                            @include('includes.components.form.input', [
                                'type' => 'date', 
                                'name' => 'birth', 
                                'title' => 'Nascimento do dono do cartão', 
                                'value' => (isset($card) ? $card->birth : null),
                                'class' => 'required',
                                'required' => true
                            ])
                        </div>
                        <div class="col-md-6">
                            @include('includes.components.form.input', [
                                'type' => 'text', 
                                'name' => 'telephone', 
                                'title' => 'Telefone do dono do cartão', 
                                'value' => (isset($card) ? $card->telephone : null),
                                'class' => 'required phone-mask',
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
        @if(config('store.payment.production'))
        <script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>
        @else
        <script type="text/javascript" src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>
        @endif

        <script type="text/javascript" src="{{ public_path('assets/js/site/pagseguro.js') }}"></script>

        <script type="text/javascript">
            const amount = Number({{ $requestmodel->payment->amountFormat }});
            const installments_discounts = {
                @foreach($installments_discounts as $key => $value)
                {{ $key }}: {{ $value }},
                @endforeach
            };

            $(document).ready(function(){
                setSessionId($('#session_id').val());

                /* Pega a bandeira do cartão */
                $('.number_card').keyup(function(){
                    $('#brand').val('');
                    $('.brand-card').empty();
                    $('.installments_card').empty();
                    $('#message-request').empty().hide();

                    let number = $(this).val().replace(/\D/ig, '');

                    getBrand(number, function(response){
                        $('#brand').val(response.brand.name);
                        $('.brand-card').html(`<img src="https://stc.pagseguro.uol.com.br/public/img/payment-methods-flags/42x20/${response.brand.name}.png" alt="${response.brand.name}" title="${response.brand.name}" />`);

                        const brand = response.brand.name;

                        /* Buscar pelas parcelas disponíveis */
                        getInstallments(amount, {{ $installment_no_interest }}, brand, function(response){
                            if(response.error){
                                $('#message-request').text('OCORREU UM ERRO AO TENTAR CARREGAR AS PARCELAS DESTE CARTÃO, POR FAVOR INFORME O NÚMERO DO CARTÃO NOVAMENTE!').show();
                                return;
                            }
                            
                            $.each(response.installments[brand], function(index, value){
                                $('.installments_card').append(optionInstallment(index + 1, value.quantity, value.totalAmount, value.installmentAmount, value.interestFree));
                            });

                            replaceInstallments(brand);
                        },
                        function(response){
                            $('#message-request').text('OCORREU UM ERRO AO TENTAR CARREGAR AS PARCELAS DESTE CARTÃO, POR FAVOR INFORME O NÚMERO DO CARTÃO NOVAMENTE!').show();
                        });
                    },
                    function(response){
                        $('#message-request').text('O CARTÃO INFORMADO É INVÁLIDO!').show();
                    });
                });

                /* Gera o hash do sender e executa a criação do link de pagamento */
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
                    const birth           = $(form).find('input[name=birth]').val();
                    const telephone       = $(form).find('input[name=telephone]').val().replace(/\D/ig, '');
                    const installments    = $(form).find('select[name=installments]').val();

                    if(brand && name && number.length >= 15 && cvv.length >= 3 && month && year && document.length >= 11 && birth.length == 10 && telephone.length >= 10 && installments){
                        getCardToken(number, brand, cvv, month, '20' + year, function(response){
                            $('#credit_card_token').val(response.card.token);

                            getSenderHash(function(response){
                                if(response.status == 'error') {
                                    $('#message-request').text('NÃO FOI POSSÍVEL EXECUTAR O PAGAMENTO, POR FAVOR VERIFIQUE SE OS DADOS DO CARTÃO ESTÃO CORRETOS!').show();
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
                                        showLoad('Validando Pagamento, aguarde...');
                                    },
                                    success: function(response){
                                        if(response.result){
                                            $('.cont-content').html('<h2>Os dados do cartão foram enviados com sucesso!</h2>');
                                            $('.cont-content').append('<p>Estamos analisando o seu pagamento, caso esteja tudo correto vamos confirmar o seu pagamento e liberar seu pedido para entrega.</p>');
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
                                })
                            })
                        },
                        function(response){
                            $('#message-request').text('NÃO FOI POSSÍVEL EXECUTAR O PAGAMENTO, POR FAVOR TENTE EXECUTAR O FORMULÁRIO NOVAMENTE!').show();
                        });
                    }else{
                        $('#message-request').text('PREENCHA TODOS OS CAMPOS CORRETAMENTE!').show();
                    }
                });
            });

            function optionInstallment(installment, quantity, totalAmount, installmentAmount, interestFree, discount = 0){
                return `<option value="${quantity}x${installmentAmount}" id="installment_${installment}">${quantity} ${quantity > 1 ? 'parcelas' : 'parcela'} de ${installmentAmount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })} = ${totalAmount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}${discount ? (' com ' + (String(discount).replace('.', ',')) + '% desconto') : ''} - ${interestFree ? 'Sem' : 'Com'} Juros</option>`;
            }

            async function replaceInstallments(brand){
                /* Substituindo parcelas com desconto */
                for(let installment in installments_discounts){
                    const discount = installments_discounts[installment];

                    if(discount){
                        const value = await new Promise((resolve, reject) => {
                            getInstallments(amount - (amount * (discount  / 100)), {{ $installment_no_interest }}, brand, function(response){
                                if(response.error){
                                    reject('Erro');
                                }
                                
                                resolve(response.installments[brand][installment - 1]);
                            });
                        });

                        await $(`option#installment_${installment}`)
                                    .replaceWith(optionInstallment(installment, value.quantity, value.totalAmount, value.installmentAmount, value.interestFree, discount));
                    }
                }
            }
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