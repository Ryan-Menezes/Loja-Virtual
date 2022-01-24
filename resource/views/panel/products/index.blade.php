@extends('templates.panel')

@section('title', 'Produtos')

@section('container')
@if(can('delete.products'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Produto',
		'message' => 'Deseja realmente deletar este produto?',
		'btnmsg' => 'Deletar'
	])
@endif

<div class="container-main">	
	@include('includes.messages')
	
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.products',
			'urlSearch' => route('panel.products'),
			'urlCreate' => route('panel.products.create'),
			'create' => true,
			'title' => 'Novo Produto'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Imagem</th>
					<th>Nome</th>
					<th>Visível</th>
					<th>Criando em</th>
					<th>Atualizado em</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($products as $product)
				<tr>
					<td>{{ $product->id }}</td>
					<td><img src="{{ url('storage/app/public/' . $product->colors->first()->images->first()->source, config('ftp.active')) }}" title="{{ $product->name }}" alt="{{ $product->name }}"></td>
					@if($product->visible)
					<td style="max-width: 200px;"><a href="{{ route('site.products.show', ['slug' => $product->slug]) }}" title="Página do produto: {{ $product->name }}" target="_blank">{{ $product->name }} <i class="fas fa-external-link-alt"></i></a></td>
					@else
					<td>{{ $product->name }}</td>
					@endif
					<td>
						@if($product->visible)
						<i class="fas fa-check-circle text-success"></i>
						@else
						<i class="fas fa-times-circle text-danger"></i>
						@endif
					</td>
					<td>{{ $product->createdAtFormat }}</td>
					<td>{{ $product->updatedAtFormat }}</td>
					<td>
						@if(can('edit.products'))
							<a href="{{ route('panel.products.edit', ['id' => $product->id]) }}" class="btn btn-sm btn-primary" title="Editar Produto"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.products'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.products.destroy', ['id' => $product->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Produto"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>

		@include('includes.paginator', ['route' => 'panel.products'])
	</div>
</div>
@endsection