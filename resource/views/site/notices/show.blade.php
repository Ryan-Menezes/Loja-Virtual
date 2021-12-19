@extends('templates.site')

@section('title', $notice->title)
@section('url', route('site.notices.show', ['slug' => $notice->slug]))
@section('keywords', $notice->tags)
@section('description', $notice->description)
@section('image', url('storage/app/public/' . $notice->poster))
@section('image_width', 1200)
@section('image_height', 628)

@section('container')
    <section class="notice-banner" style="background-image: url('{{ url('storage/app/public/' . $notice->poster) }}')">
        <h1 class="notice-title">{{ $notice->title }}</h1>

        <div class="notice-info">
            <p>Escrito por <strong>{{ $notice->author->name }}</strong> em <strong>{{ $notice->createdAtFormat }}</strong></p>
            <p><i class="fa fa-comment"></i> {{ $notice->comments->count() }}</p>
            <p><i class="fa fa-eye"></i> {{ $notice->visits }}</p>
        </div>
    </section>
    <section class="notice">
        <section class="notice-content">
            @foreach(json_decode($notice->content)->elements as $element)
                @if($element->type == 'title')
                    <{{ $element->tag }} class="mb-4">{!! $element->content !!}</{{ $element->tag }}>
                @elseif($element->type == 'paragraph')
                    <p class="mb-4">{!! str_ireplace("\n", '<br>', $element->content) !!}</p>
                @elseif($element->type == 'youtube')
                    @include('includes.components.youtube.player', [
                        'url' => 'https://www.youtube.com/embed/' . $element->videocode,
                        'class' => 'mb-4'
                    ])
                @elseif($element->type == 'image')
                    <img src="{{ url('storage/app/public/' . $element->src) }}" class="img-fluid mb-4" alt="{{ $element->title }}" title="{{ $element->title }}">
                @endif
            @endforeach
        </section>
        <section class="notice-comp">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Categorias</h3>
                </div>
                <ul class="card-content">
                    @foreach($categories as $category)
                    <li>
                        <a href="" title="{{ $category->name }}"><strong>{{ $category->name }}</strong></a>
                        <ul style="margin-left: 30px;">
                            @foreach($category->subcategories as $subcategory)
                            <li><a href="" title="{{ $subcategory->name }}">{{ $subcategory->name }}({{ $subcategory->notices->count() }})</a></li>
                            @endforeach
                        </ul>
                    </li>
                    @endforeach
                </ul>
            </div>
        </section>
    </section>
@endsection

@section('scripts')
<script type="text/javascript">
    // Facebook
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Outros compartilhamentos
    window.document.addEventListener("DOMContentLoaded", function() {
        $('.share-btn').click(function(){
            event.preventDefault()

            window.open(this.href, '_blank', 'width=700,height=350')
        })
    }, false);

    // Script para responder um comentário
    $('[data-startresponse]').click(function(){
        $('.form-response').hide()

        let data = $(this).data()

        $(`#${data.startresponse}`).show()
    })

    $('[data-cancelresponse]').click(function(){
        $('.form-response').hide()
        
        let data = $(this).data()

        $(`#${data.cancelresponse}`).hide()
    })
</script>
@endsection