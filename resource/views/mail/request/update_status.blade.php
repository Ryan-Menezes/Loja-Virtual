<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }} | Seu pedido teve seu status atualizado: {{ $requestmodel->statusFormat }}</title>
</head>
<body>
    <h2 style="margin-bottom: 20px;">Pedido #{{ $requestmodel->id }}</h2>

    <section style="margin-bottom: 40px;">
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px;">
            <p style="font-size: 20px;">Status atualizado para: <strong>{{ $requestmodel->statusFormat }}</strong></p>

            <h3 style="margin-bottom: 10px; margin-top: 30px;">Produtos</h3><hr />
            <table style="margin-top: 40px; border-collapse: collapse; border: 1px solid black; width: 100%;">
                <thead>
                    <tr>
                        <th style="padding: 10px; border: 1px solid black;">Nome</th>
                        <th style="padding: 10px; border: 1px solid black;">Tamanho e Cor</th>
                        <th style="padding: 10px; border: 1px solid black;">Preço(R$)</th>
                        <th style="padding: 10px; border: 1px solid black;">Quantidade</th>
                        <th style="padding: 10px; border: 1px solid black;">Subtotal(R$)</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($requestmodel->products as $product)
                    <tr>
                        @if($product->product->visible)
                        <td style="max-width: 200px; padding: 10px; border: 1px solid black;"><a href="{{ route('site.products.show', ['slug' => $product->product->slug]) }}" title="Página do produto: {{ $product->product->name }}" target="_blank">{{ $product->product->name }} <i class="fa fa-external-link"></i></a></td>
                        @else
                        <td style="padding: 10px; border: 1px solid black;">{{ $product->product->name }}</td>
                        @endif
                        <td style="padding: 10px; border: 1px solid black;">COR: {{ $product->color }} | TAMANHO: {{ $product->size }}</td>
                        <td style="padding: 10px; border: 1px solid black;">{{ number_format($product->price, 2, ',', '.') }}</td>
                        <td style="padding: 10px; border: 1px solid black;">{{ $product->quantity }}</td>
                        <td style="padding: 10px; border: 1px solid black;">{{ number_format($product->price * $product->quantity, 2, ',', '.') }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

            <h3 style="margin-bottom: 10px; margin-top: 30px;">Frete</h3><hr />
            <p><strong>Tipo: </strong>{{ $requestmodel->payment->shippingTypeFormat }}</p>
            <p><strong>Valor: </strong>R$ {{ number_format($requestmodel->payment->shipping_value, 2, ',', '.') }}</p>
            <p><strong>Estimativa para à entrega: </strong>Dentro de {{ $requestmodel->payment->shipping_days }} dia(s) após o pagamento</p>

            <h3 style="margin-bottom: 10px; margin-top: 30px;">Endereço de Entrega</h3><hr />
            <p><strong>CEP: </strong>{{ mask($requestmodel->address->postal_code, '#####-###') }}</p>
            <p><strong>Rua: </strong>{{ $requestmodel->address->street }}</p>
            <p><strong>Número: </strong>{{ $requestmodel->address->number }}</p>
            <p><strong>Bairro: </strong>{{ $requestmodel->address->district }}</p>
            <p><strong>Cidade: </strong>{{ $requestmodel->address->city }}</p>
            <p><strong>Estado: </strong>{{ $requestmodel->address->state }}</p>
            <p><strong>Complemento: </strong>{{ $requestmodel->address->complement }}</p>
        </div>
    </section>

    <a href="{{ route('site.myaccount.requests.show', ['id' => $requestmodel->id]) }}" title="Ver Pedido" style="padding: 15px; border: none; text-decoration: none; background-color: #D17D21; border-radius: 50px; color: white;">Ver Pedido</a>
</body>
</html>