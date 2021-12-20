@extends('templates.site')

@section('title', $notice->title)
@section('url', route('site.notices.show', ['slug' => $notice->slug]))
@section('keywords', $notice->tags)
@section('description', $notice->description)
@section('image', url('storage/app/public/' . $notice->poster))
@section('image_width', 1200)
@section('image_height', 628)

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

            @if($notice->comments_active)
            <section class="comments" id="commentsarea">
                <h2>Deixe seu comentário</h2><hr/>

                @include('includes.messages')

                <form action="{{ route('site.notices.comments.store', ['slug' => $notice->slug]) }}" method="POST" class="form">
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
                               <p><a href="javascript:void(0)" title="Responder Comentário" data-startresponse="form-response-{{ $comment->id }}">Responder</a></p>
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
                                       <p><a href="javascript:void(0)" title="Responder Comentário" data-startresponse="form-response-{{ $comment->id }}">Responder</a></p>
                                   </div>
                                   <div class="comment-content">
                                       <p>{!! str_ireplace("\n", '<br/>', $subcomment->content) !!}</p>
                                   </div>
                               </div>
                            </li>
                            @endforeach
                       </ul>
                       @endif
                       <form action="{{ route('site.notices.comments.response', ['slug' => $notice->slug, 'id' => $comment->id]) }}" method="POST" class="form form-response" id="form-response-{{ $comment->id }}">
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