@extends('templates.panel')

@section('title', 'Cliente: ' . $client->name)

@section('container')
<section class="p-4">
	<div class="border mb-4 p-4 bg-white">
		<h2 class="mb-4">{{ $client->name }}</h2>

		<p class="p-0 m-0"><strong>CPF: </strong>{{ mask($client->cpf, '###.###.###-##') }}</p>
		<p class="p-0 m-0"><strong>CNPJ: </strong>{{ mask($client->cnpj, '##.###.###/####-##') }}</p>
		<p class="p-0 m-0"><strong>E-Mail: </strong>{{ $client->email }}</p>
		<p class="p-0 m-0"><strong>Celular: </strong>{{ $client->cell }}</p>
		<p class="p-0 m-0"><strong>Telefone: </strong>{{ $client->telephone }}</p>
	</div>

	<div class="border mb-4 p-4 bg-white">
		<h2>Endereços</h2><hr />

		<table class="table table-hover">
			<thead>
				<tr>
					<th>CEP</th>
					<th>Logradouro</th>
					<th>Número</th>
					<th>Bairro</th>
					<th>Cidade</th>
					<th>Estado</th>
					<th>Complemento</th>
				</tr>
			</thead>
			<tbody>
				@foreach($client->adresses()->orderBy('id', 'DESC')->get() as $address)
				<tr>
					<td>{{ mask($address->postal_code, '#####-###') }}</td>
					<td>{{ $address->street }}</td>
					<td>{{ $address->number }}</td>
					<td>{{ $address->district }}</td>
					<td>{{ $address->city }}</td>
					<td>{{ $address->state }}</td>
					<td>{{ $address->complement }}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>

	<div class="border mb-4 p-4 bg-white">
		<h2>Pedidos</h2><hr />

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Status</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
				</tr>
			</thead>
			<tbody>
				@foreach($client->requests()->orderBy('id', 'DESC')->get() as $request)
				<tr>
					<td><a href="{{ route('panel.requests.edit', ['id' => $request->id]) }}" title="Ver Sobre o Pedido #{{ $request->id }}" target="_blank">#{{ $request->id }} <i class="fas fa-external-link-alt"></i></a></td>
					<td>
						@if($request->status == 'AP' || $request->status == 'EN')
						<span class="alert alert-info p-1 m-0"><small>{{ $request->statusFormat }}</small></span>
						@elseif($request->status == 'PA' || $request->status == 'CO')
						<span class="alert alert-success p-1 m-0"><small>{{ $request->statusFormat }}</small></span>
						@else
						<span class="alert alert-danger p-1 m-0"><small>{{ $request->statusFormat }}</small></span>
						@endif
					</td>
					<td>{{ $request->createdAtFormat }}</td>
					<td>{{ $request->updatedAtFormat }}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>
</section>
@endsection