@extends('templates.panel')

@section('title', 'Editar Comentário')

@section('container')
<div class="container-main">
	<div class="border mb-4 p-4 bg-white">
		<p><a href="{{ route('site.notices.show', ['slug' => $subcomment->comment->notice->slug]) }}" title="Visualizar: {{ $subcomment->comment->notice->title }}" target="_blank"><strong>{{ $subcomment->comment->notice->title }} <i class="fas fa-external-link-alt"></i></strong></a></p>

		<p class="m-0 p-0">{!! str_ireplace("\n", '<br>', $comment->notice->description) !!}</p>
	</div>
	<div class="border mb-4 p-4 bg-white">
		<p><strong>{{ $subcomment->name }}</strong> | <strong>{{ $subcomment->email }}</strong></p>

		<p class="mt-4 mb-0">{!! str_ireplace("\n", '<br>', $subcomment->content) !!}</p>
	</div>

	@include('includes.panel.subcomments.form', ['action' => route('panel.comments.subcomments.update', ['comment' => $comment->id, 'id' => $subcomment->id]), 'method' => 'PUT'])
</div>
@endsection