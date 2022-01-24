@extends('templates.panel')

@section('title', 'Galerias')

@section('container')
@if(can('delete.galleries'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Galeria',
		'message' => 'Deseja realmente deletar esta geleria?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.galleries',
			'urlSearch' => route('panel.galleries'),
			'urlCreate' => route('panel.galleries.create'),
			'create' => true,
			'title' => 'Nova Galeria'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Titulo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($galleries as $galery)
				<tr>
					<td>{{ $galery->id }}</td>
					<td style="max-width: 200px;">{{ $galery->title }}</td>
					<td>
						@if(can('edit.galleries'))
							<a href="{{ route('panel.galleries.edit', ['id' => $galery->id]) }}" class="btn btn-sm btn-primary" title="Editar Galeria"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.galleries'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.galleries.destroy', ['id' => $galery->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Galeria"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.galleries'])
	</div>
</div>
@endsection