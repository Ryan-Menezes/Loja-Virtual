<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	ClientAddress
};

class AddressController extends Controller{
	private $client;
	private $address;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			redirect(route('site.login'));
		
		$this->address = new ClientAddress();
	}

	public function index(){;
		$request = new Request();

		$client = $this->client;

		$builder = $request->except('page');
		$limit = config('paginate.limit');
		$page = (($request->input('page') ?? 1) - 1) * $limit;
		$pages = ceil($client->adresses->count() / $limit);

		$adresses = $client->adresses()->orderBy('id', 'DESC')->offset($page)->limit($limit)->get();

		return view('site.myaccount.adresses.index', compact('client', 'adresses', 'pages', 'builder'));
	}

	public function create(){
		return view('site.myaccount.adresses.create');
	}

	public function store(){
		$request = new Request();
		$data = $request->all();
		$data['postal_code'] = preg_replace('/[^\d]/i', '', $data['postal_code']);

		$this->validator($data, $this->address->rolesCreate, $this->address->messages);

		if($this->client->adresses()->create($data)){
			redirect(route('site.myaccount.adresses.create'), ['success' => 'Endereço cadastrado com sucesso']);
		}

		redirect(route('site.myaccount.adresses.create'), ['error' => 'Endereço NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$address = $this->client->adresses()->findOrFail($id);

		return view('site.myaccount.adresses.edit', compact('address'));
	}

	public function update($id){
		$address = $this->client->adresses()->findOrFail($id);

		$request = new Request();
		$data = $request->all();
		$data['postal_code'] = preg_replace('/[^\d]/i', '', $data['postal_code']);

		$this->validator($data, $address->rolesUpdate, $address->messages);

		if($address->update($data)){
			redirect(route('site.myaccount.adresses.edit', ['id' => $address->id]), ['success' => 'Endereço editado com sucesso']);
		}

		redirect(route('site.myaccount.adresses.edit', ['id' => $address->id]), ['error' => 'Endereço NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$address = $this->client->adresses()->findOrFail($id);

		if($address->id == $this->client->shipping_address_id || $address->id == $this->client->billing_address_id)
			abort(404);

		if($address->delete()){
			redirect(route('site.myaccount.adresses'), ['success' => 'Endereço deletado com sucesso']);
		}

		redirect(route('site.myaccount.adresses'), ['error' => 'Endereço NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}