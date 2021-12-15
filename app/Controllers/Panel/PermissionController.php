<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Permission;

class PermissionController extends Controller{
	private $permission;

	public function __construct(){
		$this->permission = new Permission();

		$this->permission->verifyPermission('view.permissions');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->permission->count() / config('paginate.limit'));

		$permissions = $this->permission->search($page, $search);

		return view('panel.permissions.index', compact('permissions', 'pages', 'builder'));
	}
}