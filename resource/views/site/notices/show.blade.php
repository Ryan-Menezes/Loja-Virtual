@extends('templates.site')

@section('title', $notice->title)
@section('url', route('site.notices.show', ['slug' => $notice->slug]))
@section('keywords', $notice->tags)
@section('description', $notice->description)
@section('image', url('storage/app/public/' . $notice->poster))
@section('image_width', 1200)
@section('image_height', 628)

@section('ld-json')
<script type="application/ld+json">
{
    "@context": "https://schema.org",
    "@type": "NewsArticle",
    "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": "{{ route('site.notices.show', ['slug' => $notice->slug]) }}"
    },
    "headline": "{{ $notice->title }},
    "image": [
        @foreach(json_decode($notice->content)->elements as $element)
            @if($element->type == 'image')
            "{{ url('storage/app/public/' . $element->src) }}",
            @endif
        @endforeach
        "{{ url('storage/app/public/' . $notice->poster) }}"
    ],
    "datePublished": "{{ date('Y-m-d', strtotime($notice->created_at)) }}T{{ date('H:i:s', strtotime($notice->created_at)) }}+00:00",
    "dateModified": "{{ date('Y-m-d', strtotime($notice->updated_at)) }}T{{ date('H:i:s', strtotime($notice->updated_at)) }}+00:00",
    "author": {
        "@type": "Person",
        "name": "{{ $notice->author->name }}",
        "url": "{{ url() }}"
    },
    "publisher": {
        "@type": "Organization",
        "name": "{{ config('app.name') }}",
        "logo": {
            "@type": "ImageObject",
            "url": "{{ public_path('assets/img/logo.png') }}"
        }
    }
}
</script>
@endsection

