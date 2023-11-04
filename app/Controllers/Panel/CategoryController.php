<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Category;
use Src\Classes\Storage\Storage;

class CategoryController extends Controller{
	private $category;

	public function __construct(){
		$this->category = new Category();

		$this->category->verifyPermission('view.categories');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->category->search(1, $search, $this->category->count())->count() / config('paginate.limit'));

		$categories = $this->category->search($page, $search)->get();

		return view('panel.categories.index', compact('categories', 'pages', 'builder'));
	}

	public function create(){
		$this->category->verifyPermission('create.categories');

		return view('panel.categories.create');
	}

	public function store(){
		$this->category->verifyPermission('create.categories');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->category->rolesCreate, $this->category->messages);

		$data['slug'] = slugify($data['name']);
		$image = $request->file('image');

		if ($image && $image->error == 0) {
			$data['image'] = $image->store('categories');
		}

		if($this->category->create($data)){
			redirect(route('panel.categories.create'), ['success' => 'Categoria cadastrada com sucesso']);
		}

		redirect(route('panel.categories.create'), ['error' => 'Categoria NÃO cadastrada, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->category->verifyPermission('edit.categories');
		$category = $this->category->findOrFail($id);

		return view('panel.categories.edit', compact('category'));
	}

	public function update($id){
		$this->category->verifyPermission('edit.categories');
		$category = $this->category->findOrFail($id);

		$request = new Request();
		$data = $request->all();
		$image = $request->file('image');
		$imagePrev = $category->image;

		$this->validator($data, $category->rolesUpdate, $category->messages);
		$data['slug'] = slugify($data['name']);

		if(!is_null($image) && mb_strlen($image->type) > 0){
			$data['image'] = $image->store('categories');
		}else{
			unset($data['image']);
			$imagePrev = null;
		}

		if($category->update($data)){
			if(!empty($imagePrev)){
				Storage::delete($imagePrev);
			}

			redirect(route('panel.categories.edit', ['id' => $category->id]), ['success' => 'Categoria editada com sucesso']);
		}

		if(!empty($imagePrev)){
			Storage::delete($data['image']);
		}

		redirect(route('panel.categories.edit', ['id' => $category->id]), ['error' => 'Categoria NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->category->verifyPermission('delete.categories');
		$category = $this->category->findOrFail($id);

		$image = $category->image;

		if($category->delete()){
			// Deletando imagem da subcategoria
			if(!empty($image)){
				Storage::delete($image);
			}

			redirect(route('panel.categories'), ['success' => 'Categoria deletada com sucesso']);
		}

		redirect(route('panel.categories'), ['error' => 'Categoria NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}