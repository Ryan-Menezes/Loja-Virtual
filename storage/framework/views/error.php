<?php $categories = (new \App\Models\Category())->all(); ?>
<!DOCTYPE html>
<html lang="<?= config('app.lang') ?>">
<head>
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=<?= config('app.charset') ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/bootstrap/bootstrap.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/all.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/brands.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/fontawesome.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/regular.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/solid.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/svg-with-js.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/libs/fontawesome/v4-shims.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= public_path('assets/css/site/style.css') ?>">

	<link rel="shortcut icon" type="image/png" href="<?= public_path('assets/img/logo.png') ?>" sizes="32x32">

	<style type="text/css">
		.content{
			width: 100%;
			height: 100%;
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
			text-align: center;
			margin-bottom: 50px;
		}
		.content h1{
			font-size: 80px;
			margin-bottom: 10px;
			color: black;
		}
		.content h2{
			font-size: 30px;
			margin-bottom: 10px;
			color: black;
		}
		.content p{
			color: #2e2e2e;
			font-size: 20px;
			margin-bottom: 10px;
		}
	</style>

	<title><?= $code ?> - <?= $message ?> | <?= config('app.name') ?></title>
</head>
<body>


    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="newsbox-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container-fluid">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="newsboxNav">
                        <!-- Nav brand -->
                        <a href="<?= route('site') ?>" class="nav-brand" title="<?= config('app.name') ?>"><img src="<?= public_path('assets/img/site/core-img/logo.png') ?>" alt="<?= config('app.name') ?>" title="<?= config('app.name') ?>"></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav mr-4">
                                <ul>
                                    <li><a href="{{ route('site') }}" title="Página Inicial">Início</a></li>
                                    <li><a href="{{ route('site.notices') }}" title="Notícias Atuais">Notícias Atuais</a></li>

                                   	<?php for($i = 0; $i < 4; $i++): ?>
                                    <li><a href="{{ route('site.categories.show', ['slug' => $categories[$i]->slug]) }}" title="Notícias da Categoria {{ $categories[$i]->name }}"><?=  $categories[$i]->name ?></a></li>
                                    <?php endfor; ?>

                                    <li><a href="javascript:vopid(0)" title="Outras Categórias">Outros</a>
                                        <ul class="dropdown">
                                           	<?php for($i = 0; $i < count($categories); $i++): ?>
                                            <li><a href="<?= route('site.categories.show', ['slug' => $categories[$i]->slug]) ?>" title="Notícias da Categoria <?= $categories[$i]->name ?>"><?= $categories[$i]->name ?></a></li>
                                            <?php endfor; ?>
                                    </li>
                                </ul>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

	<section class="content">
		<h1><?= $code ?></h1>
		<h2><?= $message ?></h2>
		<p>Infelizmente a página solicitada por você não existe, clique no link abaixo para retornar para o início:</p>
		<a href="<?= route('site') ?>" title="Retornar para a página inicial" class="btn btn-danger mt-5">Retornar para a página inicial</a>
	</section>

	<!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <!-- Footer Logo -->
        <div class="footer-logo mb-100">
            <a href="<?= route('site') ?>"><img src="<?= public_path('assets/img/site/core-img/logo.png') ?>" alt="<?= config('app.name') ?>" title="<?= config('app.name') ?>"></a>
        </div>
        <!-- Footer Content -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="footer-content text-center">
                        <!-- Footer Nav -->
                        <div class="footer-nav">
                            <ul>
                                <li><a href="<?= route('site') ?>" title="Página Inicial">Início</a></li>
                                <li><a href="<?= route('site.notices') ?>" title="Página de Notícias">Notícias</a></li>
                                <li><a href="<?= route('site.sitemap') ?>" title="Mapa do Site">SiteMap</a></li>
                            </ul>
                        </div>
                        <!-- Social Info -->
                        <div class="footer-social-info">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="behance"><i class="fa fa-behance" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        </div>

                        <!-- Copywrite Text -->
                        <p class="copywrite-text"><?= config('app.name') ?> &copy; <?= date('Y') ?> Todos os direitos reservados | Site desenvolvido por <a href="https://ryan-menezes.github.io/" target="_blank" title="Portfólio do Desenvolvedor">Ryan Menezes</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

	<!-- ##### All Javascript Script ##### -->
	<script type="text/javascript" src="<?= public_path('assets/js/libs/bootstrap/bootstrap.min.js') ?>"></script>
    <script type="text/javascript" src="<?= public_path('assets/js/libs/jquery/jquery-2.2.4.min.js') ?>"></script>
    <script type="text/javascript" src="<?= public_path('assets/js/libs/jquery/jquery.validate.min.js') ?>"></script>
    <script type="text/javascript" src="<?= public_path('assets/js/libs/bootstrap/popper.min.js') ?>"></script>
    <script type="text/javascript" src="<?= public_path('assets/js/libs/bootstrap/bootstrap.min.js') ?>"></script>
    <script type="text/javascript" src="<?= public_path('assets/js/libs/plugins/plugins.js') ?>"></script>
    <script type="text/javascript" src="<?= public_path('assets/js/site/active.js') ?>"></script>
</body>
</html>