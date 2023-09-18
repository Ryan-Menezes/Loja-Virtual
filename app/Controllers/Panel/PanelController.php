<?php
namespace App\Controllers\Panel;

use Src\Classes\Controller;
use App\Models\{
	User,
	Page,
	Client,
	Product,
	Rating,
	Request as RequestModel,
	Notice,
	Comment,
	SubComment,
	Coupon,
	SlideShow,
	Banner,
	Partner,
	Galery,
	Depoiment,
	Category,
	SubCategory,
	Role,
	Permission
};
use Illuminate\Database\Capsule\Manager as DB;

class PanelController extends Controller{
	public function index(){
		// $this->generatePermissions();

		$data = [
			'usersCount' 		=> User::count(),
			'pagesCount'		=> Page::count(),
			'clientsCount' 		=> Client::count(),
			'productsCount'		=> Product::count(),
			'ratingsCount'		=> Rating::count(),
			'requestsCount' 	=> RequestModel::count(),
			'couponsCount' 		=> Coupon::count(),
			'slideshowCount' 	=> SlideShow::count(),
			'bannersCount' 		=> Banner::count(),
			'galleriesCount'	=> Galery::count(),
			'partnersCount'		=> Partner::count(),
			'depoimentsCount'	=> Depoiment::count(),
			'noticesCount' 		=> Notice::count(),
			'commentsCount' 	=> Comment::count() + SubComment::count(),
			'categoriesCount' 	=> Category::count() + SubCategory::count(),
			'rolesCount' 		=> Role::count(),
			'permissionsCount' 	=> Permission::count()
		];

		return view('panel.index', $data);
	}

	private function generatePermissions(){
		$permission = new Permission();

		foreach($permission->get() as $permission){
			$permission->delete();
		}

		$table = $permission->table;
		DB::unprepared("ALTER TABLE {$table} AUTO_INCREMENT = 1");

		generatePermissions(
			[
				'all'
			],
			[
				'system', 
				'system.address', 
				'system.contact', 
				'system.social', 
				'system.store', 
				'system.lgpd', 
				'system.floater',
				'system.ftp'
			]
		);

		generatePermissions(
			[
				'view', 
				'create', 
				'edit', 
				'delete'
			],
			[
				'users',
				'pages', 
				'clients', 
				'products', 
				'ratings', 
				'requests', 
				'coupons', 
				'slideshow', 
				'banners',
				'galleries',
				'partners', 
				'depoiments', 
				'notices', 
				'comments', 
				'categories', 
				'roles', 
				'permissions'
			]
		);
	}
}