<?php
use Src\Classes\Route;

use App\Controllers\Panel\{
	PanelController,
	AuthController,
	UserController,
	PageController,
	ClientController,
	ProductController,
	RatingController,
	RequestController,
	CouponController,
	SlideShowController,
	BannerController,
	GaleryController,
	PartnerController,
	DepoimentController,
	NoticeController,
	CommentController,
	SubCommentController,
	CategoryController,
	SubCategoryController,
	SystemController,
	RoleController,
	PermissionController
};
use App\Controllers\Site\{
	SiteController,
	PageController as PageControllerSite,
	AuthController as AuthControllerSite,
	ProductController as ProductControllerSite,
	NoticeController as NoticeControllerSite,
	CommentController as CommentControllerSite,
	CategoryController as CategoryControllerSite,
	CartController,
	LgpdController,
	PaymentController,
	SiteMapController
};
use App\Controllers\Site\MyAccount\{
	MyAccountController,
	ClientController as ClientControllerSite,
	RequestController as RequestControllerSite,
	PagSeguroController,
	MercadoPagoController,
	PicPayController,
	AddressController,
	CardController,
	FavoriteController
};
use App\Middlewares\{
	Authenticate,
	Expiration,
	Maintenance
};
use App\Models\Page;

// ------------------------------------------------------------------------------
// ROUTE PANEL
// ------------------------------------------------------------------------------

