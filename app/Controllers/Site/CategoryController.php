<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Notice,
	Category
};

class CategoryController extends Controller{
	private $category;

	public function __construct(){
		$this->category = new Category();
	}

	public function show($slug){
		$category = $this->category->where('slug', $slug)->firstOrFail();
		
		$request = new Request();

		$limit = config('paginate.limit');
		$page = $request->input('page') ?? 1;
		$page = ($page - 1) * $limit;
		$pages = ceil($category->notices()->count() / $limit);

		$categories = $this->category->all();
		$notices = $category->notices()->offset($page)->limit($limit)->get();

		if(count($notices) == 0) abort(404);

		return view('site.notices.index', compact('notices', 'categories', 'category', 'pages'));
	}
}