<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\{
	Notice,
	Category
};

class NoticeController extends Controller{
	private $notice;

	public function __construct(){
		$this->notice = new Notice();

		$this->notice->verifyPermission('view.notices');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->notice->count() / config('paginate.limit'));

		$notices = $this->notice->search($page, $search);

		return view('panel.notices.index', compact('notices', 'pages', 'builder'));
	}

	public function component($name){
		$data = (new Request())->all();

		$file = dirname(__DIR__, 3) . '/' . trim(config('view.dir'), '/') . '/' . str_ireplace('.', '/', "includes.components.{$name}") . '.blade.php';

		if(!file_exists($file))
			return null;
		
		return view("includes.components.{$name}", $data);
	}

	public function create(){
		$this->notice->verifyPermission('create.notices');
		$categories = Category::all();

		return view('panel.notices.create', compact('categories'));
	}

	public function store(){
		$this->notice->verifyPermission('create.notices');
		$request = new Request();

		$content = [];
		$data = $request->all();

		$elements = $data['elements'];
		$titles = $data['titles'];
		$paragraphs = $data['paragraphs'];
		$youtubeUrls = $data['urls-video'];
		$images = $request->file('images');
		$titleImages = $data['title-images'];
		$titlesTag = $data['titles-tag'];
		$titleIndex = 0;
		$paragraphIndex = 0;
		$youtubeIndex = 0;
		$imageIndex = 0;

		$this->validator($data, $this->notice->rolesCreate, $this->notice->messages);

		foreach($elements as $element){
			if($element == 'TITLEEDITOR'){
				if(mb_strlen($titles[$titleIndex]) > 0 && mb_strlen($titlesTag[$titleIndex]) > 0){
					$content['elements'][] = [
						'type' 		=> 'title',
						'content' 	=> $titles[$titleIndex],
						'tag'		=> $titlesTag[$titleIndex]
					];
				}

				$titleIndex++;
			}elseif($element == 'TEXTEDITOR'){
				if(mb_strlen($paragraphs[$paragraphIndex]) > 0){
					$content['elements'][] = [
						'type' 		=> 'paragraph',
						'content' 	=> $paragraphs[$paragraphIndex]
					];
				}

				$paragraphIndex++;
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
						$filename = $image->store('notices');

						if($filename){
							$title = $titleImages[$imageIndex] ?? null;
							$path = $filename;

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

		$data['poster'] = $request->file('poster')->store('notices');
		$data['slug'] = slugify($data['title']);
		$data['content'] = json_encode($content);
		$notice = auth()->user()->notices()->create($data);

		if($notice){
			// cadastrando subcategorias
			$notice->subcategories()->sync($data['subcategories']);

			redirect(route('panel.notices.create'), ['success' => 'Artigo cadastrado com sucesso']);
		}

		Storage::delete($data['poster']);
		redirect(route('panel.notices.create'), ['error' => 'Artigo NÃO cadastrado, Ocorreu um erro no processo de cadastro!']);
	}

	public function edit($id){
		$this->notice->verifyPermission('edit.notices');
		$notice = $this->notice->findOrFail($id);
		$categories = Category::all();

		return view('panel.notices.edit', compact('categories', 'notice'));
	}

	public function update($id){
		$this->notice->verifyPermission('edit.notices');
		$notice = $this->notice->findOrFail($id);

		$request = new Request();

		$content = [];
		$data = $request->all();

		$elements = $data['elements'];
		$titles = $data['titles'];
		$paragraphs = $data['paragraphs'];
		$youtubeUrls = $data['urls-video'];
		$images = $request->file('images');
		$poster = $request->file('poster');
		$titleImages = $data['title-images'];
		$imagesEdit = explode(',', $data['images-notice-edit']);
		$imagesRemove = explode(',', $data['images-notice-remove']);
		$titlesTag = $data['titles-tag'];
		$titleIndex = 0;
		$paragraphIndex = 0;
		$youtubeIndex = 0;
		$imageIndex = 0;

		$this->validator($data, $notice->rolesUpdate, $notice->messages);

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

		// Formata o conteúdo da notícia
		foreach($elements as $element){
			if($element == 'TITLEEDITOR'){
				if(mb_strlen($titles[$titleIndex]) > 0 && mb_strlen($titlesTag[$titleIndex]) > 0){
					$content['elements'][] = [
						'type' 	    => 'title',
						'content' 	=> $titles[$titleIndex],
						'tag'		=> $titlesTag[$titleIndex]
					];
				}

				$titleIndex++;
			}else if($element == 'TEXTEDITOR'){
				if(mb_strlen($paragraphs[$paragraphIndex]) > 0){
					$content['elements'][] = [
						'type' 		=> 'paragraph',
						'content' 	=> $paragraphs[$paragraphIndex]
					];
				}

				$paragraphIndex++;
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
						$filename = $image->store('notices');

						if($filename){
							$path = $filename;

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

		$posterPrev = $notice->poster;

		if(!is_null($poster) && mb_strlen($poster->type) > 0){
			$data['poster'] = $poster->store('notices');
		}else{
			unset($data['poster']);
			$posterPrev = null;
		}

		$data['slug'] = slugify($data['title']);
		$data['content'] = json_encode($content);

		if($notice->update($data)){
			// cadastrando subcategorias
			$notice->subcategories()->sync($data['subcategories']);

			if(!empty($posterPrev)){
				Storage::delete($posterPrev);
			}

			redirect(route('panel.notices.edit', ['id' => $notice->id]), ['success' => 'Artigo editado com sucesso']);
		}

		if(!empty($posterPrev)){
			Storage::delete($data['poster']);
		}
	
		redirect(route('panel.notices.edit', ['id' => $notice->id]), ['error' => 'Artigo NÃO editado, Ocorreu um erro no processo de edição!']);
	}

	public function destroy($id){
		$this->notice->verifyPermission('delete.notices');
		$notice = $this->notice->findOrFail($id);

		$poster = $notice->poster;
		$content = json_decode($notice->content);

		if($notice->delete()){
			// Deletando poster da notícia
			if(!empty($poster)){
				Storage::delete($poster);
			}

			// Deletando imagens da notícia
			foreach($content->elements as $element){
				if($element->type == 'image'){
					Storage::delete($element->src);
				}
			}

			redirect(route('panel.notices'), ['success' => 'Artigo deletado com sucesso']);
		}

		redirect(route('panel.notices'), ['error' => 'Artigo NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}