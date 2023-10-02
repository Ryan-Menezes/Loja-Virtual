<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller,
	Mail
};
use App\Models\{
	Product,
	Notice,
	Banner,
	SlideShow,
	FormContact,
	Lgpd
};

class SiteController extends Controller{
	public function index(){
		$products = Product::with('ratings')->where('visible', true)->orderBy('id', 'DESC')->limit(20)->get();
		$products_showcase = Product::with('ratings')->where('visible', true)->where('showcase', true)->orderBy('id', 'DESC')->get();
		$notices = Notice::orderBy('id', 'DESC')->limit(3)->get();
		$banners = Banner::cached();
		$slideshow = SlideShow::cached();

		return view('site.index', compact('products', 'products_showcase', 'notices', 'banners', 'slideshow'));
	}

	public function lgpd(){
		$request = new Request();
		$server = $request->server();
		$url = $request->input('url_next');
		$method = 'GET';
		$ip = $server['REMOTE_ADDR'];
		$user_agent = $server['HTTP_USER_AGENT'];
		$referer = $request->input('url_current');

		if(!preg_match('/\.(css|js|jpg|jpeg|gif|png)$/mi', $referer) && !strstr($url, trim(config('app.url'), '/'))){
			Lgpd::create([
				'url' 		=> $url,
				'method'	=> $method,
				'ip' 		=> $ip,
				'browser' 	=> browser($user_agent),
				'device' 	=> device($user_agent),
				'so' 		=> so($user_agent),
				'referer' 	=> $referer,
				'server' 	=> json_encode($server)
			]);
		}
	}

	public function contact(){
		return view('site.contact.index');
	}

	public function sendMail(){
		$data = (new Request())->all();
		$form = new FormContact();

		$this->validator($data, $form->rolesCreate, $form->messages);

		$result = Mail::isHtml(true)
						->charset(config('mail.charset'))
						->addFrom($data['email'], $data['name'])
						->subject('Contato via formulário ' . config('app.name') . ': ' . $data['subject'])
						->message(view('mail.contact', $data))
						->send(config('mail.to'), config('app.name'));

		if($result){
			$form->create($data);

			redirect(route('site') . '#contact', ['success' => 'Sua mensagem foi enviada com sucesso, Em breve enviaremos uma resposta!']);
		}

		redirect(route('site') . '#contact', ['error' => 'Infelizmente não foi possível enviar à mensagem, Ocorreu um erro no processo de envio!']);
	}
}