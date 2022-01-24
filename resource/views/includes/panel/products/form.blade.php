@php
	$installments_amount = config('store.installments_amount');
@endphp

<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<div class="tabs">
		<ul>
			<li><a href="#tab-product">Produto</a></li>
			<li><a href="#tab-details">Cores, Imagens e Tamanhos</a></li>
			<li><a href="#tab-discounts">Descontos</a></li>
			<li><a href="#tab-categories">Categorias</a></li>
			<li><a href="#tab-products-related">Produtos Relacionados</a></li>
		</ul>

		<div class="product" id="tab-product">
			<input type="hidden" name="_method" value="{{ $method }}">
			<div class="row">
				@include('includes.components.form.input', [
					'type' => 'text', 
					'name' => 'name', 
					'title' => 'Nome', 
					'class' => 'required',
					'value' => (isset($product) ? $product->name : null),
					'required' => true
				])

				@include('includes.components.form.input', [
					'type' => 'text', 
					'name' => 'brand', 
					'title' => 'Marca', 
					'class' => 'required',
					'value' => (isset($product) ? $product->brand : null),
					'required' => true
				])

				<div class="col-md-6">
					@include('includes.components.form.select', [
						'name' => 'visible', 
						'title' => 'Visibilidade',
						'value' => (isset($product) ? $product->visible : 1),
						'options' => [
							1 => 'Visível',
							0 => 'Invisivel'
						],
						'class' => 'required',
						'required' => true
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.select', [
						'name' => 'ratings_active', 
						'title' => 'Avaliações',
						'value' => (isset($product) ? $product->ratings_active : 1),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.select', [
						'name' => 'freight_free', 
						'title' => 'Frete Grátis',
						'value' => (isset($product) ? $product->freight_free : 0),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])
				</div>

				<div class="col-md-6">
					@include('includes.components.form.select', [
						'name' => 'showcase', 
						'title' => 'Vitrine',
						'value' => (isset($product) ? $product->showcase : 0),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])
				</div>

				@include('includes.components.form.select', [
					'name' => 'installment_no_interest', 
					'title' => 'Quantidade de Parcelas sem Juros',
					'value' => (isset($product) ? $product->installment_no_interest : 2),
					'options' => array_combine(range(2, $installments_amount), range(2, $installments_amount)),
					'class' => 'required',
					'required' => true
				])

				@include('includes.components.form.textarea', [
					'name' => 'description',
					'title' => 'Descrição',
					'class' => 'required',
					'value' => (isset($product) ? $product->description : null),
					'required' => true
				])

				@include('includes.components.form.textarea', [
					'name' => 'details',
					'title' => 'Detalhes',
					'class' => 'textarea-editor required',
					'value' => (isset($product) ? $product->details : null),
					'required' => true
				])

				@isset($product)
					@include('includes.components.form.youtubeeditor', [
						'name' => 'video',
						'notoptions' => true,
						'url' => 'https://www.youtube.com/embed/' . $product->videoFormat,
						'texturl' => $product->video
					])
				@else
					@include('includes.components.form.youtubeeditor', [
						'name' => 'video',
						'notoptions' => true
					])
				@endisset
			</div>
		</div>

		<div class="details" id="tab-details">
			<div class="content-elements">
				@if(isset($product))
					@foreach($product->colors as $color)
						@include('includes.components.form.coloreditor', [
							'description' => $color->description,
							'hex' => $color->hex,
							'images' => $color->images,
							'sizes' => $color->sizes,
							'urlimage' => route('panel.products.component', ['name' => 'form.imageeditor']),
							'urlsize' => route('panel.products.component', ['name' => 'form.sizeeditor']),
							'id' => $color->id
						])
					@endforeach
				@endif
			</div>

			<div class="row text-center mt-5">
				<div class="col-md-12 text-center p-4 bg-primary text-white" style="cursor: pointer;" title="Clique aqui para adicionar uma nova cor" data-urlajax="{{ route('panel.products.component', ['name' => 'form.coloreditor']) }}" data-urlimage="{{ route('panel.products.component', ['name' => 'form.imageeditor']) }}" data-urlsize="{{ route('panel.products.component', ['name' => 'form.sizeeditor']) }}">NOVA COR <i class="fas fa-fill-drip"></i></div>
			</div>
		</div>

		@php
			$discounts = [];
			if(isset($product)){
				foreach($product->discounts as $discount){
					$discounts[$discount->installment] = $discount;
				}
			}
		@endphp

		<div class="discounts" id="tab-discounts">
			<div class="accordion">
				@for($i = 1; $i <= $installments_amount; $i++)
				@if($i == 1)
				<h3>Pagamento à vista</h3>
				@else
				<h3>Parcelado {{ $i }} vezes</h3>
				@endif
				<div class="row">
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'type' => 'number',
							'name' => 'percents[]',
							'title' => 'Porcentagem do Desconto(%)',
							'min' => 0,
							'max' => 100,
							'value' => (array_key_exists($i, $discounts) ? $discounts[$i]->percent : null)
						])
					</div>
					<div class="col-md-6">
						@include('includes.components.form.input', [
							'type' => 'date',
							'name' => 'expirations[]',
							'title' => 'Esse desconto vai até:',
							'value' => (array_key_exists($i, $discounts) ? $discounts[$i]->expiration : null)
						])
					</div>
				</div>
				@endfor
			</div>
		</div>

		<div class="categories" id="tab-categories">
			<div class="accordion">
				@foreach($categories as $category)
					@if($category->subcategories->count() > 0)
					<h3>{{ $category->name }}</h3>
					<div>
						@include('includes.components.form.checkboxes', [
							'name' => 'subcategories[]',
							'title' => 'Sub Categorias de ' . $category->name,
							'values' => $category->subcategories->pluck('name', 'id'),
							'checks' => (isset($product) ? $product->subcategories->pluck('id')->all() : null)
						])
					</div>
					@endif
				@endforeach
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
						<div class="card-header"><strong>Produtos Adicionados</strong></div>
						<div class="card-body">
							<ul class="list-group products_related_selected">
							@if(isset($product))
								@foreach($product->relateds as $related)
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<input type="hidden" name="products_related[]" value="{{ $related->product_related_id }}" />
									<p class="m-0 p-0">{{ $related->productRelated->name }}</p>
									<span class="badge btn btn-danger btn-sm rounded-pill" data-removeid="{{ $related->product_related_id }}">&times;</span>
								</li>
								@endforeach
							@endif
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<button type="submit" class="btn btn-danger m-3">Salvar <i class="fas fa-save"></i></button>
	</div>
</form>