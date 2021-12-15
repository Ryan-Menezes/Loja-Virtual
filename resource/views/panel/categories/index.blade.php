@extends('templates.panel')

@section('title', 'Categorias')

@section('container')
	@if(can('delete.categories'))
		@include('includes.components.modais.delete', [
			'title' => 'Deletar Categoria',
			'message' => 'Deseja realmente deletar esta categoria?',
			'btnmsg' => 'Deletar'
		])
	@endif

	<div class="container-main">
		@include('includes.search', [
			'can' => 'create.categories',
			'urlSearch' => route('panel.categories'),
			'urlCreate' => route('panel.categories.create'),
			'create' => true,
			'title' => 'Nova Categoria'
		])

		@include('includes.messages')

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($categories as $category)
				<tr>
					<td>{{ $category->id }}</td>
					<td>{{ $category->name }}</td>
					<td>
						@if(can('edit.categories'))
							<a href="{{ route('panel.categories.edit', ['id' => $category->id]) }}" class="btn btn-sm btn-primary" title="Editar Categoria"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.categories'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.categories.destroy', ['id' => $category->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Categoria"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.categories'])
	</div>
@endsection