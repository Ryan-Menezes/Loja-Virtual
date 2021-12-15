<nav class="navbar navbar-dark bg-dark p-3 m-0">
  	<div class="container-fluid">
    		<div class="row">
      			<div class="col-md-2">
      				  <span class="open-menu" title="Abrir/Fechar Menu">&#9776;</span>
      			</div>
      			<div class="col-md-5">
      				  <span class="navbar-brand m-0 h1">Painel {{ config('app.name') }}</span>
      			</div>
    		</div>
    		<li class="nav-item dropdown">
  	        <a class="dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ auth()->user()->name }}</a>
  	        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
  	            <li><a class="dropdown-item" href="{{ route('panel.logout') }}" title="Deslogar do Sistema"><i class="fas fa-sign-out-alt"></i> Sair</a></li>
  	        </ul>
  	    </li>
  	</div>
</nav>