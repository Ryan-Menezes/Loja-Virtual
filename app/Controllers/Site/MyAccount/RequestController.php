<?php
namespace App\Controllers\Site\MyAccount;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Client,
	ClientAddress,
	ClientCard,
    Request as RequestModel
};

class RequestController extends Controller{
	private $client;
	private $requestmodel;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
		
		$this->requestmodel = new RequestModel();
	}

	public function index(){;
		$request = new Request();

		$client = $this->client;

		$builder = $request->except('page');
		$limit = config('paginate.limit');
		$page = (($request->input('page') ?? 1) - 1) * $limit;
		$pages = ceil($client->requests->count() / $limit);

		$requests = $client->requests()->offset($page)->limit($limit)->get();

		return view('site.myaccount.requests.index', compact('client', 'requests', 'pages', 'builder'));
	}

    public function show($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        return view('site.myaccount.requests.show', compact('requestmodel'));
    }
}