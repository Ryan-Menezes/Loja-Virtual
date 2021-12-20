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
					<div class="products-tabs">
						<!-- tab -->
						<div id="tab1" class="tab-pane active">
							<div class="products-slick" data-nav="#slick-nav-1">
								@foreach($products as $product)
								<!-- product -->
								<div class="product">
									<div class="product-img">
										<img src="{{ url('storage/app/public/' . $product->firstImage) }}" alt="{{ $product->name }}" title="{{ $product->name }}">
										<div class="product-label">
											@if($product->promotion_percent)
											<span class="sale">-{{ $product->promotion_percent }}%</span>
											@endif
											<span class="new">NOVO</span>
										</div>
									</div>
									<div class="product-body">
										<h3 class="product-name"><a href="{{ route('site.products.show', ['slug' => $product->slug]) }}" title="{{ $product->name }}">{{ $product->name }}</a></h3>
										<h4 class="product-price">
											R${{ $product->priceFormat }}
											@if(!empty($product->price_previous))
											<del class="product-old-price">{{ $product->pricePreviousFormat }}</del>
											@endif
										</h4>
										<div class="product-rating">
											@if($product->ratings_active)
												@if($product->ratings->where('visible', true)->count() > 0)
													@for($i = 0; $i < $product->ratings->where('visible', true)->avg('stars'); $i++)
													<i class="fa fa-star"></i>
													@endfor

													@for($i = 0; $i < 5 - $product->ratings->where('visible', true)->avg('stars'); $i++)
													<i class="fa fa-star-o"></i>
													@endfor
												@else
												<p>Nenhuma Avaliação</p>
												@endif
											@endif
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Favoritar</span></button>
											<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">Comparar</span></button>
											<button class="quick-view"><a href="{{ route('site.products.show', ['slug' => $product->slug]) }}" title="Visualizar"><i class="fa fa-eye"></i><span class="tooltipp">Visualizar</span></a></button>
										</div>
									</div>
									<div class="add-to-cart">
										@if($product->sizes->first()->quantity > 0)
										<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Adicionar ao Carrinho</button>
										@else
										<p style="color: white;"><strong>Produto Indisponível</strong></p>
										@endif
									</div>
								</div>
								<!-- /product -->
								@endforeach
							</div>
							<div id="slick-nav-1" class="products-slick-nav"></div>
						</div>
						<!-- /tab -->
					</div>
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
				    <div class="notice-card">
				        <div class="notice-image">
				            <img src="{{ url('storage/app/public/' . $notice->poster) }}" alt="{{ $notice->title }}" title="{{ $notice->title }}">
				        </div>
				        <div class="notice-info">
				            <h2 class="notice-title"><a href="{{ route('site.notices.show', ['slug' => $notice->slug]) }}" title="{{ $notice->title }}">{{ $notice->title }}</a></h2>
				            <p class="notice-desc">{{ mb_substr($notice->description, 0, 100) }}...</p>
				            <p class="notice-status"><i class="fa fa-comment"></i> {{ $notice->comments->count() }} <i class="fa fa-eye"></i> {{ $notice->visits }}</p>
				        </div>
				    </div>
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