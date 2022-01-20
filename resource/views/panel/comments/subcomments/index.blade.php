@extends('templates.panel')

@section('title', 'Respostas do Comentário: ' . $comment->id)

@section('container')
@if(can('delete.comments'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Resposta',
		'message' => 'Deseja realmente deletar esta resposta?',
		'btnmsg' => 'Deletar',
	])
@endif

<div class="container-main">	
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => '',
			'urlSearch' => route('panel.comments.subcomments', ['comment' => $comment->id]),
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
				@foreach($subcomments as $subcomment)
				<tr>
					<td>{{ $subcomment->id }}</td>
					<td>{{ $subcomment->name }}</td>
					<td>{{ $subcomment->email }}</td>
					<td>
						@if($subcomment->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>{{ $subcomment->createdAtFormat }}</td>
					<td>{{ $subcomment->updatedAtFormat }}</td>
					<td>
						<a href="{{ route('site.notices.show', ['slug' => $comment->notice->slug]) }}#subcomment_{{ $subcomment->id }}" title="Ver Resposta" target="_blank">Ver Resposta <i class="fas fa-external-link-alt"></i></a>
						
						@if(can('edit.comments'))
							<a href="{{ route('panel.comments.subcomments.edit', ['comment' => $comment->id, 'id' => $subcomment->id]) }}" style="margin-left: 5px;" class="btn btn-sm btn-primary" title="Editar Resposta"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.comments'))
							<a href="javascript:void(0)" style="margin-left: 5px;" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.comments.subcomments.destroy', ['comment' => $comment->id, 'id' => $subcomment->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Resposta"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.comments.subcomments', 'params' => ['comment' => $comment->id]])
	</div>
</div>
@endsection