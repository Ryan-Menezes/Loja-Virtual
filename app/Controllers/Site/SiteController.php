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
		$products_showcase = Product::where('visible', true)->where('showcase', true)->orderBy('id', 'DESC')->get();
		$notices = Notice::orderBy('id', 'DESC')->limit(3)->get();
		$banners = Banner::all();
		$slideshow = SlideShow::all();

		return view('site.index', compact('products', 'products_showcase', 'notices', 'banners', 'slideshow'));
	}
}