@extends('templates.panel')

@section('title', 'Banners')

@section('container')
@if(can('delete.banners'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Banner',
		'message' => 'Deseja realmente deletar este banner?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.banners',
			'urlSearch' => route('panel.banners'),
			'urlCreate' => route('panel.banners.create'),
			'create' => true,
			'title' => 'Novo Banner'
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
				@foreach($banners as $banner)
				<tr>
					<td>{{ $banner->id }}</td>
					<td><img src="{{ url('storage/app/public/' . $banner->image, config('ftp.active')) }}" title="{{ $banner->title }}" alt="{{ $banner->title }}"></td>
					<td style="max-width: 200px;">{{ $banner->title }}</td>
					<td style="max-width: 200px;"><a href="{{ $banner->link }}" title="Ver Link" target="_blank">{{ $banner->link }} <i class="fas fa-external-link-alt"></i></a></td>
					<td>
						@if(can('edit.banners'))
							<a href="{{ route('panel.banners.edit', ['id' => $banner->id]) }}" class="btn btn-sm btn-primary" title="Editar Banner"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.banners'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.banners.destroy', ['id' => $banner->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Banner"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>

		@include('includes.paginator', ['route' => 'panel.banners'])
	</div>
</div>
@endsection