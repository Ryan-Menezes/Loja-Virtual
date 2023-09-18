<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use App\Models\{
	Comment,
    SubComment
};

class SubCommentController extends Controller{
	private $comment;
    private $subcomment;

	public function __construct(){
		$this->comment = new Comment();
		$this->subcomment = new SubComment();

		$this->subcomment->verifyPermission('view.comments');
	}

	public function index($comment){
		$request = new Request();

        $comment = $this->comment->findOrFail($comment);

		$builder = $request->except('page');
		$page = $request->input('page') ?? 1;
		$search = $request->input('search');
		$pages = ceil($comment->subcomments->count() / config('paginate.limit'));
		$pages = ceil($this->subcomment->search($comment->id, 1, $search, $comment->subcomments->count())->count() / config('paginate.limit'));

		$subcomments = $this->subcomment->search($comment->id, $page, $search)->get();

		return view('panel.comments.subcomments.index', compact('comment', 'subcomments', 'pages', 'builder'));
	}

    public function edit($comment, $id){
		$this->subcomment->verifyPermission('edit.comments');

		$comment = $this->comment->findOrFail($comment);
        $subcomment = $comment->subcomments()->findOrFail($id);

		return view('panel.comments.subcomments.edit', compact('comment', 'subcomment'));
	}

	public function update($comment, $id){
		$this->subcomment->verifyPermission('edit.comments');
		
		$comment = $this->comment->findOrFail($comment);
        $subcomment = $comment->subcomments()->findOrFail($id);

		$request = new Request();
		$data = $request->all();

		if($subcomment->update($data)){
			redirect(route('panel.comments.subcomments.edit', ['comment' => $comment->id, 'id' => $subcomment->id]), ['success' => 'Resposta editada com sucesso']);
		}

		redirect(route('panel.comments.subcomments.edit', ['comment' => $comment->id, 'id' => $subcomment->id]), ['error' => 'Resposta NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function destroy($comment, $id){
		$this->subcomment->verifyPermission('delete.comments');
		
        $comment = $this->comment->findOrFail($comment);
        $subcomment = $comment->subcomments()->findOrFail($id);

		if($subcomment->delete()){
			redirect(route('panel.comments.subcomments', ['comment' => $comment->id]), ['success' => 'Resposta deletada com sucesso']);
		}

		redirect(route('panel.comments.subcomments', ['comment' => $comment->id]), ['error' => 'Resposta NÃO deletada, Ocorreu um erro no processo de exclusão!']);
	}
}