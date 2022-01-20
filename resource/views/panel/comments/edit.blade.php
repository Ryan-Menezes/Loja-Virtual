@extends('templates.panel')

@section('title', 'Editar Comentário')

@section('container')
<div class="container-main">
	<div class="border mb-4 p-4 bg-white">
		<p><a href="{{ route('site.notices.show', ['slug' => $comment->notice->slug]) }}" title="Visualizar: {{ $comment->notice->title }}" target="_blank"><strong>{{ $comment->notice->title }} <i class="fas fa-external-link-alt"></i></strong></a></p>

		<p class="m-0 p-0">{!! str_ireplace("\n", '<br>', $comment->notice->description) !!}</p>
	</div>
	<div class="border mb-4 p-4 bg-white">
		<p><strong>{{ $comment->name }}</strong> | <strong>{{ $comment->email }}</strong></p>

		<p class="mt-4 mb-0">{!! str_ireplace("\n", '<br>', $comment->content) !!}</p>
	</div>

	@include('includes.panel.comments.form', ['action' => route('panel.comments.update', ['id' => $comment->id]), 'method' => 'PUT'])
</div>
@endsection