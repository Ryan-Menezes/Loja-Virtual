@extends('templates.panel')

@section('title', 'Início')

@section('container')
	<div class="container-main">
		<div class="cards-container">
			@if(can('view.users'))
				@include('includes.components.card', ['title' => 'Usuários', 'link' => route('panel.users'), 'class' => 'bg-primary', 'amount' => $usersCount, 'icon' => 'fas fa-users'])
			@endif

			@if(can('view.clients'))
				@include('includes.components.card', ['title' => 'Clientes', 'link' => route('panel.clients'), 'class' => 'bg-danger', 'amount' => $clientsCount, 'icon' => 'fas fa-user-circle'])
			@endif

			@if(can('view.products'))
				@include('includes.components.card', ['title' => 'Produtos', 'link' => route('panel.products'), 'class' => 'bg-danger', 'amount' => $productsCount, 'icon' => 'fas fa-box'])
			@endif

			@if(can('view.assessments'))
				@include('includes.components.card', ['title' => 'Avaliações', 'link' => route('panel.assessments'), 'class' => 'bg-danger', 'amount' => $assessmentsCount, 'icon' => 'fas fa-star'])
			@endif

			@if(can('view.requests'))
				@include('includes.components.card', ['title' => 'Pedidos', 'link' => route('panel.requests'), 'class' => 'bg-danger', 'amount' => $requestsCount, 'icon' => 'fas fa-list'])
			@endif

			@if(can('view.coupons'))
				@include('includes.components.card', ['title' => 'Cupons', 'link' => route('panel.coupons'), 'class' => 'bg-danger', 'amount' => $couponsCount, 'icon' => 'fas fa-percent'])
			@endif

			@if(can('view.slideshow'))
				@include('includes.components.card', ['title' => 'Carrossel', 'link' => route('panel.slideshow'), 'class' => 'bg-danger', 'amount' => $slideshowCount, 'icon' => 'fas fa-image'])
			@endif

			@if(can('view.banners'))
				@include('includes.components.card', ['title' => 'Banners', 'link' => route('panel.banners'), 'class' => 'bg-danger', 'amount' => $bannersCount, 'icon' => 'fas fa-images'])
			@endif

			@if(can('view.notices'))
				@include('includes.components.card', ['title' => 'Blog', 'link' => route('panel.notices'), 'class' => 'bg-danger', 'amount' => $noticesCount, 'icon' => 'fas fa-newspaper'])
			@endif

			@if(can('view.comments'))
				@include('includes.components.card', ['title' => 'Comentários', 'link' => route('panel.comments'), 'class' => 'bg-info', 'amount' => $commentsCount, 'icon' => 'fas fa-comments'])
			@endif

			@if(can('view.categories'))
				@include('includes.components.card', ['title' => 'Categorias', 'link' => route('panel.categories'), 'class' => 'bg-success', 'amount' => $categoriesCount, 'icon' => 'fas fa-tag'])
			@endif

			@if(can('view.roles'))
				@include('includes.components.card', ['title' => 'Funções', 'link' => route('panel.roles'), 'class' => 'bg-dark', 'amount' => $rolesCount, 'icon' => 'fas fa-user-tag'])
			@endif

			@if(can('view.permissions'))
				@include('includes.components.card', ['title' => 'Permissões', 'link' => route('panel.permissions'), 'class' => 'bg-warning', 'amount' => $permissionsCount, 'icon' => 'fas fa-lock'])
			@endif
		</div>
	</div>
@endsection