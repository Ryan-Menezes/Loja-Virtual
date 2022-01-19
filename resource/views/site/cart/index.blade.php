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
			            <td>
							<select name="quantity" class="form-control">
								@for($i = 1; $i <= $product->size->quantity; $i++)
									@if($i == $product->quantity)
									<option value="{{ $i }}" selected>{{ $i }}</option>
									@else
									<option value="{{ $i }}">{{ $i }}</option>
									@endif
								@endfor
							</select>
						</td>
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
    		<div class="input-container">
    			<form action="{{ route('site.cart.freight') }}" method="POST" id="form-freight" data-container=".result-frete">
    				@if($client)
    				<select name="postal_code" id="select-address">
    					@foreach($client->adresses as $address)
    					<option value="{{ $address->postal_code }}" data-addressid="{{ $address->id }}">{{ mask($address->postal_code, '#####-###') }}, {{ $address->street }} - {{ $address->number }}, {{ $address->district }}, {{ $address->city }} - {{ $address->state }}</option>
    					@endforeach
    				</select>
    				@else
		    		<input type="text" name="postal_code" placeholder="CEP para calcular o frete" class="cep-mask" id="postal_code">
		    		@endif
		    		<button type="submit" form="form-freight">CALCULAR</button>
		    	</form>
		    	<div class="result-frete"></div>
    		</div>
    	</div>

    	<div class="col-md-3">
    		<div class="input-container">
	    		<form action="{{ route('site.cart.coupon.validate') }}" method="POST" id="form-coupon" data-container=".result-coupon">
	    			<input type="text" name="code" placeholder="Cupom de desconto" id="code">
	    			<button type="submit" form="form-coupon">VALIDAR</button>
		    	</form>
		    	<div class="result-coupon"></div>
		    </div>
    	</div>
    	
    	<form action="{{ route('site.cart.store.request') }}" method="POST" id="form-request" class="col-md-5 text-right text-end">
    		<input type="hidden" name="address_id" value="{{ ($client ? $client->adresses->first()->id : null) }}">
    		<input type="hidden" name="freight">
    		<input type="hidden" name="code">

    		<a href="{{ route('site.cart.clear') }}" class="primary-btn cta-btn" title="Limpar carrinho de compras">LIMPAR CARRINHO</a>
    		<button type="submit" class="primary-btn cta-btn" title="Finalizar carrinho e efetuar o pedido" form="form-request">FINALIZAR PEDIDO</button>
    	</form>
	</div>
    @else
    <p>SEU CARRINHO ESTÁ VÁZIO</p>
    @endif
</section>
@endsection