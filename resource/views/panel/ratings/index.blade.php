@extends('templates.panel')

@section('title', 'Avaliações')

@section('container')
@if(can('delete.ratings'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Avaliação',
		'message' => 'Deseja realmente deletar esta avaliação?',
		'btnmsg' => 'Deletar',
	])
@endif

<div class="container-main">
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => '',
			'urlSearch' => route('panel.ratings'),
			'create' => false
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Cliente</th>
					<th>Estrelas</th>
					<th>Visível</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($ratings as $rating)
				<tr>
					<td>{{ $rating->id }}</td>
					<td><a href="{{ route('panel.clients.show', ['id' => $rating->client->id]) }}" title="Ver Mais Sobre: {{ $rating->client->name }}" target="_blank">{{ $rating->client->name }} <i class="fas fa-external-link-alt"></i></a></td>
					<td>
						@for($i = 0; $i < $rating->stars; $i++)
						<i class="fas fa-star"></i>
						@endfor
					</td>
					<td>
						@if($rating->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>{{ $rating->createdAtFormat }}</td>
					<td>{{ $rating->updatedAtFormat }}</td>
					<td>
						<a href="{{ route('site.products.show', ['slug' => $rating->product->slug]) }}#rating_{{ $rating->id }}" title="Ver Avaliação" target="_blank">Ver Avaliação <i class="fas fa-external-link-alt"></i></a>

						@if(can('edit.ratings'))
							<a href="{{ route('panel.ratings.edit', ['id' => $rating->id]) }}" style="margin-left: 5px;" class="btn btn-sm btn-primary" title="Editar Avaliação"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.ratings'))
							<a href="javascript:void(0)" style="margin-left: 5px;" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.ratings.destroy', ['id' => $rating->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Avaliação"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.ratings'])
	</div>
</div>
@endsection