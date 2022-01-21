@extends('templates.login')

@section('title', 'Login')

@section('container')
@include('includes.messages')

<form action="{{ route('panel.login.validate') }}" method="POST" class="form">
	<input type="hidden" name="_method" value="POST">
	<div class="box-input">
		<input type="email" name="email" placeholder="E-Mail" />
		<i class="fas fa-key"></i>
	</div>
	<div class="box-input">
		<input type="password" name="password" placeholder="Senha" />
		<i class="fas fa-lock"></i>
	</div>

	<button type="submit">Entrar</button>
</form>
@endsection