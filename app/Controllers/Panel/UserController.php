<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	User,
	Role
};

class UserController extends Controller{
	private $user;

	public function __construct(){
		$this->user = new User();

		$this->user->verifyPermission('view.users');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->user->search($page, $search, $this->user->count())->count() / config('paginate.limit'));

		$users = $this->user->search($page, $search)->get();

		return view('panel.users.index', compact('users', 'pages', 'builder'));
	}

	public function create(){
		$this->user->verifyPermission('create.users');
		$roles = Role::pluck('name', 'id')->all();

		return view('panel.users.create', compact('roles'));
	}

	public function store(){
		$this->user->verifyPermission('create.users');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->user->rolesCreate, $this->user->messages);
		$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);

		$user = $this->user->create($data);

		if($user){
			$user->roles()->sync($data['role']);

			redirect(route('panel.users.create'), ['success' => 'Usuário cadastrado com sucesso']);
		}

		redirect(route('panel.users.create'), ['error' => 'Usuário NÃO cadastrado, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->user->verifyPermission('edit.users');

		$user = $this->user->findOrFail($id);
		$roles = Role::pluck('name', 'id')->all();

		return view('panel.users.edit', compact('roles', 'user'));
	}

	public function update($id){
		$this->user->verifyPermission('edit.users');
		
		$user = $this->user->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $user->rolesUpdate, $user->messages);
		if(mb_strlen($data['password']) == 0){
			unset($data['password']);
		}else{
			$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
		}

		if($user->update($data)){
			$user->roles()->sync($data['role']);

			redirect(route('panel.users.edit', ['id' => $user->id]), ['success' => 'Usuário editado com sucesso']);
		}

		redirect(route('panel.users.edit'), ['error' => 'Usuário NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->user->verifyPermission('delete.users');
		$user = $this->user->findOrFail($id);

		if($user->delete()){
			redirect(route('panel.users'), ['success' => 'Usuário deletado com sucesso']);
		}

		redirect(route('panel.users'), ['error' => 'Usuário NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}