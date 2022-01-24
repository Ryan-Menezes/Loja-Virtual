@extends('templates.site')

@section('title', 'Início')
@section('url', route('site'))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			@foreach($banners as $banner)
			<!-- shop -->
			<div class="col-md-4 col-xs-6">
				<div class="shop">
					<div class="shop-img">
						<img src="{{ url('storage/app/public/' . $banner->image) }}" alt="{{ $banner->title }}" title="{{ $banner->title }}">
					</div>
					<div class="shop-body">
						<h3>{{ $banner->title }}</h3>
						<a href="{{ $banner->link }}" class="cta-btn" title="Ver Mais Sobre {{ $banner->title }}">VER MAIS <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<!-- /shop -->
			@endforeach
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Novos Produtos</h2>
				</div>
			</div>
			<!-- /section title -->

			<!-- Products tab & slick -->
			<div class="col-md-12">
				<div class="row">
					<div class="products-slick" data-nav="#slick-nav-1">
						@foreach($products as $product)
						@include('includes.site.products.card', ['new' => true])
						@endforeach
					</div>
					<div id="slick-nav-1" class="products-slick-nav"></div>
				</div>
			</div>
			<!-- Products tab & slick -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="hot-deal">
					<ul class="hot-deal-countdown">
						<li>
							<div>
								<h3>02</h3>
								<span>Days</span>
							</div>
						</li>
						<li>
							<div>
								<h3>10</h3>
								<span>Hours</span>
							</div>
						</li>
						<li>
							<div>
								<h3>34</h3>
								<span>Mins</span>
							</div>
						</li>
						<li>
							<div>
								<h3>60</h3>
								<span>Secs</span>
							</div>
						</li>
					</ul>
					<h2 class="text-uppercase">hot deal this week</h2>
					<p>New Collection Up to 50% OFF</p>
					<a class="primary-btn cta-btn" href="#">Shop now</a>
				</div>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Artigos Recentes do Blog</h2>
				</div>
			</div>
			<!-- /section title -->

			<div class="col-md-12">
				<section class="notices">
				    @foreach($notices as $notice)
				    @include('includes.site.notices.card')
				    @endforeach
				</section>

				<div class="text-center" style="margin-top: 50px;">
					<a href="{{ route('site.notices') }}" title="Ver Mais Artigos" class="primary-btn cta-btn">Ver Mais</a>
				</div>	
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->
@endsection