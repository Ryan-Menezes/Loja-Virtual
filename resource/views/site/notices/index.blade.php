@extends('templates.site')

@section('title', 'Blog')
@section('url', route('site.notices'))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
    <section class="notices">
        @foreach($notices as $notice)
        @include('includes.site.notices.card')
        @endforeach
    </section>
    @include('includes.site.paginator', ['route' => 'site.notices'])
</section>
@endsection