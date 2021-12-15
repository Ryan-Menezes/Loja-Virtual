@extends('templates.login')

@section('title', 'Login')

@section('container')
	@include('includes.messages')

	<form action="{{ route('panel.login.validate') }}" method="POST" class="form p-4 border">
		<img src="{{ public_path('assets/img/logo.png') }}" title="{{ config('app.name') }}" alt="{{ config('app.name') }}"><hr>

		<input type="hidden" name="_method" value="POST">
		@include('includes.components.form.input', [
			'type' => 'email',
			'name' => 'email',
			'title' => 'E-Mail'
		])
		@include('includes.components.form.input', [
			'type' => 'password',
			'name' => 'password',
			'title' => 'Senha'
		])

		<input type="submit" value="Entrar" class="btn btn-danger">
	</form>
@endsection