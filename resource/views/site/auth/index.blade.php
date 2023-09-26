@extends('templates.site')

@section('title', 'Login')
@section('url', route('site.login'))
@section('description', 'Faça login  em sua conta')

@section('container')
<section class="container">
	<div class="row">
		<div class="col-md-6">
			<form action="{{ route('site.login.validate') }}" method="POST" class="form">
				@include('includes.messages')

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

				<p><a href="{{ route('site.forget') }}" title="Recuperar senha">Esqueci minha senha</a></p>

				<input type="submit" class="primary-btn cta-btn" value="Entrar">

				<hr />
				<div class="login-types">
					<a href="{{ route('site.login.facebook') }}" title="Logar com o Facebook" class="btn-primary"><i class="fa fa-facebook-f"></i> Login social com o Facebook</a>
					<a href="{{ route('site.login.google') }}" title="Logar com o Google" class="btn-danger"><i class="fa fa-google"></i> Login social com o Google</a>
				</div>
				
			</form>
		</div>
		<div class="col-md-6">
			<h2>Crie sua conta como:</h2><hr>

			<div class="row">
				<div class="col-xs-6 col-md-6">
					<a href="{{ route('site.account.pf.create') }}" class="thumbnail text-center" title="Pessoa Física">
						<img src="{{ public_path('assets/img/site/pf.png') }}" alt="Pessoa Física" title="Pessoa Física" style="width: 400px;">

						<h3>Pessoa Física</h3>
					</a>
				</div>
				<div class="col-xs-6 col-md-6">
					<a href="{{ route('site.account.pj.create') }}" class="thumbnail text-center" title="Pessoa Jurídica">
						<img src="{{ public_path('assets/img/site/pj.png') }}" alt="Pessoa Jurídica" title="Pessoa Jurídica" style="width: 400px;">

						<h3>Pessoa Jurídica</h3>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
@endsection