<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Product,
	ProductColor,
	Category,
	SubCategory
};

class ProductController extends Controller{
	private $product;

	public function __construct(){
		$this->product = new Product();
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->product->search(1, $search, $this->product->count())->count() / config('paginate.limit'));
		
		$products = $this->product->search($page, $search)->get();
		$categories = Category::orderBy('name')->get();

		return view('site.products.index', compact('products', 'categories', 'search', 'pages', 'builder'));
	}

	public function info($id){
		$color = ProductColor::find($id);
		$data = [
			'success' => true,
			'sizes' => [],
			'images' => []
		];

		if($color){
			$data['sizes'] = $color->sizes->all();
			for($i = 0; $i < count($data['sizes']); $i++){
				$data['sizes'][$i]->priceDiscount = $data['sizes'][$i]->getPriceDiscount(1);
			}

			foreach($color->images as $image){
				$data['images'][] = url('storage/app/public/' . $image->source);
			}

			return json_encode($data);
		}

		return json_encode([
			'success' => false,
			'message' => 'A cor informada não pertence a este produto!'
		]);
	}

	public function show($slug){
		$product = $this->product->where('visible', true)->where('slug', $slug)->firstOrFail();

		return view('site.products.show', compact('product'));
	}
}