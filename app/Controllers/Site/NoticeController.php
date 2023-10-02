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

class NoticeController extends Controller{
	private $notice;

	public function __construct(){
		$this->notice = new Notice();
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$limit = config('paginate.limit');
		$search = $request->input('search');
		$query = $this->notice->search(1, $search, $this->notice->where('visible', true)->count());
		$pages = ceil($query->where('visible', true)->count() / $limit);

		$notices = $this->notice->search($page, $search)->where('visible', true)->get();
		$categories = Category::cachedNotices();

		return view('site.notices.index', compact('notices', 'categories', 'page', 'pages', 'builder'));
	}

	public function show($slug){
		$notice = $this->notice->where('visible', true)->where('slug', $slug)->firstOrFail();

		$notice->visits++;
		$notice->save();

		$categories = Category::cachedNotices();

		return view('site.notices.show', compact('notice', 'categories'));
	}
}