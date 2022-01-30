<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }} | Parabéns por criar sua conta em nosso site, agora basta validá-la!</title>
</head>
<body>
    <h2 style="margin-bottom: 20px;">Parabéns por criar sua conta em nosso site, agora basta validá-la!</h2>

    <section style="margin-bottom: 40px;">
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px;">
            <p>Para validar sua conta clique no botão abaixo:</p>
        </div>
    </section>

    <a href="{{ route('site.account.validate', ['token' => $client->token]) }}" title="Validar Conta" style="padding: 15px; border: none; text-decoration: none; background-color: #D17D21; border-radius: 50px; color: white;">Validar Conta</a>
</body>
</html>