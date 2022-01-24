@extends('templates.site')

@section('title', 'Dados Pessoais')
@section('url', route('site.myaccount.client'))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <form action="{{ route('site.myaccount.client.update') }}" method="POST" class="form form-validate">
				@include('includes.messages')

				<input type="hidden" name="_method" value="PUT">

				<h1>Dados Pessoais</h1><hr />

				@include('includes.components.form.input', [
					'title' => 'Nome',
					'name' => 'name',
					'type' => 'text',
					'value' => $client->name,
					'class' => 'required',
					'required' => true
				])

				<div class="row">
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'title' => 'E-Mail',
							'name' => 'email',
							'type' => 'email',
							'value' => $client->email,
							'class' => 'required email',
							'required' => true,
							'disabled' => true
						])
					</div>
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'title' => 'Senha',
							'name' => 'password',
							'type' => 'password'
						])
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'type' => 'text',
							'title' => 'Telefone',
							'name' => 'telephone',
							'value' => $client->telephone,
							'class' => 'phone-mask'
						])
					</div>
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'title' => 'Celular',
							'name' => 'cell',
							'type' => 'text',
							'value' => $client->cell,
							'class' => 'required cell-mask',
							'required' => true
						])
					</div>
				</div>
				
				@if(!empty($client->cpf))
					@include('includes.components.form.input', [
						'title' => 'CPF',
						'name' => 'cpf',
						'type' => 'text',
						'value' => $client->cpf,
						'class' => 'required cpf-mask',
						'required' => true
					])
				@else
					@include('includes.components.form.input', [
						'title' => 'CNPJ',
						'name' => 'cnpj',
						'type' => 'text',
						'value' => $client->cnpj,
						'class' => 'required cnpj-mask',
						'required' => true
					])
				@endif

				<br /><h2>Endereços Principais</h2><hr />

				<div class="row">
					<div class="col-md-6">
						@include('includes.components.form.select', [
							'title' => 'Entrega',
							'name' => 'shipping_address_id',
							'options' => $adresses,
							'value' => $client->shipping_address_id,
							'class' => 'required',
							'required' => true
						])

						<a href="{{ route('site.myaccount.adresses.create') }}" title="Adicionar Novo Endareço">Adicionar novo endereço</a>
					</div>
					<div class="col-md-6">
						@include('includes.components.form.select', [
							'title' => 'Cobrança',
							'name' => 'billing_address_id',
							'options' => $adresses,
							'value' => $client->billing_address_id,
							'class' => 'required',
							'required' => true
						])

						<a href="{{ route('site.myaccount.adresses.create') }}" title="Adicionar Novo Endareço">Adicionar novo endereço</a>
					</div>
				</div>

				<br />
				<button type="submit" class="btn btn-danger">Salvar <i class="fa fa-save"></i></button>
			</form>
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection