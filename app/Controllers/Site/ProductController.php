<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Product,
	ProductColor,
	Category
};

class ProductController extends Controller{
	private $product;

	public function __construct(){
		$this->product = new Product();
	}

	public function index(){
		$products = $this->product->all();
		$categories = Category::all();

		return view('site.products.index', compact('products', 'categories'));
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