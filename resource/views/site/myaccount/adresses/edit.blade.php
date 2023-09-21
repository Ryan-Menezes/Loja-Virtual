@extends('templates.site')

@section('title', 'Editar Endereço')
@section('url', route('site.myaccount'))

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
        	<h1>Editar Endereço</h1><hr />

            @include('includes.site.adresses.form', ['action' => route('site.myaccount.adresses.update', ['id' => $address->id]), 'method' => 'PUT'])
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection