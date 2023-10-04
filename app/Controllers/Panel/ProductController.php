<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\{
	Product,
	ProductImage,
	Category
};

class ProductController extends Controller{
	private $product;

	public function __construct(){
		$this->product = new Product();

		$this->product->verifyPermission('view.products');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->product->search(1, $search, $this->product->count())->count() / config('paginate.limit'));

		$products = $this->product->search($page, $search)->get();

		return view('panel.products.index', compact('products', 'pages', 'builder'));
	}

	public function component($name){
		$data = (new Request())->all();

		$file = dirname(__DIR__, 3) . '/' . trim(config('view.dir'), '/') . '/' . str_ireplace('.', '/', "includes.components.{$name}") . '.blade.php';

		if(!file_exists($file))
			return null;
		
		return view("includes.components.{$name}", $data);
	}

	public function products(){
		$data = (new Request())->all();
		$search = $data['search'] ?? null;

		$products = $this->product->where('name', 'LIKE', "%{$search}%")->limit(20)->get();

		$html = '';
		foreach($products as $product){
			$html .= view('includes.panel.products.card', [
				'id' => $product->id,
				'title' => $product->name,
				'image' => url('storage/app/public/' . $product->images->first()->source),
				'description' => $product->description
			]);
		}

		return $html;
	}

	public function create(){
		$this->product->verifyPermission('create.products');
		$categories = Category::all();

		return view('panel.products.create', compact('categories'));
	}

	public function store(){
		$this->product->verifyPermission('create.products');
		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->product->rolesCreate, $this->product->messages);

		// Validando cores e imagens
		if(empty($data['id-colors'])){
			redirect(route('panel.products.create'), ['error' => 'O produto precisa que pelo menos possua uma cor!'], true);
		}

		for($i = 0; $i < count($data['id-colors']); $i++){
			$id = trim($data['id-colors'][$i]);
			$description = trim($data['description-colors'][$i]);
			$hex = trim($data['hex-colors'][$i]);

			// Descrição da cor
			if(empty($description) || empty($hex)){
				redirect(route('panel.products.create'), ['error' => 'Todos os campos das cores devem ser preenchidos!(Descrição, Cor, Imagens e Tamanhos)'], true);
			}

			// Imagens da cor
			$images = $request->file("images-{$id}");

			if(empty($images)){
				redirect(route('panel.products.create'), ['error' => 'Todos os campos das cores devem ser preenchidos!(Descrição, Cor, Imagens e Tamanhos)'], true);
			}

			for($j = 0; $j < count($images); $j++){
				if($images[$j]->error != 0){
					redirect(route('panel.products.create'), ['error' => 'Algumas imagens não são válidas!'], true);
					return;
				}
			}
		}

		// Cadastrando produto
		$data['slug'] = slugify($data['name']);

		$product = $this->product->create($data);

		if($product){
			// cadastrando descontos
			for($i = 0; $i < count($data['percents']); $i++){
				$percent = trim($data['percents'][$i]);
				$expiration = trim($data['expirations'][$i]);

				if(!empty($percent)){
					if(!empty($expiration)){
						$product->discounts()->create([
							'installment' => $i + 1,
							'percent' => $percent,
							'expiration' => $expiration
						]);
					}else{
						$product->discounts()->create([
							'installment' => $i + 1,
							'percent' => $percent
						]);
					}
				}
			}

			// cadastrando subcategorias
			$product->subcategories()->sync($data['subcategories']);

			// cadastrando cores
			for($i = 0; $i < count($data['id-colors']); $i++){
				$id = trim($data['id-colors'][$i]);
				$description = trim($data['description-colors'][$i]);
				$hex = trim($data['hex-colors'][$i]);

				$color = $product->colors()->create([
					'description' => $description,
					'hex' => $hex
				]);

				if($color){
					// cadastrando tamanhos
					$descriptions = $data["description-size-{$id}"];
					$prices = $data["price-size-{$id}"];
					$pricesPrevious = $data["price-previous-size-{$id}"];
					$quanties = $data["quantity-size-{$id}"];
					$widths = $data["width-size-{$id}"];
					$heights = $data["height-size-{$id}"];
					$depths = $data["depth-size-{$id}"];
					$weights = $data["weight-size-{$id}"];

					for($j = 0; $j < count($descriptions); $j++){
						if(!empty(trim($descriptions[$j])) && !empty(trim($prices[$j])) && !empty(trim($pricesPrevious[$j])) && !empty(trim($quanties[$j])) && !empty(trim($widths[$j])) && !empty(trim($heights[$j])) && !empty(trim($depths[$j])) || !empty(trim($weights[$j]))){
							$size = $color->sizes()->create([
								'description' 		=> trim($descriptions[$j]),
								'price' 			=> number($prices[$j]),
								'price_previous' 	=> number($pricesPrevious[$j]),
								'quantity'			=> number($quanties[$j]),
								'width'				=> number($widths[$j]),
								'height'			=> number($heights[$j]),
								'depth'				=> number($depths[$j]),
								'weight'			=> number($weights[$j])
							]);
						}
					}

					// cadastrando imagens
					$images = $request->file("images-{$id}");

					for($j = 0; $j < count($images); $j++){
						if($images[$j]->error == 0){
							$filename = $images[$j]->store('products');

							if($filename){
								$image = $color->images()->create([
									'source' => $filename
								]);

								if(!$image){
									Storage::delete($filename);
								}
							}
						}
					}
				}
			}

			// Cadastrando produtos relacionados
			if(isset($data['products_related'])){
				foreach($data['products_related'] as $product_related){
					$product->relateds()->create([
						'product_related_id' => $product_related
					]);
				}
			}

			redirect(route('panel.products.create'), ['success' => 'Produto cadastrado com sucesso']);
		}

		redirect(route('panel.products.create'), ['error' => 'Produto NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->product->verifyPermission('edit.products');
		$product = $this->product->findOrFail($id);
		$categories = Category::all();

		return view('panel.products.edit', compact('categories', 'product'));
	}

	public function update($id){
		$this->product->verifyPermission('edit.products');
		$product = $this->product->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $product->rolesUpdate, $product->messages);

		// Validando cores e imagens
		if(empty($data['id-colors'])){
			redirect(route('panel.products.edit', ['id' => $id]), ['error' => 'O produto precisa que pelo menos possua uma cor!'], true);
		}

		for($i = 0; $i < count($data['id-colors']); $i++){
			$id_cor = trim($data['id-colors'][$i]);
			$description = trim($data['description-colors'][$i]);
			$hex = trim($data['hex-colors'][$i]);

			// Descrição da cor
			if(empty($description) || empty($hex)){
				redirect(route('panel.products.edit', ['id' => $id]), ['error' => 'Todos os campos das cores devem ser preenchidos!(Descrição, Cor, Imagens e Tamanhos)'], true);
			}

			// Imagens da cor
			$images = $request->file("images-{$id_cor}");

			if(empty($images)){
				redirect(route('panel.products.edit', ['id' => $id]), ['error' => 'Todos os campos das cores devem ser preenchidos!(Descrição, Cor, Imagens e Tamanhos)'], true);
			}
		}

		// Atualizando produto
		$data['slug'] = slugify($data['name']);

		if($product->update($data)){
			// cadastrando descontos
			$product->discounts()->delete();
			for($i = 0; $i < count($data['percents']); $i++){
				$percent = trim($data['percents'][$i]);
				$expiration = trim($data['expirations'][$i]);

				if(!empty($percent)){
					if(!empty($expiration)){
						$product->discounts()->create([
							'installment' => $i + 1,
							'percent' => $percent,
							'expiration' => $expiration
						]);
					}else{
						$product->discounts()->create([
							'installment' => $i + 1,
							'percent' => $percent
						]);
					}
				}
			}

			// cadastrando subcategorias
			$product->subcategories()->sync($data['subcategories']);

			// excluindo todas as cores, imagens e tamanhos do produto
			foreach($product->colors as $color){
				foreach($color->sizes as $size){
					if(!in_array($size->id, $data['id-sizes'])){
						$size->delete();
					}
				}

				foreach(explode(',', $data['images-remove']) as $source){
					$image = ProductImage::where('source', $source)->first();	

					if($image){
						Storage::delete($image->source);

						$image->delete();
					}
				}

				if(!in_array($color->id, $data['id-colors'])){
					foreach($color->images as $image){
						Storage::delete($image->source);

						$image->delete();
					}

					$color->delete();
				}
			}

			// cadastrando cores
			for($i = 0; $i < count($data['id-colors']); $i++){
				$id = trim($data['id-colors'][$i]);
				$description = trim($data['description-colors'][$i]);
				$hex = trim($data['hex-colors'][$i]);

				$color = $product->colors()->find($id);

				if($color){
					$color->update([
						'description' => $description,
						'hex' => $hex
					]);
				}else{
					$color = $product->colors()->create([
						'description' => $description,
						'hex' => $hex
					]);
				}

				if($color){
					// cadastrando tamanhos
					$id_sizes = $data["id-sizes-color-{$id}"];
					$descriptions = $data["description-size-{$id}"];
					$prices = $data["price-size-{$id}"];
					$pricesPrevious = $data["price-previous-size-{$id}"];
					$quanties = $data["quantity-size-{$id}"];
					$widths = $data["width-size-{$id}"];
					$heights = $data["height-size-{$id}"];
					$depths = $data["depth-size-{$id}"];
					$weights = $data["weight-size-{$id}"];

					for($j = 0; $j < count($id_sizes); $j++){
						$id_size = $id_sizes[$j];

						if(!empty(trim($descriptions[$j])) && !empty(trim($prices[$j])) && !empty(trim($pricesPrevious[$j])) && !empty(trim($quanties[$j])) && !empty(trim($widths[$j])) && !empty(trim($heights[$j])) && !empty(trim($depths[$j])) || !empty(trim($weights[$j]))){
							$size = $color->sizes->find($id_size);

							if($size){
								$size->update([
									'description' 		=> trim($descriptions[$j]),
									'price' 			=> number($prices[$j]),
									'price_previous' 	=> number($pricesPrevious[$j]),
									'quantity'			=> number($quanties[$j]),
									'width'				=> number($widths[$j]),
									'height'			=> number($heights[$j]),
									'depth'				=> number($depths[$j]),
									'weight'			=> number($weights[$j])
								]);
							}else{
								$size = $color->sizes()->create([
									'description' 		=> trim($descriptions[$j]),
									'price' 			=> number($prices[$j]),
									'price_previous' 	=> number($pricesPrevious[$j]),
									'quantity'			=> number($quanties[$j]),
									'width'				=> number($widths[$j]),
									'height'			=> number($heights[$j]),
									'depth'				=> number($depths[$j]),
									'weight'			=> number($weights[$j])
								]);
							}
						}
					}

					// cadastrando imagens
					$images = $request->file("images-{$id}");

					for($j = 0; $j < count($images); $j++){
						if($images[$j]->error == 0){
							$filename = $images[$j]->store('products');

							if($filename){
								$image = $color->images()->create([
									'source' => $filename
								]);

								if(!$image){
									Storage::delete($filename);
								}
							}
						}
					}
				}
			}

			// Cadastrando produtos relacionados
			$product->relateds()->delete();
			if(isset($data['products_related'])){
				foreach($data['products_related'] as $product_related){
					$product->relateds()->create([
						'product_related_id' => $product_related
					]);
				}
			}

			redirect(route('panel.products.edit', ['id' => $product->id]), ['success' => 'Produto editado com sucesso']);
		}

		redirect(route('panel.products.edit', ['id' => $product->id]), ['error' => 'Produto NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->product->verifyPermission('delete.products');
		$product = $this->product->findOrFail($id);

		$colors = $product->colors;
		$images = [];
		foreach($colors as $color){
			foreach($color->images as $image){
				$images[] = $image->source;
			}
		}

		if($product->delete()){
			// Deletando imagens do produto
			foreach($images as $image){
				Storage::delete($image);
			}

			redirect(route('panel.products'), ['success' => 'Produto deletado com sucesso']);
		}

		redirect(route('panel.products'), ['error' => 'Produto NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}