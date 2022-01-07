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

		$cards = $client->cards()->offset($page)->limit($limit)->get();

		return view('site.myaccount.cards.index', compact('client', 'cards', 'pages', 'builder'));
	}

	public function create(){
		return view('site.myaccount.cards.create');
	}

	public function store(){
		$request = new Request();
		$data = $request->all();
		$data['number'] = preg_replace('/[^\d]/i', '', $data['number']);

		$this->validator($data, $this->card->rolesCreate, $this->card->messages);

		if($this->client->cards()->create($data)){
			redirect(route('site.myaccount.cards.create'), ['success' => 'Cartão cadastrado com sucesso']);
		}

		redirect(route('site.myaccount.cards.create'), ['error' => 'Cartão NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$card = $this->client->cards()->findOrFail($id);

		return view('site.myaccount.cards.edit', compact('card'));
	}

	public function update($id){
		$card = $this->client->cards()->findOrFail($id);

		$request = new Request();
		$data = $request->all();
		$data['number'] = preg_replace('/[^\d]/i', '', $data['number']);

		$this->validator($data, $card->rolesUpdate, $card->messages);

		if($card->update($data)){
			redirect(route('site.myaccount.cards.edit', ['id' => $card->id]), ['success' => 'Cartão editado com sucesso']);
		}

		redirect(route('site.myaccount.cards.edit', ['id' => $card->id]), ['error' => 'Cartão NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$card = $this->client->cards()->findOrFail($id);

		if($card->delete()){
			redirect(route('site.myaccount.cards'), ['success' => 'Cartão deletado com sucesso']);
		}

		redirect(route('site.myaccount.cards'), ['error' => 'Cartão NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}