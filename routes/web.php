<?php
use Src\Classes\Route;

use App\Controllers\Panel\{
	PanelController,
	AuthController,
	UserController,
	ClientController,
	ProductController,
	RatingController,
	CouponController,
	SlideShowController,
	BannerController,
	DepoimentController,
	NoticeController,
	CommentController,
	SubCommentController,
	CategoryController,
	SubCategoryController,
	RoleController,
	PermissionController
};
use App\Controllers\Site\{
	SiteController,
	ProductController as ProductControllerSite,
	NoticeController as NoticeControllerSite,
	CommentController as CommentControllerSite,
	CategoryController as CategoryControllerSite,
	SiteMapController
};
use App\Middlewares\Authenticate;

Route::group(['prefix' => 'painel', 'middleware' => Authenticate::class], function(){
	Route::get('/', [PanelController::class, 'index'])->name('panel');

	// ROUTE USERS
	Route::group(['prefix' => 'usuarios'], function(){
		Route::any('/', [UserController::class, 'index'])->name('panel.users');
		Route::get('/novo', [UserController::class, 'create'])->name('panel.users.create');
		Route::post('/novo/salvar', [UserController::class, 'store'])->name('panel.users.store');
		Route::get('/{id}/editar', [UserController::class, 'edit'])->name('panel.users.edit');
		Route::put('/{id}/editar/salvar', [UserController::class, 'update'])->name('panel.users.update');
		Route::delete('/{id}', [UserController::class, 'destroy'])->name('panel.users.destroy');
	});

	// ROUTE CLIENTS
	Route::group(['prefix' => 'clientes'], function(){
		Route::any('/', [ClientController::class, 'index'])->name('panel.clients');
		Route::get('/{id}', [ClientController::class, 'show'])->name('panel.clients.show');
		Route::delete('/{id}', [ClientController::class, 'destroy'])->name('panel.clients.destroy');
	});

	// ROUTE PRODUCTS
	Route::group(['prefix' => 'produtos'], function(){
		Route::any('/', [ProductController::class, 'index'])->name('panel.products');
		Route::get('/novo', [ProductController::class, 'create'])->name('panel.products.create');
		Route::post('/novo/salvar', [ProductController::class, 'store'])->name('panel.products.store');
		Route::any('/componente/{name}', [ProductController::class, 'component'])->name('panel.products.component');
		Route::get('/{id}/editar', [ProductController::class, 'edit'])->name('panel.products.edit');
		Route::put('/{id}/editar/salvar', [ProductController::class, 'update'])->name('panel.products.update');
		Route::delete('/{id}/deletar', [ProductController::class, 'destroy'])->name('panel.products.destroy');
	});

	// ROUTE RATINGS
	Route::group(['prefix' => 'avaliacoes'], function(){
		Route::any('/', [RatingController::class, 'index'])->name('panel.ratings');
		Route::get('/{id}/editar', [RatingController::class, 'edit'])->name('panel.ratings.edit');
		Route::put('/{id}/editar/salvar', [RatingController::class, 'update'])->name('panel.ratings.update');
		Route::delete('/{id}/deletar', [RatingController::class, 'destroy'])->name('panel.ratings.destroy');
	});

	// ROUTE COUPONS
	Route::group(['prefix' => 'cupons'], function(){
		Route::any('/', [CouponController::class, 'index'])->name('panel.coupons');
		Route::get('/novo', [CouponController::class, 'create'])->name('panel.coupons.create');
		Route::post('/novo/salvar', [CouponController::class, 'store'])->name('panel.coupons.store');
		Route::get('/{id}/editar', [CouponController::class, 'edit'])->name('panel.coupons.edit');
		Route::put('/{id}/editar/salvar', [CouponController::class, 'update'])->name('panel.coupons.update');
		Route::delete('/{id}', [CouponController::class, 'destroy'])->name('panel.coupons.destroy');
	});

	// ROUTE SLIDESHOW
	Route::group(['prefix' => 'carrossel'], function(){
		Route::any('/', [SlideShowController::class, 'index'])->name('panel.slideshow');
		Route::get('/novo', [SlideShowController::class, 'create'])->name('panel.slideshow.create');
		Route::post('/novo/salvar', [SlideShowController::class, 'store'])->name('panel.slideshow.store');
		Route::get('/{id}/editar', [SlideShowController::class, 'edit'])->name('panel.slideshow.edit');
		Route::put('/{id}/editar/salvar', [SlideShowController::class, 'update'])->name('panel.slideshow.update');
		Route::delete('/{id}', [SlideShowController::class, 'destroy'])->name('panel.slideshow.destroy');
	});

	// ROUTE BANNERS
	Route::group(['prefix' => 'banners'], function(){
		Route::any('/', [BannerController::class, 'index'])->name('panel.banners');
		Route::get('/novo', [BannerController::class, 'create'])->name('panel.banners.create');
		Route::post('/novo/salvar', [BannerController::class, 'store'])->name('panel.banners.store');
		Route::get('/{id}/editar', [BannerController::class, 'edit'])->name('panel.banners.edit');
		Route::put('/{id}/editar/salvar', [BannerController::class, 'update'])->name('panel.banners.update');
		Route::delete('/{id}', [BannerController::class, 'destroy'])->name('panel.banners.destroy');
	});

	// ROUTE DEPOIMENTS
	Route::group(['prefix' => 'depoimentos'], function(){
		Route::any('/', [DepoimentController::class, 'index'])->name('panel.depoiments');
		Route::get('/novo', [DepoimentController::class, 'create'])->name('panel.depoiments.create');
		Route::post('/novo/salvar', [DepoimentController::class, 'store'])->name('panel.depoiments.store');
		Route::get('/{id}/editar', [DepoimentController::class, 'edit'])->name('panel.depoiments.edit');
		Route::put('/{id}/editar/salvar', [DepoimentController::class, 'update'])->name('panel.depoiments.update');
		Route::delete('/{id}', [DepoimentController::class, 'destroy'])->name('panel.depoiments.destroy');
	});

	// ROUTE NOTICES
	Route::group(['prefix' => 'blog'], function(){
		Route::any('/', [NoticeController::class, 'index'])->name('panel.notices');
		Route::get('/novo', [NoticeController::class, 'create'])->name('panel.notices.create');
		Route::post('/novo/salvar', [NoticeController::class, 'store'])->name('panel.notices.store');
		Route::any('/componente/{name}', [NoticeController::class, 'component'])->name('panel.notices.component');
		Route::get('/{id}/editar', [NoticeController::class, 'edit'])->name('panel.notices.edit');
		Route::put('/{id}/editar/salvar', [NoticeController::class, 'update'])->name('panel.notices.update');
		Route::delete('/{id}/deletar', [NoticeController::class, 'destroy'])->name('panel.notices.destroy');
	});

	// ROUTE COMMENTS
	Route::group(['prefix' => 'comentarios'], function(){
		Route::any('/', [CommentController::class, 'index'])->name('panel.comments');
		Route::get('/{id}/editar', [CommentController::class, 'edit'])->name('panel.comments.edit');
		Route::put('/{id}/editar/salvar', [CommentController::class, 'update'])->name('panel.comments.update');
		Route::delete('/{id}/deletar', [CommentController::class, 'destroy'])->name('panel.comments.destroy');

		// ROUTE SUBCOMMENTS
		Route::group(['prefix' => '/{comment}/respostas'], function(){
			Route::any('/', [SubCommentController::class, 'index'])->name('panel.comments.subcomments');
			Route::get('/{id}/editar', [SubCommentController::class, 'edit'])->name('panel.comments.subcomments.edit');
			Route::put('/{id}/editar/salvar', [SubCommentController::class, 'update'])->name('panel.comments.subcomments.update');
			Route::delete('/{id}/deletar', [SubCommentController::class, 'destroy'])->name('panel.comments.subcomments.destroy');
		});
	});

	// ROUTE CATEGORIES
	Route::group(['prefix' => 'categorias'], function(){
		Route::any('/', [CategoryController::class, 'index'])->name('panel.categories');
		Route::get('/novo', [CategoryController::class, 'create'])->name('panel.categories.create');
		Route::post('/novo/salvar', [CategoryController::class, 'store'])->name('panel.categories.store');
		Route::get('/{id}/editar', [CategoryController::class, 'edit'])->name('panel.categories.edit');
		Route::put('/{id}/editar/salvar', [CategoryController::class, 'update'])->name('panel.categories.update');
		Route::delete('/{id}/deletar', [CategoryController::class, 'destroy'])->name('panel.categories.destroy');

		// ROUTE SUBCATEGORIES
		Route::group(['prefix' => '/{category}/subcategorias'], function(){
			Route::any('/', [SubCategoryController::class, 'index'])->name('panel.categories.subcategories');
			Route::get('/novo', [SubCategoryController::class, 'create'])->name('panel.categories.subcategories.create');
			Route::post('/novo/salvar', [SubCategoryController::class, 'store'])->name('panel.categories.subcategories.store');
			Route::get('/{id}/editar', [SubCategoryController::class, 'edit'])->name('panel.categories.subcategories.edit');
			Route::put('/{id}/editar/salvar', [SubCategoryController::class, 'update'])->name('panel.categories.subcategories.update');
			Route::delete('/{id}/deletar', [SubCategoryController::class, 'destroy'])->name('panel.categories.subcategories.destroy');
		});
	});

	// ROUTE ROLES
	Route::group(['prefix' => 'funcoes'], function(){
		Route::any('/', [RoleController::class, 'index'])->name('panel.roles');
		Route::get('/novo', [RoleController::class, 'create'])->name('panel.roles.create');
		Route::post('/novo/salvar', [RoleController::class, 'store'])->name('panel.roles.store');
		Route::get('/{id}/editar', [RoleController::class, 'edit'])->name('panel.roles.edit');
		Route::put('/{id}/editar/salvar', [RoleController::class, 'update'])->name('panel.roles.update');
		Route::delete('/{id}/deletar', [RoleController::class, 'destroy'])->name('panel.roles.destroy');
	});

	// ROUTE PERMISSONS
	Route::group(['prefix' => 'permissoes'], function(){
		Route::any('/', [PermissionController::class, 'index'])->name('panel.permissions');
	});
});

