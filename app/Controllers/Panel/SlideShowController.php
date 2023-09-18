<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\SlideShow;

class SlideShowController extends Controller{
	private $slideshow;

	public function __construct(){
		$this->slideshow = new SlideShow();

		$this->slideshow->verifyPermission('view.slideshow');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->slideshow->search(1, $search, $this->slideshow->count())->count() / config('paginate.limit'));

		$slideshow = $this->slideshow->search($page, $search)->get();

		return view('panel.slideshow.index', compact('slideshow', 'pages', 'builder'));
	}

	public function create(){
		$this->slideshow->verifyPermission('create.slideshow');

		return view('panel.slideshow.create');
	}

	public function store(){
		$this->slideshow->verifyPermission('create.slideshow');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->slideshow->rolesCreate, $this->slideshow->messages);

		$data['image'] = $request->file('image')->store('slideshow');

		$slideshow = $this->slideshow->create($data);

		if($slideshow){
			redirect(route('panel.slideshow.create'), ['success' => 'Slide cadastrado com sucesso']);
		}

		Storage::delete($data['image']);
		redirect(route('panel.slideshow.create'), ['error' => 'Slide NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->slideshow->verifyPermission('edit.slideshow');

		$slideshow = $this->slideshow->findOrFail($id);

		return view('panel.slideshow.edit', compact('slideshow'));
	}

	public function update($id){
		$this->slideshow->verifyPermission('edit.slideshow');
		
		$slideshow = $this->slideshow->findOrFail($id);

		$request = new Request();

		$data = $request->all();
		$image = $request->file('image');
		$imagePrev = $slideshow->image;

		$this->validator($data, $slideshow->rolesUpdate, $slideshow->messages);

		if(!is_null($image) && mb_strlen($image->type) > 0){
			$data['image'] = $image->store('slideshow');
		}else{
			unset($data['image']);
			$imagePrev = null;
		}

		if($slideshow->update($data)){
			if(!empty($imagePrev)){
				Storage::delete($imagePrev);
			}

			redirect(route('panel.slideshow.edit', ['id' => $slideshow->id]), ['success' => 'Slide editado com sucesso']);
		}

		if(!empty($imagePrev)){
			Storage::delete($data['image']);
		}

		redirect(route('panel.slideshow.edit'), ['error' => 'Slide NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->slideshow->verifyPermission('delete.slideshow');
		$slideshow = $this->slideshow->findOrFail($id);

		$image = $slideshow->image;

		if($slideshow->delete()){
			// Deletando imagem do slide
			if(!empty($image)){
				Storage::delete($image);
			}

			redirect(route('panel.slideshow'), ['success' => 'Slide deletado com sucesso']);
		}

		redirect(route('panel.slideshow'), ['error' => 'Slide NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}