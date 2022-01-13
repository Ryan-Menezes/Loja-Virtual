@extends('templates.site')

@section('title', $product->name)
@section('url', route('site.products.show', ['slug' => $product->slug]))
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

				<div class="input-container" style="margin-top: 40px;">
	    			<form action="{{ route('site.products.show.freight', ['slug' => $product->slug]) }}" method="POST" data-container=".result-frete">
	    				<input type="hidden" name="size_id" value="{{ $product->sizes->first()->id }}">
			    		<input type="text" name="postal_code" placeholder="CEP para calcular o frete" class="cep-mask">
			    		<button type="submit">CALCULAR</button>
			    	</form>
			    	<div class="result-frete"></div>
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

						@if($product->getDiscount(1) > 0)
						<p><strong class="price-discount">R$ {{ number_format($product->sizes->first()->getPriceDiscount(1), 2, ',', '.') }}</strong> <small>à vista com {{ $product->getDiscount(1) }}% de desconto</small></p>
						@endif
					</div>
					<p>{!! str_ireplace("\n", '<br/>', $product->description) !!}</p>

					<div class="product-options">
						<div>
							@foreach($product->colors as $color)
								@if($color->sizes->count())
								<div class="product-color" title="{{ $color->description }}" style="background-color: {{ $color->hex }}" data-colorurl="{{ route('site.products.info', ['id' => $color->id]) }}"></div>
								@endif
							@endforeach
						</div>
						<div id="sizes" style="margin-top: 20px;">
							@foreach($product->colors->first()->sizes as $size)
							<div class="product-size" data-size="{{ $size->id }}-{{ $loop->index }}">{{ $size->description }}</div>
							@endforeach
						</div>
					</div>
					
					<form action="{{ route('site.cart.store', ['product_id' => $product->id, 'size_id' => $product->sizes->first()->id]) }}" method="POST" class="add-to-cart" @if($product->sizes->first()->quantity == 0) style="display: none" @endif>
						<div class="qty-label">
							Qtde
							<div class="input-number">
								<input type="number" value="1" name="quantity" min="1" max="{{ $product->sizes->first()->quantity }}" required>
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
						<button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Adicionar ao Carrinho</button>
					</form>

					<ul class="product-btns">
						<li><a href="{{ route('site.myaccount.favorites.add', ['id' => $product->id]) }}" title="Adicionar aos Favoritos" class="add-favorite-btn-ajax" data-url="{{ route('site.myaccount.favorites.add', ['id' => $product->id]) }}"><i class="fa fa-heart-o"></i> Favoritar</a></li>
					</ul>

					<section style="margin-top: 40px;">
				        <!-- Your share button code -->
				        <div class="fb-share-button mt-1" data-href="{{ urlencode(route('site.products.show', ['slug' => $product->slug])) }}" data-layout="button" data-size="large" title="Compartilhe no Facebook"></div>
				        <a href="https://twitter.com/intent/tweet?url={{ urlencode(route('site.products.show', ['slug' => $product->slug])) }}&text={{ $product->name }}" class="btn btn-sm bg-twitter mt-0 mb-2 share-btn" target="_blank" title="Compartilhe no Twitter"><i class="fa fa-twitter"></i> Share</a>
				        <a href="https://api.whatsapp.com/send?text={{ urlencode($product->name . ': ' . route('site.products.show', ['slug' => $product->slug])) }}" target="_blank" class="btn btn-sm bg-whatsapp mt-0 mb-2 share-btn" title="Compartilhe no WhatsApp"><i class="fa fa-whatsapp"></i> Share</a>

				        <!-- Load Facebook SDK for JavaScript -->
				        <div id="fb-root"></div>
				    </section>

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
									{!! str_ireplace("\n", '<br/>', $product->details) !!}
									<br /><br />
									@if($product->video)
										@include('includes.components.youtube.player', [
											'url' => 'https://www.youtube.com/embed/' . $product->videoFormat
										])
									@endif
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
										@if($client && $client->ratings->where('product_id', $product->id)->count() == 0)
										@include('includes.messages')

										<form action="{{ route('site.products.show.ratings.send', ['slug' => $product->slug]) }}" method="POST" class="review-form">
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
										@else
										<p>Para avaliar este produto, você precisa estar logado, ter no minímo feita a compra de uma ou mais unidades desse produto e só é possível avaliar uma única vez por produto!</p>
										@endif
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
											@foreach($ratings as $rating)
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
										@include('includes.site.paginator', ['route' => 'site.products.show', 'params' => ['slug' => $product->slug]])
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
	let sizes

	$(document).ready(function(){
		$('[data-colorurl]').click(function(){
			getInfo($(this).data().colorurl)
		})

		$('*').delegate('[data-size]', 'click', function(){
			let value = $(this).data().size.split('-')

			renderSize(sizes[value[1]])
			return false
		})

		getInfo($('[data-colorurl]:first').data().colorurl)
	})

	function getInfo(url){
		$.ajax({
			url: url,
			method: 'POST',
			dataType: 'json',
			beforeSend(){
				showLoad()
			},
			complete: function(){
				hideLoad()
			}
		})
		.done(function(result){
			if(result.success){
				$('#product-imgs').empty().removeAttr('class')
				$('#product-main-img').empty().removeAttr('class')
				$('#sizes').empty()

				$.each(result.images, function(index, image){
					let html = `<div class="product-preview"><img src="${image}" alt="{{ $product->name }}" title="{{ $product->name }}"/></div>`

					$('#product-imgs').append(html)
					$('#product-main-img').append(html)
				})

				$.each(result.sizes, function(index, size){
					let html = `<div class="product-size" data-size="${size.id}-${index}">${size.description}</div>`

					$('#sizes').append(html)
				})

				sizes = result.sizes
				renderSize(result.sizes[0])
				restart()
			}
		})
		.fail(function(){
			alert('FALHA AO TENTAR CARREGAR AS IMAGENS E TAMANHOS DO PRODUTO!')
		})
	}

	function renderSize(size){
		if(size != undefined){
			$('input[name=size_id]').val(size.id)

			$('.product-current-price').text((Number(size.price)).toLocaleString('pt-BR', {
				style: 'currency', 
				currency: 'BRL'
			}))

			$('.product-old-price').text((Number(size.price_previous)).toLocaleString('pt-BR', {
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

			$('.price-discount').text((Number(size.priceDiscount)).toLocaleString('pt-BR', {
				style: 'currency', 
				currency: 'BRL'
			}))

			let form = window.document.querySelector('.add-to-cart')

			if(form){
				let url = form.action
				url = url.replace(/^(.*)(\/.*)$/ig, '$1/' + size.id)
				form.action = url
			}
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
<script type="text/javascript">
    // Facebook
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Outros compartilhamentos
    window.document.addEventListener("DOMContentLoaded", function() {
        $('.share-btn').click(function(){
            event.preventDefault()

            window.open(this.href, '_blank', 'width=700,height=350')
        })
    }, false);

    // Script para responder um comentário
    $('[data-startresponse]').click(function(){
        $('.form-response').hide()

        let data = $(this).data()

        $(`#${data.startresponse}`).show()
    })

    $('[data-cancelresponse]').click(function(){
        $('.form-response').hide()
        
        let data = $(this).data()

        $(`#${data.cancelresponse}`).hide()
    })
</script>
@endsection