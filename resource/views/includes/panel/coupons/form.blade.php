<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	@include('includes.components.form.input', [
		'type' => 'text', 
		'name' => 'code', 
		'title' => 'Código', 
		'value' => (isset($coupon) ? $coupon->code : null),
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'number', 
		'name' => 'percent',
		'title' => 'Porcentagem',
		'value' => (isset($coupon) ? $coupon->percent : null),
		'min' => 1,
		'max' => 100,
		'class' => 'required',
		'required' => true
	])

	@include('includes.components.form.input', [
		'type' => 'date', 
		'name' => 'expiration', 
		'title' => 'Data de Expiração', 
		'value' => (isset($coupon) ? $coupon->expiration : null)
	])

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Esse cupom está voltado para as categorias:</strong></div>
		<div class="card-body">
			<div class="cards-container">
				<div class="accordion" style="grid-column: 1/6;">
					@foreach($categories as $category)
						@if($category->subcategories->count() > 0)
						<h3>{{ $category->name }}</h3>
						<div>
							@include('includes.components.form.checkboxes', [
								'name' => 'subcategories[]',
								'title' => 'Sub Categorias de ' . $category->name,
								'values' => $category->subcategories->pluck('name', 'id'),
								'checks' => (isset($coupon) ? $coupon->subcategories->pluck('id')->all() : null)
							])
						</div>
						@endif
					@endforeach
				</div>
			</div>
		</div>
	</div>

	<div class="products_related" id="tab-products-related">
		<div class="row">
			<div class="col-md-6">
				<div class="input-group input-group-lg">
					<input type="search" placeholder="Pesquise por algum produto..." name="search" class="form-control" id="search_product_related" data-action="{{ route('panel.create.products') }}">
					<span class="input-group-text"><i class="fas fa-search"></i></span>
				</div>

				<div class="list-group mt-4 products_related_list"></div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header"><strong>Produtos removidos do desconto desse cupom</strong></div>
					<div class="card-body">
						<ul class="list-group products_related_selected">
						@if(isset($coupon))
							@foreach($coupon->products as $product)
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<input type="hidden" name="products_related[]" value="{{ $product->id }}" />
								<p class="m-0 p-0">{{ $product->name }}</p>
								<span class="badge btn btn-danger btn-sm rounded-pill" data-removeid="{{ $product->id }}">&times;</span>
							</li>
							@endforeach
						@endif
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>