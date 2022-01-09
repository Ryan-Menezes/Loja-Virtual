<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\Comment;

class CommentController extends Controller{
	private $comment;

	public function __construct(){
		$this->comment = new Comment();

		$this->comment->verifyPermission('view.comments');
	}

	public function index(){
		$request = new Request();

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($this->comment->search(1, $search, $this->comment->count())->count() / config('paginate.limit'));

		$comments = $this->comment->search($page, $search)->get();

		return view('panel.comments.index', compact('comments', 'pages', 'builder'));
	}

    public function edit($id){
		$this->comment->verifyPermission('edit.comments');

		$comment = $this->comment->findOrFail($id);

		return view('panel.comments.edit', compact('comment'));
	}

	public function update($id){
		$this->comment->verifyPermission('edit.comments');
		
		$comment = $this->comment->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		if($comment->update($data)){
			redirect(route('panel.comments.edit', ['id' => $comment->id]), ['success' => 'Comentário editado com sucesso']);
		}

		redirect(route('panel.comments.edit'), ['error' => 'Comentário NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($id){
		$this->comment->verifyPermission('delete.comments');
		$comment = $this->comment->findOrFail($id);

		if($comment->delete()){
			redirect(route('panel.comments'), ['success' => 'Comentário deletado com sucesso']);
		}

		redirect(route('panel.comments'), ['error' => 'Comentário NÃO deletado, Ocorreu um erro no processo de exclusão!']);
	}
}