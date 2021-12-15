<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Category;

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
		$pages = ceil($this->category->count() / config('paginate.limit'));

		$categories = $this->category->search($page, $search);

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

		if($this->category->create($data)){
			redirect(route('panel.categories.create'), ['success' => 'Categoria cadastrada com sucesso']);
		}

		redirect(route('panel.categories.create'), ['error' => 'Categoria NÃO cadastrada, Ocorreu um erro no processo de cadastro!']);
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

		$this->validator($data, $category->rolesUpdate, $category->messages);
		$data['slug'] = slugify($data['name']);

		if($category->update($data)){
			redirect(route('panel.categories.edit', ['id' => $category->id]), ['success' => 'Categoria editada com sucesso']);
		}

		redirect(route('panel.categories.edit', ['id' => $category->id]), ['error' => 'Categoria NÃO editada, Ocorreu um erro no processo de edição!']);
	}

	public function destroy($id){
		$this->category->verifyPermission('delete.categories');
		$category = $this->category->findOrFail($id);

		if($category->delete()){
			redirect(route('panel.categories'), ['success' => 'Categoria deletada com sucesso']);
		}

		redirect(route('panel.categories'), ['error' => 'Categoria NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}