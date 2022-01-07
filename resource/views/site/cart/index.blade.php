@extends('templates.site')

@section('title', 'Carrinho')
@section('url', route('site.cart'))
@section('description', 'Aqui está o seu carrinho de compras')
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
@include('includes.site.modais.delete', [
    'title' => 'Remover do Carrinho',
    'message' => 'Deseja realmente remover este produto do carrinho?',
    'btnmsg' => 'Remover'
])

<section class="container">
	<h1>Carrinho</h1><hr />

	@include('includes.messages')

	<table class="table table-hover">
	    <thead>
	        <tr>
	        	<th>Imagem</th>
	            <th>Produto</th>
	            <th>Cor, Tamanho e Preço</th>
	            <th>Quantidade</th>
	            <th></th>
	        </tr>
	    </thead>
	    <tbody>
	        @foreach($products as $product)
		        @if($product->product->visible)
		        <tr>
		        	<td><img src="{{ url('storage/app/public/' . $product->size->color->images->first()->source) }}" title="{{ $product->product->name }}" alt="{{ $product->product->name }}"></td>
		            <td><a href="{{ route('site.products.show', ['slug' => $product->product->slug]) }}" title="Var mais sobre: {{ $product->product->name }}" target="_blank">{{ $product->product->name }} <i class="fa fa-external-link"></i></a></td>
		            <td>
		            	<select class="form-control" name="product">
		            		@foreach($product->product->colors as $color)
		            			@if($color->sizes->where('quantity', '>', 0)->count())
		            			<optgroup label="{{ $color->description }}">
				            		@foreach($color->sizes->where('quantity', '>', 0) as $size)
				            			@if($product->size->id == $size->id)
				            			<option selected>{{ $color->description }} - {{ $size->description }} - R${{ $size->priceFormat }}</option>
				            			@else
				            			<option>{{ $color->description }} - {{ $size->description }} - R${{ $size->priceFormat }}</option>
				            			@endif
				            		@endforeach
			            		</optgroup>
			            		@endif
		            		@endforeach
		            	</select>
		            </td>
		            <td>{{ $product->quantity }}</td>
		            <td>
		                <a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('site.cart.destroy', ['id' => $product->size->id]) }}" data-toggle="modal" data-target="#modalDelete" title="Remover do Carrinho"><i class="fa fa-trash"></i></a>
		            </td>
		        </tr>
		    	@endif
	        @endforeach
	    </tbody>
	</table>
</section>
@endsection