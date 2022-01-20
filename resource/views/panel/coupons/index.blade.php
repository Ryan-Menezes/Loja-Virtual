@extends('templates.panel')

@section('title', 'Cupons')

@section('container')
@if(can('delete.coupons'))
	@include('includes.components.modais.delete', [
		'title' => 'Deletar Cupom',
		'message' => 'Deseja realmente deletar este cupom?',
		'btnmsg' => 'Deletar',
	])
@endif

<div class="container-main">	
	@include('includes.messages')

	<div class="p-4 bg-white border">
		@include('includes.search', [
			'can' => 'create.coupons',
			'urlSearch' => route('panel.coupons'),
			'urlCreate' => route('panel.coupons.create'),
			'create' => true,
			'title' => 'Novo Cupom'
		])

		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Código</th>
					<th>Porcentagem(%)</th>
					<th>Data de Expiração</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@foreach($coupons as $coupon)
				<tr>
					<td>{{ $coupon->id }}</td>
					<td>{{ $coupon->code }}</td>
					<td>{{ $coupon->percent }}</td>
					<td>{{ $coupon->expirationFormat }}</td>
					<td>
						@if(can('edit.coupons'))
							<a href="{{ route('panel.coupons.edit', ['id' => $coupon->id]) }}" class="btn btn-sm btn-primary" title="Editar Cupom"><i class="fas fa-pencil-alt"></i></a>
						@endif

						@if(can('delete.coupons'))
							<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('panel.coupons.destroy', ['id' => $coupon->id]) }}" data-bs-toggle="modal" data-bs-target="#modalDelete" title="Deletar Cupom"><i class="fas fa-trash"></i></a>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		@include('includes.paginator', ['route' => 'panel.coupons'])
	</div>
</div>
@endsection