<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset={{ config('app.charset') }}" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="noindex" />

	<link rel="stylesheet" type="text/css" href="{{ public_path('assets/dist/panel.css') }}">

	<!-- Favicon -->
    <link rel="icon" href="{{ public_path('assets/img/favicon.png') }}">

	<title>{{ config('app.name') }} | @yield('title')</title>
</head>
<body>
	<section class="modal-load">
        <main>
            <div class="load"></div>
            <p><strong class="message">Aguarde, Carregando...</strong></p>
        </main>
    </section>

	<section class="content">
		@include('includes.panel.menu')
		<div>
			@include('includes.panel.header')
			
			<section class="content-main">
				@php 
					$routeComplete = '';
					$routes = explode('/', route());
				@endphp
			
				@if(!empty($routes) && !empty($routes[0]))				
				<main class="content-breadcrumb">
					<nav aria-label="breadcrumb" class="p-3 border bg-white">
						<ol class="breadcrumb p-0 m-0">
							@foreach($routes as $route)
								@php $routeComplete .= $route . '/' @endphp

								@if(!$loop->last)
						    	<li class="breadcrumb-item"><a href="{{ url($routeComplete) }}">{{ $route }}</a></li>
						    	@else
						    	@php $routeComplete = $route @endphp
						    	@endif
						    @endforeach
						    <li class="breadcrumb-item active" aria-current="page">{{ trim($routeComplete, '/') }}</li>
						</ol>
					</nav>
				</main>
				@endif

				<main class="content-view">
					@yield('container')
				</main>
			</section>
		</div>
	</section>

	<script type="text/javascript" src="{{ public_path('assets/dist/panel.js') }}"></script>
	<script type="text/javascript" src="{{ public_path('assets/js/libs/plugins/Trumbowyg/trumbowyg.min.js') }}"></script>
	@yield('scripts')
</body>
</html>