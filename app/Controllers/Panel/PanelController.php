<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	User,
	Client,
	Product,
	Rating,
	Notice,
	Comment,
	SubComment,
	Coupon,
	SlideShow,
	Banner,
	Depoiment,
	Category,
	SubCategory,
	Role,
	Permission
};

class PanelController extends Controller{
	public function index(){
		/*
		$actions = ['all'];
		$tables = ['system', 'system.address', 'system.contact', 'system.social', 'system.store', 'system.floater'];

		foreach($tables as $table){
			foreach($actions as $action){
				Permission::create([
					'name' => "{$action}.{$table}",
					'description' => "{$action}.{$table}"
				]);
			}
		}

		$actions = ['view', 'create', 'edit', 'delete'];
		$tables = ['users', 'clients', 'products', 'ratings', 'requests', 'coupons', 'slideshow', 'banners', 'depoiments', 'notices', 'comments', 'categories', 'roles', 'permissions'];

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
			'clientsCount' 		=> Client::count(),
			'productsCount'		=> Product::count(),
			'ratingsCount'		=> Rating::count(),
			'requestsCount' 	=> 0,
			'couponsCount' 		=> Coupon::count(),
			'slideshowCount' 	=> SlideShow::count(),
			'bannersCount' 		=> Banner::count(),
			'depoimentsCount'	=> Depoiment::count(),
			'noticesCount' 		=> Notice::count(),
			'commentsCount' 	=> Comment::count() + SubComment::count(),
			'categoriesCount' 	=> Category::count() + SubCategory::count(),
			'rolesCount' 		=> Role::count(),
			'permissionsCount' 	=> Permission::count()
		];

		return view('panel.index', $data);
	}
}