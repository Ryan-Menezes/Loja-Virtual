@extends('templates.site')

@section('title', $page->title)
@section('tags', $page->tags)
@section('url', url($page->url))
@section('description', $page->description)

@section('ld-json')
    @if(!empty($page->ld_json))
    <script type="application/ld+json">
    {!! $page->ld_json !!}
    </script>
    @endif
@endsection

@section('metatags')
    @if(!$page->index_active)
    <meta name="robots" content="noindex">
    <meta name="googlebot" content="noindex">
    @endif
@endsection

@section('container')
<!-- Section -->
<section class="container">
@foreach(json_decode($page->content)->elements as $element)
    @if($element->type == 'text')
        {!! str_ireplace("\n", '<br>', $element->content) !!}
    @elseif($element->type == 'youtube')
        @include('includes.components.youtube.player', [
            'url' => 'https://www.youtube.com/embed/' . $element->videocode,
            'class' => 'mb-4'
        ])
    @elseif($element->type == 'image')
        <img src="{{ url('storage/app/public/' . $element->src) }}" class="img-fluid" alt="{{ $element->title }}" title="{{ $element->title }}" style="margin: 20px 0px;">
    @endif
@endforeach
</section>
<!-- /Section -->
@endsection