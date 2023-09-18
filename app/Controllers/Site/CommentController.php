<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller,
	Mail
};
use App\Models\{
	Notice,
	Comment,
	SubComment
};

class CommentController extends Controller{
	private $notice;
	private $comment;
	private $subcomment;

	public function __construct(){
		$this->notice = new Notice();
		$this->comment = new Comment();
		$this->subcomment = new SubComment();
	}

	public function store($slug){
		$notice = $this->notice
							->where('slug', $slug)
							->where('visible', true)
							->where('comments_active', true)
							->firstOrFail();

		$request = new Request();
		$client = auth('site');
		$data = $request->all();

		$this->validator($data, $this->comment->rolesCreate, $this->comment->messages);

		if($client){
			$data['name'] = $client->name;
			$data['email'] = $client->email;
		}

		$comment = $notice->comments()->create($data);

		if($comment){
			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('app.contact.email'), config('app.name'))
					->subject('Alguém fez um comentário na sua notícia: ' . $notice->title)
					->message(view('mail.comment.comment', compact('notice', 'comment')))
					->send(config('mail.to'), config('app.name'));

			redirect(route('site.notices.show', ['slug' => $notice->slug]) . '#commentsarea', ['success' => 'Comentário enviado com sucesso']);
		}

		redirect(route('site.notices.show', ['slug' => $notice->slug]) . '#commentsarea', ['error' => 'Comentário NÃO enviado, Ocorreu um erro no processo de envio!'], true);
	}

	public function response($slug, $id){
		$notice = $this->notice
							->where('slug', $slug)
							->where('visible', true)
							->where('comments_active', true)
							->firstOrFail();
							
		$comment = $notice->comments()->where('visible', true)->findOrFail($id);

		$request = new Request();
		$client = auth('site');
		$data = $request->all();

		$this->validator($data, $this->subcomment->rolesCreate, $this->subcomment->messages);

		if($client){
			$data['name'] = $client->name;
			$data['email'] = $client->email;
		}

		$subcomment = $comment->subcomments()->create($data);

		if($subcomment){
			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('app.contact.email'), config('app.name'))
					->subject('Alguém respondeu o seu comentário na notícia: ' . $notice->title)
					->message(view('mail.comment.response', [
						'notice' => $notice,
						'subcomment' => $subcomment,
						'panel' => false
					]))
					->send($comment->email, $comment->name);

			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('app.contact.email'), config('app.name'))
					->subject('Alguém respondeu o seu comentário na notícia: ' . $notice->title)
					->message(view('mail.comment.response', [
						'notice' => $notice,
						'subcomment' => $subcomment,
						'panel' => true
					]))
					->send(config('mail.to'), config('app.name'));

			redirect(route('site.notices.show', ['slug' => $notice->slug]) . '#commentsarea', ['success' => 'Resposta enviada com sucesso']);
		}

		redirect(route('site.notices.show', ['slug' => $notice->slug]) . '#commentsarea', ['error' => 'Resposta NÃO enviada, Ocorreu um erro no processo de envio!'], true);
	}
}