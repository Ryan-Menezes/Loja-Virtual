<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>{{ config('app.name') }} | Contato via formulário da {{ config('app.name') }}: {{ $subject }}</title>
</head>
<body>
    <h2>Contato via formulário da {{ config('app.name') }}: {{ $subject }}</h2>

    <section style="margin-top: 20px;">
        <div style="padding: 20px; border: 1px solid #bfbfbf; border-radius: 5px;">
            <div>
                <span><strong>{{ $name }}</strong> | </span>
                <span><strong>{{ $email }}</strong></span>
            </div>
            <p style="margin-top: 10px;">{!! str_ireplace("\n", '<br>', $content) !!}</p>
        </div>
    </section>
</body>
</html>