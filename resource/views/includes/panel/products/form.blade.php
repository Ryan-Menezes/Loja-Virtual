<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<div class="tabs">
		<ul>
			<li><a href="#tab-product">Produto</a></li>
			<li><a href="#tab-details">Cores, Imagens e Tamanhos</a></li>
			<li><a href="#tab-categories">Categorias</a></li>
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

				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'number', 
						'name' => 'promotion_percent', 
						'title' => 'Promoção(%)', 
						'min' => 0,
						'max' => 100,
						'value' => (isset($product) ? $product->promotion_percent : null)
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'date', 
						'name' => 'promotion_expiration', 
						'title' => 'Expiração da Promoção', 
						'value' => (isset($product) ? $product->promotion_expiration : null)
					])
				</div>

				<div class="col-md-4">
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
				<div class="col-md-4">
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
				<div class="col-md-4">
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

				@include('includes.components.form.textarea', [
					'name' => 'description',
					'title' => 'Descrição',
					'class' => 'required',
					'value' => (isset($product) ? $product->description : null),
					'required' => true
				])

				<label class="form-label">Detalhes:</label>
				@include('includes.components.form.texteditor', [
					'name' => 'details',
					'title' => 'Detalhes',
					'class' => 'required',
					'value' => (isset($product) ? $product->details : null),
					'notoptions' => true,
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
			<div class="content-elements sortable">
				@if(isset($product))
					@foreach($product->colors as $color)
						@include('includes.components.form.coloreditor', [
							'description' => $color->description,
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
				<div class="col-md-12">
					<button type="button" class="btn border" data-urlajax="{{ route('panel.products.component', ['name' => 'form.coloreditor']) }}" data-urlimage="{{ route('panel.products.component', ['name' => 'form.imageeditor']) }}" data-urlsize="{{ route('panel.products.component', ['name' => 'form.sizeeditor']) }}">Adicionar uma Cor <i class="fas fa-fill-drip"></i></button>
				</div>
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
	</div>

	<button type="submit" class="btn btn-danger mt-3">Salvar <i class="fas fa-save"></i></button>
</form>