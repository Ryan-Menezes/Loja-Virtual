<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<input type="hidden" name="_method" value="{{ $method }}">
	<div class="row">
		@include('includes.components.form.file', [
			'type' => 'file', 
			'name' => 'poster', 
			'title' => 'Capa', 
			'accept' => 'image/*',
			'class' => (!isset($notice) ? 'required' : null)
		])

		@include('includes.components.form.input', [
			'type' => 'text', 
			'name' => 'title', 
			'title' => 'Titulo', 
			'class' => 'required',
			'value' => (isset($notice) ? $notice->title : null)
		])

		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'tags', 
				'title' => 'Tags', 
				'value' => (isset($notice) ? $notice->tags : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'name' => 'visible', 
				'title' => 'Visibilidade',
				'value' => (isset($notice) ? $notice->visible : null),
				'options' => [
					0 => 'Invisivel',
					1 => 'Visível'
				]
			])
		</div>

		@include('includes.components.form.textarea', [
			'name' => 'description',
			'title' => 'Descrição',
			'class' => 'required',
			'value' => (isset($notice) ? $notice->description : null)
		])

		@include('includes.components.form.checkboxes', [
			'name' => 'categories[]',
			'title' => 'Categorias',
			'values' => $categories,
			'checks' => (isset($notice) ? $notice->categories->pluck('id')->all() : null)
		])
	</div>

	<br><h2>Conteúdo</h2><hr>

	<div class="content-notice">
		@php
			$images = [];
		@endphp
		
		@if(isset($notice))
			@foreach(json_decode($notice->content)->elements as $element)
				@if($element->type == 'title')
					@include('includes.components.form.titleeditor', [
						'value' => $element->content,
						'tag' => $element->tag
					])
				@elseif($element->type == 'paragraph')
					@include('includes.components.form.texteditor', [
						'name' => 'paragraphs[]',
						'class' => 'paragraph draggable required',
						'title' => 'Digite o texto do parágrafo...',
						'value' => $element->content
					])
				@elseif($element->type == 'youtube')
					@include('includes.components.form.youtubeeditor', [
						'url' => 'https://www.youtube.com/embed/' . $element->videocode,
						'texturl' => $element->url
					])
				@elseif($element->type == 'image')
					@include('includes.components.form.imageeditor', [
						'title' => $element->title,
						'image' => url('storage/app/public/' . $element->src),
						'imageRemove' => $element->src
					])

					@php
						$images[] = $element->src;
					@endphp
				@endif
			@endforeach
		@else
			@include('includes.components.form.titleeditor')

			@include('includes.components.form.texteditor', [
				'name' => 'paragraphs[]',
				'class' => 'paragraph',
				'title' => 'Digite o texto do parágrafo...'
			])

			@include('includes.components.form.imageeditor')

			@include('includes.components.form.youtubeeditor')
		@endif

		<input type="hidden" name="images-notice-edit" value="{{ implode(',', $images) }}">
		<input type="hidden" name="images-notice-remove">
	</div>

	<div class="row text-center mb-5">
		<div class="col-md-12">
			<button type="button" class="btn border" data-urlajax="{{ route('panel.notices.component', ['name' => 'form.titleeditor']) }}">Adicionar um Titulo <i class="fas fa-heading"></i></button>

			<button type="button" class="btn border" data-name="paragraphs[]" data-class="paragraph" data-title="Digite o texto do parágrafo..." data-urlajax="{{ route('panel.notices.component', ['name' => 'form.texteditor']) }}">Adicionar parágrafo <i class="fas fa-paragraph"></i></button>

			<button type="button" class="btn border" data-urlajax="{{ route('panel.notices.component', ['name' => 'form.imageeditor']) }}">Adicionar imagem <i class="fas fa-image"></i></button>

			<button type="button" class="btn border" data-urlajax="{{ route('panel.notices.component', ['name' => 'form.youtubeeditor']) }}">Adicionar Video do Youtube <i class="fas fa-video"></i></button>
		</div>
	</div>

	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>