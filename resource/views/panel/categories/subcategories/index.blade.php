@extends('templates.panel')

@section('title', 'Sub Categorias de ' . $category->name)

@section('container')
@if(can('delete.categories'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Sub Categoria',
		'message' => 'Deseja realmente deletar esta sub categoria?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">
	<div class="p-4 bg-white border mb-4">
		<h2 class="p-0 m-0">Sub Categorias de {{ $category->name }}</h2>
	</div>

	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.categories',
			'urlSearch' => route('panel.categories.subcategories', ['category' => $category->id]),
			'urlCreate' => route('panel.categories.subcategories.create', ['category' => $category->id]),
			'create' => true,
			'title' => 'Nova Sub Categoria'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($subcategories as $subcategory)
				<tr>
					<td>{{ $subcategory->id }}</td>
					<td>{{ $subcategory->name }}</td>
					<td>
						@if(can('edit.categories'))
							<a href="{{ route('panel.categories.subcategories.edit', ['category' => $category->id, 'id' => $subcategory->id]) }}" class="btn btn-sm btn-primary" title="Editar Sub Categoria"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.categories'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.categories.subcategories.destroy', ['category' => $category->id, 'id' => $subcategory->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Sub Categoria"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.categories.subcategories', 'params' => ['category' => $category->id]])
	</div>
</div>
@endsection