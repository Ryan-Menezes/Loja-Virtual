@extends('templates.panel')

@section('title', 'Funções')

@section('container')
@if(can('delete.roles'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Função',
		'message' => 'Deseja realmente deletar esta função?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.roles',
			'urlSearch' => route('panel.roles'),
			'urlCreate' => route('panel.roles.create'),
			'create' => true,
			'title' => 'Nova Função'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Descrição</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($roles as $role)
				<tr>
					<td>{{ $role->id }}</td>
					<td>{{ $role->name }}</td>
					<td>{{ $role->description }}</td>
					<td>
						@if(can('edit.roles'))
							<a href="{{ route('panel.roles.edit', ['id' => $role->id]) }}" class="btn btn-sm btn-primary" title="Editar Função"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.roles'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.roles.destroy', ['id' => $role->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Função"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.roles'])
	</div>
</div>
@endsection