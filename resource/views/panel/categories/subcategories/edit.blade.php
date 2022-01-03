@extends('templates.panel')

@section('title', 'Editar Sub Categoria da Categoria: ' . $category->name)

@section('container')
<div class="container-main">
	@include('includes.panel.subcategories.form', ['action' => route('panel.categories.subcategories.update', ['category' => $category->id, 'id' => $subcategory->id]), 'method' => 'PUT'])
</div>
@endsection