@extends('templates.site')

@section('title', $product->name)
@section('url', route('site.notices.show', ['slug' => $product->slug]))
@section('description', $product->description)
@section('image', url('storage/app/public/' . $product->firstImage))
@section('image_width', 100)
@section('image_height', 100)

@section('container')
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- Product main img -->
			<div class="col-md-5 col-md-push-2">
				<div id="product-main-img">
					@foreach($product->colors->first()->images as $image)
					<div class="product-preview">
						<img src="{{ url('storage/app/public/' . $image->source) }}" alt="{{ $product->name }}" title="{{ $product->name }}">
					</div>
					@endforeach
				</div>
			</div>
			<!-- /Product main img -->

			<!-- Product thumb imgs -->
			<div class="col-md-2  col-md-pull-5">
				<div id="product-imgs">
					@foreach($product->colors->first()->images as $image)
					<div class="product-preview">
						<img src="{{ url('storage/app/public/' . $image->source) }}" alt="{{ $product->name }}" title="{{ $product->name }}">
					</div>
					@endforeach
				</div>
			</div>
			<!-- /Product thumb imgs -->

			<!-- Product details -->
			<div class="col-md-5">
				<div class="product-details">
					<h1 class="product-name">{{ $product->name }}</h1>

					@if($product->freight_free)
					<span class="product-available" style="margin-left: 0px;">Frete Grátis</span>
					@endif

					<div>
						@if($product->ratings_active)
							@if($product->ratings->where('visible', true)->count() > 0)
							<div class="product-rating">
								@for($i = 0; $i < $product->ratings->where('visible', true)->avg('stars'); $i++)
								<i class="fa fa-star"></i>
								@endfor

								@for($i = 0; $i < 5 - $product->ratings->where('visible', true)->avg('stars'); $i++)
								<i class="fa fa-star-o"></i>
								@endfor
							</div>
							@endif
							<a class="review-link" href="#tab3" title="Avaliações">{{ $product->ratings->where('visible', true)->count() }} Avaliação(ões) | Adicione sua avaliação</a>
						@endif
					</div>
					<div>
						<h2 class="product-price">
							<span class="product-current-price">R$ {{ $product->priceFormat }}</span>
							@if(!empty($product->sizes->first()->price_previous))
							<del class="product-old-price">R$ {{ $product->pricePreviousFormat }}</del>
							@else
							<del class="product-old-price"></del>
							@endif
						</h2>
						@if($product->sizes->first()->quantity > 0)
						<span class="product-available">Produto Disponível</span>
						@else
						<span class="product-available">Produto Indisponível</span>
						@endif
					</div>
					<p>{!! str_ireplace("\n", '<br/>', $product->description) !!}</p>

					<div class="product-options">
						<label>
							Cor
							<select class="input-select" id="colors">
								@foreach($product->colors as $color)
								<option value="{{ route('site.products.info', ['id' => $color->id]) }}">{{ $color->description }}</option>
								@endforeach
							</select>
						</label>
						<label>
							Tamanho
							<select class="input-select">
								@foreach($product->colors->first()->sizes as $size)
								<option value="{{ $size->id }}">{{ $size->description }}</option>
								@endforeach
							</select>
						</label>
					</div>

					@if($product->sizes->first()->quantity > 0)
					<div class="add-to-cart">
						<div class="qty-label">
							Qtde
							<div class="input-number">
								<input type="number" value="1" name="quantity" min="1" max="{{ $product->sizes->first()->quantity }}">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Adicionar ao Carrinho</button>
					</div>
					@endif

					<ul class="product-btns">
						<li><a href="#"><i class="fa fa-heart-o"></i> Favoritar</a></li>
						<li><a href="#"><i class="fa fa-exchange"></i> Comparar</a></li>
					</ul>

					<ul class="product-links">
						<li><strong>Categorias:</strong></li>
						<li><a href="#">Headphones</a></li>
						<li><a href="#">Accessories</a></li>
					</ul>

					<ul class="product-links">
						<li><strong>Compartilhar:</strong></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-envelope"></i></a></li>
					</ul>

				</div>
			</div>
			<!-- /Product details -->

			<!-- Product tab -->
			<div class="col-md-12">
				<div id="product-tab">
					<!-- product tab nav -->
					<ul class="tab-nav">
						<li class="active"><a data-toggle="tab" href="#tab1">Descrição</a></li>
						<li><a data-toggle="tab" href="#tab2">Detalhes</a></li>
						@if($product->ratings_active)
						<li><a data-toggle="tab" href="#tab3">Avaliações({{ $product->ratings->where('visible', true)->count() }})</a></li>
						@endif
					</ul>
					<!-- /product tab nav -->

					<!-- product tab content -->
					<div class="tab-content">
						<!-- tab1  -->
						<div id="tab1" class="tab-pane fade in active">
							<div class="row">
								<div class="col-md-12">
									<p>{!! str_ireplace("\n", '<br/>', $product->description) !!}</p>
								</div>
							</div>
						</div>
						<!-- /tab1  -->

						<!-- tab2  -->
						<div id="tab2" class="tab-pane fade in">
							<div class="row">
								<div class="col-md-12">
									<p>{!! str_ireplace("\n", '<br/>', $product->details) !!}</p>
								</div>
							</div>
						</div>
						<!-- /tab2  -->

						@if($product->ratings_active)
						<!-- tab3  -->
						<div id="tab3" class="tab-pane fade in">
							<div class="row">
								<!-- Review Form -->
								<div class="col-md-12" style="margin-bottom: 50px;">
									<div id="review-form">
										<form action="" method="POST" class="review-form">
											<div class="input-rating">
												<span>Avaliação: </span>
												<div class="stars">
													<input id="star5" name="stars" value="5" type="radio"><label for="star5"></label>
													<input id="star4" name="stars" value="4" type="radio"><label for="star4"></label>
													<input id="star3" name="stars" value="3" type="radio"><label for="star3"></label>
													<input id="star2" name="stars" value="2" type="radio"><label for="star2"></label>
													<input id="star1" name="stars" value="1" type="radio"><label for="star1"></label>
												</div>
											</div>
											<textarea class="input" name="content" placeholder="Sua Avaliação"></textarea>

											<button class="primary-btn">Enviar</button>
										</form>
									</div>
								</div>
								<!-- /Review Form -->

								@if($product->ratings->where('visible', true)->count() > 0)
								<!-- Rating -->
								<div class="col-md-4">
									<div id="rating">
										<div class="rating-avg">
											<span>{{ number_format($product->ratings->where('visible', true)->avg('stars'), 1) }}</span>
											<div class="rating-stars">
												@for($i = 0; $i < $product->ratings->where('visible', true)->avg('stars'); $i++)
												<i class="fa fa-star"></i>
												@endfor

												@for($i = 0; $i < 5 - $product->ratings->where('visible', true)->avg('stars'); $i++)
												<i class="fa fa-star-o"></i>
												@endfor
											</div>
										</div>
										<ul class="rating">
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="rating-progress">
													<div style="width: 80%;"></div>
												</div>
												<span class="sum">{{ $product->ratings->where('visible', true)->where('stars', 5)->count() }}</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div style="width: 60%;"></div>
												</div>
												<span class="sum">{{ $product->ratings->where('visible', true)->where('stars', 4)->count() }}</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div></div>
												</div>
												<span class="sum">{{ $product->ratings->where('visible', true)->where('stars', 3)->count() }}</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div></div>
												</div>
												<span class="sum">{{ $product->ratings->where('visible', true)->where('stars', 2)->count() }}</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div></div>
												</div>
												<span class="sum">{{ $product->ratings->where('visible', true)->where('stars', 1)->count() }}</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- /Rating -->

								<!-- Reviews -->
								<div class="col-md-8">
									<div id="reviews">
										<ul class="reviews">
											@foreach($product->ratings as $rating)
											<li>
												<div class="review-heading">
													<h5 class="name">{{ $rating->client->name }}</h5>
													<p class="date">{{ $rating->createdAtFormat }}</p>
													<div class="review-rating">
														@for($i = 0; $i < $rating->stars; $i++)
														<i class="fa fa-star"></i>
														@endfor

														@for($i = 0; $i < 5 - $rating->stars; $i++)
														<i class="fa fa-star-o empty"></i>
														@endfor
													</div>
												</div>
												<div class="review-body">
													<p>{!! str_ireplace("\n", '<br>', $rating->content) !!}</p>
												</div>
											</li>
											@endforeach
										</ul>
										<ul class="reviews-pagination">
											<li class="active">1</li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
										</ul>
									</div>
								</div>
								<!-- /Reviews -->
								@else
								<p>Este produto ainda não possui nenhuma avaliação!</p>
								@endif
							</div>
						</div>
						<!-- /tab3  -->
						@endif
					</div>
					<!-- /product tab content  -->
				</div>
			</div>
			<!-- /product tab -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<div class="col-md-12">
				<div class="section-title text-center">
					<h3 class="title">Related Products</h3>
				</div>
			</div>

			<!-- product -->
			<div class="col-md-3 col-xs-6">
				<div class="product">
					<div class="product-img">
						<img src="./img/product01.png" alt="">
						<div class="product-label">
							<span class="sale">-30%</span>
						</div>
					</div>
					<div class="product-body">
						<p class="product-category">Category</p>
						<h3 class="product-name"><a href="#">product name goes here</a></h3>
						<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
						<div class="product-rating">
						</div>
						<div class="product-btns">
							<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
							<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
							<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
						</div>
					</div>
					<div class="add-to-cart">
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
					</div>
				</div>
			</div>
			<!-- /product -->

			<!-- product -->
			<div class="col-md-3 col-xs-6">
				<div class="product">
					<div class="product-img">
						<img src="./img/product02.png" alt="">
						<div class="product-label">
							<span class="new">NEW</span>
						</div>
					</div>
					<div class="product-body">
						<p class="product-category">Category</p>
						<h3 class="product-name"><a href="#">product name goes here</a></h3>
						<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
						<div class="product-rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product-btns">
							<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
							<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
							<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
						</div>
					</div>
					<div class="add-to-cart">
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
					</div>
				</div>
			</div>
			<!-- /product -->

			<div class="clearfix visible-sm visible-xs"></div>

			<!-- product -->
			<div class="col-md-3 col-xs-6">
				<div class="product">
					<div class="product-img">
						<img src="./img/product03.png" alt="">
					</div>
					<div class="product-body">
						<p class="product-category">Category</p>
						<h3 class="product-name"><a href="#">product name goes here</a></h3>
						<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
						<div class="product-rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star-o"></i>
						</div>
						<div class="product-btns">
							<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
							<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
							<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
						</div>
					</div>
					<div class="add-to-cart">
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
					</div>
				</div>
			</div>
			<!-- /product -->

			<!-- product -->
			<div class="col-md-3 col-xs-6">
				<div class="product">
					<div class="product-img">
						<img src="./img/product04.png" alt="">
					</div>
					<div class="product-body">
						<p class="product-category">Category</p>
						<h3 class="product-name"><a href="#">product name goes here</a></h3>
						<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
						<div class="product-rating">
						</div>
						<div class="product-btns">
							<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
							<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
							<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
						</div>
					</div>
					<div class="add-to-cart">
						<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
					</div>
				</div>
			</div>
			<!-- /product -->

		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /Section -->
