@extends('templates.panel')

@section('title', 'Início')

@section('container')
<div class="container-main">
	<div class="card mb-4">
		<div class="card-header p-3"><strong>Geral</strong></div>
		<div class="card-body">
			<div class="cards-container">
				@if(can('view.users'))
					@include('includes.components.card', ['title' => 'Usuários', 'link' => route('panel.users'), 'class' => 'text-primary', 'amount' => $usersCount, 'icon' => 'fas fa-users'])
				@endif
			</div>
		</div>
	</div>

	@if(can('view.clients') || can('view.categories') || can('view.slideshow') || can('view.banners') || can('view.depoiments'))
	<div class="card mb-4">
		<div class="card-header p-3"><strong>Site</strong></div>
		<div class="card-body">
			<div class="cards-container">
				@if(can('view.pages'))
					@include('includes.components.card', ['title' => 'Páginas', 'link' => route('panel.pages'), 'class' => 'text-secondary', 'amount' => $pagesCount, 'icon' => 'fas fa-file'])
				@endif

				@if(can('view.clients'))
					@include('includes.components.card', ['title' => 'Clientes', 'link' => route('panel.clients'), 'class' => 'text-warning', 'amount' => $clientsCount, 'icon' => 'fas fa-user-circle'])
				@endif
	
				@if(can('view.categories'))
					@include('includes.components.card', ['title' => 'Categorias', 'link' => route('panel.categories'), 'class' => 'text-success', 'amount' => $categoriesCount, 'icon' => 'fas fa-tag'])
				@endif
	
				@if(can('view.slideshow'))
					@include('includes.components.card', ['title' => 'Carrossel', 'link' => route('panel.slideshow'), 'class' => 'text-dark', 'amount' => $slideshowCount, 'icon' => 'fas fa-image'])
				@endif
	
				@if(can('view.partners'))
					@include('includes.components.card', ['title' => 'Parceiros', 'link' => route('panel.partners'), 'class' => 'text-info', 'amount' => $partnersCount, 'icon' => 'fas fa-handshake'])
				@endif
	
				@if(can('view.galleries'))
					@include('includes.components.card', ['title' => 'Galerias', 'link' => route('panel.galleries'), 'class' => 'text-primary', 'amount' => $galleriesCount, 'icon' => 'fas fa-camera-retro'])
				@endif
	
				@if(can('view.banners'))
					@include('includes.components.card', ['title' => 'Banners', 'link' => route('panel.banners'), 'class' => 'text-secondary', 'amount' => $bannersCount, 'icon' => 'fas fa-images'])
				@endif
	
				@if(can('view.depoiments'))
					@include('includes.components.card', ['title' => 'Depoimentos', 'link' => route('panel.depoiments'), 'class' => 'text-danger', 'amount' => $depoimentsCount, 'icon' => 'fas fa-smile'])
				@endif
			</div>
		</div>
	</div>
	@endif

	@if(can('view.products') || can('view.ratings') || can('view.requests') || can('view.coupons'))
	<div class="card mb-4"">
		<div class="card-header p-3"><strong>Loja Virtual</strong></div>
		<div class="card-body">
			<div class="cards-container">
				@if(can('view.products'))
					@include('includes.components.card', ['title' => 'Produtos', 'link' => route('panel.products'), 'class' => 'text-success', 'amount' => $productsCount, 'icon' => 'fas fa-box'])
				@endif
	
				@if(can('view.ratings'))
					@include('includes.components.card', ['title' => 'Avaliações', 'link' => route('panel.ratings'), 'class' => 'text-warning', 'amount' => $ratingsCount, 'icon' => 'fas fa-star'])
				@endif
	
				@if(can('view.requests'))
					@include('includes.components.card', ['title' => 'Pedidos', 'link' => route('panel.requests'), 'class' => 'text-info', 'amount' => $requestsCount, 'icon' => 'fas fa-clipboard-list'])
				@endif
	
				@if(can('view.coupons'))
					@include('includes.components.card', ['title' => 'Cupons', 'link' => route('panel.coupons'), 'class' => 'text-dark', 'amount' => $couponsCount, 'icon' => 'fas fa-ticket-alt'])
				@endif
			</div>
		</div>
	</div>
	@endif

	@if(can('view.notices') || can('view.comments'))
	<div class="card mb-4">
		<div class="card-header p-3"><strong>Blog</strong></div>
		<div class="card-body">
			<div class="cards-container">
				@if(can('view.notices'))
					@include('includes.components.card', ['title' => 'Artigos', 'link' => route('panel.notices'), 'class' => 'text-danger', 'amount' => $noticesCount, 'icon' => 'fas fa-newspaper'])
				@endif

				@if(can('view.comments'))
					@include('includes.components.card', ['title' => 'Comentários', 'link' => route('panel.comments'), 'class' => 'text-info', 'amount' => $commentsCount, 'icon' => 'fas fa-comments'])
				@endif
			</div>
		</div>
	</div>
	@endif

	@if(can('view.roles') || can('view.permissions'))
	<div class="card mb-4">
		<div class="card-header p-3"><strong>Configurações</strong></div>
		<div class="card-body">
			<div class="cards-container">
				@if(can('view.roles'))
					@include('includes.components.card', ['title' => 'Funções', 'link' => route('panel.roles'), 'class' => 'text-dark', 'amount' => $rolesCount, 'icon' => 'fas fa-user-tag'])
				@endif

				@if(can('view.permissions'))
					@include('includes.components.card', ['title' => 'Permissões', 'link' => route('panel.permissions'), 'class' => 'text-warning', 'amount' => $permissionsCount, 'icon' => 'fas fa-lock'])
				@endif
			</div>
		</div>
	</div>
	@endif
</div>
@endsection