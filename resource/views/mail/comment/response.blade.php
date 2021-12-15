<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }} | Alguém respondeu o seu comentário na notícia: {{ $notice->title }}</title>
</head>
<body>
    <h2 style="margin-bottom: 20px;">Alguém respondeu o seu comentário na notícia: {{ $notice->title }}</h2>

    <section style="margin-bottom: 40px;">
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px; margin-bottom: 20px;">
            <div style="margin-bottom: 10px;">
                <span><strong>{{ $subcomment->comment->name }}</strong> | </span>
                <span><strong>{{ $subcomment->comment->createdAtFormat }}</strong></span>
            </div>
            <p>{!! str_ireplace("\n", '<br>', $subcomment->comment->content) !!}</p>
        </div>
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px; margin-left: 50px;">
            <div style="margin-bottom: 10px;">
                <span><strong>{{ $subcomment->name }}</strong> | </span>
                <span><strong>{{ $subcomment->createdAtFormat }}</strong></span>
            </div>
            <p>{!! str_ireplace("\n", '<br>', $subcomment->content) !!}</p>
        </div>
    </section>

    @if($panel)
    <a href="{{ route('panel') }}" title="Responder" style="padding: 15px; border: none; text-decoration: none; background-color: #D17D21; border-radius: 50px; color: white;">Responder</a>
    @else
    <a href="{{ route('site.notices.show', ['slug' => $notice->slug]) }}#subcomment_{{ $subcomment->id }}" title="Responder" style="padding: 15px; border: none; text-decoration: none; background-color: #D17D21; border-radius: 50px; color: white;">Responder</a>
    @endif
</body>
</html>