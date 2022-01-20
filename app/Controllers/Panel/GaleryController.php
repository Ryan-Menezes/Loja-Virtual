<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\{
	Galery,
	Role
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

	public function create(){
		$this->galery->verifyPermission('create.galleries');

		return view('panel.galleries.create');
	}

	public function store(){
		$this->galery->verifyPermission('create.galleries');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->galery->rolesCreate, $this->galery->messages);

		$galery = $this->galery->create($data);

		if($galery){
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

		$this->validator($data, $galery->rolesUpdate, $galery->messages);

		if($galery->update($data)){
			redirect(route('panel.galleries.edit', ['id' => $galery->id]), ['success' => 'Galeria editada com sucesso']);
		}

		redirect(route('panel.galleries.edit'), ['error' => 'Galeria NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->galery->verifyPermission('delete.galleries');
		$galery = $this->galery->findOrFail($id);

		if($galery->delete()){
			redirect(route('panel.galleries'), ['success' => 'Galeria deletada com sucesso']);
		}

		redirect(route('panel.galleries'), ['error' => 'Galeria NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}