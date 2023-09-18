<?php
namespace App\Controllers\Site;

use Src\Classes\Controller;
use App\Models\{
	Product,
	Notice,
	SubCategory,
	Page
};

class SiteMapController extends Controller{
	private $sitemap;
	private $sitemapImages;

	public function __construct(){
		$urls = config('sitemap.urls');

		// Products
		$pages = ceil(Product::where('visible', true)->count() / config('paginate.limit'));

		for($i = 1; $i <= $pages; $i++){
			array_push($urls, [
				'loc' => route('site.products') . '?' . http_build_query(['page' => $i]),
				'changefreq' => 'weekly',
            	'priority' => '0.64'
			]);
		}
		
		foreach(Product::where('visible', true)->get() as $product){
			array_push($urls, [
				'loc' => route('site.products.show', ['slug' => $product->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);
		}

		// Notices
		$pages = ceil(Notice::where('visible', true)->count() / config('paginate.limit'));

		for($i = 1; $i <= $pages; $i++){
			array_push($urls, [
				'loc' => route('site.notices') . '?' . http_build_query(['page' => $i]),
				'changefreq' => 'weekly',
            	'priority' => '0.64'
			]);
		}
		
		foreach(Notice::where('visible', true)->get() as $notice){
			array_push($urls, [
				'loc' => route('site.notices.show', ['slug' => $notice->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);
		}

		// Categories Notices
		foreach(SubCategory::all() as $subcategory){
			array_push($urls, [
				'loc' => route('site.notices.category.subcategory', ['category' => $subcategory->category->slug, 'subcategory' => $subcategory->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);

			$pages = ceil($subcategory->notices->count() / config('paginate.limit'));

			for($i = 1; $i <= $pages; $i++){
				array_push($urls, [
					'loc' => route('site.notices.category.subcategory', ['category' => $subcategory->category->slug, 'subcategory' => $subcategory->slug]) . '?' . http_build_query(['page' => $i]),
					'changefreq' => 'weekly',
	            	'priority' => '0.64'
				]);
			}
		}

		// Categories Products
		foreach(SubCategory::all() as $subcategory){
			array_push($urls, [
				'loc' => route('site.products.category.subcategory', ['category' => $subcategory->category->slug, 'subcategory' => $subcategory->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);

			$pages = ceil($subcategory->products->count() / config('paginate.limit'));

			for($i = 1; $i <= $pages; $i++){
				array_push($urls, [
					'loc' => route('site.products.category.subcategory', ['category' => $subcategory->category->slug, 'subcategory' => $subcategory->slug]) . '?' . http_build_query(['page' => $i]),
					'changefreq' => 'weekly',
	            	'priority' => '0.64'
				]);
			}
		}

		// Pages
		foreach(Page::where('visible', true)->get() as $page){
			array_push($urls, [
				'loc' => url() . $page->url,
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);
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