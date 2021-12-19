@extends('templates.panel')

@section('title', 'Cliente: ' . $client->name)

@section('container')
	<section class="p-4">
		<h2>Dados Pessoais</h2><hr>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Nome</th>
					<th>CPF</th>
					<th>CNPJ</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{{ $client->name }}</td>
					<td>{{ mask($client->cpf, '###.###.###-##') }}</td>
					<td>{{ $client->cnpj }}</td>
					<td>{{ $client->createdAtFormat }}</td>
					<td>{{ $client->updatedAtFormat }}</td>
				</tr>
			</tbody>
		</table>

		<h2 class="mt-5">Contato</h2><hr>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>E-Mail</th>
					<th>Telefone</th>
					<th>Celular</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{{ $client->email }}</td>
					<td>{{ mask($client->telephone, '(##)####-####') }}</td>
					<td>{{ mask($client->cell, '(##)#####-####') }}</td>
				</tr>
			</tbody>
		</table>

		<h2 class="mt-5">Endereços</h2><hr>

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
				@foreach($client->adresses as $address)
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
	</section>
@endsection