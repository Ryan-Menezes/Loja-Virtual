<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset={{ config('app.charset') }}" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="noindex" />

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/bootstrap/bootstrap.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/all.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/brands.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/fontawesome.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/regular.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/solid.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/svg-with-js.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/libs/fontawesome/v4-shims.min.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/panel/auth/config.css') }}">

	<!-- Favicon -->
    <link rel="icon" href="{{ public_path('assets/img/logo.png') }}">

	<title>{{ config('app.name') }} | @yield('title')</title>
</head>
<body>
	<section class="content">
		@yield('container')
	</section>

	<script type="text/javascript" src="{{ public_path('assets/js/libs/bootstrap/bootstrap.min.js') }}"></script>
</body>
</html>