Route::group(['prefix' => 'painel', 'middleware' => [Expiration::class, Authenticate::class]], function(){
	// ROUTE HOME
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

	// ROUTE SITE
	Route::group(['prefix' => 'site'], function(){
		// ROUTE PAGES
		Route::group(['prefix' => 'paginas'], function(){
			Route::any('/', [PageController::class, 'index'])->name('panel.pages');
			Route::any('/componente/{name}', [PageController::class, 'component'])->name('panel.pages.component');
			Route::get('/novo', [PageController::class, 'create'])->name('panel.pages.create');
			Route::post('/novo/salvar', [PageController::class, 'store'])->name('panel.pages.store');
			Route::get('/{id}/editar', [PageController::class, 'edit'])->name('panel.pages.edit');
			Route::put('/{id}/editar/salvar', [PageController::class, 'update'])->name('panel.pages.update');
			Route::delete('/{id}/deletar', [PageController::class, 'destroy'])->name('panel.pages.destroy');
		});

		// ROUTE CLIENTS
		Route::group(['prefix' => 'clientes'], function(){
			Route::any('/', [ClientController::class, 'index'])->name('panel.clients');
			Route::get('/{id}', [ClientController::class, 'show'])->name('panel.clients.show');
			Route::delete('/{id}', [ClientController::class, 'destroy'])->name('panel.clients.destroy');
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

		// ROUTE GALLERIES
		Route::group(['prefix' => 'galerias'], function(){
			Route::any('/', [GaleryController::class, 'index'])->name('panel.galleries');
			Route::any('/componente/{name}', [GaleryController::class, 'component'])->name('panel.galleries.component');
			Route::get('/novo', [GaleryController::class, 'create'])->name('panel.galleries.create');
			Route::post('/novo/salvar', [GaleryController::class, 'store'])->name('panel.galleries.store');
			Route::get('/{id}/editar', [GaleryController::class, 'edit'])->name('panel.galleries.edit');
			Route::put('/{id}/editar/salvar', [GaleryController::class, 'update'])->name('panel.galleries.update');
			Route::delete('/{id}', [GaleryController::class, 'destroy'])->name('panel.galleries.destroy');
		});

		// ROUTE PARTNERS
		Route::group(['prefix' => 'parceiros'], function(){
			Route::any('/', [PartnerController::class, 'index'])->name('panel.partners');
			Route::get('/novo', [PartnerController::class, 'create'])->name('panel.partners.create');
			Route::post('/novo/salvar', [PartnerController::class, 'store'])->name('panel.partners.store');
			Route::get('/{id}/editar', [PartnerController::class, 'edit'])->name('panel.partners.edit');
			Route::put('/{id}/editar/salvar', [PartnerController::class, 'update'])->name('panel.partners.update');
			Route::delete('/{id}', [PartnerController::class, 'destroy'])->name('panel.partners.destroy');
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
	});

	// ROUTE LOJA VIRTUAL
	Route::group(['prefix' => 'loja-virtual'], function(){
		// ROUTE PRODUCTS
		Route::group(['prefix' => 'produtos'], function(){
			Route::any('/', [ProductController::class, 'index'])->name('panel.products');
			Route::any('/componente/{name}', [ProductController::class, 'component'])->name('panel.products.component');
			Route::get('/novo', [ProductController::class, 'create'])->name('panel.products.create');
			Route::post('/novo/salvar', [ProductController::class, 'store'])->name('panel.products.store');
			Route::any('/novo/produtos', [ProductController::class, 'products'])->name('panel.create.products');
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

		// ROUTE REQUESTS
		Route::group(['prefix' => 'pedidos'], function(){
			Route::any('/', [RequestController::class, 'index'])->name('panel.requests');
			Route::get('/{id}/editar', [RequestController::class, 'edit'])->name('panel.requests.edit');
			Route::put('/{id}/editar/salvar', [RequestController::class, 'update'])->name('panel.requests.update');
			Route::delete('/{id}', [RequestController::class, 'destroy'])->name('panel.requests.destroy');
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
	});

	// ROUTE NOTICES
	Route::group(['prefix' => 'blog'], function(){
		Route::group(['prefix' => 'artigos'], function(){
			Route::any('/', [NoticeController::class, 'index'])->name('panel.notices');
			Route::any('/componente/{name}', [NoticeController::class, 'component'])->name('panel.notices.component');
			Route::get('/novo', [NoticeController::class, 'create'])->name('panel.notices.create');
			Route::post('/novo/salvar', [NoticeController::class, 'store'])->name('panel.notices.store');
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
	});

	// ROUTE SETTINGS
	Route::group(['prefix' => 'configuracoes'], function(){
		// ROUTE SYSTEM
		Route::group(['prefix' => 'sistema'], function(){
			Route::get('/', [SystemController::class, 'index'])->name('panel.system');
			Route::post('/salvar', [SystemController::class, 'update'])->name('panel.system.update');

			Route::get('/endereco', [SystemController::class, 'address'])->name('panel.system.address');
			Route::post('/endereco/salvar', [SystemController::class, 'updateAddress'])->name('panel.system.address.update');

			Route::get('/contato', [SystemController::class, 'contact'])->name('panel.system.contact');
			Route::post('/contato/salvar', [SystemController::class, 'updateContact'])->name('panel.system.contact.update');

			Route::get('/redes-sociais', [SystemController::class, 'social'])->name('panel.system.social');
			Route::post('/redes-sociais/salvar', [SystemController::class, 'updateSocial'])->name('panel.system.social.update');

			Route::get('/loja-online', [SystemController::class, 'store'])->name('panel.system.store');
			Route::post('/loja-online/salvar', [SystemController::class, 'updateStore'])->name('panel.system.store.update');

			Route::get('/lgpd', [SystemController::class, 'lgpd'])->name('panel.system.lgpd');
			Route::post('/lgpd/salvar', [SystemController::class, 'updateLgpd'])->name('panel.system.lgpd.update');

			Route::get('/floater', [SystemController::class, 'floater'])->name('panel.system.floater');
			Route::post('/floater/salvar', [SystemController::class, 'updateFloater'])->name('panel.system.floater.update');

			Route::get('/ftp', [SystemController::class, 'ftp'])->name('panel.system.ftp');
			Route::post('/ftp/salvar', [SystemController::class, 'updateFtp'])->name('panel.system.ftp.update');
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
});

Route::group(['prefix' => 'painel'], function(){
	// ROUTE AUTHENTICATE
	Route::get('/login', [AuthController::class, 'index'])->name('panel.login');
	Route::post('/login/valida', [AuthController::class, 'login'])->name('panel.login.validate');
	Route::get('/logout', [AuthController::class, 'logout'])->name('panel.logout');
});

// ------------------------------------------------------------------------------
// ROUTE SITE
// ------------------------------------------------------------------------------

Route::group(['prefix' => '/', 'middleware' => [Expiration::class, Maintenance::class]], function(){
	// ROUTE HOME
	Route::get('/', [SiteController::class, 'index'])->name('site');

	// ROUTE LGPD
	// Route::post('/lgpd', [SiteController::class, 'lgpd'])->name('site.lgpd');

	// ROUTE CONTACT SEND
	Route::get('/contato', [SiteController::class, 'contact'])->name('site.contact');
	Route::post('/contato', [SiteController::class, 'sendMail'])->name('site.contact.send');

	// ROUTE SITEMAP
	Route::get('/sitemap.xml', [SiteMapController::class, 'index'])->name('site.sitemap');

	// ROUTE SITEMAP-IMAGES
	Route::get('/sitemap-images.xml', [SiteMapController::class, 'images'])->name('site.sitemap-images');

	// ROUTE PRIVACY POLICY
	Route::get('/politica-de-privacidade', [LgpdController::class, 'privacy_policy'])->name('site.privacy_policy');

	// ROUTE TERMS CONDITIONS
	Route::get('/termos-e-condicoes', [LgpdController::class, 'terms_conditions'])->name('site.terms_conditions');

	// ROUTE RETURN POLICY
	Route::get('/politica-de-devolucao', [LgpdController::class, 'return_policy'])->name('site.return_policy');

	// ROUTE LOGIN
	Route::group(['prefix' => 'login'], function(){
		Route::get('/', [AuthControllerSite::class, 'index'])->name('site.login');
		Route::post('/', [AuthControllerSite::class, 'loginValidate'])->name('site.login.validate');
		Route::get('/facebook', [AuthControllerSite::class, 'facebook'])->name('site.login.facebook');
		Route::get('/google', [AuthControllerSite::class, 'google'])->name('site.login.google');
	});

	// ROUTE FORGET
	Route::group(['prefix' => 'recuperar-senha'], function(){
		Route::get('/', [AuthControllerSite::class, 'forget'])->name('site.forget');
		Route::post('/', [AuthControllerSite::class, 'forgetStore'])->name('site.forget.store');

		Route::get('/{token}', [AuthControllerSite::class, 'forgetPassword'])->name('site.forget.password');
		Route::post('/{token}', [AuthControllerSite::class, 'forgetPasswordUpdate'])->name('site.forget.password.update');
	});

	// ROUTE CREATE ACCOUNT
	Route::group(['prefix' => 'criar-conta'], function(){
		Route::get('/pessoa-fisica', [AuthControllerSite::class, 'createPF'])->name('site.account.pf.create');
		Route::get('/pessoa-juridica', [AuthControllerSite::class, 'createPJ'])->name('site.account.pj.create');
		Route::post('/', [AuthControllerSite::class, 'store'])->name('site.account.store');
		Route::get('/validar/{token}', [AuthControllerSite::class, 'validate'])->name('site.account.validate');
	});

	// ROUTE MY ACCOUNT
	Route::group(['prefix' => 'minha-conta'], function(){
		Route::get('/', [MyAccountController::class, 'index'])->name('site.myaccount');

		// ROUTES CLIENT
		Route::group(['prefix' => 'dados-pessoais'], function(){
			Route::get('/', [ClientControllerSite::class, 'index'])->name('site.myaccount.client');
			Route::put('/salvar', [ClientControllerSite::class, 'update'])->name('site.myaccount.client.update');
			Route::put('/senha/salvar', [ClientControllerSite::class, 'updatePassword'])->name('site.myaccount.client.password.update');
		});

		// ROUTE REQUESTS
		Route::group(['prefix' => 'pedidos'], function(){
			Route::get('/', [RequestControllerSite::class, 'index'])->name('site.myaccount.requests');
			
			Route::group(['prefix' => '{id}'], function(){
				Route::get('/', [RequestControllerSite::class, 'show'])->name('site.myaccount.requests.show');
				Route::post('/cancelar', [RequestControllerSite::class, 'cancel'])->name('site.myaccount.requests.cancel');
				Route::post('/reembolsar', [RequestControllerSite::class, 'refund'])->name('site.myaccount.requests.refund');

				// Checkouts
				if(config('store.payment.credentials.pagseguro.active')){
					Route::get('/pagseguro', [PagSeguroController::class, 'checkout'])->name('site.myaccount.requests.show.pagseguro');
				}

				if(config('store.payment.credentials.mercadopago.active')){
					Route::get('/mercado-pago', [MercadoPagoController::class, 'checkout'])->name('site.myaccount.requests.show.mercadopago');
				}

				if(config('store.payment.methods.pix')){
					if(config('store.payment.credentials.picpay.active')){
						Route::get('/pix', [PicPayController::class, 'pix'])->name('site.myaccount.requests.show.pix');
					}else if(config('store.payment.credentials.mercadopago.active')){
						Route::get('/pix', [MercadoPagoController::class, 'pix'])->name('site.myaccount.requests.show.pix');
					}
				}

				// Checkout transparent
				if(config('store.payment.types.pagseguro')){
					if(config('store.payment.methods.credit_card')){
						Route::get('/cartao-de-credito', [PagSeguroController::class, 'creditCard'])->name('site.myaccount.requests.show.credit_card');
						Route::post('/cartao-de-credito', [PagSeguroController::class, 'creditCardStore'])->name('site.myaccount.requests.show.credit_card.store');
					}
					
					if(config('store.payment.methods.bolet')){
						Route::get('/boleto', [PagSeguroController::class, 'bolet'])->name('site.myaccount.requests.show.bolet');
						Route::post('/boleto', [PagSeguroController::class, 'boletStore'])->name('site.myaccount.requests.show.bolet.store');
					}
					
					if(config('store.payment.methods.debit_online')){
						Route::get('/debito-online', [PagSeguroController::class, 'debitOnline'])->name('site.myaccount.requests.show.debit_online');
						Route::post('/debito-online', [PagSeguroController::class, 'debitOnlineStore'])->name('site.myaccount.requests.show.debit_online.store');
					}
				}else if(config('store.payment.types.mercadopago')){
					if(config('store.payment.methods.credit_card')){
						Route::get('/cartao-de-credito', [MercadoPagoController::class, 'creditCard'])->name('site.myaccount.requests.show.credit_card');
						Route::post('/cartao-de-credito', [MercadoPagoController::class, 'creditCardStore'])->name('site.myaccount.requests.show.credit_card.store');
					}
					
					if(config('store.payment.methods.bolet')){
						Route::get('/boleto', [MercadoPagoController::class, 'bolet'])->name('site.myaccount.requests.show.bolet');
						Route::post('/boleto', [MercadoPagoController::class, 'boletStore'])->name('site.myaccount.requests.show.bolet.store');
					}
					
					if(config('store.payment.methods.bank_transfer')){
						Route::get('/transferencia-bancaria', [MercadoPagoController::class, 'bankTransfer'])->name('site.myaccount.requests.show.bank_transfer');
						Route::post('/transferencia-bancaria', [MercadoPagoController::class, 'bankTransferStore'])->name('site.myaccount.requests.show.bank_transfer.store');
					}
				}
			});
		});

		// ROUTES ADRESSESS
		Route::group(['prefix' => 'enderecos'], function(){
			Route::get('/', [AddressController::class, 'index'])->name('site.myaccount.adresses');
			Route::get('/novo', [AddressController::class, 'create'])->name('site.myaccount.adresses.create');
			Route::post('/novo/salvar', [AddressController::class, 'store'])->name('site.myaccount.adresses.store');
			Route::get('/{id}/editar', [AddressController::class, 'edit'])->name('site.myaccount.adresses.edit');
			Route::put('/{id}/editar/salvar', [AddressController::class, 'update'])->name('site.myaccount.adresses.update');
			Route::delete('/{id}/deletar', [AddressController::class, 'destroy'])->name('site.myaccount.adresses.destroy');
		});

		if(config('store.payment.checkouts.transparent')){
			// ROUTE CARDS
			Route::group(['prefix' => 'cartoes'], function(){
				Route::get('/', [CardController::class, 'index'])->name('site.myaccount.cards');
				Route::get('/{id}', [CardController::class, 'show'])->name('site.myaccount.cards.show');
				Route::delete('/{id}/deletar', [CardController::class, 'destroy'])->name('site.myaccount.cards.destroy');
			});
		}

		// ROUTE FAVORITES
		Route::group(['prefix' => 'favoritos'], function(){
			Route::get('/', [FavoriteController::class, 'index'])->name('site.myaccount.favorites');
			Route::post('/adicionar/{id}', [FavoriteController::class, 'add'])->name('site.myaccount.favorites.add');
			Route::delete('/remover/{id}', [FavoriteController::class, 'remove'])->name('site.myaccount.favorites.remove');
		});

		// ROUTE LOGOUT
		Route::get('/sair', [MyAccountController::class, 'logout'])->name('site.myaccount.logout');
	});

	// ROUTE CART
	Route::group(['prefix' => 'carrinho'], function(){
		Route::get('/', [CartController::class, 'index'])->name('site.cart');
		Route::put('/', [CartController::class, 'update'])->name('site.cart.update');
		Route::get('/limpar', [CartController::class, 'clear'])->name('site.cart.clear');
		Route::post('/adicionar/{product_id}', [CartController::class, 'add'])->name('site.cart.add');
		Route::post('/adicionar/{product_id}/{?size_id}', [CartController::class, 'store'])->name('site.cart.store');
		Route::delete('/{id}/remover', [CartController::class, 'destroy'])->name('site.cart.destroy');
		Route::post('/frete', [CartController::class, 'freight'])->name('site.cart.freight');
		Route::post('/cupom/validar', [CartController::class, 'couponValidate'])->name('site.cart.coupon.validate');
		Route::post('/finalizar-pedido', [CartController::class, 'storeRequest'])->name('site.cart.store.request');
		Route::get('/dropdown', [CartController::class, 'dropdown'])->name('site.cart.dropdown');
	});

	// ROUTE NOTICES
	Route::group(['prefix' => 'blog'], function(){
		Route::any('/', [NoticeControllerSite::class, 'index'])->name('site.notices');

		// ROUTE CATEGORIES NOTICES
		Route::group(['prefix' => '/{category}'], function(){
			Route::any('/{subcategory}', [CategoryControllerSite::class, 'noticeSubCategory'])->name('site.notices.category.subcategory');
		});

		Route::group(['prefix' => '/{slug}'], function(){
			Route::get('/', [NoticeControllerSite::class, 'show'])->name('site.notices.show');

			// ROUTE COMMENTS
			Route::group(['prefix' => 'comentarios'], function(){
				Route::post('/enviar', [CommentControllerSite::class, 'store'])->name('site.notices.comments.store');
				Route::post('/{id}/responder', [CommentControllerSite::class, 'response'])->name('site.notices.comments.response');
			});
		});
	});

	// ROUTE PRODUCTS
	Route::group(['prefix' => 'produtos'], function(){
		Route::any('/', [ProductControllerSite::class, 'index'])->name('site.products');

		// ROUTE PRODUCT
		Route::group(['prefix' => '/{slug}'], function(){
			Route::get('/', [ProductControllerSite::class, 'show'])->name('site.products.show');

			// ROUTE RATINGS
			Route::group(['prefix' => '/avaliacoes'], function(){
				Route::post('/enviar', [ProductControllerSite::class, 'storeRating'])->name('site.products.show.ratings.send');
			});

			// ROUTE FREIGHT
			Route::post('/frete', [ProductControllerSite::class, 'freight'])->name('site.products.show.freight');
		});

		Route::any('/info/{id}', [ProductControllerSite::class, 'info'])->name('site.products.info');

		// ROUTE CATEGORIES PRODUCTS
		Route::group(['prefix' => '/{category}'], function(){
			Route::any('/{subcategory}', [CategoryControllerSite::class, 'productSubCategory'])->name('site.products.category.subcategory');
		});
	});

	// PAYMENT
	Route::group(['prefix' => 'notificacao'], function(){
		Route::any('/pagseguro', [PaymentController::class, 'notificationPagseguro'])->name('site.notification.pagseguro');
		Route::any('/mercadopago', [PaymentController::class, 'notificationMercadopago'])->name('site.notification.mercadopago');
		Route::any('/picpay', [PaymentController::class, 'notificationPicpay'])->name('site.notification.picpay');
	});

	// PAGES
	foreach(Page::where('visible', true)->get() as $page){
		Route::get("/{$page->url}", [PageControllerSite::class, 'index'])->name("site.{$page->id}");
	}
});