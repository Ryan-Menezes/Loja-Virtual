@extends('templates.panel')

@section('title', 'Depoimentos')

@section('container')
@if(can('delete.depoiments'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Depoimento',
		'message' => 'Deseja realmente deletar este depoimento?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.depoiments',
			'urlSearch' => route('panel.depoiments'),
			'urlCreate' => route('panel.depoiments.create'),
			'create' => true,
			'title' => 'Novo Depoimento'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Visível</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($depoiments as $depoiment)
				<tr>
					<td>{{ $depoiment->id }}</td>
					<td>{{ $depoiment->name }}</td>
					<td>
						@if($depoiment->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>
						@if(can('edit.depoiments'))
							<a href="{{ route('panel.depoiments.edit', ['id' => $depoiment->id]) }}" class="btn btn-sm btn-primary" title="Editar Depoimento"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.depoiments'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.depoiments.destroy', ['id' => $depoiment->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Depoimento"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.depoiments'])
	</div>
</div>
@endsection