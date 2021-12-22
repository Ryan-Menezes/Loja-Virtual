@extends('templates.site')

@section('title', 'Login')
@section('url', route('site.login'))
@section('description', 'Faça login  em sua conta')
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
	<div class="row">
		<div class="col-md-6">
			<form action="" method="POST" class="form">
				<h2>Faça seu login:</h2><hr />

				@include('includes.components.form.input', [
					'title' => 'E-Mail',
					'name' => 'email',
					'type' => 'email'
				])

				@include('includes.components.form.input', [
					'title' => 'Senha',
					'name' => 'password',
					'type' => 'password'
				])

				<p><a href="" title="Recuperar senha">Esqueci minha senha</a></p>

				<input type="submit" class="primary-btn cta-btn" value="Entrar">

				<hr />
				<a href="" title="Logar com o Facebook" class="btn btn-primary"><i class="fa fa-facebook-f"></i> Facebook</a>
				<a href="" title="Logar com o Google" class="btn btn-danger"><i class="fa fa-google"></i> Google</a>
			</form>
		</div>
		<div class="col-md-6">
			<h2>Crie sua conta:</h2><hr>

			<a href="{{ route('site.create') }}" title="Criar conta como pessoa física" class="btn btn-primary">Criar conta como pessoa física</a>
			<a href="{{ route('site.create') }}" title="Criar conta como pessoa juridica" class="btn btn-danger">Criar conta como pessoa juridica</a>
		</div>
	</div>
</section>
@endsection