@extends('templates.panel')

@section('title', 'Páginas')

@section('container')
@if(can('delete.pages'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Página',
		'message' => 'Deseja realmente deletar esta página?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.pages',
			'urlSearch' => route('panel.pages'),
			'urlCreate' => route('panel.pages.create'),
			'create' => true,
			'title' => 'Nova Página'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Titulo</th>
					<th>URL</th>
					<th>Visível</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($pagesarr as $page)
				<tr>
					<td>{{ $page->id }}</td>
					<td>{{ $page->title }}</td>
					@if($page->visible)
					<td style="max-width: 200px;"><a href="{{ url() . $page->url }}" title="Página: {{ $page->title }}" target="_blank">{{ url() . $page->url }} <i class="fas fa-external-link-alt"></i></a></td>
					@else
					<td>{{ url() . $page->url }}</td>
					@endif
					<td>
						@if($page->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>{{ $page->createdAtFormat }}</td>
					<td>{{ $page->updatedAtFormat }}</td>
					<td>
						@if(can('edit.pages'))
							<a href="{{ route('panel.pages.edit', ['id' => $page->id]) }}" class="btn btn-sm btn-primary" title="Editar Página"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.pages'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.pages.destroy', ['id' => $page->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Página"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.pages'])
	</div>
</div>
@endsection