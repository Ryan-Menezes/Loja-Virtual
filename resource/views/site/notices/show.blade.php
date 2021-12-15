@extends('templates.site')

@section('title', $notice->title)
@section('url', route('site.notices.show', ['slug' => $notice->slug]))
@section('keywords', $notice->tags)
@section('description', $notice->description)
@section('image', url('storage/app/public/' . $notice->poster))
@section('image_width', 1200)
@section('image_height', 628)

@section('container')
<!-- ##### Post Details Title Area Start ##### -->
<div class="post-details-title-area bg-overlay clearfix" style="background-image: url('{{ url('storage/app/public/' . $notice->poster) }}')">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-12 col-lg-8">
                <!-- Post Content -->
                <div class="post-content">
                    <hj class="post-title">{{ $notice->title }}</h1>
                    <div class="d-flex align-items-center">
                        <span class="post-date mr-30">Escrito por <strong>{{ isset($notice->author) ? $notice->author->name : config('app.name') }}</strong> em {{ $notice->createdAtFormat }}</span>
                        <span class="post-date mr-30"><i class="fa fa-eye"></i> {{ number_format($notice->visits, 0, '', '.') }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### Post Details Title Area End ##### -->

<!-- ##### Post Details Area Start ##### -->
<section class="post-news-area section-padding-40-0 mb-70">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 mb-5">
                <!-- Your share button code -->
                <div class="fb-share-button mt-1" data-href="{{ urlencode(route('site.notices.show', ['slug' => $notice->slug])) }}" data-layout="button" data-size="large" title="Compartilhe no Facebook"></div>
                <a href="https://twitter.com/intent/tweet?url={{ urlencode(route('site.notices.show', ['slug' => $notice->slug])) }}&text={{ $notice->title }}" class="btn btn-sm bg-twitter mt-0 mb-2 share-btn" target="_blank" title="Compartilhe no Twitter"><i class="fa fa-twitter"></i> Share</a>
                <a href="https://api.whatsapp.com/send?text={{ urlencode($notice->title . ': ' . route('site.notices.show', ['slug' => $notice->slug])) }}" target="_blank" class="btn btn-sm bg-whatsapp mt-0 mb-2 share-btn" title="Compartilhe no WhatsApp"><i class="fa fa-whatsapp"></i> Share</a>

                <!-- Load Facebook SDK for JavaScript -->
                <div id="fb-root"></div>
            </div>

            <!-- Post Details Content Area -->
            <div class="col-12 col-lg-8">
                <div class="post-details-content mb-100">
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

                    <div class="post-a-comment-area mb-30 clearfix" id="commentsarea">
                        <h2 class="mb-50">Faça um Comentário:</h2>

                        @include('includes.messages')

                        <!-- Reply Form -->
                        <div class="contact-form-area">
                            <form action="{{ route('site.notices.comments.store', ['slug' => $notice->slug]) }}" method="POST" class="form-validate">
                                <div class="row">
                                    <div class="col-12 col-lg-6">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Nome" class="required">
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="E-Mail" class="required email">
                                    </div>
                                    <div class="col-12">
                                        <textarea name="content" class="form-control" id="message" cols="30" rows="10" placeholder="Mensagem" class="required"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn newsbox-btn mt-30" type="submit">Enviar</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- Comment Area Start -->
                        <div class="comment_area clearfix mb-100 mt-5">
                            <h2 class="mb-50">Comentários({{ $notice->comments->where('visible', true)->count() }}):</h2><hr>

                            @if($notice->comments->where('visible', true)->count() > 0)
                            <ol>
                                @foreach($notice->comments->where('visible', true) as $comment)
                                <!-- Single Comment Area -->
                                <li class="single_comment_area" id="comment_{{ $comment->id }}">
                                    <!-- Comment Content -->
                                    <div class="comment-content d-flex">
                                        <!-- Comment Meta -->
                                        <div class="comment-meta">
                                            <div class="d-flex">
                                                <h3 class="post-author">{{ $comment->name }}</h3>
                                                <span class="post-date"><strong>{{ $comment->createdAtFormat }}</strong></span>
                                                <a href="javascript:void(0)" class="reply" data-startresponse="form-comment-{{ $comment->id }}"><i class="fa fa-reply"></i> Responder</a>
                                            </div>
                                            <p>{!! str_ireplace("\n", '<br>', $comment->content) !!}</p>
                                        </div>
                                    </div>
                                    @if($comment->subcomments->where('visible', true)->count() > 0)
                                    <ol class="children">
                                        @foreach($comment->subcomments->where('visible', true) as $subcomment)
                                        <li class="single_comment_area" id="subcomment_{{ $subcomment->id }}">
                                            <!-- Comment Content -->
                                            <div class="comment-content d-flex">

                                                <!-- Comment Meta -->
                                                <div class="comment-meta">
                                                    <div class="d-flex">
                                                        <h3 class="post-author">{{ $subcomment->name }}</h3>
                                                        <span class="post-date"><strong>{{ $subcomment->createdAtFormat }}</strong></span>
                                                        <a href="javascript:void(0)" class="reply" data-startresponse="form-comment-{{ $comment->id }}"><i class="fa fa-reply"></i> Responder</a>
                                                    </div>
                                                    <p>{!! str_ireplace("\n", '<br>', $subcomment->content) !!}</p>
                                                </div>
                                            </div>
                                        </li>
                                        @endforeach
                                    </ol>
                                    @endif
                                    <form id="form-comment-{{ $comment->id }}" action="{{ route('site.notices.comments.response', ['slug' => $notice->slug, 'id' => $comment->id]) }}" method="POST" class="form-response form-validate" style="display: none!important;">
                                        <div class="row">
                                            <div class="col-12 col-lg-6 mt-4">
                                                <input type="text" class="form-control" id="name" name="name" placeholder="Nome" class="required">
                                            </div>
                                            <div class="col-12 col-lg-6 mt-4">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="E-Mail" class="required email">
                                            </div>
                                            <div class="col-12 mt-4">
                                                <textarea name="content" class="form-control" id="message" cols="30" rows="5" placeholder="Mensagem" class="required"></textarea>
                                            </div>
                                            <div class="col-12 mt-4">
                                                <button type="submit" class="btn btn-danger">Responder</button>
                                                <button type="button" class="btn btn-dark" data-cancelresponse="form-comment-{{ $comment->id }}">Cancelar</button>
                                            </div>
                                        </div>
                                    </form>
                                </li>
                                @endforeach
                            </ol>
                            @else
                            <h3>Nesta notícia ainda não há comentários, Seja o primeiro a comentar!</h3>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Post Details Area End ##### -->
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