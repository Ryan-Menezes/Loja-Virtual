@extends('templates.site')

@section('title', isset($subcategory) ? $subcategory->name : 'Produtos')
@section('url', isset($subcategory) ? route('site.products.category.subcategory', ['category' => $subcategory->category->slug, 'subcategory' => $subcategory->slug]) : route('site.products'))
@section('description', 'Busque por um produto expecífico')

@section('container')
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- ASIDE -->
			<form method="POST" id="aside" class="col-md-3">
				<input type="hidden" name="search" value="{{ $search ?? null }}">

				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Categorias</h3>
					<ul class="checkbox-filter">
						@foreach($categories as $category)
							@if(count($category->subcategories))
							<li>
								<p><strong>{{ $category->name }}</strong></p>

								<ul style="margin-left: 40px;">
									@foreach($category->subcategories as $subcategory)
										<li>
											<a href="{{ route('site.products.category.subcategory', ['category' => $category->slug, 'subcategory' => $subcategory->slug]) }}" title="Produtos da Sub Categoria: {{ $subcategory->name }}">{{ $subcategory->name }}</a>
										</li>
									@endforeach
								</ul>
							</li>
							@endif
						@endforeach
					</ul>
				</div>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<div class="aside" style="margin-top: 40px;">
					<h3 class="aside-title">Frete</h3>
					<div class="input-checkbox">
						@isset($builder['freight_free'])
						<input type="checkbox" name="freight_free" value="1" id="freight_free" checked>
						@else
						<input type="checkbox" name="freight_free" value="1" id="freight_free">
						@endisset
						<label for="freight_free"><span></span>Frete Grátis</label>
					</div>
				</div>
				<!-- /aside Widget -->

				<button type="submit" class="primary-btn cta-btn" style="margin-top: 20px; width: 100%;">Aplicar Filtro</button>
			</form>
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
				@include('includes.site.paginator')
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