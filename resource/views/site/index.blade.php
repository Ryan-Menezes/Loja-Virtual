@extends('templates.site')

@section('title', 'Início')

@section('container')
@if(count($slideshow))
<div id="carousel-example" class="carousel slide" data-ride="carousel" style="width: 100%; margin-bottom: 40px;">
	<ol class="carousel-indicators">
		@foreach($slideshow as $slide)
			@if($loop->first)
	  		<li data-target="#carousel-example" data-slide-to="{{ $loop->index }}" class="active"></li>
			@else
			<li data-target="#carousel-example" data-slide-to="{{ $loop->index }}"></li>
			@endif
		@endforeach
	</ol>
	<div class="carousel-inner text-left" role="listbox">
		@foreach($slideshow as $slide)
			@if($loop->first)
			<div class="item active">
				<img src="{{ url('storage/app/public/' . $slide->image) }}" alt="{{ $slide->title }}" title="{{ $slide->title }}" style="min-width: 100%;" />
				<div class="carousel-caption">
					@if(!empty($slide->title))
					<h2>{{ $slide->title }}</h2>
					@endif

					@if(!empty($slide->description))
					<p style="margin-bottom: 40px;">{{ $slide->description }}</p>
					@endif

					@if(!empty($slide->link))
					<a href="{{ $slide->link }}" class="primary-btn cta-btn" title="{{ $slide->title }}" style="margin-bottom: 40px;" target="_blank">Ver Mais</a>
					@endif
				</div>
			</div>
			@else
			<div class="item">
				<img src="{{ url('storage/app/public/' . $slide->image) }}" alt="{{ $slide->title }}" title="{{ $slide->title }}" style="min-width: 100%;" />
				<div class="carousel-caption">
					@if(!empty($slide->title))
					<h2>{{ $slide->title }}</h2>
					@endif

					@if(!empty($slide->description))
					<p style="margin-bottom: 40px;">{{ $slide->description }}</p>
					@endif

					@if(!empty($slide->link))
					<a href="{{ $slide->link }}" class="primary-btn cta-btn" title="{{ $slide->title }}" style="margin-bottom: 40px;" target="_blank">Ver Mais</a>
					@endif
				</div>
			</div>
			@endif
		@endforeach
	</div>
	<a class="left carousel-control" href="#carousel-example" role="button" data-slide="prev">
	  <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#carousel-example" role="button" data-slide="next">
	  <span class="sr-only">Next</span>
	</a>
</div>
@endif

@php
	$bannersCount = count($banners);
	$bCount = $bannersCount ? $bannersCount : 1;
	$md = max(ceil(12 / $bCount), 3);
@endphp

@if($bannersCount)
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			@foreach($banners as $banner)
			<!-- shop -->
			<div class="col-md-{{ $md }} col-xs-6">
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
@endif

@if($products->count())
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
@endif

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<img src="//assets.pagseguro.com.br/ps-integration-assets/banners/divulgacao/728x90_10X_pagseguro.gif" alt="Banner PagSeguro" title="Parcele suas compras em até 18x" style="width: 100%;" />
		</div>

		<div class="col-md-6">
			<img src="https://imgmp.mlstatic.com/org-img/MLB/MP/BANNERS/tipo2_468X60.jpg?v=1" alt="Mercado Pago - Meios de pagamento" title="Mercado Pago - Meios de pagamento" style="width: 100%;" />
		</div>
	</div>
</div>

@if($products_showcase->count())
<!-- SECTION -->
<div class="section" style="margin-top: 40px;">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Nossa Vitrine</h2>
				</div>
			</div>
			<!-- /section title -->

			<!-- Products tab & slick -->
			<div class="col-md-12">
				<div class="row">
					<div class="products-slick" data-nav="#slick-nav-2">
						@foreach($products_showcase as $product)
						@include('includes.site.products.card')
						@endforeach
					</div>
					<div id="slick-nav-2" class="products-slick-nav"></div>
				</div>
			</div>
			<!-- Products tab & slick -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->
@endif

@if($notices->count())
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
@endif
@endsection

@section('styles')
<style>
	#breadcrumb{
		margin-bottom: 0px;
	}
</style>
@endsection