@extends('templates.site')

@section('title', 'Blog')
@section('url', route('site.notices'))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
<section class="container">
    <div class="col-md-8">
        <div class="notices" style="grid-template-columns: 1fr;">
            @foreach($notices as $notice)
            @include('includes.site.notices.card')
            @endforeach
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Categorias</h2>
            </div>
            <ul class="card-content">
                @foreach($categories as $category)
                    @if($category->notices()->count() && $category->subcategories->count())
                    <li>
                        <p><strong>{{ $category->name }}({{ $category->notices()->count() }})</strong></p>
                        
                        <ul style="margin-left: 30px;">
                            @foreach($category->subcategories()->orderBy('name')->get() as $subcategory)
                                @if($subcategory->notices()->count())
                                <li><a href="{{ route('site.notices.category.subcategory', ['category' => $category->slug, 'subcategory' => $subcategory->slug]) }}" title="Artigos da Sub Categoria: {{ $subcategory->name }}">{{ $subcategory->name }}({{ $subcategory->notices->count() }})</a></li>
                                @endif
                            @endforeach
                        </ul>
                    </li>
                    @endif
                @endforeach
            </ul>
        </div>
    </div>

    <div class="col-md-12">
       @include('includes.site.paginator') 
    </div>
</section>
@endsection