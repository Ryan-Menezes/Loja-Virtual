<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Product,
	Notice,
	SubCategory
};

class SiteMapController extends Controller{
	private $sitemap;
	private $sitemapImages;

	public function __construct(){
		$urls = config('sitemap.urls');

		// Products
		$pages = ceil(Product::count() / config('paginate.limit'));

		for($i = 1; $i <= $pages; $i++){
			array_push($urls, [
				'loc' => route('site.products') . '?' . http_build_query(['page' => $i]),
				'changefreq' => 'weekly',
            	'priority' => '0.64'
			]);
		}
		
		foreach(Product::all() as $product){
			array_push($urls, [
				'loc' => route('site.products.show', ['slug' => $product->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);
		}

		// Notices
		$pages = ceil(Notice::count() / config('paginate.limit'));

		for($i = 1; $i <= $pages; $i++){
			array_push($urls, [
				'loc' => route('site.notices') . '?' . http_build_query(['page' => $i]),
				'changefreq' => 'weekly',
            	'priority' => '0.64'
			]);
		}
		
		foreach(Notice::all() as $notice){
			array_push($urls, [
				'loc' => route('site.notices.show', ['slug' => $notice->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);
		}

		// Categories
		foreach(SubCategory::all() as $subcategory){
			array_push($urls, [
				'loc' => route('site.categories.subcategories.show', ['slug' => $subcategory->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);

			$pages = ceil($subcategory->notices->count() / config('paginate.limit'));

			for($i = 1; $i <= $pages; $i++){
				array_push($urls, [
					'loc' => route('site.categories.subcategories.show', ['slug' => $subcategory->slug]) . '?' . http_build_query(['page' => $i]),
					'changefreq' => 'weekly',
	            	'priority' => '0.64'
				]);
			}
		}

		$this->sitemap = sitemap($urls, false);
		$this->sitemapImages = sitemapImages(false);
	}

	public function index(){
		header('Content-Type: application/xml');

		return $this->sitemap;
	}

	public function images(){
		header('Content-Type: application/xml');

		return $this->sitemapImages;
	}
}