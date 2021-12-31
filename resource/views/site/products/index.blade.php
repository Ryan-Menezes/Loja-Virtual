@extends('templates.site')

@section('title', 'Produtos')
@section('url', route('site.notices'))
@section('description', 'Busque por um produto expecífico')
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
			<!-- ASIDE -->
			<div id="aside" class="col-md-3">
				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Categorias</h3>
					<ul class="checkbox-filter">
						@foreach($categories as $category)
						<li class="input-checkbox">
							<input type="checkbox" id="category-{{ $category->id }}">
							<label for="category-{{ $category->id }}">
								<span></span>
								{{ $category->name }}
							</label>

							@if($category->subcategories->count() > 0)
							<ul style="margin-left: 40px;">
								@foreach($category->subcategories as $subcategory)
									@if($subcategory->products->count() > 0)
									<li class="input-checkbox">
										<input type="checkbox" id="subcategory-{{ $subcategory->id }}">
										<label for="subcategory-{{ $subcategory->id }}">
											<span></span>
											{{ $subcategory->name }}
											<small>({{ $subcategory->products->count() }})</small>
										</label>
									</li>
									@endif
								@endforeach
							</ul>
							@endif
						</li>
						@endforeach
					</ul>
				</div>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Preço</h3>
					<div class="price-filter">
						<div id="price-slider"></div>
						<div class="input-number price-min">
							<input id="price-min" type="number">
							<span class="qty-up">+</span>
							<span class="qty-down">-</span>
						</div>
						<span>-</span>
						<div class="input-number price-max">
							<input id="price-max" type="number">
							<span class="qty-up">+</span>
							<span class="qty-down">-</span>
						</div>
					</div>
				</div>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Frete</h3>
					<div class="input-checkbox">
						<input type="checkbox" name="freight_free" value="1" id="freight_free">
						<label for="freight_free"><span></span>Frete Grátis</label>
					</div>
				</div>
				<!-- /aside Widget -->
			</div>
			<!-- /ASIDE -->

			<!-- STORE -->
			<div id="store" class="col-md-9">
				<!-- store products -->
				<div class="row">
					@foreach($products as $product)
					<!-- product -->
					<div class="col-md-4 col-xs-6">
						<div class="product">
							<div class="product-img">
								<img src="{{ url('storage/app/public/' . $product->firstImage) }}" alt="{{ $product->name }}" title="{{ $product->name }}">
								<div class="product-label">
									@if($product->promotion_percent)
									<span class="sale">-{{ $product->promotion_percent }}%</span>
									@endif
									{{-- <span class="new">NOVO</span> --}}
								</div>
							</div>
							<div class="product-body">
								<h3 class="product-name"><a href="{{ route('site.products.show', ['slug' => $product->slug]) }}" title="{{ $product->name }}">{{ $product->name }}</a></h3>
								<h4 class="product-price">
									R$ {{ $product->priceFormat }}
									@if(!empty($product->price_previous))
									<del class="product-old-price">{{ $product->pricePreviousFormat }}</del>
									@endif
								</h4>
								<div class="product-rating">
									@if($product->freight_free)
									<span class="product-available" style="margin-left: 0px;">Frete Grátis</span>
									@endif
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
					</div>
					<!-- /product -->
					@endforeach
				</div>

				<!-- store bottom filter -->
				{{-- @include('includes.site.paginator', ['route' => 'site.products']) --}}
				<!-- /store bottom filter -->
			</div>
			<!-- /STORE -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->
@endsection