@extends('templates.panel')

@section('title', 'Nova Sub Categoria Para: ' . $category->name)

@section('container')
<div class="container-main">
	@include('includes.panel.subcategories.form', ['action' => route('panel.categories.subcategories.store', ['category' => $category->id]), 'method' => 'POST'])
</div>
@endsection