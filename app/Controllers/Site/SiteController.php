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

class SiteController extends Controller{
	public function index(){
		$notices = Notice::where('visible', true)->orderBy('id', 'DESC')->get();
		$categories = Category::all();

		return view('site.index', compact('notices', 'categories'));
	}
}