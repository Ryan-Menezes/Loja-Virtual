<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Category
};

class CategoryController extends Controller{
	private $category;

	public function __construct(){
		$this->category = new Category();
	}

	private function searchProduct($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->where('name', 'LIKE', "%{$filter}%")
					->where('slug', 'LIKE', "%{$filter}%")
					->where('description', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	private function searchNotice($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->where('title', 'LIKE', "%{$filter}%")
					->where('slug', 'LIKE', "%{$filter}%")
					->where('description', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function productCategory($category){
		$category = $this->category->where('slug', $category)->firstOrFail();
		$products = $category->products();
		
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($products->count() / config('paginate.limit'));

		$categories = $this->category->orderBy('name')->get();

		return view('site.products.index', compact('products', 'categories', 'search', 'pages', 'builder'));
	}

	public function productSubCategory($category, $subcategory){
		$category = $this->category->where('slug', $category)->firstOrFail();
		$subcategory = $category->subcategories->where('slug', $subcategory)->firstOrFail();
		
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->searchProduct($subcategory->products(), $page, $search, $subcategory->products->count())->count() / config('paginate.limit'));
		
		$products = $this->searchProduct($subcategory->products(), $page, $search)->get();
		$categories = $this->category->orderBy('name')->get();

		return view('site.products.index', compact('products', 'categories', 'search', 'pages', 'builder'));
	}

	public function noticeCategory($category){
		$category = $this->category->where('slug', $category)->firstOrFail();
		$notices = $category->notices();
		
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($notices->count() / config('paginate.limit'));

		$categories = $this->category->orderBy('name')->get();

		return view('site.notices.index', compact('notices', 'categories', 'search', 'pages', 'builder'));
	}

	public function noticeSubCategory($category, $subcategory){
		$category = $this->category->where('slug', $category)->firstOrFail();
		$subcategory = $category->subcategories->where('slug', $subcategory)->firstOrFail();
		
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->searchNotice($subcategory->notices(), $page, $search, $subcategory->notices->count())->count() / config('paginate.limit'));
		
		$notices = $this->searchNotice($subcategory->notices(), $page, $search)->get();
		$categories = $this->category->orderBy('name')->get();

		return view('site.notices.index', compact('notices', 'categories', 'search', 'pages', 'builder'));
	}
}