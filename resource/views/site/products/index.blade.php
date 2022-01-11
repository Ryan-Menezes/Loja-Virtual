@extends('templates.site')

@section('title', 'Produtos')
@section('url', route('site.products'))
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
							@if($category->products()->count())
							<li>
								<p><strong>{{ $category->name }} ({{ $category->products()->count() }})</strong></p>

								@if($category->subcategories->count())
								<ul style="margin-left: 40px;">
									@foreach($category->subcategories()->orderBy('name')->get() as $subcategory)
										@if($subcategory->products->count())
										<li>
											<a href="{{ route('site.products.category.subcategory', ['category' => $category->slug, 'subcategory' => $subcategory->slug]) }}" title="Produtos da Sub Categoria: {{ $subcategory->name }}">{{ $subcategory->name }}({{ $subcategory->products->count() }})</a>
										</li>
										@endif
									@endforeach
								</ul>
								@endif
							</li>
							@endif
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
					@include('includes.site.products.card')
					@endforeach
				</div>

				<!-- store bottom filter -->
				@include('includes.site.paginator', ['route' => 'site.products'])
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