@extends('templates.panel')

@section('title', 'Editar Cupom')

@section('container')
<div class="container-main">
	@include('includes.panel.coupons.form', ['action' => route('panel.coupons.update', ['id' => $coupon->id]), 'method' => 'PUT'])
</div>
@endsection