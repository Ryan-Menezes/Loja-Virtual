<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
    Category,
    Coupon
};

class CouponController extends Controller{
	private $coupon;

	public function __construct(){
		$this->coupon = new Coupon();

		$this->coupon->verifyPermission('view.coupons');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->coupon->search(1, $search, $this->coupon->count())->count() / config('paginate.limit'));

		$coupons = $this->coupon->search($page, $search)->get();

		return view('panel.coupons.index', compact('coupons', 'pages', 'builder'));
	}

	public function create(){
		$this->coupon->verifyPermission('create.coupons');
		$categories = Category::all();

		return view('panel.coupons.create', compact('categories'));
	}

	public function store(){
		$this->coupon->verifyPermission('create.coupons');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->coupon->rolesCreate, $this->coupon->messages);
		$data['code'] = mb_strtoupper($data['code']);
		if(empty($data['expiration'])){
			unset($data['expiration']);
		}

		$coupon = $this->coupon->create($data);

		if($coupon){
			// Cadastrando subcategorias voltadas para o cupom
			$coupon->subcategories()->sync($data['subcategories']);

			// Cadastrando produtos que ficarão de fora desse desconto
			$coupon->products()->sync($data['products_related']);

			redirect(route('panel.coupons.create'), ['success' => 'Cupom cadastrado com sucesso']);
		}

		redirect(route('panel.coupons.create'), ['error' => 'Cupom NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->coupon->verifyPermission('edit.coupons');

		$coupon = $this->coupon->findOrFail($id);
		$categories = Category::all();

		return view('panel.coupons.edit', compact('coupon', 'categories'));
	}

	public function update($id){
		$this->coupon->verifyPermission('edit.coupons');
		
		$coupon = $this->coupon->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $coupon->rolesUpdate, $coupon->messages);
		$data['code'] = mb_strtoupper($data['code']);
		if(empty($data['expiration'])){
			unset($data['expiration']);
		}

		if($coupon->update($data)){
			// Cadastrando subcategorias voltadas para o cupom
			$coupon->subcategories()->sync($data['subcategories']);

			// Cadastrando produtos que ficarão de fora desse desconto
			$coupon->products()->sync($data['products_related']);

			redirect(route('panel.coupons.edit', ['id' => $coupon->id]), ['success' => 'Cupom editado com sucesso']);
		}

		redirect(route('panel.coupons.edit'), ['error' => 'Cupom NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->coupon->verifyPermission('delete.coupons');
		$coupon = $this->coupon->findOrFail($id);

		if($coupon->delete()){
			redirect(route('panel.coupons'), ['success' => 'Cupom deletado com sucesso']);
		}

		redirect(route('panel.coupons'), ['error' => 'Cupom NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}