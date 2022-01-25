@extends('templates.panel')

@section('title', 'Editar Pedido')

@section('container')
<div class="container-main">
	<h1>Pedido #{{ $requestmodel->id }}</h1><hr />

	@include('includes.panel.requests.form', ['action' => route('panel.requests.update', ['id' => $requestmodel->id]), 'method' => 'PUT'])

	<div class="card my-4">
		<div class="card-header p-3"><strong>Produtos</strong></div>
		<div class="card-body">

			<table class="table table-hover">
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
						<td><img src="{{ url('storage/app/public/' . $product->product->colors->first()->images->first()->source, config('ftp.active')) }}" title="{{ $product->product->name }}" alt="{{ $product->product->name }}"></td>
						@if($product->product->visible)
						<td style="max-width: 200px;"><a href="{{ route('site.products.show', ['slug' => $product->product->slug]) }}" title="Página do produto: {{ $product->product->name }}" target="_blank">{{ $product->product->name }} <i class="fas fa-external-link-alt"></i></a></td>
						@else
						<td>{{ $product->product->name }}</td>
						@endif
						<td>COR: {{ $product->color }} | TAMANHO: {{ $product->size }}</td>
						<td>{{ number_format((float)$product->price, 2, ',', '.') }}</td>
						<td>{{ $product->quantity }}</td>
						<td>{{ number_format((float)$product->price * $product->quantity, 2, ',', '.') }}</td>
					</tr>
					@endforeach
				</tbody>
			</table>

			<div class="mb-4 text-end">
				<p class="p-0 m-0 mt-4">(Desconto por Cupom) <strong>-R$ {{ number_format((float)$requestmodel->payment->discount_coupon, 2, ',', '.') }}</strong></p>
				@if($requestmodel->payment->status_type != 'AP')
					@if($requestmodel->payment->installments == 1)
					<p class="p-0 m-0">(Desconto Pagamento à Vista) <strong>-R$ {{ number_format((float)$requestmodel->payment->discount_installment, 2, ',', '.') }}</strong></p>
					@else
					<p class="p-0 m-0">(Desconto por Selecionar {{ $requestmodel->payment->installments }} Parcelas) <strong>-R$ {{ number_format((float)$requestmodel->payment->discount_installment, 2, ',', '.') }}</strong></p>
					@endif
				@endif
				<p class="p-0 m-0">(Desconto do Carrinho) <strong>-R$ {{ number_format((float)$requestmodel->payment->discount_cart, 2, ',', '.') }}</strong></p>
				<p class="p-0 m-0">(Valor do Frete) <strong>+R$ {{ number_format((float)$requestmodel->payment->shipping_value, 2, ',', '.') }}</strong></p>
				<h2 class="mt-2">Total: R$ {{ number_format((float)$requestmodel->payment->amountFormat, 2, ',', '.') }}</h2>
			</div>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Cliente</strong></div>
		<div class="card-body">

			<p><a href="{{ route('panel.clients.show', ['id' => $requestmodel->client->id]) }}" title="Saber mais sobre o cliente: {{ $requestmodel->client->name }}" target="_blank"><strong>{{ $requestmodel->client->name }} <i class="fas fa-external-link-alt"></i></strong></a></p>

			<p class="p-0 m-0"><strong>CPF: </strong>{{ mask($requestmodel->client->cpf, '###.###.###-##') }}</p>
			<p class="p-0 m-0"><strong>CNPJ: </strong>{{ mask($requestmodel->client->cnpj, '##.###.###/####-##') }}</p>
			<p class="p-0 m-0"><strong>E-Mail: </strong>{{ $requestmodel->client->email }}</p>
			<p class="p-0 m-0"><strong>Celular: </strong>{{ mask($requestmodel->client->cell, '(##)#####-####') }}</p>
			<p class="p-0 m-0"><strong>Telefone: </strong>{{ mask($requestmodel->client->telephone, '(##)####-####') }}</p>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Endereço de Entrega</strong></div>
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

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Pagamento</strong></div>
		<div class="card-body">
			@if($requestmodel->payment->status_type == 'AP' || $requestmodel->payment->status_type == 'EA')
			<span class="alert alert-info p-2 m-0"><small>{{ $requestmodel->payment->statusTypeFormat }}</small></span>
			@elseif($requestmodel->payment->status_type == 'ED')
			<span class="alert alert-warning p-2 m-0"><small>{{ $requestmodel->payment->statusTypeFormat }}</small></span>
			@elseif($requestmodel->payment->status_type == 'PA' || $requestmodel->payment->status_type == 'DI')
			<span class="alert alert-success p-2 m-0"><small>{{ $requestmodel->payment->statusTypeFormat }}</small></span>
			@else
			<span class="alert alert-danger p-2 m-0"><small>{{ $requestmodel->payment->statusTypeFormat }}</small></span>
			@endif

			<p class="p-0 m-0 mt-4"><strong>Código da Transação: </strong>{{ $requestmodel->payment->code }}</p>
			<p class="p-0 m-0"><strong>Transação efetuada pelo: </strong>{{ $requestmodel->payment->typeFormat }}</p>
			<p class="p-0 m-0"><strong>Método de Pagamento: </strong>{{ $requestmodel->payment->methodFormat }}</p>
			<p class="p-0 m-0"><strong>Status do Pagamento: </strong>{{ $requestmodel->payment->statusTypeFormat }}</p>
		</div>
	</div>

	@if($requestmodel->payment->method == 'CC' ||  $requestmodel->payment->method == 'CD')
	<div class="card mb-4">
		<div class="card-header p-3"><strong>Partelas e Juros</strong></div>
		<div class="card-body">
			<p class="p-0 m-0"><strong>Número de Parcelas: </strong>{{ $requestmodel->payment->installments }}</p>
			<p class="p-0 m-0"><strong>Número de Parcelas sem Juros: </strong>{{ $requestmodel->payment->installment_no_interest }}</p>
		</div>
	</div>
	@endif

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Descontos Aplicados</strong></div>
		<div class="card-body">
			<p class="p-0 m-0"><strong>Desconto por Cupom: </strong>-R$ {{ number_format((float)$requestmodel->payment->discount_coupon, 2, ',', '.') }}</p>
			@if($requestmodel->payment->status_type != 'AP')
				@if($requestmodel->payment->installments == 1)
				<p class="p-0 m-0"><strong>Desconto por pagamento à vista: </strong>-R$ {{ number_format((float)$requestmodel->payment->discount_installment, 2, ',', '.') }}</p>
				@else
				<p class="p-0 m-0"><strong>Desconto por Selecionar {{ $requestmodel->payment->installments }} Parcelas: </strong>-R$ {{ number_format((float)$requestmodel->payment->discount_installment, 2, ',', '.') }}</p>
				@endif
			@endif
			<p class="p-0 m-0"><strong>Desconto do Carrinho: </strong>-R$ {{ number_format((float)$requestmodel->payment->discount_cart, 2, ',', '.') }}</p>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Frete</strong></div>
		<div class="card-body">
			<p class="p-0 m-0"><strong>Tipo: </strong>{{ $requestmodel->payment->shippingTypeFormat }}</p>
			<p class="p-0 m-0"><strong>Valor: </strong>R$ {{ number_format((float)$requestmodel->payment->shipping_value, 2, ',', '.') }}</p>
			<p class="p-0 m-0"><strong>Estimativa para à entrega: </strong>Dentro de {{ $requestmodel->payment->shipping_days }} dia(s)</p>
		</div>
	</div>
</div>
@endsection