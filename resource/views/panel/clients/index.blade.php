@extends('templates.panel')

@section('title', 'Clientes')

@section('container')
@if(can('delete.clients'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Cliente',
		'message' => 'Deseja realmente deletar este cliente?',
		'btnmsg' => 'Deletar',
	])
@endif

<div class="container-main">
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => '',
			'urlSearch' => route('panel.clients'),
			'create' => false
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>E-Mail</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($clients as $client)
				<tr>
					<td>{{ $client->id }}</td>
					<td>{{ $client->name }}</td>
					<td>{{ $client->email }}</td>
					<td>{{ $client->createdAtFormat }}</td>
					<td>{{ $client->updatedAtFormat }}</td>
					<td>
						@if(can('view.clients'))
							<a href="{{ route('panel.clients.show', ['id' => $client->id]) }}" class="btn btn-sm btn-warning" title="Mais Informações"><i class="fas fa-info-circle"></i></a>
						@endif

						@if(can('delete.clients'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.clients.destroy', ['id' => $client->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Cliente"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.clients'])
	</div>
</div>
@endsection