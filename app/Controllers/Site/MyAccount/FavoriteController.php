<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	Product
};

class FavoriteController extends Controller{
	private $client;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);
	}

	public function index(){
		if(!$this->client)
			redirect(route('site.login'));

		$request = new Request();

		$client = $this->client;

		$builder = $request->except('page');
		$limit = config('paginate.limit');
		$page = (($request->input('page') ?? 1) - 1) * $limit;
		$pages = ceil($client->favorites->count() / $limit);

		$favorites = $client->favorites()->orderBy('id', 'DESC')->offset($page)->limit($limit)->get();

		return view('site.myaccount.favorites.index', compact('client', 'favorites', 'pages', 'builder'));
	}

	public function add($id){
		if($this->client){
			$product = Product::find($id);

			if($product){
				$this->client->favorites()->detach($product->id);
				$this->client->favorites()->attach($product->id);

				return json_encode([
					'success' => true,
					'message' => 'Produto adicionado aos favoritos com sucesso!'
				]);
			}

			return json_encode([
				'success' => false,
				'message' => 'O produto que ia ser adicionado aos favoritos não existe!'
			]);
		}

		return json_encode([
			'success' => false,
			'message' => 'Você precisa estar logado para adicionar este produto ao seus favoritos!'
		]);
	}

	public function remove($id){
		$product = Product::findOrFail($id);

		if($this->client->favorites()->detach($product->id)){
			redirect(route('site.myaccount.favorites'), ['success' => 'Produto removido dos favoritos com sucesso!']);
		}

		redirect(route('site.myaccount.favorites'), ['error' => 'Produto NÃO removido dos favoritos, Ocorreu um erro no processo de remoção!']);
	}
}