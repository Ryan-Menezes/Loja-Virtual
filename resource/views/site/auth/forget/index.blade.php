@extends('templates.site')

@section('title', 'Recuperar Senha')
@section('url', route('site.forget'))
@section('description', 'Recuperar Senha')
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container" style="margin: 40px auto;">
    @include('includes.messages')

	<form action="{{ route('site.forget.store') }}" method="POST" class="form form-validate">
        @include('includes.components.form.input', [
            'title' => 'E-Mail de Recuperação',
            'name' => 'email',
            'type' => 'email',
            'class' => 'required email',
            'required' => true
        ])

        <input type="submit" class="primary-btn cta-btn" value="Recuperar" style="margin-top: 20px;">
    </form>
</section>
@endsection