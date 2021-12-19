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
	<section class="content">
		<h1><?= $code ?></h1>
		<h2><?= $message ?></h2>
		<p>Infelizmente a página solicitada por você não existe, clique no link abaixo para retornar para o início:</p>
		<a href="<?= route('site') ?>" title="Retornar para a página inicial" class="btn btn-danger mt-5">Retornar para a página inicial</a>
	</section>

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