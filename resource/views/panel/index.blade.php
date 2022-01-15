@extends('templates.panel')

@section('title', 'Início')

@section('container')
<div class="container-main">
	<div class="border mb-4 p-4">
		<div class="cards-container">
			@if(can('view.users'))
				@include('includes.components.card', ['title' => 'Usuários', 'link' => route('panel.users'), 'class' => 'bg-primary', 'amount' => $usersCount, 'icon' => 'fas fa-users'])
			@endif
		</div>
	</div>

	@if(can('view.clients') || can('view.categories') || can('view.slideshow') || can('view.banners') || can('view.depoiments'))
	<div class="border mb-4 p-4">
		<h2>Site</h2><hr/>

		<div class="cards-container">
			@if(can('view.clients'))
				@include('includes.components.card', ['title' => 'Clientes', 'link' => route('panel.clients'), 'class' => 'bg-warning', 'amount' => $clientsCount, 'icon' => 'fas fa-user-circle'])
			@endif

			@if(can('view.categories'))
				@include('includes.components.card', ['title' => 'Categorias', 'link' => route('panel.categories'), 'class' => 'bg-success', 'amount' => $categoriesCount, 'icon' => 'fas fa-tag'])
			@endif

			@if(can('view.slideshow'))
				@include('includes.components.card', ['title' => 'Carrossel', 'link' => route('panel.slideshow'), 'class' => 'bg-dark', 'amount' => $slideshowCount, 'icon' => 'fas fa-image'])
			@endif

			@if(can('view.banners'))
				@include('includes.components.card', ['title' => 'Banners', 'link' => route('panel.banners'), 'class' => 'bg-secondary', 'amount' => $bannersCount, 'icon' => 'fas fa-images'])
			@endif

			@if(can('view.depoiments'))
				@include('includes.components.card', ['title' => 'Depoimentos', 'link' => route('panel.depoiments'), 'class' => 'bg-danger', 'amount' => $depoimentsCount, 'icon' => 'fas fa-smile'])
			@endif
		</div>
	
		<div id="pages_access" class="mt-4"></div>
	</div>
	@endif

	@if(can('view.products') || can('view.ratings') || can('view.requests') || can('view.coupons'))
	<div class="border mb-4 p-4">
		<h2 class="mt-4">Loja Virtual</h2><hr/>

		<div class="cards-container">
			@if(can('view.products'))
				@include('includes.components.card', ['title' => 'Produtos', 'link' => route('panel.products'), 'class' => 'bg-success', 'amount' => $productsCount, 'icon' => 'fas fa-box'])
			@endif

			@if(can('view.ratings'))
				@include('includes.components.card', ['title' => 'Avaliações', 'link' => route('panel.ratings'), 'class' => 'bg-warning', 'amount' => $ratingsCount, 'icon' => 'fas fa-star'])
			@endif

			@if(can('view.requests'))
				@include('includes.components.card', ['title' => 'Pedidos', 'link' => route('panel.requests'), 'class' => 'bg-info', 'amount' => $requestsCount, 'icon' => 'fas fa-list'])
			@endif

			@if(can('view.coupons'))
				@include('includes.components.card', ['title' => 'Cupons', 'link' => route('panel.coupons'), 'class' => 'bg-dark', 'amount' => $couponsCount, 'icon' => 'fas fa-percent'])
			@endif
		</div>

		<div class="row">
			<div class="col-md-6">
				<div id="products_store" class="mt-4"></div>
			</div>
			<div class="col-md-6">
				<div id="products_access" class="mt-4"></div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div id="products_rating" class="mt-4"></div>
			</div>
			<div class="col-md-6">
				<div id="request_amount" class="mt-4"></div>
			</div>
		</div>
	</div>
	@endif

	@if(can('view.notices') || can('view.comments'))
	<div class="border mb-4 p-4">
		<h2 class="mt-4">Blog</h2><hr/>

		<div class="cards-container">
			@if(can('view.notices'))
				@include('includes.components.card', ['title' => 'Artigos', 'link' => route('panel.notices'), 'class' => 'bg-danger', 'amount' => $noticesCount, 'icon' => 'fas fa-newspaper'])
			@endif

			@if(can('view.comments'))
				@include('includes.components.card', ['title' => 'Comentários', 'link' => route('panel.comments'), 'class' => 'bg-info', 'amount' => $commentsCount, 'icon' => 'fas fa-comments'])
			@endif
		</div>

		<div id="notices_access" class="mt-4"></div>
	</div>
	@endif

	@if(can('view.roles') || can('view.permissions'))
	<div class="border mb-4 p-4">
		<h2 class="mt-4">Configurações</h2><hr/>

		<div class="cards-container">
			@if(can('view.roles'))
				@include('includes.components.card', ['title' => 'Funções', 'link' => route('panel.roles'), 'class' => 'bg-dark', 'amount' => $rolesCount, 'icon' => 'fas fa-user-tag'])
			@endif

			@if(can('view.permissions'))
				@include('includes.components.card', ['title' => 'Permissões', 'link' => route('panel.permissions'), 'class' => 'bg-warning', 'amount' => $permissionsCount, 'icon' => 'fas fa-lock'])
			@endif
		</div>
	</div>
	@endif
</div>
@endsection

@section('scripts')
<script type="text/javascript">
	createChart('bar', 'Páginas mais acessadas', '#pages_access', 'Número de Acessos', [{{ implode(', ', $pages_access) }}], '#f56342', ['{!! implode('\', \'', array_keys($pages_access)) !!}'])
	createChart('bar', 'Produtos mais vendidos', '#products_store', 'Total de Vendas', [31, 40, 28, 51, 42], '#007d21', ['PC Gamer', 'Celular', 'Creme Pra Cabelo', 'Mouse', 'Teclado'])
	createChart('bar', 'Produtos mais acessados', '#products_access', 'Número de Acessos', [{{ implode(', ', $products_access) }}], '#f5ce42', ['{!! implode('\', \'', array_keys($products_access)) !!}'])
	createChart('bar', 'Produtos mais bem avaliados', '#products_rating', 'Média de Avaliações', [{{ implode(', ', $products_rating) }}], '#ed186a', ['{!! implode('\', \'', array_keys($products_rating)) !!}'])
	createChart('area', 'Pedidos feitos nos últimos meses', '#request_amount', 'Total de Pedidos', [31, 40, 28, 51, 42, 109, 100, 40, 28, 51, 42, 100], '#1858ed', ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'])
	createChart('bar', 'Artigos mais acessados', '#notices_access', 'Número de Acessos', [{{ implode(', ', $notices_access) }}], '#f56342', ['{!! implode('\', \'', array_keys($notices_access)) !!}'])
</script>
@endsection