@extends('templates.site')

@section('title', isset($subcategory) ? $subcategory->name : 'Blog')
@section('url', isset($subcategory) ? route('site.notices.category.subcategory', ['category' => $subcategory->category->slug, 'subcategory' => $subcategory->slug]) : route('site.notices'))

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
                    @if(count($category->subcategories))
                    <li>
                        <p><strong>{{ $category->name }}</strong></p>
                        
                        <ul style="margin-left: 30px;">
                            @foreach($category->subcategories as $subcategory)
                                <li><a href="{{ route('site.notices.category.subcategory', ['category' => $category->slug, 'subcategory' => $subcategory->slug]) }}" title="Artigos da Sub Categoria: {{ $subcategory->name }}">{{ $subcategory->name }}</a></li>
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