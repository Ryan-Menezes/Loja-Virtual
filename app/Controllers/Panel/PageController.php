<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\Page;

class PageController extends Controller{
	private $page;

	public function __construct(){
		$this->page = new Page();

		$this->page->verifyPermission('view.pages');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->page->search(1, $search, $this->page->count())->count() / config('paginate.limit'));

		$pagesarr = $this->page->search($page, $search)->get();

		return view('panel.pages.index', compact('pagesarr', 'pages', 'builder'));
	}

	public function component($name){
		$data = (new Request())->all();

		$file = dirname(__DIR__, 3) . '/' . trim(config('view.dir'), '/') . '/' . str_ireplace('.', '/', "includes.components.{$name}") . '.blade.php';

		if(!file_exists($file))
			return null;
		
		return view("includes.components.{$name}", $data);
	}

	public function create(){
		$this->page->verifyPermission('create.pages');

		return view('panel.pages.create');
	}

	public function store(){
		$this->page->verifyPermission('create.pages');
		$request = new Request();

		$content = [];
		$data = $request->all();

		$elements = isset($data['elements']) ? $data['elements'] : [];
		$texts = isset($data['texts']) ? $data['texts'] : [];
		$youtubeUrls = isset($data['urls-video']) ? $data['urls-video'] : [];
		$images = $request->file('images');
		$titleImages = isset($data['title-images']) ? $data['title-images'] : [];
		$textIndex = 0;
		$youtubeIndex = 0;
		$imageIndex = 0;

		$this->validator($data, $this->page->rolesCreate, $this->page->messages);

		// Validando conteúdo
		if(empty($elements)){
			redirect(route('panel.pages.create'), ['error' => 'O preenchimento do conteúdo é obrigatório!'], true);
		}

		foreach($elements as $element){
			if($element == 'TEXTEDITOR'){
				if(mb_strlen($texts[$textIndex]) > 0){
					$content['elements'][] = [
						'type' 		=> 'text',
						'content' 	=> $texts[$textIndex]
					];
				}

				$textIndex++;
			}else if($element == 'YOUTUBEEDITOR'){
				if(mb_strlen($youtubeUrls[$youtubeIndex]) > 0){
					$url = preg_split('/[\/=]/i', $youtubeUrls[$youtubeIndex]);

					$content['elements'][] = [
						'type' 			=> 'youtube',
						'videocode' 	=> end($url),
						'url'			=> $youtubeUrls[$youtubeIndex]
					];
				}

				$youtubeIndex++;
			}else if($element == 'IMAGEEDITOR'){
				if(isset($images[$imageIndex])){
					$image = $images[$imageIndex];

					if($image->error == 0){
						$filename = $image->store('pages');

						if($filename){
							$title = $titleImages[$imageIndex] ?? null;

							$content['elements'][] = [
								'type' 	=> 'image',
								'src' 	=> $filename,
								'title' => $title
							];
						}
					}
				}

				$imageIndex++;
			}
		}

		// Validando conteúdo
		if(empty($content)){
			redirect(route('panel.pages.create'), ['error' => 'O preenchimento do conteúdo é obrigatório!'], true);
		}

		if(!empty(trim($data['url']))){
            $parts = explode('/', trim($data['url'], '/'));
            $data['url'] = '';
            foreach($parts as $part){
                $data['url'] .= slugify($part) . '/';
            }

            $data['url'] = trim($data['url'], '/');
        }else{
            $data['url'] = slugify($data['title']);
        }

		$data['content'] = json_encode($content);
		$data['expiration'] = empty($data['expiration']) ? null : $data['expiration'];

		if($this->page->create($data)){
			redirect(route('panel.pages.create'), ['success' => 'Página cadastrada com sucesso']);
		}

		redirect(route('panel.pages.create'), ['error' => 'Página NÃO cadastrada, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->page->verifyPermission('edit.pages');
		$page = $this->page->findOrFail($id);

		return view('panel.pages.edit', compact('page'));
	}

	public function update($id){
		$this->page->verifyPermission('edit.pages');
		$page = $this->page->findOrFail($id);

		$request = new Request();

		$content = [];
		$data = $request->all();

		$elements = isset($data['elements']) ? $data['elements'] : [];
		$texts = isset($data['texts']) ? $data['texts'] : [];
		$youtubeUrls = isset($data['urls-video']) ? $data['urls-video'] : [];
		$images = $request->file('images');
		$titleImages = isset($data['title-images']) ? $data['title-images'] : [];
		$imagesEdit = explode(',', $data['images-notice-edit']);
		$imagesRemove = explode(',', $data['images-remove']);
		$textIndex = 0;
		$youtubeIndex = 0;
		$imageIndex = 0;
		
		$this->validator($data, $page->rolesUpdate, $page->messages);

		// Validando conteúdo
		if(empty($elements)){
			redirect(route('panel.pages.edit', ['id' => $id]), ['error' => 'O preenchimento do conteúdo é obrigatório!'], true);
		}

		// Formata o conteúdo da notícia
		foreach($elements as $element){
			if($element == 'TEXTEDITOR'){
				if(mb_strlen($texts[$textIndex]) > 0){
					$content['elements'][] = [
						'type' 		=> 'text',
						'content' 	=> $texts[$textIndex]
					];
				}

				$textIndex++;
			}else if($element == 'YOUTUBEEDITOR'){
				if(mb_strlen($youtubeUrls[$youtubeIndex]) > 0){
					$url = preg_split('/[\/=]/i', $youtubeUrls[$youtubeIndex]);

					$content['elements'][] = [
						'type' 			=> 'youtube',
						'videocode' 	=> end($url),
						'url'			=> $youtubeUrls[$youtubeIndex]
					];
				}

				$youtubeIndex++;
			}else if($element == 'IMAGEEDITOR'){
				if(isset($images[$imageIndex])){
					$image = $images[$imageIndex];
					$title = $titleImages[$imageIndex] ?? null;

					if($image->error == 0){
						$filename = $image->store('pages');

						if($filename){
							$content['elements'][] = [
								'type' 	=> 'image',
								'src' 	=> $filename,
								'title' => $title
							];

							if(!empty($imagesEdit)){
								Storage::delete(trim($imagesEdit[0]));

								array_shift($imagesEdit);
							}
						}
					}else{
						if(!empty($imagesEdit)){
							$content['elements'][] = [
								'type' 	=> 'image',
								'src' 	=> trim($imagesEdit[0]),
								'title' => $title
							];

							array_shift($imagesEdit);
						}
					}
				}

				$imageIndex++;
			}
		}

		// Validando conteúdo
		if(empty($elements)){
			redirect(route('panel.pages.edit', ['id' => $id]), ['error' => 'O preenchimento do conteúdo é obrigatório!'], true);
		}

		// Remove imagens que foram deletadas
		if(!empty($imagesRemove)){
			foreach($imagesRemove as $image){
				if(!empty($image)){
					$image = trim($image);

					Storage::delete($image);

					if(!empty($imagesEdit) && in_array($image, $imagesEdit)){
						$key = array_search($image, $imagesEdit);

						array_splice($imagesEdit, $key, 1);
					}
				}
			}
		}

		// Editando página
        if(!empty(trim($data['url']))){
            $parts = explode('/', trim($data['url'], '/'));
            $data['url'] = '';
            foreach($parts as $part){
                $data['url'] .= slugify($part) . '/';
            }

            $data['url'] = trim($data['url'], '/');
        }else{
            $data['url'] = slugify($data['title']);
        }

		$data['content'] = json_encode($content);
		$data['expiration'] = empty($data['expiration']) ? null : $data['expiration'];

		if($page->update($data)){
			redirect(route('panel.pages.edit', ['id' => $page->id]), ['success' => 'Página editada com sucesso']);
		}
	
		redirect(route('panel.pages.edit', ['id' => $page->id]), ['error' => 'Página NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->page->verifyPermission('delete.pages');
		$page = $this->page->findOrFail($id);

		$content = json_decode($page->content);

		if($page->delete()){
			// Deletando imagens da página
			foreach($content->elements as $element){
				if($element->type == 'image'){
					Storage::delete($element->src);
				}
			}

			redirect(route('panel.pages'), ['success' => 'Página deletada com sucesso']);
		}

		redirect(route('panel.pages'), ['error' => 'Página NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}