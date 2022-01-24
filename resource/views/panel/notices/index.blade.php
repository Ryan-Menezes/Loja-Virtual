@extends('templates.panel')

@section('title', 'Artigos')

@section('container')
@if(can('delete.notices'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Notícia',
		'message' => 'Deseja realmente deletar este artigo?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.notices',
			'urlSearch' => route('panel.notices'),
			'urlCreate' => route('panel.notices.create'),
			'create' => true,
			'title' => 'Novo Artigo'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Capa</th>
					<th>Titulo</th>
					<th>Visível</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($notices as $notice)
				<tr>
					<td>{{ $notice->id }}</td>
					<td><img src="{{ url('storage/app/public/' . $notice->poster, config('ftp.active')) }}" title="{{ $notice->title }}" alt="{{ $notice->title }}"></td>
					@if($notice->visible)
					<td style="max-width: 200px;"><a href="{{ route('site.notices.show', ['slug' => $notice->slug]) }}" title="Página da notícia: {{ $notice->title }}" target="_blank">{{ $notice->title }} <i class="fas fa-external-link-alt"></i></a></td>
					@else
					<td>{{ $notice->title }}</td>
					@endif
					<td>
						@if($notice->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>{{ $notice->createdAtFormat }}</td>
					<td>{{ $notice->updatedAtFormat }}</td>
					<td>
						@if(can('edit.notices'))
							<a href="{{ route('panel.notices.edit', ['id' => $notice->id]) }}" class="btn btn-sm btn-primary" title="Editar Artigo"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.notices'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.notices.destroy', ['id' => $notice->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Artigo"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.notices'])
	</div>
</div>
@endsection