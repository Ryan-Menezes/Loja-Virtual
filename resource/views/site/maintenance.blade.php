<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={{ config('app.charset') }}" />
    <meta name="keywords" content="{{ config('app.keywords') }}">
    <meta name="description" content="{{ config('app.description') }}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta property="og:url" content="{{ route('site') }}" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{ config('app.name') }}" />
    <meta property="og:description" content="{{ config('app.description') }}" />
    <meta property="og:image" content="{{ public_path('assets/img/site/core-img/favicon.ico') }}" />
    <meta property="og:image:alt" content="{{ config('app.name') }}" />
    <meta property="og:image:width" content="200" /> 
    <meta property="og:image:height" content="200" /> 
    <meta property="og:site_name" content="{{ config('app.name') }}" /> 
    <meta property="og:locale" content="{{ config('app.lang') }}" />
    {{-- <meta property="og:app_id" content="" /> --}}
    {{-- <meta property="fb:pages" content="" /> --}}
    
    <meta property="article:author" content="{{ config('app.social.facebook') }}" /> 
    <meta property="article:publisher" content="{{ config('app.social.facebook') }}" /> 
    <meta property="twitter:card" content="summary_large_image" /> 
    <meta property="twitter:domain" content="{{ config('app.domain') }}" /> 
    <meta property="twitter:title" content="{{ config('app.name') }}" /> 
    <meta property="twitter:description" content="{{ config('app.description') }}" /> 
    <meta property="twitter:image" content="{{ public_path('assets/img/site/core-img/favicon.ico') }}" /> 
    <meta property="twitter:url" content="{{ route('site') }}" />
    <meta name="twitter:card" content="summary" />
    {{-- <meta name="twitter:site" content="@news" /> --}}
    {{-- <meta name="twitter:creator" content="@news" /> --}}

    <!-- Title -->
    <title>{{ config('app.name') }}</title>

    <!-- Favicon -->
    <link rel="icon" href="{{ public_path('assets/img/logo.png') }}"> 

    <style type="text/css">
        *{
            padding: 0px;
            margin: 0px;
            font-family: arial;
        }
        #container{
            display: flex;
            height: 100%;
            width: 100%;
            position: absolute;
            align-items: center;
            justify-content: center;
            background-color: #1a1a1a;
        }
        #container main{
            width: 80%;
            height: 80%;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            box-shadow: 0px 0px 5px 10px #1c1c1c;
            background-color: #2b2b2b;
        }
        #container main h1{
            font-size: 50px;
            color: #878787;
        }
    </style>
</head>
<body>
    <section id="container">
        <main>
            <h1>O SITE ESTÁ EM MANUTENÇÃO</h1>
        </main>
    </section>
</body>
</html>