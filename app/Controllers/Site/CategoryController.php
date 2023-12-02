<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Category;

class CategoryController extends Controller{
	private $category;

	public function __construct(){
		$this->category = new Category();
	}

	private function searchProduct($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->with('ratings')
					->where('name', 'LIKE', "%{$filter}%")
					->where('visible', true)
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	private function searchNotice($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->where('title', 'LIKE', "%{$filter}%")
					->where('visible', true)
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function productSubCategory($category, $subcategory){
		$category = $this->category->where('slug', $category)->firstOrFail();
		$subcategory = $category->subcategories()->where('slug', $subcategory)->firstOrFail();
		
		$request = new Request();

		$limit = 9;
		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$query = $this->searchProduct($subcategory->products(), 1, $search, $subcategory->products->where('visible', true)->count());

		if($request->has('freight_free')){
			$query = $query->where('freight_free', true);
		}

		$pages = ceil($query->count() / $limit);
		
		$query = $this->searchProduct($subcategory->products(), $page, $search, $limit);
		if($request->has('freight_free')){
			$query = $query->where('freight_free', true);
		}
		$products = $query->get();

		$categories = $this->category->cachedProducts();

		return view('site.products.index', compact('products', 'categories', 'subcategory', 'search', 'pages', 'builder'));
	}

	public function noticeSubCategory($category, $subcategory){
		$category = $this->category->where('slug', $category)->firstOrFail();
		$subcategory = $category->subcategories()->where('slug', $subcategory)->firstOrFail();
		
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->searchNotice($subcategory->notices(), 1, $search, $subcategory->notices->where('visible', true)->count())->count() / config('paginate.limit'));
		
		$notices = $this->searchNotice($subcategory->notices(), $page, $search)->get();
		$categories = $this->category->cachedProducts();

		return view('site.notices.index', compact('notices', 'categories', 'subcategory', 'search', 'pages', 'builder'));
	}
}