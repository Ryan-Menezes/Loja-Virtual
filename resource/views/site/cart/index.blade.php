@extends('templates.site')

@section('title', 'Carrinho')
@section('url', route('site.cart'))
@section('description', 'Aqui está o seu carrinho de compras')

@section('container')
@include('includes.site.modais.delete', [
    'title' => 'Remover do Carrinho',
    'message' => 'Deseja realmente remover este produto do carrinho?',
    'btnmsg' => 'Remover'
])

<section class="container">
	@include('includes.messages')

	@if(count($products))
	<div class="row">
		<div class="col-md-8">
			<div class="shopping-cart">
				<div class="title">Carrinho</div>
				
				@foreach($products as $product)
					@if($product->product->visible)
						<form action="{{ route('site.cart.update') }}" method="POST" class="item">
							<input type="hidden" name="_method" value="PUT">
							<input type="hidden" name="id" value="{{ $product->size->id }}">
							
							<div class="buttons">
								<button type="submit" class="btn btn-sm btn-primary" title="Atualizar Produto do Carrinho"><i class="fa fa-repeat"></i></button>
								<a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete ml-2" data-route="{{ route('site.cart.destroy', ['id' => $product->size->id]) }}" data-toggle="modal" data-target="#modalDelete" title="Remover do Carrinho"><i class="fa fa-trash"></i></a>
							</div>
						
							<div class="image">
								<img src="{{ url('storage/app/public/' . $product->size->color->images->first()->source) }}" title="{{ $product->product->name }}" alt="{{ $product->product->name }}">
							</div>
						
							<div class="description">
								<span><a href="{{ route('site.products.show', ['slug' => $product->product->slug]) }}" title="Var mais sobre: {{ $product->product->name }}" target="_blank">{{ $product->product->name }} <i class="fa fa-external-link"></i></a></span>
								
								@if($product->product->colors->count() > 1 || $product->product->sizes->count() > 1)
								<select class="form-control" name="size" style="max-width: 200px">
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
								@else
								<input type="hidden" name="size" value="{{ $product->product->sizes->first()->id }}" />
								@endif
							</div>
						
							<div class="quantity">
								<button class="minus-btn" type="button" name="button">
									<i class="fa fa-minus"></i>
								</button>
		
								<input name="quantity" type="text" name="name" value="{{ $product->quantity }}" readonly>
								
								<button class="plus-btn" type="button" name="button">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						
							<div class="total-price">R$ {{ number_format($product->quantity * $product->size->price, 2, ',', '.') }}</div>
						</form>
					@endif
				@endforeach
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-header p-3"><strong>Resumo do Carrinho</strong></div>
				<div class="card-body" style="padding: 20px;">
					<div>
						<p><strong>TOTAL DO CARRINHO: </strong> R$ {{ number_format($cart->amount(), 2, ',', '.') }}</p>
						<p><strong>DESCONTO DO CARRINHO: </strong> R$ {{ number_format($cart->amount() * (config('store.cart.discount_percent_promotion') / 100), 2, ',', '.') }}</p>
						<p><strong>TOTAL: </strong> R$ {{ number_format($cart->amount() - ($cart->amount() * config('store.cart.discount_percent_promotion') / 100), 2, ',', '.') }}</p>
					</div>

					<hr />

					<form action="{{ route('site.cart.store.request') }}" method="POST" id="form-request" class="text-right text-end">
						<input type="hidden" name="address_id" value="{{ ($client ? $client->adresses->first()->id : null) }}">
						<input type="hidden" name="freight">
						<input type="hidden" name="code">
			
						<a href="{{ route('site.cart.clear') }}" class="primary-btn cta-btn" title="Limpar carrinho de compras" style="width: 100%;">LIMPAR CARRINHO</a>
						<button type="submit" class="primary-btn cta-btn" title="Finalizar carrinho e efetuar o pedido" form="form-request" style="width: 100%; margin-top: 10px;">FINALIZAR PEDIDO R$ {{ number_format($cart->amount() - ($cart->amount() * config('store.cart.discount_percent_promotion') / 100), 2, ',', '.') }}</button>
					</form>
				</div>
			</div>

			<div class="row" style="margin-top: 40px;">
				<div class="col-md-12">
					<div class="input-container" style="margin-bottom: 10px;">
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
					<div>
						<div class="input-container">
							<form action="{{ route('site.cart.coupon.validate') }}" method="POST" id="form-coupon" data-container=".result-coupon">
								<input type="text" name="code" placeholder="Cupom de desconto" id="code">
								<button type="submit" form="form-coupon">VALIDAR</button>
							</form>
							<div class="result-coupon"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    @else
    <p>SEU CARRINHO ESTÁ VÁZIO</p>
    @endif
</section>
@endsection


@section('scripts')
<script>
	$(document).ready(function () {
		$('.minus-btn').on('click', function(e) {
			e.preventDefault();
			var $this = $(this);
			var $input = $this.closest('div').find('input');
			var value = parseInt($input.val());
		
			if (value > 1) {
				value = value - 1;
			} else {
				value = 1;
			}
		
			$input.val(value);
		});
		
		$('.plus-btn').on('click', function(e) {
			e.preventDefault();
			var $this = $(this);
			var $input = $this.closest('div').find('input');
			var value = parseInt($input.val());
		
			if (value < 100) {
				value = value + 1;
			} else {
				value = 100;
			}
		
			$input.val(value);
		});
	});
</script>
@endsection