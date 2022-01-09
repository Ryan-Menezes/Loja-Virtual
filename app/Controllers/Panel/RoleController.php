<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Role,
	Permission
};

class RoleController extends Controller{
	private $role;

	public function __construct(){
		$this->role = new Role();

		$this->role->verifyPermission('view.roles');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->role->search(1, $search, $this->role->count())->count() / config('paginate.limit'));

		$roles = $this->role->search($page, $search)->get();

		return view('panel.roles.index', compact('roles', 'pages', 'builder'));
	}

	public function create(){
		$this->role->verifyPermission('create.roles');
		$permissions = Permission::pluck('name', 'id')->all();

		return view('panel.roles.create', compact('permissions'));
	}

	public function store(){
		$this->role->verifyPermission('create.roles');

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $this->role->rolesCreate, $this->role->messages);

		$role = $this->role->create($data);

		if($role){
			if(array_key_exists('permissions', $data))
				$role->permissions()->sync($data['permissions']);

			redirect(route('panel.roles.create'), ['success' => 'Função cadastrada com sucesso']);
		}

		redirect(route('panel.roles.create'), ['error' => 'Função NÃO cadastrada, Ocorreu um erro no processo de cadastro!'], true);
	}

	public function edit($id){
		$this->role->verifyPermission('edit.roles');

		$role = $this->role->findOrFail($id);
		$permissions = Permission::pluck('name', 'id')->all();

		return view('panel.roles.edit', compact('role', 'permissions'));
	}

	public function update($id){
		$this->role->verifyPermission('edit.roles');
		
		$role = $this->role->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $role->rolesUpdate, $role->messages);

		if($role->update($data)){
			if(!array_key_exists('permissions', $data))
				$data['permissions'] = [];

			$role->permissions()->sync($data['permissions']);

			redirect(route('panel.roles.edit', ['id' => $role->id]), ['success' => 'Função editada com sucesso']);
		}

		redirect(route('panel.roles.edit', ['id' => $role->id]), ['error' => 'Função NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->role->verifyPermission('delete.roles');
		$role = $this->role->findOrFail($id);

		if($role->delete()){
			redirect(route('panel.roles'), ['success' => 'Função deletada com sucesso']);
		}

		redirect(route('panel.roles'), ['error' => 'Função NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}