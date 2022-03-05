<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
	@include('includes.messages')
	
	<div class="tabs">
		<ul>
			<li><a href="#tab-page">Página</a></li>
			<li><a href="#tab-content">Conteúdo</a></li>
		</ul>

		<div class="page" id="tab-page">
			<input type="hidden" name="_method" value="{{ $method }}">
			<div class="row">
				@include('includes.components.form.input', [
					'type' => 'text', 
					'name' => 'title', 
					'title' => 'Titulo', 
					'class' => 'required',
					'value' => (isset($page) ? $page->title : null),
					'required' => true
				])

				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'url', 
						'title' => 'URL', 
						'value' => (isset($page) ? $page->url : null)
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'tags', 
						'title' => 'Tags', 
						'value' => (isset($page) ? $page->tags : null)
					])
				</div>

				<div class="col-md-6">
					@include('includes.components.form.select', [
						'name' => 'visible', 
						'title' => 'Visibilidade',
						'value' => (isset($page) ? $page->visible : 1),
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
						'name' => 'index_active', 
						'title' => 'Indexação nos mecânismos de busca',
						'value' => (isset($page) ? $page->index_active : 1),
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
					'value' => (isset($page) ? $page->description : null),
					'required' => true
				])

				@include('includes.components.form.textarea', [
					'name' => 'ld_json',
					'title' => 'LD-JSON',
					'value' => (isset($page) ? $page->ld_json : null)
				])
			</div>
		</div>

		<div class="content" id="tab-content">
			<div class="content-elements sortable bg-white">
				@php
					$images = [];
				@endphp
				
				@if(isset($page))
					@foreach(json_decode($page->content)->elements as $element)
						@if($element->type == 'text')
							@include('includes.components.form.texteditor', [
								'name' => 'texts[]',
								'class' => 'text draggable required',
								'title' => 'Digite o seu texto aqui...',
								'value' => $element->content
							])
						@elseif($element->type == 'youtube')
							@include('includes.components.form.youtubeeditor', [
								'url' => 'https://www.youtube.com/embed/' . $element->videocode,
								'texturl' => $element->url,
								'required' => true
							])
						@elseif($element->type == 'image')
							@include('includes.components.form.imageeditor', [
								'title' => $element->title,
								'image' => url('storage/app/public/' . $element->src, config('ftp.active')),
								'imageRemove' => $element->src
							])

							@php
								$images[] = $element->src;
							@endphp
						@endif
					@endforeach
				@else
					@include('includes.components.form.texteditor', [
						'name' => 'texts[]',
						'class' => 'text draggable required',
						'title' => 'Digite o seu texto aqui...'
					])

					@include('includes.components.form.imageeditor')

					@include('includes.components.form.youtubeeditor')
				@endif

				<input type="hidden" name="images-notice-edit" value="{{ implode(',', $images) }}">
				<input type="hidden" name="images-remove">
			</div>

			<div class="row text-center mt-5 bg-white">
				<div class="col-md-12 row">
					<div class="col-md-4 text-center p-4 bg-primary text-white" style="cursor: pointer;" title="Clique aqui para adicionar um novo parágrafo" data-name="texts[]" data-class="text" data-title="Digite o texto do parágrafo..." data-urlajax="{{ route('panel.pages.component', ['name' => 'form.texteditor']) }}">NOVO TEXTO <i class="fas fa-paragraph"></i></div>
					<div class="col-md-4 text-center p-4 bg-success text-white" style="cursor: pointer;" title="Clique aqui para adicionar uma nova imagem" data-urlajax="{{ route('panel.pages.component', ['name' => 'form.imageeditor']) }}">NOVA IMAGEM <i class="fas fa-image"></i></div>
					<div class="col-md-4 text-center p-4 bg-danger text-white" style="cursor: pointer;" title="Clique aqui para adicionar um novo video" data-urlajax="{{ route('panel.pages.component', ['name' => 'form.youtubeeditor']) }}" data-required="true">NOVO VIDEO DO YOUTUBE <i class="fas fa-video"></i></div>
				</div>
			</div>
		</div>
	</div>

	<button type="submit" class="btn btn-danger mt-3">Salvar <i class="fas fa-save"></i></button>
</form>