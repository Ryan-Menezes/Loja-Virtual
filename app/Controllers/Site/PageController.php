<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Page;

class PageController extends Controller{
	private $page;

	public function __construct(){
		$this->page = new Page();
	}

	public function index(){
        $server = (new Request())->server();
        $page = $this->page->where('url', trim($server['REQUEST_URI'], '/'))->firstOrFail();

		return view('site.pages.index', compact('page'));
	}
}