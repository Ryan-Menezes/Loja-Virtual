@extends('templates.panel')

@section('title', 'Usuários')

@section('container')
@if(can('delete.users'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Usuário',
		'message' => 'Deseja realmente deletar este usuário?',
		'btnmsg' => 'Deletar',
	])
@endif

<div class="container-main">
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.users',
			'urlSearch' => route('panel.users'),
			'urlCreate' => route('panel.users.create'),
			'create' => true,
			'title' => 'Novo Usuário'
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
				@foreach($users as $user)
				<tr>
					<td>{{ $user->id }}</td>
					<td>{{ $user->name }}</td>
					<td>{{ $user->email }}</td>
					<td>{{ $user->createdAtFormat }}</td>
					<td>{{ $user->updatedAtFormat }}</td>
					<td>
						@if(can('edit.users'))
							<a href="{{ route('panel.users.edit', ['id' => $user->id]) }}" class="btn btn-sm btn-primary" title="Editar Usuário"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.users'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.users.destroy', ['id' => $user->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Usuário"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.users'])
	</div>
</div>
@endsection