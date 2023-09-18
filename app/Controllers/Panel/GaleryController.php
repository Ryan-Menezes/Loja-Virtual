<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\{
	Galery
};

class GaleryController extends Controller{
	private $galery;

	public function __construct(){
		$this->galery = new Galery();

		$this->galery->verifyPermission('view.galleries');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->galery->search(1, $search, $this->galery->count())->count() / config('paginate.limit'));

		$galleries = $this->galery->search($page, $search)->get();

		return view('panel.galleries.index', compact('galleries', 'pages', 'builder'));
	}

	public function component($name){
		$data = (new Request())->all();

		$file = dirname(__DIR__, 3) . '/' . trim(config('view.dir'), '/') . '/' . str_ireplace('.', '/', "includes.components.{$name}") . '.blade.php';

		if(!file_exists($file))
			return null;
		
		return view("includes.components.{$name}", $data);
	}

	public function create(){
		$this->galery->verifyPermission('create.galleries');

		return view('panel.galleries.create');
	}

	public function store(){
		$this->galery->verifyPermission('create.galleries');

		$request = new Request();
		$data = $request->all();
		$images = $request->file('images');

		$this->validator($data, $this->galery->rolesCreate, $this->galery->messages);
		$data['slug'] = slugify($data['title']);

		$galery = $this->galery->create($data);
		if($galery){
			foreach($images as $image){
				if($image->error == 0){
					$filename = $image->store('galleries');

					if($filename){
						$galery->images()->create([
							'source' => $filename
						]);
					}
				}
			}

			redirect(route('panel.galleries.create'), ['success' => 'Galeria cadastrada com sucesso']);
		}

		redirect(route('panel.galleries.create'), ['error' => 'Galeria NÃO cadastrada, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->galery->verifyPermission('edit.galleries');

		$galery = $this->galery->findOrFail($id);

		return view('panel.galleries.edit', compact('galery'));
	}

	public function update($id){
		$this->galery->verifyPermission('edit.galleries');
		
		$galery = $this->galery->findOrFail($id);

		$request = new Request();
		$data = $request->all();
		$images = $request->file('images');

		$this->validator($data, $galery->rolesUpdate, $galery->messages);
		$data['slug'] = slugify($data['title']);

		if($galery->update($data)){
			if(!empty($data['images-remove'])){
				foreach(explode(',', $data['images-remove']) as $source){
					$image = $galery->images->where('source', $source)->first();

					if($image){
						$image->delete();
					}

					Storage::delete($source);
				}
			}

			foreach($images as $image){
				if($image->error == 0){
					$filename = $image->store('galleries');

					if($filename){
						$galery->images()->create([
							'source' => $filename
						]);
					}
				}
			}

			redirect(route('panel.galleries.edit', ['id' => $galery->id]), ['success' => 'Galeria editada com sucesso']);
		}

		redirect(route('panel.galleries.edit'), ['error' => 'Galeria NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->galery->verifyPermission('delete.galleries');
		$galery = $this->galery->findOrFail($id);
		$images = $galery->images;

		if($galery->delete()){
			foreach($images as $image){
				Storage::delete($image->source);
			}

			redirect(route('panel.galleries'), ['success' => 'Galeria deletada com sucesso']);
		}

		redirect(route('panel.galleries'), ['error' => 'Galeria NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}