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
	Request as RequestModel,
	RequestProduct,
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
	Permission,
	Lgpd
};
use Illuminate\Database\Capsule\Manager as DB;

class PanelController extends Controller{
	public function index(){
		// $this->generatePermissions();

		// Páginas mais acessadas
		$pages_access = Lgpd::select('url', DB::raw('COUNT(*) as amount'))->groupBy('url')->orderBy(DB::raw('COUNT(*)'), 'DESC')->limit(5)->pluck('amount', 'url')->toArray();
		$keys = array_map(function($value){
			$page = str_ireplace(trim(url(), '/'), '', $value);
			return empty($page) ? '/' : $page;
 		}, array_keys($pages_access));
		$pages_access = array_combine($keys, $pages_access);

		// Produtos mais vendidos
		$products_requests = RequestProduct::select('product_id', DB::raw('COUNT(quantity) as amount'))->groupBy('product_id')->orderBy(DB::raw('COUNT(product_id)'), 'DESC')->limit(5)->pluck('amount', 'product_id')->toArray();
		$products = Product::select('id', 'name')->whereIn('id', array_keys($products_requests))->get();
		foreach($products as $product){
			$products_requests[$product->name] = $products_requests[$product->id];
			unset($products_requests[$product->id]);
		}
		arsort($products_requests);

		// Produtos mais acessados
		$products_access = Lgpd::select('url', DB::raw('COUNT(*) as amount'))->where('url', 'REGEXP', '/produtos/[a-z|A-Z|0-9]+')->groupBy('url')->orderBy(DB::raw('COUNT(*)'), 'DESC')->limit(5)->pluck('amount', 'url')->toArray();
		$keys = array_map(function($value){
			$page = str_ireplace(trim(url(), '/'), '', $value);
			return empty($page) ? '/' : $page;
 		}, array_keys($products_access));
		$products_access = array_combine($keys, $products_access);

		// Produtos mais bem avaliados
		$products_rating = Rating::select('product_id', DB::raw('AVG(stars) as avg'))->groupBy('product_id')->orderBy(DB::raw('AVG(stars)'), 'DESC')->limit(5)->pluck('avg', 'product_id')->toArray();
		$products = Product::select('id', 'name')->whereIn('id', array_keys($products_rating))->get();
		foreach($products as $product){
			$products_rating[$product->name] = $products_rating[$product->id];
			unset($products_rating[$product->id]);
		}
		arsort($products_rating);

		// Pedidos feitos nos útimos meses
		$request_amount = RequestModel::select(DB::raw('COUNT(*) as amount'), DB::raw('CONCAT(MONTH(created_at), "/", YEAR(created_at)) as cd'))->groupBy(DB::raw('CONCAT(YEAR(created_at), "-", MONTH(created_at))'))->orderBy('id', 'DESC')->limit(5)->pluck('amount', 'cd')->toArray();
		$request_amount = array_reverse($request_amount, true);

		// Noticias mais acessadas
		$notices_access = Notice::select('title', 'visits')->orderBy('visits', 'DESC')->limit(5)->pluck('visits', 'title')->toArray();

		$data = [
			'usersCount' 		=> User::count(),
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
			'permissionsCount' 	=> Permission::count(),
			'pages_access'		=> $pages_access,
			'products_access'	=> $products_access,
			'products_requests'	=> $products_requests,
			'products_rating'	=> $products_rating,
			'request_amount'	=> $request_amount,
			'notices_access'	=> $notices_access
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