<?php
namespace App\Classes;

use App\Models\Notice;

class SiteMap{
    public static function create(){
        $urls = config('sitemap.urls');
		foreach(Notice::all() as $notice){
			array_push($urls, [
				'loc' => route('site.notices.show', ['slug' => $notice->slug]),
            	'priority' => '0.80'
			]);
		}

		sitemap($urls);
		sitemapImages();
    }
}