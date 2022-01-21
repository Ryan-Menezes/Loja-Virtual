<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Request as RequestModel,
	Role
};
use App\Classes\Payment\PagSeguro;

class RequestController extends Controller{
	private $requestmodel;

	public function __construct(){
		$this->requestmodel = new RequestModel();

		$this->requestmodel->verifyPermission('view.requests');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->requestmodel->search(1, $search, $this->requestmodel->count())->count() / config('paginate.limit'));

		$requests = $this->requestmodel->search($page, $search)->get();

		return view('panel.requests.index', compact('requests', 'pages', 'builder'));
	}

	public function edit($id){
		$this->requestmodel->verifyPermission('edit.requests');

		$requestmodel = $this->requestmodel->findOrFail($id);

		if(config('store.types.pagseguro') || $requestmodel->payment->type == 'PS'){
			// Objeto do pagseguro
			$email = config('store.payment.credentials.pagseguro.email');
			$token = config('store.payment.credentials.pagseguro.token');
			$production = config('store.payment.production');

			$pagseguro = new PagSeguro($email, $token, !$production);

			// Verifica se a transação para este pedido já foi feita
			update_payment_request_pagseguro($pagseguro, $requestmodel);
		}

		return view('panel.requests.edit', compact('requestmodel'));
	}

	public function update($id){
		$this->requestmodel->verifyPermission('edit.requests');
		
		$requestmodel = $this->requestmodel->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $requestmodel->rolesUpdate, $requestmodel->messages);

		if($requestmodel->update($data)){
			if(config('store.types.pagseguro') || $requestmodel->payment->type == 'PS'){
				// Objeto do pagseguro
				$email = config('store.payment.credentials.pagseguro.email');
				$token = config('store.payment.credentials.pagseguro.token');
				$production = config('store.payment.production');
	
				$pagseguro = new PagSeguro($email, $token, !$production);
	
				// Verifica se a transação para este pedido já foi feita
				update_payment_request_pagseguro($pagseguro, $requestmodel);
			}

			redirect(route('panel.requests.edit', ['id' => $requestmodel->id]), ['success' => 'Pedido editado com sucesso']);
		}

		redirect(route('panel.requests.edit'), ['error' => 'Pedido NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->requestmodel->verifyPermission('delete.requests');
		$requestmodel = $this->requestmodel->findOrFail($id);

		$payment = $requestmodel->payment;
		$address = $requestmodel->address;

		if($requestmodel->delete()){
			$payment->delete();
			$address->delete();

			redirect(route('panel.requests'), ['success' => 'Pedido deletado com sucesso']);
		}

		redirect(route('panel.requests'), ['error' => 'Pedido NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}