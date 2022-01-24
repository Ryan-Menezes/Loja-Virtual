@extends('templates.panel')

@section('title', 'Parceiros')

@section('container')
@if(can('delete.partners'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Parceiro',
		'message' => 'Deseja realmente deletar este parceiro?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.partners',
			'urlSearch' => route('panel.partners'),
			'urlCreate' => route('panel.partners.create'),
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
				@foreach($partners as $partner)
				<tr>
					<td>{{ $partner->id }}</td>
					<td><img src="{{ url('storage/app/public/' . $partner->image, config('ftp.active')) }}" title="{{ $partner->title }}" alt="{{ $partner->title }}"></td>
					<td style="max-width: 200px;">{{ $partner->title }}</td>
					<td style="max-width: 200px;"><a href="{{ $partner->link }}" title="Ver Link" target="_blank">{{ $partner->link }} <i class="fas fa-external-link-alt"></i></a></td>
					<td>
						@if(can('edit.partners'))
							<a href="{{ route('panel.partners.edit', ['id' => $partner->id]) }}" class="btn btn-sm btn-primary" title="Editar Parceiro"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.partners'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.partners.destroy', ['id' => $partner->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Parceiro"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.partners'])
	</div>
</div>
@endsection