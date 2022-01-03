@extends('templates.panel')

@section('title', 'Novo Cupom')

@section('container')
<div class="container-main">
	@include('includes.panel.coupons.form', ['action' => route('panel.coupons.store'), 'method' => 'POST'])
</div>
@endsection