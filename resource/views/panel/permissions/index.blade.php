@extends('templates.panel')

@section('title', 'Permissões')

@section('container')
<div class="container-main">
	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => '',
			'urlSearch' => route('panel.permissions'),
			'create' => false
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Descrição</th>
				</tr>
			</thead>
			<tbody>
				@foreach($permissions as $permission)
				<tr>
					<td>{{ $permission->id }}</td>
					<td>{{ $permission->name }}</td>
					<td>{{ $permission->description }}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.permissions'])
	</div>
</div>
@endsection