@section('container')
<section class="container">
    <section class="notice-banner" style="background-image: url('{{ url('storage/app/public/' . $notice->poster) }}')">
        <h1 class="notice-title">{{ $notice->title }}</h1>

        <div class="notice-info">
            <p>Escrito por <strong>{{ $notice->author->name }}</strong> em <strong>{{ $notice->createdAtFormat }}</strong></p>
            <p><i class="fa fa-comment"></i> {{ $notice->comments->where('visible', true)->count() }}</p>
            <p><i class="fa fa-eye"></i> {{ number_format($notice->visits, 0, '', '.') }}</p>
        </div>
    </section>

    <section style="margin-bottom: 40px;">
        <!-- Your share button code -->
        <div class="fb-share-button mt-1" data-href="{{ urlencode(route('site.notices.show', ['slug' => $notice->slug])) }}" data-layout="button" data-size="large" title="Compartilhe no Facebook"></div>
        <a href="https://twitter.com/intent/tweet?url={{ urlencode(route('site.notices.show', ['slug' => $notice->slug])) }}&text={{ $notice->title }}" class="btn btn-sm bg-twitter mt-0 mb-2 share-btn" target="_blank" title="Compartilhe no Twitter"><i class="fa fa-twitter"></i> Share</a>
        <a href="https://api.whatsapp.com/send?text={{ urlencode($notice->title . ': ' . route('site.notices.show', ['slug' => $notice->slug])) }}" target="_blank" class="btn btn-sm bg-whatsapp mt-0 mb-2 share-btn" title="Compartilhe no WhatsApp"><i class="fa fa-whatsapp"></i> Share</a>

        <!-- Load Facebook SDK for JavaScript -->
        <div id="fb-root"></div>
    </section>

    <section class="notice">
        <section class="notice-content">
            @foreach(json_decode($notice->content)->elements as $element)
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

            @if($notice->comments_active)
            <section class="comments" id="commentsarea" style="margin-top: 20px;">
                <h2>Deixe seu comentário</h2><hr/>

                @include('includes.messages')

                <form action="{{ route('site.notices.comments.store', ['slug' => $notice->slug]) }}" method="POST" class="form form-validate">
                    @if(!auth('site'))
                        @include('includes.components.form.input', [
                            'type' => 'text',
                            'title' => 'Nome',
                            'name' => 'name',
                            'class' => 'required'
                        ])

                        @include('includes.components.form.input', [
                            'type' => 'email',
                            'title' => 'E-Mail',
                            'name' => 'email',
                            'class' => 'required'
                        ])
                    @endif

                    @include('includes.components.form.textarea', [
                        'title' => 'Mensagem',
                        'name' => 'content',
                        'class' => 'required'
                    ])

                    <input type="submit" class="primary-btn cta-btn" value="Enviar">
                </form>

                <h2 style="margin-top: 40px;">Comentários({{ $notice->comments->where('visible', true)->count() }})</h2><hr/>

                @if($notice->comments->where('visible', true)->count() > 0)
                <ul>
                   @foreach($notice->comments->where('visible', true) as $comment)
                   <li id="comment_{{ $comment->id }}">
                       <div class="comment">
                           <div class="comment-header">
                               <p><strong>{{ $comment->name }}</strong></p>
                               <p><strong>{{ $comment->createdAtFormat }}</strong></p>
                               <p><a href="javascript:void(0)" title="Responder Comentário" data-startresponse="form-response-{{ $comment->id }}"><i class="fa fa-reply"></i></a></p>
                           </div>
                           <div class="comment-content">
                               <p>{!! str_ireplace("\n", '<br/>', $comment->content) !!}</p>
                           </div>
                       </div>

                       @if($comment->subcomments->where('visible', true)->count() > 0)
                       <ul style="margin-left: 50px;">
                           @foreach($comment->subcomments->where('visible', true) as $subcomment)
                           <li id="subcomment_{{ $subcomment->id }}">
                               <div class="comment">
                                   <div class="comment-header">
                                       <p><strong>{{ $subcomment->name }}</strong></p>
                                       <p><strong>{{ $subcomment->createdAtFormat }}</strong></p>
                                       <p><a href="javascript:void(0)" title="Responder Comentário" data-startresponse="form-response-{{ $comment->id }}"><i class="fa fa-reply"></i></a></p>
                                   </div>
                                   <div class="comment-content">
                                       <p>{!! str_ireplace("\n", '<br/>', $subcomment->content) !!}</p>
                                   </div>
                               </div>
                            </li>
                            @endforeach
                       </ul>
                       @endif
                       <form action="{{ route('site.notices.comments.response', ['slug' => $notice->slug, 'id' => $comment->id]) }}" method="POST" class="form form-response form-validate" id="form-response-{{ $comment->id }}">
                            @if(!auth('site'))
                                @include('includes.components.form.input', [
                                    'type' => 'text',
                                    'title' => 'Nome',
                                    'name' => 'name',
                                    'class' => 'required'
                                ])

                                @include('includes.components.form.input', [
                                    'type' => 'email',
                                    'title' => 'E-Mail',
                                    'name' => 'email',
                                    'class' => 'required'
                                ])
                            @endif

                            @include('includes.components.form.textarea', [
                                'title' => 'Mensagem',
                                'name' => 'content',
                                'class' => 'required'
                            ])

                            <input type="submit" class="primary-btn cta-btn" value="Responder">
                            <input type="button" class="primary-btn cta-btn bg-dark" value="Cancelar" data-cancelresponse="form-response-{{ $comment->id }}">
                       </form>
                   </li>
                   @endforeach 
                </ul>
                @else
                <p>Ainda não há comentários nesse artigo, Seja o primeiro a comentar <a href="#commentsarea" title="Fazer um Comentário">clicando aqui</a></p>
                @endif
            </section>
            @endif
        </section>
        <section class="notice-comp">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">Categorias</h2>
                </div>
                <ul class="card-content">
                    @foreach($categories as $category)
                        @if(count($category->subcategories))
                        <li>
                            <p><strong>{{ $category->name }}</strong></p>
                            
                            <ul style="margin-left: 30px;">
                                @foreach($category->subcategories as $subcategory)
                                    <li><a href="{{ route('site.notices.category.subcategory', ['category' => $category->slug, 'subcategory' => $subcategory->slug]) }}" title="Artigos da Sub Categoria: {{ $subcategory->name }}">{{ $subcategory->name }}</a></li>
                                @endforeach
                            </ul>
                        </li>
                        @endif
                    @endforeach
                </ul>
            </div>
        </section>
    </section>
</section>
@endsection

@section('scripts')
<script type="text/javascript">
    /* Facebook */
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    /* Outros compartilhamentos */
    window.document.addEventListener("DOMContentLoaded", function() {
        $('.share-btn').click(function(){
            event.preventDefault();

            window.open(this.href, '_blank', 'width=700,height=350');
        });
    }, false);

    /* Script para responder um comentário */
    $('[data-startresponse]').click(function(){
        $('.form-response').hide();

        let data = $(this).data();

        $(`#${data.startresponse}`).show();
    });

    $('[data-cancelresponse]').click(function(){
        $('.form-response').hide();
        
        let data = $(this).data();

        $(`#${data.cancelresponse}`).hide();
    });
</script>
@endsection