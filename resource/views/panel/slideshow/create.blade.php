@extends('templates.panel')

@section('title', 'Novo Slide')

@section('container')
<div class="container-main">
	@include('includes.panel.slideshow.form', ['action' => route('panel.slideshow.store'), 'method' => 'POST'])
</div>
@endsection