@extends('templates.panel')

@section('title', 'Comentários')

@section('container')
@if(can('delete.comments'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Comentátio',
		'message' => 'Deseja realmente deletar este commentário?',
		'btnmsg' => 'Deletar',
	])
@endif

<div class="container-main">
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => '',
			'urlSearch' => route('panel.comments'),
			'create' => false
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>E-Mail</th>
					<th>Visível</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($comments as $comment)
				<tr>
					<td>{{ $comment->id }}</td>
					<td>{{ $comment->name }}</td>
					<td>{{ $comment->email }}</td>
					<td>
						@if($comment->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>{{ $comment->createdAtFormat }}</td>
					<td>{{ $comment->updatedAtFormat }}</td>
					<td>
						<a href="{{ route('site.notices.show', ['slug' => $comment->notice->slug]) }}#comment_{{ $comment->id }}" title="Ver Comentário" target="_blank">Ver Comentário <i class="fas fa-external-link-alt"></i></a>

						<a href="{{ route('panel.comments.subcomments', ['comment' => $comment->id]) }}" style="margin-left: 5px;" title="Ver Respostas">Respostas({{ $comment->subcomments->count() }}) <i class="fas fa-comment"></i></a>

						@if(can('edit.comments'))
							<a href="{{ route('panel.comments.edit', ['id' => $comment->id]) }}" style="margin-left: 5px;" class="btn btn-sm btn-primary" title="Editar Comentário"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.comments'))
							<a href="javascript:void(0)" style="margin-left: 5px;" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.comments.destroy', ['id' => $comment->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Comentário"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.comments'])
	</div>
</div>
@endsection