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
            <h1>Pedido #{{ $requestmodel->id }}</h1><hr />

            @if($requestmodel->status != 'CA')
            <div class="status-request">
                <div class="status-body">
                    <div class="status-circle checked">
                        <i class="fa fa-clipboard"></i>
                    </div>

                    <p>Pedido Realizado</p>
                    <p>{{ $requestmodel->createdAtFormat }}</p>
                </div>

                <div class="status-body">
                    <div class="status-circle {{ ($requestmodel->status == 'PA' || $requestmodel->status == 'EN' || $requestmodel->status == 'CO' ? 'checked' : null) }}">
                        <i class="fa fa-money"></i>
                    </div>

                    <p>Pagamento Confirmado</p>
                </div>

                <div class="status-body">
                    <div class="status-circle {{ ($requestmodel->status == 'EN' || $requestmodel->status == 'CO' ? 'checked' : null) }}">
                        <i class="fa fa-truck"></i>
                    </div>

                    <p>Pedido Enviado Para Entrega</p>
                </div>

                <div class="status-body">
                    <div class="status-circle {{ ($requestmodel->status == 'CO' ? 'checked' : null) }}">
                        <i class="fa fa-check"></i>
                    </div>

                    <p>Previsão de Entrega</p>
                    <p>Entrega dentro de {{ $requestmodel->payment->shipping_days }} dia(s)</p>
                </div>
            </div>
            @else
            <div style="margin-bottom: 40px;">
                <span class="alert alert-danger p-1 m-0"><small>Pedido {{ $requestmodel->statusFormat }}</small></span>
            </div>
            @endif

            <div class="row">
                <div class="col-md-6">
                    <div class="card-simple">
                        <div class="card-header"><strong>Frete</strong></div>
                        <div class="card-body">
                            <p class="p-0 m-0"><strong>Tipo: </strong>{{ $requestmodel->payment->shippingTypeFormat }}</p>
                            <p class="p-0 m-0"><strong>Valor: </strong>R$ {{ number_format($requestmodel->payment->shipping_value, 2, ',', '.') }}</p>
                            <p class="p-0 m-0"><strong>Estimativa para à entrega: </strong>Dentro de {{ $requestmodel->payment->shipping_days }} dia(s)</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card-simple">
                        <div class="card-header"><strong>Endereço de Entrega</strong></div>
                        <div class="card-body">
                            <p class="p-0 m-0"><strong>CEP: </strong>{{ mask($requestmodel->address->postal_code, '#####-###') }}</p>
                            <p class="p-0 m-0"><strong>Rua: </strong>{{ $requestmodel->address->street }}</p>
                            <p class="p-0 m-0"><strong>Número: </strong>{{ $requestmodel->address->number }}</p>
                            <p class="p-0 m-0"><strong>Bairro: </strong>{{ $requestmodel->address->district }}</p>
                            <p class="p-0 m-0"><strong>Cidade: </strong>{{ $requestmodel->address->city }}</p>
                            <p class="p-0 m-0"><strong>Estado: </strong>{{ $requestmodel->address->state }}</p>
                            <p class="p-0 m-0"><strong>Complemento: </strong>{{ $requestmodel->address->complement }}</p>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table table-hover" style="margin-top: 40px;">
                <thead>
                    <tr>
                        <th>Imagem</th>
                        <th>Nome</th>
                        <th>Tamanho e Cor</th>
                        <th>Preço(R$)</th>
                        <th>Quantidade</th>
                        <th>Subtotal(R$)</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($requestmodel->products as $product)
                    <tr>
                        <td><img src="{{ url('storage/app/public/' . $product->size->color->images->first()->source) }}" title="{{ $product->size->color->product->name }}" alt="{{ $product->size->color->product->name }}"></td>
                        @if($product->size->color->product->visible)
                        <td style="max-width: 200px;"><a href="{{ route('site.products.show', ['slug' => $product->size->color->product->slug]) }}" title="Página do produto: {{ $product->size->color->product->name }}" target="_blank">{{ $product->size->color->product->name }} <i class="fa fa-external-link"></i></a></td>
                        @else
                        <td>{{ $product->size->color->product->name }}</td>
                        @endif
                        <td>Tamanho: {{ $product->size->description }} | Cor: {{ $product->size->color->description }}</td>
                        <td>{{ number_format($product->price, 2, ',', '.') }}</td>
                        <td>{{ $product->quantity }}</td>
                        <td>{{ number_format($product->price * $product->quantity, 2, ',', '.') }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

            <div class="mb-4 text-end text-right">
                <p class="p-0 m-0 mt-4">(Desconto por Cupom) <strong>-R$ {{ number_format($requestmodel->payment->discount_coupon, 2, ',', '.') }}</strong></p>
                @if($requestmodel->payment->status_type != 'AP')
                    @if($requestmodel->payment->installments == 1)
                    <p class="p-0 m-0">(Desconto Pagamento à Vista) <strong>-R$ {{ number_format($requestmodel->payment->discount_installment, 2, ',', '.') }}</strong></p>
                    @else
                    <p class="p-0 m-0">(Desconto por Selecionar {{ $requestmodel->payment->installments }} Parcelas) <strong>-R$ {{ number_format($requestmodel->payment->discount_installment, 2, ',', '.') }}</strong></p>
                    @endif
                @endif
                <p class="p-0 m-0">(Desconto do Carrinho) <strong>-R$ {{ number_format($requestmodel->payment->discount_cart, 2, ',', '.') }}</strong></p>
                <p class="p-0 m-0">(Valor do Frete) <strong>+R$ {{ number_format($requestmodel->payment->shipping_value, 2, ',', '.') }}</strong></p>
                <h2 class="mt-2">Total: R$ {{ number_format($requestmodel->payment->amount - $requestmodel->payment->discount_cart - $requestmodel->payment->discount_installment - $requestmodel->payment->discount_coupon + $requestmodel->payment->shipping_value, 2, ',', '.') }}</h2>
            </div>

            @if($requestmodel->status == 'AP' && empty($requestmodel->payment->method))
            <h2 style="margin-top: 20px;">Pagamento</h2><hr />

            <div class="cards">
                @if(config('store.payment.checkouts.transparent'))
                    @if(config('store.payment.methods.credit_card'))
                        @include('includes.components.card', ['title' => 'Cartão de Crédito', 'link' => route('site.requests.show.credit_card', ['id' => $requestmodel->id]), 'class' => 'text-danger', 'amount' => 'Cartão de Crédito', 'icon' => 'fa fa-credit-card'])
                    @endif

                    @if(config('store.payment.methods.debit_card'))
                        @include('includes.components.card', ['title' => 'Cartão de Débito', 'link' => route('site.requests.show.debit_card', ['id' => $requestmodel->id]), 'class' => 'text-info', 'amount' => 'Cartão de Débito', 'icon' => 'fa fa-credit-card'])
                    @endif

                    @if(config('store.payment.methods.bolet') && !config('store.payment.types.paypal'))
                        @include('includes.components.card', ['title' => 'Boleto', 'link' => route('site.requests.show.bolet', ['id' => $requestmodel->id]), 'class' => 'text-black', 'amount' => 'Boleto', 'icon' => 'fa fa-barcode'])
                    @endif
                    
                    @if(config('store.payment.methods.debit_online'))
                        @include('includes.components.card', ['title' => 'Débito Online', 'link' => route('site.requests.show.debit_online', ['id' => $requestmodel->id]), 'class' => 'text-warning', 'amount' => 'Débito Online', 'icon' => 'fa fa-bank'])
                    @endif
                @else
                    @include('includes.components.card', ['title' => 'Pagar Pedido', 'link' => '', 'class' => 'text-black', 'amount' => 'Pagar Pedido', 'icon' => 'fa fa-money'])
                @endif
        
                @if(config('store.payment.methods.pix'))
                    @include('includes.components.card', ['title' => 'PIX', 'link' => route('site.requests.show.pix', ['id' => $requestmodel->id]), 'class' => 'text-success', 'amount' => 'PIX', 'icon' => 'fa fa-qrcode'])
                @endif
                
                @if(config('store.payment.methods.paypal'))
                    @include('includes.components.card', ['title' => 'PayPal', 'link' => route('site.requests.show.paypal', ['id' => $requestmodel->id]), 'class' => 'text-primary', 'amount' => 'PayPal', 'icon' => 'fa fa-paypal'])
                @endif
            </div>
            @endif
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection