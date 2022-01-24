@extends('templates.panel')

@section('title', 'Pedidos')

@section('container')
@if(can('delete.requests'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Pedido',
		'message' => 'Deseja realmente deletar este pedido?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => '',
			'urlSearch' => route('panel.requests'),
			'create' => false
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Cliente</th>
					<th>Status</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($requests as $request)
				<tr>
					<td>#{{ $request->id }}</td>
					<td><a href="{{ route('panel.clients.show', ['id' => $request->client->id]) }}" title="Saber mais sobre o cliente: {{ $request->client->name }}" target="_blank">{{ $request->client->name }} <i class="fas fa-external-link-alt"></i></a></td>
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
					<td>
						@if(can('edit.requests'))
							<a href="{{ route('panel.requests.edit', ['id' => $request->id]) }}" class="btn btn-sm btn-primary" title="Editar Pedido"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.requests'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.requests.destroy', ['id' => $request->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Pedido"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.requests'])
	</div>
</div>
@endsection