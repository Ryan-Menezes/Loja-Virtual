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

	@if(count($products))
	<table class="table table-hover">
	    <thead>
	        <tr>
	        	<th>Imagem</th>
	            <th>Produto</th>
	            <th>Cor, Tamanho e Preço</th>
	            <th>Quantidade</th>
	            <th>Subtotal</th>
	            <th></th>
	        </tr>
	    </thead>
	    <tbody>
	        @foreach($products as $product)
		        @if($product->product->visible)
		        <form action="{{ route('site.cart.update') }}" method="POST">
		        	<input type="hidden" name="_method" value="PUT">
		        	<input type="hidden" name="id" value="{{ $product->size->id }}">
			        <tr>
			        	<td><img src="{{ url('storage/app/public/' . $product->size->color->images->first()->source) }}" title="{{ $product->product->name }}" alt="{{ $product->product->name }}"></td>
			            <td><a href="{{ route('site.products.show', ['slug' => $product->product->slug]) }}" title="Var mais sobre: {{ $product->product->name }}" target="_blank">{{ $product->product->name }} <i class="fa fa-external-link"></i></a></td>
			            <td>
			            	<select class="form-control" name="size">
			            		@foreach($product->product->colors as $color)
			            			@if($color->sizes->where('quantity', '>', 0)->count())
			            			<optgroup label="{{ $color->description }}">
					            		@foreach($color->sizes->where('quantity', '>', 0) as $size)
					            			@if($product->size->id == $size->id)
					            			<option value="{{ $size->id }}" selected>{{ $color->description }} - {{ $size->description }} - R$ {{ $size->priceFormat }}</option>
					            			@else
					            			<option value="{{ $size->id }}">{{ $color->description }} - {{ $size->description }} - R${{ $size->priceFormat }}</option>
					            			@endif
					            		@endforeach
				            		</optgroup>
				            		@endif
			            		@endforeach
			            	</select>
			            </td>
			            <td><input type="number" name="quantity" class="form-control" value="{{ $product->quantity }}" min="1" max="{{ $product->size->quantity }}"></td>
			            <td>R$ {{ number_format($product->quantity * $product->size->price, 2, ',', '.') }}</td>
			            <td>
			            	<button type="submit" class="btn btn-sm btn-primary" title="Atualizar Produto do Carrinho"><i class="fa fa-repeat"></i></button>
			                <a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('site.cart.destroy', ['id' => $product->size->id]) }}" data-toggle="modal" data-target="#modalDelete" title="Remover do Carrinho"><i class="fa fa-trash"></i></a>
			            </td>
			        </tr>
		    	</form>
		    	@endif
	        @endforeach
	    </tbody>
	</table>
	<hr />
    <div class="text-right text-end">
    	<p style="font-size: 20px;"><strong>TOTAL: </strong> R$ {{ number_format($cart->amount(), 2, ',', '.') }}</p>
    </div>
    <div class="row" style="margin-top: 40px;">
    	<div class="col-md-4">
    		<form action="" method="POST" class="row">
	    		<div class="col-md-8">
	    			<input type="text" name="coupon" class="form-control" placeholder="Cupom de desconto">
	    		</div>
	    		<div class="col-md-4">
	    			<button type="submit" class="btn btn-primary">VALIDAR</button>
	    		</div>
	    	</form>

	    	<br />

    		<form action="" method="POST" class="row">
	    		<div class="col-md-8">
	    			<input type="text" name="postal_code" class="form-control" placeholder="CEP para calcular o frete">
	    		</div>
	    		<div class="col-md-4">
	    			<button type="submit" class="btn btn-warning">CALCULAR</button>
	    		</div>
	    	</form>
    	</div>
    	
    	<div class="col-md-8 text-right text-end">
    		<a href="{{ route('site.cart.clear') }}" class="btn btn-primary" title="Limpar carrinho de compras">LIMPAR CARRINHO</a>

    		<button type="submit" class="btn btn-danger" title="Finalizar carrinho e efetuar o pedido">FINALIZAR COMPRA</button>
    	</div>
    </div>
    @else
    <p>SEU CARRINHO ESTÁ VÁZIO</p>
    @endif
</section>
@endsection