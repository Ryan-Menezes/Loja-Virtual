<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	ClientAddress,
	ClientCard
};

class CardController extends Controller{
	private $client;
	private $card;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
		
		$this->card = new ClientCard();
	}

	public function index(){;
		$request = new Request();

		$client = $this->client;

		$builder = $request->except('page');
		$limit = config('paginate.limit');
		$page = (($request->input('page') ?? 1) - 1) * $limit;
		$pages = ceil($client->cards->count() / $limit);

		$cards = $client->cards()->orderBy('id', 'DESC')->offset($page)->limit($limit)->get();

		return view('site.myaccount.cards.index', compact('client', 'cards', 'pages', 'builder'));
	}

	public function show($id){
		$card = $this->client->cards()->findOrFail($id);

		return view('site.myaccount.cards.show', compact('card'));
	}

	public function destroy($id){
		$card = $this->client->cards()->findOrFail($id);

		if($card->delete()){
			redirect(route('site.myaccount.cards'), ['success' => 'Cartão deletado com sucesso']);
		}

		redirect(route('site.myaccount.cards'), ['error' => 'Cartão NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}