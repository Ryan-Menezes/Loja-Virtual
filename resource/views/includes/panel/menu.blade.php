<nav class="menu">
	<div class="menu-header">
		<p>{{ auth()->user()->name }}</p>
		<p>{{ auth()->user()->email }}</p>
	</div>
	<ul>
		<a href="{{ route('panel') }}" title="Página Inicial"><li><i class="fas fa-home"></i> Início</li></a>

		@if(can('view.users'))
			<a href="{{ route('panel.users') }}" title="Página de Usuários"><li><i class="fas fa-users"></i> Usuários</li></a>
		@endif

		<div class="menu-header">
			<p><strong>Site</strong></p>
		</div>

		@if(can('view.pages'))
			<a href="{{ route('panel.pages') }}" title="Páginas"><li><i class="fas fa-file"></i> Páginas</li></a>
		@endif

		@if(can('view.clients'))
			<a href="{{ route('panel.clients') }}" title="Página de Clientes"><li><i class="fas fa-user-circle"></i> Clientes</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-users"></i> Clientes</li></a>
		@endif

		@if(can('view.categories'))
			<a href="{{ route('panel.categories') }}" title="Página de Categorias"><li><i class="fas fa-tag"></i> Categorias</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-tag"></i> Categorias</li></a>
		@endif

		@if(can('view.slideshow'))
			<a href="{{ route('panel.slideshow') }}" title="Página do Carrossel de Imagens"><li><i class="fas fa-image"></i> Carrossel</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-image"></i> Carrossel</li></a>
		@endif

		@if(can('view.banners'))
			<a href="{{ route('panel.banners') }}" title="Página de Banners"><li><i class="fas fa-images"></i> Banners</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-images"></i> Banners</li></a>
		@endif

		@if(can('view.partners'))
			<a href="{{ route('panel.partners') }}" title="Página de Parceiros"><li><i class="fas fa-handshake"></i> Parceiros</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-handshake"></i> Parceiros</li></a>
		@endif

		@if(can('view.galleries'))
			<a href="{{ route('panel.galleries') }}" title="Página de Galerias"><li><i class="fas fa-camera-retro"></i> Galerias</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-camera-retro"></i> Galerias</li></a>
		@endif

		@if(can('view.depoiments'))
			<a href="{{ route('panel.depoiments') }}" title="Página de Depoimentos"><li><i class="fas fa-smile"></i> Depoimentos</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-smile"></i> Depoimentos</li></a>
		@endif

		<div class="menu-header">
			<p><strong>Loja Virtual</strong></p>
		</div>

		@if(can('view.products'))
			<a href="{{ route('panel.products') }}" title="Página de Produtos"><li><i class="fas fa-box"></i> Produtos</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-box"></i> Produtos</li></a>
		@endif

		@if(can('view.ratings'))
			<a href="{{ route('panel.ratings') }}" title="Página de Avaliações"><li><i class="fas fa-star"></i> Avaliações</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-star"></i> Avaliações</li></a>
		@endif

		@if(can('view.requests'))
			<a href="{{ route('panel.requests') }}" title="Página de Pedidos"><li><i class="fas fa-clipboard-list"></i> Pedidos</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-clipboard-list"></i> Pedidos</li></a>
		@endif

		@if(can('view.coupons'))
			<a href="{{ route('panel.coupons') }}" title="Página de Cupons de Desconto"><li><i class="fas fa-ticket-alt"></i> Cupons</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-ticket-alt"></i> Cupons</li></a>
		@endif

		<div class="menu-header">
			<p><strong>Blog/Notícias</strong></p>
		</div>

		@if(can('view.notices'))
			<a href="{{ route('panel.notices') }}" title="Página de Artigos"><li><i class="fas fa-newspaper"></i> Artigos</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-newspaper"></i> Artigos</li></a>
		@endif

		@if(can('view.comments'))
			<a href="{{ route('panel.comments') }}" title="Página de Comentários"><li><i class="fas fa-comments"></i> Comentários</li></a>
		@else
			<a href="javascript:void(0)"><li class="disabled"><i class="fas fa-comments"></i> Comentários</li></a>
		@endif

		<div class="menu-header">
			<p><strong>Configurações</strong></p>
		</div>

		@if(can('all.system'))
			<a href="{{ route('panel.system') }}" title="Página de Configurações do Sistema"><li><i class="fas fa-cog"></i> Sistema</li></a>
		@endif

		@if(can('view.roles'))
			<a href="{{ route('panel.roles') }}" title="Página de Funções"><li><i class="fas fa-user-tie"></i> Funções</li></a>
		@endif

		@if(can('view.permissions'))
			<a href="{{ route('panel.permissions') }}" title="Página de Permissões"><li><i class="fas fa-lock"></i> Permissões</li></a>
		@endif
		
		<a href="{{ route('panel.logout') }}" title="Deslogar do Sistema"><li><i class="fas fa-sign-out-alt"></i> Sair</li></a>
	</ul>
</nav>