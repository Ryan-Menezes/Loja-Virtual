<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }} | Recuperação de senha</title>
</head>
<body>
    <h2 style="margin-bottom: 20px;">Recuperação de senha: {{ config('app.name') }}</h2>

    <section style="margin-bottom: 40px;">
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px;">
            <p>Para recuperar sua conta basta clicar no link abaixo:</p>
        </div>
    </section>

    <a href="{{ route('site.forget.password', ['token' => $client->token]) }}" title="Recuperar Senha" style="padding: 15px; border: none; text-decoration: none; background-color: #D17D21; border-radius: 50px; color: white;">Recuperar Senha</a>
</body>
</html>