@endsection

@section('scripts')
<script type="text/javascript">
	$(document).ready(function(){
		$('#colors').change(function(){
			getInfo($(this).val())
		})
	})

	function getInfo(url){
		$.ajax({
			url: url,
			method: 'POST',
			dataType: 'json',
			beforeSend(){

			}
		})
		.done(function(result){
			if(result.success){
				$('#product-imgs').empty().removeAttr('class')
				$('#product-main-img').empty().removeAttr('class')

				$.each(result.images, function(index, image){
					let html = `<div class="product-preview"><img src="${image}" alt="{{ $product->name }}" title="{{ $product->name }}"/></div>`

					$('#product-imgs').append(html)
					$('#product-main-img').append(html)
				})

				renderSize(result.sizes[0])
				restart()
			}
		})
		.fail(function(){
			alert('FALHA AO TENTAR CARREGAR AS IMAGENS E TAMANHOS DO PRODUTO!')
		})
	}

	function renderSize(size){
		$('.product-current-price').text(Number(size.price).toFixed(2).toLocaleString('pt-BR', {
			style: 'currency',
			currency: 'BRL'
		}))

		$('.product-old-price').text(Number(size.price_previous).toFixed(2).toLocaleString('pt-BR', {
			style: 'currency',
			currency: 'BRL'
		}))

		if(size.quantity > 0){
			$('.product-available').text('Produto Disponível')
			$('.add-to-cart').show()
		}else{
			$('.product-available').text('Produto Indisponível')
			$('.add-to-cart').hide()
		}
	}

	function restart(){
		$('#product-main-img').slick({
	    	infinite: true,
	    	speed: 300,
	    	dots: false,
	    	arrows: true,
	    	fade: true,
	    	asNavFor: '#product-imgs'
	  	})

		// Product imgs Slick
		$('#product-imgs').slick({
		    slidesToShow: 3,
		    slidesToScroll: 1,
		    arrows: true,
		    centerMode: true,
		    focusOnSelect: true,
			centerPadding: 0,
			vertical: true,
		    asNavFor: '#product-main-img',
				responsive: [{
		        breakpoint: 991,
		        settings: {
					vertical: false,
					arrows: false,
					dots: true,
		        }
		    }]
		})

		// Product img zoom
		var zoomMainProduct = document.getElementById('product-main-img');
		if (zoomMainProduct) {
			$('#product-main-img .product-preview').zoom();
		}
	}
</script>
@endsection