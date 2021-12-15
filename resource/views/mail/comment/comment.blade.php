<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }} | Alguém fez um comentário na sua notícia: {{ $notice->title }}</title>
</head>
<body>
    <h2 style="margin-bottom: 20px;">Alguém fez um comentário na sua notícia: {{ $notice->title }}</h2>

    <section style="margin-bottom: 40px;">
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px;">
            <div style="margin-bottom: 10px;">
                <span><strong>{{ $comment->name }}</strong> | </span>
                <span><strong>{{ $comment->createdAtFormat }}</strong></span>
            </div>
            <p>{!! str_ireplace("\n", '<br>', $comment->content) !!}</p>
        </div>
    </section>

    <a href="{{ route('panel') }}" title="Responder Comentário" style="padding: 15px; border: none; text-decoration: none; background-color: #D17D21; border-radius: 50px; color: white;">Responder Comentário</a>
</body>
</html>