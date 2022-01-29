@extends('templates.panel')

@section('title', 'Carrossel')

@section('container')
@if(can('delete.slideshow'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Slide',
		'message' => 'Deseja realmente deletar este slide?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.slideshow',
			'urlSearch' => route('panel.slideshow'),
			'urlCreate' => route('panel.slideshow.create'),
			'create' => true,
			'title' => 'Novo Slide'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Imagem</th>
					<th>Titulo</th>
					<th>Link</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($slideshow as $slide)
				<tr>
					<td>{{ $slide->id }}</td>
					<td><img src="{{ url('storage/app/public/' . $slide->image, config('ftp.active')) }}" title="{{ $slide->title }}" alt="{{ $slide->title }}"></td>
					<td style="max-width: 200px;">{{ $slide->title }}</td>
					<td style="max-width: 200px;">
						@if(!empty($slide->link))
						<a href="{{ $slide->link }}" title="Ver Link" target="_blank">{{ $slide->link }} <i class="fas fa-external-link-alt"></i></a>
						@endif
					</td>
					<td>
						@if(can('edit.slideshow'))
							<a href="{{ route('panel.slideshow.edit', ['id' => $slide->id]) }}" class="btn btn-sm btn-primary" title="Editar Slide"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.slideshow'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.slideshow.destroy', ['id' => $slide->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Slide"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.slideshow'])
	</div>
</div>
@endsection