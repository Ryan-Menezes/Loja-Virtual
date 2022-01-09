<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Depoiment;

class DepoimentController extends Controller{
	private $depoiment;

	public function __construct(){
		$this->depoiment = new Depoiment();

		$this->depoiment->verifyPermission('view.depoiments');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->depoiment->search(1, $search, $this->depoiment->count())->count() / config('paginate.limit'));

		$depoiments = $this->depoiment->search($page, $search)->get();

		return view('panel.depoiments.index', compact('depoiments', 'pages', 'builder'));
	}

	public function create(){
		$this->depoiment->verifyPermission('create.depoiments');

		return view('panel.depoiments.create');
	}

	public function store(){
		$this->depoiment->verifyPermission('create.depoiments');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->depoiment->rolesCreate, $this->depoiment->messages);
		$data['slug'] = slugify($data['name']);

		if($this->depoiment->create($data)){
			redirect(route('panel.depoiments.create'), ['success' => 'Depoimento cadastrado com sucesso']);
		}

		redirect(route('panel.depoiments.create'), ['error' => 'Depoimento NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

    public function edit($id){
		$this->depoiment->verifyPermission('edit.depoiments');

		$depoiment = $this->depoiment->findOrFail($id);

		return view('panel.depoiments.edit', compact('depoiment'));
	}

	public function update($id){
		$this->depoiment->verifyPermission('edit.depoiments');
		
		$depoiment = $this->depoiment->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		if($depoiment->update($data)){
			redirect(route('panel.depoiments.edit', ['id' => $depoiment->id]), ['success' => 'Depoimento editado com sucesso']);
		}

		redirect(route('panel.depoiments.edit'), ['error' => 'Depoimento NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->depoiment->verifyPermission('delete.depoiments');
		$depoiment = $this->depoiment->findOrFail($id);

		if($depoiment->delete()){
			redirect(route('panel.depoiments'), ['success' => 'Depoimento deletado com sucesso']);
		}

		redirect(route('panel.depoiments'), ['error' => 'Depoimento NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}