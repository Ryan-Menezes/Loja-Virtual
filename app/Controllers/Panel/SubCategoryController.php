<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Category,
    SubCategory
};

class SubCategoryController extends Controller{
	private $category;
    private $subcategory;

	public function __construct(){
		$this->category = new Category();
		$this->subcategory = new SubCategory();

		$this->subcategory->verifyPermission('view.categories');
	}

	public function index($category){
		$request = new Request();

        $category = $this->category->findOrFail($category);

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->subcategory->search($category->id, 1, $search, $category->subcategories->count())->count() / config('paginate.limit'));

		$subcategories = $this->subcategory->search($category->id, $page, $search)->get();

		return view('panel.categories.subcategories.index', compact('category', 'subcategories', 'pages', 'builder'));
	}

	public function create($category){
		$this->category->verifyPermission('create.categories');

		$category = $this->category->findOrFail($category);

		return view('panel.categories.subcategories.create', compact('category'));
	}

	public function store($category){
		$this->category->verifyPermission('create.categories');

		$category = $this->category->findOrFail($category);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->subcategory->rolesCreate, $this->subcategory->messages);
		$data['slug'] = slugify($data['name']);
		$data['category_id'] = $category->id;

		// Verificando se há existem uma sub categória com o mesmo nome
		if($this->subcategory->where('name', $data['name'])->where('category_id', $category->id)->exists()){
			redirect(route('panel.categories.subcategories.create', ['category' => $category->id]), ['error' => "A categoria {$category->name} já possui uma sub categoria {$data['name']}!"], true);
		}

		if($this->subcategory->create($data)){
			redirect(route('panel.categories.subcategories.create', ['category' => $category->id]), ['success' => 'Sub Categoria cadastrada com sucesso']);
		}

		redirect(route('panel.categories.subcategories.create', ['category' => $category->id]), ['error' => 'Sub Categoria NÃO cadastrada, Ocorreu um erro no processo de cadastro!'], true);
	}

    public function edit($category, $id){
		$this->subcategory->verifyPermission('edit.categories');

		$category = $this->category->findOrFail($category);
        $subcategory = $category->subcategories()->findOrFail($id);

		return view('panel.categories.subcategories.edit', compact('category', 'subcategory'));
	}

	public function update($category, $id){
		$this->subcategory->verifyPermission('edit.categories');
		
		$category = $this->category->findOrFail($category);
        $subcategory = $category->subcategories()->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $subcategory->rolesUpdate, $subcategory->messages);
		$data['slug'] = slugify($data['name']);

		// Verificando se há existem uma sub categória com o mesmo nome
		if($subcategory->where('name', $data['name'])->where('category_id', $category->id)->where('id', '!=', $subcategory->id)->exists()){
			redirect(route('panel.categories.subcategories.edit', ['category' => $category->id, 'id' => $subcategory->id]), ['error' => "A categoria {$category->name} já possui uma sub categoria {$data['name']}"], true);
		}

		if($subcategory->update($data)){
			redirect(route('panel.categories.subcategories.edit', ['category' => $category->id, 'id' => $subcategory->id]), ['success' => 'Sub Categoria editada com sucesso']);
		}

		redirect(route('panel.categories.subcategories.edit', ['category' => $category->id, 'id' => $subcategory->id]), ['error' => 'Sub Categoria NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($category, $id){
		$this->subcategory->verifyPermission('delete.categories');
		
        $category = $this->category->findOrFail($category);
        $subcategory = $category->subcategories()->findOrFail($id);

		if($subcategory->delete()){
			redirect(route('panel.categories.subcategories', ['category' => $category->id]), ['success' => 'Sub Categoria deletada com sucesso']);
		}

		redirect(route('panel.categories.subcategories', ['category' => $category->id]), ['error' => 'Sub Categoria NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}