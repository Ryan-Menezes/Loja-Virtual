<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	User,
	Notice,
	Comment,
	SubComment,
	Coupon,
	SlideShow,
	Banner,
	Category,
	Role,
	Permission
};

class PanelController extends Controller{
	public function index(){
		/*
		$actions = ['view', 'create', 'edit', 'delete'];
		$tables = ['users', 'clients', 'products', 'assessments', 'requests', 'coupons', 'slideshow', 'banners', 'notices', 'comments', 'categories', 'roles', 'permissions'];

		foreach($tables as $table){
			foreach($actions as $action){
				Permission::create([
					'name' => "{$action}.{$table}",
					'description' => "{$action}.{$table}"
				]);
			}
		}
		*/

		$data = [
			'usersCount' 		=> User::count(),
			'clientsCount' 		=> 0,
			'productsCount'		=> 0,
			'assessmentsCount'	=> 0,
			'requestsCount' 	=> 0,
			'couponsCount' 		=> Coupon::count(),
			'slideshowCount' 	=> SlideShow::count(),
			'bannersCount' 		=> Banner::count(),
			'noticesCount' 		=> Notice::count(),
			'commentsCount' 	=> Comment::count() + SubComment::count(),
			'categoriesCount' 	=> Category::count(),
			'rolesCount' 		=> Role::count(),
			'permissionsCount' 	=> Permission::count()
		];

		return view('panel.index', $data);
	}
}