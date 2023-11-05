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
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.categories',
			'urlSearch' => route('panel.categories'),
			'urlCreate' => route('panel.categories.create'),
			'create' => true,
			'title' => 'Nova Categoria'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Imagem</th>
					<th>Nome</th>
					<th>Destaque</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($categories as $category)
				<tr>
					<td>{{ $category->id }}</td>
					<td>
						@if($category->image)
						<img src="{{ url('storage/app/public/' . $category->image, config('ftp.active')) }}" title="{{ $category->name }}" alt="{{ $category->name }}">
						@else
						<img src="{{ url('public/assets/img/no-image.jpg') }}" title="{{ $category->name }}" alt="{{ $category->name }}">
						@endif
					</td>
					<td>{{ $category->name }}</td>
					<td>
						@if($category->emphasis)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>
						<a href="{{ route('panel.categories.subcategories', ['category' => $category->id]) }}" style="margin-right: 5px;" title="Ver Sub Categorias">Sub Categorias({{ $category->subcategories->count() }}) <i class="fas fa-tag"></i></a>

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
</div>
@endsection