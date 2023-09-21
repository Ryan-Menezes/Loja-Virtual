@extends('templates.site')

@section('title', 'Dados Pessoais')
@section('url', route('site.myaccount.client'))

@section('container')
<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
			@include('includes.messages')

            <form action="{{ route('site.myaccount.client.update') }}" method="POST" class="form form-validate">
				<input type="hidden" name="_method" value="PUT">

				<h2>Dados Pessoais</h2><hr />

				@php
					$parts = explode(' ', $client->name);
					$first_name = isset($parts[0]) ? $parts[0] : null;
					array_shift($parts);
					$last_name = !empty($parts) ? implode(' ', $parts) : null;
				@endphp

				<div class="row">
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'title' => 'Nome',
							'name' => 'first_name',
							'type' => 'text',
							'value' => $first_name,
							'class' => 'required',
							'required' => true
						])
					</div>
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'title' => 'Sobrenome',
							'name' => 'last_name',
							'type' => 'text',
							'value' => $last_name,
							'class' => 'required',
							'required' => true
						])
					</div>
				</div>

				@include('includes.components.form.input', [
					'title' => 'E-Mail',
					'name' => 'email',
					'type' => 'email',
					'value' => $client->email,
					'class' => 'required email',
					'required' => true,
					'disabled' => true
				])
				
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

			<form action="{{ route('site.myaccount.client.password.update') }}" method="POST" class="form form-validate" style="margin-top: 40px;">
				<input type="hidden" name="_method" value="PUT">

				<h2>Senha</h2><hr />

				@include('includes.components.form.input', [
					'title' => 'Senha Atual',
					'name' => 'password',
					'type' => 'password',
					'class' => 'required',
					'required' => true
				])

				@include('includes.components.form.input', [
					'title' => 'Nova Senha',
					'name' => 'npassword',
					'type' => 'password',
					'class' => 'required',
					'required' => true
				])
		
				@include('includes.components.form.input', [
					'title' => 'Repetir Nova Senha',
					'name' => 'rnpassword',
					'type' => 'password',
					'class' => 'required',
					'required' => true
				])

				<br />
				<button type="submit" class="btn btn-danger">Alterar Senha <i class="fa fa-lock"></i></button>
			</form>
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection