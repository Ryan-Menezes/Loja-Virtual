<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset={{ config('app.charset') }}" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="noindex" />
	
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/dist/auth.css') }}">

	<!-- Favicon -->
    <link rel="icon" href="{{ public_path('assets/img/favicon.png') }}">

	<title>{{ config('app.name') }} | @yield('title')</title>
</head>
<body>
	<section class="content">
		@yield('container')
	</section>

	<script type="text/javascript" src="{{ public_path('assets/dist/auth.js') }}"></script>
</body>
</html>