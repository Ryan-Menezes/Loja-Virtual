<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Product,
	Notice,
	Banner,
	SlideShow
};

class SiteController extends Controller{
	public function index(){
		$products = Product::where('visible', true)->orderBy('id', 'DESC')->limit(20)->get();
		$notices = Notice::orderBy('id', 'DESC')->limit(3)->get();
		$banners = Banner::all();
		$slideshow = SlideShow::all();

		return view('site.index', compact('products', 'notices', 'banners', 'slideshow'));
	}
}