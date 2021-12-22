@extends('templates.site')

@section('title', 'Criar Conta')
@section('url', route('site.create'))
@section('description', 'Criar Conta')
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
	<form action="" method="POST" class="form">
		<h2>Criar Conta:</h2><hr />

		@include('includes.components.form.input', [
			'title' => 'Nome',
			'name' => 'name',
			'type' => 'text'
		])

		<div class="row">
			<div class="col-md-6">
				@include('includes.components.form.input', [
					'title' => 'E-Mail',
					'name' => 'email',
					'type' => 'email'
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
					'title' => 'Telefone',
					'name' => 'telephone',
					'type' => 'text'
				])
			</div>
			<div class="col-md-6">
				@include('includes.components.form.input', [
					'title' => 'Celular',
					'name' => 'cell',
					'type' => 'text'
				])
			</div>
		</div>

		@include('includes.components.form.input', [
			'title' => 'CPF',
			'name' => 'cpf',
			'type' => 'text'
		])

		@include('includes.components.form.input', [
			'title' => 'CNPJ',
			'name' => 'cnpj',
			'type' => 'text'
		])

		<h3>Endereço</h3><hr />

		@include('includes.components.form.input', [
			'title' => 'CEP',
			'name' => 'postal_code',
			'type' => 'text'
		])

		<div class="row">
			<div class="col-md-6">
				@include('includes.components.form.input', [
					'title' => 'Logradouro',
					'name' => 'street',
					'type' => 'text'
				])
			</div>
			<div class="col-md-6">
				@include('includes.components.form.input', [
					'title' => 'Número',
					'name' => 'number',
					'type' => 'text'
				])
			</div>
		</div>

		@include('includes.components.form.input', [
			'title' => 'Bairro',
			'name' => 'district',
			'type' => 'text'
		])

		<div class="row">
			<div class="col-md-6">
				@include('includes.components.form.select', [
					'title' => 'Cidade',
					'name' => 'city',
					'options' => []
				])
			</div>
			<div class="col-md-6">
				@include('includes.components.form.select', [
					'title' => 'Estado',
					'name' => 'state',
					'options' => []
				])
			</div>
		</div>

		<p><a href="{{ route('site.login') }}" title="Fazer login">Já possuo conta</a></p>

		<input type="submit" class="primary-btn cta-btn" value="Criar Conta">
	</form>
</section>
@endsection