Route::group(['prefix' => 'painel'], function(){
	// ROUTE AUTHENTICATE
	Route::get('/login', [AuthController::class, 'index'])->name('panel.login');
	Route::post('/login/valida', [AuthController::class, 'login'])->name('panel.login.validate');
	Route::get('/logout', [AuthController::class, 'logout'])->name('panel.logout');
});

// ROUTE SITE
Route::group(['prefix' => '/'], function(){
	Route::get('/', [SiteController::class, 'index'])->name('site');

	// ROUTE NOTICES
	Route::group(['prefix' => 'blog'], function(){
		Route::get('/', [NoticeControllerSite::class, 'index'])->name('site.notices');

		Route::group(['prefix' => '/{slug}'], function(){
			Route::get('/', [NoticeControllerSite::class, 'show'])->name('site.notices.show');

			// ROUTE COMMENTS
			Route::group(['prefix' => 'comentarios'], function(){
				Route::post('/enviar', [CommentControllerSite::class, 'store'])->name('site.notices.comments.store');
				Route::post('/{id}/responder', [CommentControllerSite::class, 'response'])->name('site.notices.comments.response');
			});
		});
	});

	// ROUTE CATEGORIES
	Route::group(['prefix' => 'categorias'], function(){
		Route::get('/{slug}', [CategoryControllerSite::class, 'show'])->name('site.categories.show');
	});

	// ROUTE PRODUCTS
	Route::group(['prefix' => 'produtos'], function(){
		Route::get('/', [ProductControllerSite::class, 'index'])->name('site.products');
		Route::get('/{slug}', [ProductControllerSite::class, 'show'])->name('site.products.show');
	});

	// ROUTE SITEMAP
	Route::group(['prefix' => 'sitemap'], function(){
		Route::get('/', [SiteMapController::class, 'index'])->name('site.sitemap');
	});

	// ROUTE SITEMAP-IMAGES
	Route::group(['prefix' => 'sitemap-images'], function(){
		Route::get('/', [SiteMapController::class, 'images'])->name('site.sitemap-images');
	});
});