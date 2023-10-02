<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	Product,
	ProductColor,
	Category,
	Rating
};

class ProductController extends Controller{
	private $product;

	public function __construct(){
		$this->product = new Product();
	}

	public function index(){
		$request = new Request();

		$limit = 9;
		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$query = $this->product->search(1, $search, $this->product->where('visible', true)->count(), $limit);

		if($request->has('freight_free')){
			$query = $query->where('freight_free', true);
		}

		$pages = ceil($query->where('visible', true)->count() / $limit);
		$query = $this->product->search($page, $search, $limit)->where('visible', true);

		if($request->has('freight_free')){
			$query = $query->where('freight_free', true);
		}

		$products = $query->get();
		$categories = Category::cachedProducts();

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
		$client = auth('site');

		if($client)
			$client = Client::find($client->id);

		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$limit = config('paginate.limit');
		$pages = ceil($product->ratings->where('visible', true)->count() / $limit);
		$ratings = $product->ratings()->where('visible', true)->offset(($page - 1) * $limit)->limit($limit)->get();

		return view('site.products.show', compact('product', 'ratings', 'client', 'pages', 'builder'));
	}

	public function storeRating($slug){
		$product = $this->product->where('visible', true)->where('ratings_active', true)->where('slug', $slug)->firstOrFail();
		$client = auth('site');
		$rating = new Rating();

		if(!$client)
			abort(404);

		if($client->ratings->where('product_id', $product->id)->count()){
			redirect(route('site.products.show', ['slug' => $product->slug]), ['error' => 'Não foi possível enviar a sua avaliação, Só é permitido avaliar o mesmo produto uma única vez!']);
		}

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $rating->rolesCreate, $rating->messages);

		$data['product_id'] = $product->id;
		$data['client_id'] = $client->id;

		if($rating->create($data)){
			redirect(route('site.products.show', ['slug' => $product->slug]), ['success' => 'Avaliação enviada com sucesso, Em breve estará no site!']);
		}

		redirect(route('site.products.show', ['slug' => $product->slug]), ['error' => 'Não foi possível enviar a sua avaliação, Ocorreu um erro no processo!'], true);
	}

	public function freight($slug){
		$request = new Request();
		$data = $request->all();

		if(!isset($data['size_id']) && !isset($data['postal_code'])){
			abort(404);
		}

		$product = $this->product->where('visible', true)->where('slug', $slug)->firstOrFail();
		$size = $product->sizes()->where('product_sizes.id', $data['size_id'])->firstOrFail();

		$weight = $size->weight < 0.1 ? 0.1 : $size->weight;
		$width = max(11, min(105, $size->width, 2));
		$height = max(2, min(105, $size->height, 2));
		$depth = max(16, min(105, $size->depth, 2));

		return freight_format($data['postal_code'], $weight, $width, $height, $depth, $product->freight_free, false);
	}
}