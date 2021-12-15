<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Notice,
	Category
};

class SiteMapController extends Controller{
	private $sitemap;
	private $sitemapImages;

	public function __construct(){
		$urls = config('sitemap.urls');
		$pages = ceil(Notice::count() / config('paginate.limit'));

		// Notices
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
		foreach(Category::all() as $category){
			array_push($urls, [
				'loc' => route('site.categories.show', ['slug' => $category->slug]),
				'changefreq' => 'weekly',
            	'priority' => '0.80'
			]);

			$pages = ceil($category->notices->count() / config('paginate.limit'));

			for($i = 1; $i <= $pages; $i++){
				array_push($urls, [
					'loc' => route('site.categories.show', ['slug' => $category->slug]) . '?' . http_build_query(['page' => $i]),
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