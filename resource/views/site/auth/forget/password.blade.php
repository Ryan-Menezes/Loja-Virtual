@extends('templates.site')

@section('title', 'Recuperar Senha')
@section('url', route('site.forget'))
@section('description', 'Recuperar Senha')

@section('container')
<section class="container" style="margin: 40px auto;">
    @include('includes.messages')

	<form action="{{ route('site.forget.password.update', ['token' => $client->token]) }}" method="POST" class="form form-validate">
        @include('includes.components.form.input', [
            'title' => 'Nova Senha',
            'name' => 'password',
            'type' => 'password',
            'class' => 'required',
            'required' => true
        ])

        @include('includes.components.form.input', [
            'title' => 'Repetir Nova Senha',
            'name' => 'rpassword',
            'type' => 'password',
            'class' => 'required',
            'required' => true
        ])

        <input type="submit" class="primary-btn cta-btn" value="Altera Senha" style="margin-top: 20px;">
    </form>
</section>
@endsection