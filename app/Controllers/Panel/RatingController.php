<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Rating;

class RatingController extends Controller{
	private $rating;

	public function __construct(){
		$this->rating = new Rating();

		$this->rating->verifyPermission('view.ratings');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->rating->search(1, $search, $this->rating->count())->count() / config('paginate.limit'));

		$ratings = $this->rating->search($page, $search)->get();

		return view('panel.ratings.index', compact('ratings', 'pages', 'builder'));
	}

    public function edit($id){
		$this->rating->verifyPermission('edit.ratings');

		$rating = $this->rating->findOrFail($id);

		return view('panel.ratings.edit', compact('rating'));
	}

	public function update($id){
		$this->rating->verifyPermission('edit.ratings');
		
		$rating = $this->rating->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		if($rating->update($data)){
			redirect(route('panel.ratings.edit', ['id' => $rating->id]), ['success' => 'Avaliação editada com sucesso']);
		}

		redirect(route('panel.ratings.edit'), ['error' => 'Avaliação NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->rating->verifyPermission('delete.ratings');
		$rating = $this->rating->findOrFail($id);

		if($rating->delete()){
			redirect(route('panel.ratings'), ['success' => 'Avaliação deletada com sucesso']);
		}

		redirect(route('panel.ratings'), ['error' => 'Avaliação NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}