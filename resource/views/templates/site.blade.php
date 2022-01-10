@php
    use Src\Classes\Storage\Storage;

    $categories = (new \App\Models\Category())->all();
    $system = (new \App\Models\System())->first();
    $cart = new \App\Classes\Cart();
    $cart_products = $cart->all();
@endphp

<!DOCTYPE html>
<html lang="{{ config('app.lang') }}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={{ config('app.charset') }}" />
    <meta name="keywords" content="@yield('keywords')">
    <meta name="description" content="@yield('description')">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta property="og:url" content="@yield('url')" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{ config('app.name') }} | @yield('title')" />
    <meta property="og:description" content="@yield('description')" />
    <meta property="og:image" content="@yield('image')" />
    <meta property="og:image:alt" content="{{ config('app.name') }} | @yield('title')" />
    <meta property="og:image:width" content="@yield('image_width')" /> 
    <meta property="og:image:height" content="@yield('image_height')" /> 
    <meta property="og:site_name" content="{{ config('app.name') }}" /> 
    <meta property="og:locale" content="{{ config('app.lang') }}" />
    {{-- <meta property="og:app_id" content="" /> --}}
    {{-- <meta property="fb:pages" content="" /> --}}
    
    <meta property="article:author" content="{{ config('app.social.facebook') }}" /> 
    <meta property="article:publisher" content="{{ config('app.social.facebook') }}" /> 
    <meta property="twitter:card" content="summary_large_image" /> 
    <meta property="twitter:domain" content="{{ config('app.domain') }}" /> 
    <meta property="twitter:title" content="{{ config('app.name') }} | @yield('title')" /> 
    <meta property="twitter:description" content="@yield('description')" /> 
    <meta property="twitter:image" content="@yield('image')" /> 
    <meta property="twitter:url" content="@yield('url')" />
    <meta name="twitter:card" content="summary" />
    {{-- <meta name="twitter:site" content="@news" /> --}}
    {{-- <meta name="twitter:creator" content="@news" /> --}}

    <!-- Title -->
    <title>{{ config('app.name') }} | @yield('title')</title>

    <!-- Favicon -->
    <link rel="icon" href="{{ public_path('assets/img/logo.png') }}">

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- jQuery CSS -->
    <link rel="stylesheet" type="text/css" href="{{ public_path('assets/js/libs/jquery/jquery-ui/jquery-ui.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ public_path('assets/js/libs/jquery/jquery-ui/jquery-ui.structure.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ public_path('assets/js/libs/jquery/jquery-ui/jquery-ui.theme.min.css') }}">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="{{ public_path('assets/css/libs/bootstrap.min.css') }}"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="{{ public_path('assets/css/libs/slick.css') }}"/>
    <link type="text/css" rel="stylesheet" href="{{ public_path('assets/css/libs/slick-theme.css') }}"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="{{ public_path('assets/css/libs/nouislider.min.css') }}"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="{{ public_path('assets/css/libs/font-awesome.min.css') }}">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="{{ public_path('assets/css/site/style.css') }}">
    <link rel="stylesheet" href="{{ public_path('assets/css/site/site.css') }}">
    @yield('styles')
