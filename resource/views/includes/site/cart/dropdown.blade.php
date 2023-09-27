@php
    $cart = new \App\Classes\Cart();
    $cart_products = $cart->all();
@endphp

<!-- Cart -->
<div class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        <i class="fa fa-shopping-cart"></i>
        <span>Carrinho</span>
        @if($cart->quantity() > 0)
        <div class="qty">{{ $cart->quantity() }}</div>
        @endif
    </a>
    <div class="cart-dropdown">
        <div class="cart-list">
            @forelse($cart_products as $cart_product)
            <div class="product-widget">
                <div class="product-img">
                    <img src="{{ url('storage/app/public/' . $cart_product->size->color->images->first()->source) }}" alt="{{ $cart_product->product->name }}" title="{{ $cart_product->product->name }}">
                </div>
                <div class="product-body">
                    <h3 class="product-name"><a href="{{ route('site.products.show', ['slug' => $cart_product->product->slug]) }}" title="{{ $cart_product->product->name }}">{{ $cart_product->product->name }} - {{ $cart_product->size->color->description }} - {{ $cart_product->size->description }}</a></h3>
                    <h4 class="product-price"><span class="qty">{{ $cart_product->quantity }}x</span>R${{ $cart_product->size->priceFormat }}</h4>
                </div>
            </div>
            @empty
            <p><strong>Seu carrinho está vázio</strong></p>
            @endforelse
        </div>
        <div class="cart-summary">
            <small>{{ $cart->quantity() }} Item(s)</small>
            <h5>SUBTOTAL: R$ {{ number_format($cart->amount(), 2, ',', '.') }}</h5>
        </div>
        @if(!empty($cart_products))
        <div class="cart-btns">
            <a href="{{ route('site.cart') }}" title="Ver mais detalhes do carrinho">Ver Carrinho</a>
        </div>
        @endif
    </div>
</div>
<!-- /Cart -->