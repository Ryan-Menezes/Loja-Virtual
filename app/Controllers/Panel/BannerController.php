<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\{
	Banner
};

class BannerController extends Controller{
	private $banner;

	public function __construct(){
		$this->banner = new Banner();

		$this->banner->verifyPermission('view.banners');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->banner->search(1, $search, $this->banner->count())->count() / config('paginate.limit'));

		$banners = $this->banner->search($page, $search)->get();

		return view('panel.banners.index', compact('banners', 'pages', 'builder'));
	}

	public function create(){
		$this->banner->verifyPermission('create.banners');

		return view('panel.banners.create');
	}

	public function store(){
		$this->banner->verifyPermission('create.banners');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->banner->rolesCreate, $this->banner->messages);

		$data['image'] = $request->file('image')->store('banners');

		$banner = $this->banner->create($data);

		if($banner){
			redirect(route('panel.banners.create'), ['success' => 'Banner cadastrado com sucesso']);
		}

		Storage::delete($data['image']);
		redirect(route('panel.banners.create'), ['error' => 'Banner NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->banner->verifyPermission('edit.banners');

		$banner = $this->banner->findOrFail($id);

		return view('panel.banners.edit', compact('banner'));
	}

	public function update($id){
		$this->banner->verifyPermission('edit.banners');
		
		$banner = $this->banner->findOrFail($id);

		$request = new Request();

		$data = $request->all();
		$image = $request->file('image');
		$imagePrev = $banner->image;

		$this->validator($data, $banner->rolesUpdate, $banner->messages);

		if(!is_null($image) && mb_strlen($image->type) > 0){
			$data['image'] = $image->store('banners');
		}else{
			unset($data['image']);
			$imagePrev = null;
		}

		if($banner->update($data)){
			if(!empty($imagePrev)){
				Storage::delete($imagePrev);
			}

			redirect(route('panel.banners.edit', ['id' => $banner->id]), ['success' => 'Banner editado com sucesso']);
		}

		if(!empty($imagePrev)){
			Storage::delete($data['image']);
		}

		redirect(route('panel.banners.edit'), ['error' => 'Banner NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->banner->verifyPermission('delete.banners');
		$banner = $this->banner->findOrFail($id);

		$image = $banner->image;

		if($banner->delete()){
			// Deletando imagem do banner
			if(!empty($image)){
				Storage::delete($image);
			}

			redirect(route('panel.banners'), ['success' => 'Banner deletado com sucesso']);
		}

		redirect(route('panel.banners'), ['error' => 'Banner NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}