</head>
<body>
    @if($system && !empty($system->floater->image) && Storage::exists($system->floater->image) && $system->floater->active)
        @include('includes.site.modais.floater', [
            'title' => 'Aviso',
            'image' => url('storage/app/public/' . $system->floater->image),
            'link' => $system->floater->link
        ])
    @endif

    <!-- HEADER -->
    <header>
        <!-- TOP HEADER -->
        <div id="top-header">
            <div class="container">
                <ul class="header-links pull-left">
                    <li><a href="callto:{{ config('app.contact.phone') }}" title="Entrar em Contato por Telefone"><i class="fa fa-phone"></i> {{ mask(config('app.contact.phone'), '(##)####-####') }}</a></li>
                    <li><a href="mailto:{{ config('app.contact.email') }}" title="Entrar em Contato por E-Mail"><i class="fa fa-envelope-o"></i> {{ config('app.contact.email') }}</a></li>
                    <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
                </ul>
                <ul class="header-links pull-right">
                    @if(!auth('site'))
                    <li><a href="{{ route('site.login') }}" title="Fazer Login em Minha Conta"><i class="fa fa-lock"></i> Login</a></li>
                    <li><a href="{{ route('site.account.pf.create') }}" title="Criar Minha Conta"><i class="fa fa-user"></i> Criar Conta</a></li>
                    @else
                    <li><a href="{{ route('site.myaccount') }}" title="Minha Conta"><i class="fa fa-user-circle"></i> Minha Conta</a></li>
                    @endif
                </ul>
            </div>
        </div>
        <!-- /TOP HEADER -->

        <!-- MAIN HEADER -->
        <div id="header">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- LOGO -->
                    <div class="col-md-3">
                        <div class="header-logo">
                            <a href="{{ url() }}" class="logo" title="{{ config('app.name') }}">
                                <img src="{{ public_path('assets/img/logo.png') }}" alt="{{ config('app.name') }}" title="{{ config('app.name') }}">
                            </a>
                        </div>
                    </div>
                    <!-- /LOGO -->

                    <!-- SEARCH BAR -->
                    <div class="col-md-6">
                        <div class="header-search">
                            <form action="{{ route('site.products') }}" method="POST">
                                <select class="input-select">
                                    <option value="0">Todos</option>
                                    @foreach($categories as $category)
                                        @if($category->subcategories->count())
                                        <optgroup label="{{ $category->name }}">
                                            @foreach($category->subcategories as $subcategory)
                                            <option value="{{ $subcategory->id }}">{{ $subcategory->name }}</option>
                                            @endforeach
                                        </optgroup>
                                        @endif
                                    @endforeach
                                </select>
                                <input type="text" class="input" placeholder="Buscar" name="search" value="{{ $search ?? null }}">
                                <button class="search-btn">Buscar</button>
                            </form>
                        </div>
                    </div>
                    <!-- /SEARCH BAR -->

                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Wishlist -->
                            <div>
                                <a href="#">
                                    <i class="fa fa-heart-o"></i>
                                    <span>Favoritos</span>
                                    <div class="qty">2</div>
                                </a>
                            </div>
                            <!-- /Wishlist -->

                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
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
                                        <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                    @endif
                                </div>
                            </div>
                            <!-- /Cart -->

                            <!-- Menu Toogle -->
                            <div class="menu-toggle">
                                <a href="#">
                                    <i class="fa fa-bars"></i>
                                    <span>Menu</span>
                                </a>
                            </div>
                            <!-- /Menu Toogle -->
                        </div>
                    </div>
                    <!-- /ACCOUNT -->
                </div>
                <!-- row -->
            </div>
            <!-- container -->
        </div>
        <!-- /MAIN HEADER -->
    </header>
    <!-- /HEADER -->

    <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
                <ul class="main-nav nav navbar-nav">
                    <li class="active"><a href="{{ route('site') }}" title="Página Inicial">Início</a></li>
                    <li><a href="{{ route('site.products') }}" title="Página de Produtos">Produtos</a></li>
                    <li><a href="{{ route('site.notices') }}" title="Página do Blog">Blog</a></li>
                </ul>
                <!-- /NAV -->
            </div>
            <!-- /responsive-nav -->
        </div>
        <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb-tree">
                        @empty(route())
                        <li class="active">inicio</li>
                        @else
                        <li><a href="{{ url() }}">inicio</a></li>
                        @php $routeComplete = '' @endphp
                        @foreach(explode('/', route()) as $route)
                            @php $routeComplete .= $route . '/' @endphp

                            @if(!$loop->last)
                            <li><a href="{{ url($routeComplete) }}">{{ $route }}</a></li>
                            @else
                            @php $routeComplete = $route @endphp
                            @endif
                        @endforeach
                        <li class="active">{{ trim($routeComplete, '/') }}</li>
                        @endempty
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- SECTION -->
    <div class="section">
        <!-- row -->
        <div class="row">
            @yield('container')
        </div>
        <!-- /row -->
    </div>
    <!-- /SECTION -->

    <!-- FOOTER -->
    <footer id="footer">
        <!-- top footer -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">About Us</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                            <ul class="footer-links">
                                <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Categories</h3>
                            <ul class="footer-links">
                                <li><a href="#">Hot deals</a></li>
                                <li><a href="#">Laptops</a></li>
                                <li><a href="#">Smartphones</a></li>
                                <li><a href="#">Cameras</a></li>
                                <li><a href="#">Accessories</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="clearfix visible-xs"></div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Information</h3>
                            <ul class="footer-links">
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Orders and Returns</a></li>
                                <li><a href="#">Terms & Conditions</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Service</h3>
                            <ul class="footer-links">
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">View Cart</a></li>
                                <li><a href="#">Wishlist</a></li>
                                <li><a href="#">Track My Order</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /top footer -->

        <!-- bottom footer -->
        <div id="bottom-footer" class="section">
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <ul class="footer-payments">
                            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                        </ul>
                        <span class="copyright">{{ config('app.name') }} &copy; {{ date('Y') }} Todos os direitos reservados | Site desenvolvido por <a href="https://ryan-menezes.github.io/" target="_blank" title="Portfólio do Desenvolvedor">Ryan Menezes</a></span>
                    </div>
                </div>
                    <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /bottom footer -->
    </footer>
    <!-- /FOOTER -->

    <!-- ##### All Javascript Script ##### -->
    <script type="text/javascript" src="{{ public_path('assets/js/libs/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/libs/jquery/jquery-ui/jquery-ui.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/libs/jquery/jquery.validate.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/libs/bootstrap.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/libs/plugins/slick.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/libs/plugins/nouislider.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/libs/plugins/jquery.zoom.min.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/site/script.js') }}"></script>
    <script type="text/javascript" src="{{ public_path('assets/js/site/main.js') }}"></script>
    @yield('scripts')
</body>
</html>