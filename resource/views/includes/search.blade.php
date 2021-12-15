<form action="{{ $urlSearch ?? null }}" method="POST" class="form mb-4">
	@if(can($can) && $create)
		<div class="row">
			<div class="col-md-10">
				<input type="search" name="search" placeholder="Buscar" class="form-control">
			</div>
			<div class="col-md-2">
				<a href="{{ $urlCreate ?? null }}" class="btn btn-danger float-end" title="{{ $title ?? 'Novo' }}">Novo <i class="fas fa-plus-circle"></i></a>
			</div>
		</div>
	@else
		<input type="search" name="search" placeholder="Buscar" class="form-control">
	@endif
</form>