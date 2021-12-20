@extends('templates.site')

@section('title', 'Notícias')
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
        <div class="notice-card">
            <div class="notice-image">
                <img src="{{ url('storage/app/public/' . $notice->poster) }}" alt="{{ $notice->title }}" title="{{ $notice->title }}">
            </div>
            <div class="notice-info">
                <h2 class="notice-title"><a href="{{ route('site.notices.show', ['slug' => $notice->slug]) }}" title="{{ $notice->title }}">{{ $notice->title }}</a></h2>
                <p class="notice-desc">{{ mb_substr($notice->description, 0, 100) }}...</p>
                <p class="notice-status"><i class="fa fa-comment"></i> {{ $notice->comments->where('visible', true)->count() }} <i class="fa fa-eye"></i> {{ number_format($notice->visits, 0, '', '.') }}</p>
            </div>
        </div>
        @endforeach
    </section>
    @include('includes.paginator', ['route' => 'panel.clients'])
</section>
@endsection