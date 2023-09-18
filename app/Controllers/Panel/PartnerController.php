<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\Partner;

class PartnerController extends Controller{
	private $partner;

	public function __construct(){
		$this->partner = new Partner();

		$this->partner->verifyPermission('view.partners');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->partner->search(1, $search, $this->partner->count())->count() / config('paginate.limit'));

		$partners = $this->partner->search($page, $search)->get();

		return view('panel.partners.index', compact('partners', 'pages', 'builder'));
	}

	public function create(){
		$this->partner->verifyPermission('create.partners');

		return view('panel.partners.create');
	}

	public function store(){
		$this->partner->verifyPermission('create.partners');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->partner->rolesCreate, $this->partner->messages);
		$data['slug'] = slugify($data['title']);
		$data['image'] = $request->file('image')->store('partners');

		$partner = $this->partner->create($data);

		if($partner){
			redirect(route('panel.partners.create'), ['success' => 'Parceiro cadastrado com sucesso']);
		}

		Storage::delete($data['image']);
		redirect(route('panel.partners.create'), ['error' => 'Parceiro NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->partner->verifyPermission('edit.partners');

		$partner = $this->partner->findOrFail($id);

		return view('panel.partners.edit', compact('partner'));
	}

	public function update($id){
		$this->partner->verifyPermission('edit.partners');
		
		$partner = $this->partner->findOrFail($id);

		$request = new Request();

		$data = $request->all();
		$image = $request->file('image');
		$imagePrev = $partner->image;

		$this->validator($data, $partner->rolesUpdate, $partner->messages);
		$data['slug'] = slugify($data['title']);

		if(!is_null($image) && mb_strlen($image->type) > 0){
			$data['image'] = $image->store('partners');
		}else{
			unset($data['image']);
			$imagePrev = null;
		}

		if($partner->update($data)){
			if(!empty($imagePrev)){
				Storage::delete($imagePrev);
			}

			redirect(route('panel.partners.edit', ['id' => $partner->id]), ['success' => 'Parceiro editado com sucesso']);
		}

		if(!empty($imagePrev)){
			Storage::delete($data['image']);
		}

		redirect(route('panel.partners.edit'), ['error' => 'Parceiro NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->partner->verifyPermission('delete.partners');
		$partner = $this->partner->findOrFail($id);

		$image = $partner->image;

		if($partner->delete()){
			// Deletando imagem do parceiro
			if(!empty($image)){
				Storage::delete($image);
			}

			redirect(route('panel.partners'), ['success' => 'Parceiro deletado com sucesso']);
		}

		redirect(route('panel.partners'), ['error' => 'Parceiro NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}