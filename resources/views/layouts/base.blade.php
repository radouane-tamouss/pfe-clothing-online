<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Définissez la tendance des vêtements pour hommes, femmes, enfants et bébés avec RedOne-fashion. l'accessoire le plus élégant - modèles de chaussures et produits de décoration pour la cuisine - est à portée d'un clic.">
	<meta name="keywords" content="redonefashion, redone fashion cloths, redone-cloths, redone-shoes, redone vetment, cloths el jadida , vetement pas chere el jadida , redone cloths , fashion store redone , redone cloths cheap, vetement pas chere maroc, cloths el jadida pas chere, vetement livraison gratuits, t-shirt eljadida, short el jadida ">
	<title>RedOne fashion | Définissez la tendance des vêtements pour hommes, femmes, enfants et bébés avec RedOne-fashion </title>	

    <link rel="shortcut icon" type="image/x-icon" href="{{asset('assets/images/favicon.ico')}}">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400italic,700,700italic,900,900italic&amp;subset=latin,latin-ext" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open%20Sans:300,400,400italic,600,600italic,700,700italic&amp;subset=latin,latin-ext" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/animate.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/font-awesome.min.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/bootstrap.min.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/owl.carousel.min.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/flexslider.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/chosen.min.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/style.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/color-01.css')}}">
    @livewireStyles
</head>
<body class="home-page home-01 ">

	<!-- mobile menu -->
    <div class="mercado-clone-wrap">
        <div class="mercado-panels-actions-wrap">
            <a class="mercado-close-btn mercado-close-panels" href="#">x</a>
        </div>
        <div class="mercado-panels"></div>
    </div>
 
	<!--header-->
	<header id="header" class="header header-style-1">
		<div class="container-fluid">
			<div class="row">
				<div class="topbar-menu-area">
					<div class="container">
						
						<div class="topbar-menu right-menu">
							<ul>
								  
								@if(Route::has('login'))
									@auth
									
										 @if(Auth::user()->utype === 'ADM')
										 <li class="menu-item menu-item-has-children parent" >
											<a title="Mon Compte" href="#">Mon Compte ({{Auth::user()->utype}})<i class="fa fa-angle-down" aria-hidden="true"></i></a>
											<ul class="submenu curency" >
												<li class="menu-item" >
												<a title="Dashboard" href="{{ route('admin.dashboard') }}">Dashboard</a>
												</li>
											
											
												<li class="menu-item" >
                                                    <a title="Categories" href="{{route('admin.categories')}}">Categories</a>
                                                </li>
												<li class="menu-item" >
                                                    <a title="Products" href="{{route('admin.products')}}">Tous les produits</a>
                                                </li>
												<li class="menu-item" >
                                                    <a title="Attributes" href="{{route('admin.attributes')}}">Attributs des Produits</a>
                                                </li>
												<li class="menu-item" >
                                                    <a title="Manage Home Categories" href="{{route('admin.homecategories')}}">Gérer les catégories d'accueil</a>
                                                </li>
												<li class="menu-item" >
                                                    <a title="orders" href="{{route('admin.orders')}}">Commandes</a>
                                                </li>
												<form id='logout-form' method="post" action="{{route('logout')}}">
                                                    @csrf
                                                </form>

                                                <li class="menu-item">
                                                    <a href="{{route('logout')}}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Se déconnecter</a>
                                                </li>
											
											</ul>
										</li>
										 @else
		 								 <li class="menu-item menu-item-has-children parent" >
											<a title="Mon Compte" href="#">Mon Compte ({{Auth::user()->utype}})<i class="fa fa-angle-down" aria-hidden="true"></i></a>
											<ul class="submenu curency" >
												
												<form id='logout-form' method="post" action="{{route('logout')}}">
                                                    @csrf
                                                </form>

                                                <li class="menu-item">
                                                    <a href="{{route('logout')}}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Se déconnecter</a>
                                                </li>
											
											</ul>
										</li>
										 @endif
									@else
									<li class="menu-item" ><a title="Register or Login" href="{{route('login')}}">connexion</a></li>
								<li class="menu-item" ><a title="Register or Login" href="{{route('register')}}">S'niscrire</a></li>
									@endif
								@endif
							</ul>
						</div>
					</div>
				</div>

				<div class="container">
					<div class="mid-section main-info-area">

						<div class="wrap-logo-top left-section">
							<a href="/" class="link-to-home"><img src="{{ asset('assets/images/logo-top-1.png')}}" alt="RedOne-fashion"></a>
						</div>

						@livewire('header-search-component')

						<div class="wrap-icon right-section">
							
							<div class="wrap-icon-section minicart">
								<a href="#" class="link-direction">
									<i class="fa fa-shopping-basket" aria-hidden="true"></i>
									<div class="left-info">
									@if(Cart::count() >= 0)
										<span class="index">{{Cart::count()}} articls</span>
									@endif

										<span class="title"><a class="title" href="/cart">panier</a></span>
									</div>
								</a>
							</div>
							<div class="wrap-icon-section show-up-after-1024">
								<a href="#" class="mobile-navigation">
									<span></span>
									<span></span>
									<span></span>
								</a>
							</div>
						</div>

					</div>
				</div>

				<div class="nav-section header-sticky">
					<div class="header-nav-section">
						
					</div>

					<div class="primary-nav-section">
						<div class="container">
							<ul class="nav primary clone-main-menu" id="mercado_main" data-menuname="Main menu" >
								<li class="menu-item home-icon">
									<a href="/" class="link-term mercado-item-title"><i class="fa fa-home" aria-hidden="true"></i></a>
								</li>
								
								<li class="menu-item">
									<a href="/shop" class="link-term mercado-item-title">Boutique</a>
								</li>
								<li class="menu-item">
									<a href="/cart" class="link-term mercado-item-title">Panier</a>
								</li>
								
							
								
								
																							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

    {{$slot}}

	<footer id="footer">
		<div class="wrap-footer-content footer-style-1">

			
			<!--End function info-->

			<div class="main-footer-content">
 
				<div class="container">

					<div class="row">

						<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">
							<div class="wrap-footer-item">
								<h3 class="item-header">DÉTAILS DU CONTACT</h3>
								<div class="item-content">
									<div class="wrap-contact-detail">
										<ul>
											<li>
												<i class="fa fa-map-marker" aria-hidden="true"></i>
												<p class="contact-txt">El Jadida</p>
											</li>
											<li>
												<i class="fa fa-phone" aria-hidden="true"></i>
												<p class="contact-txt">(+212) 7725 61 225</p>
											</li>
											<li>
												<i class="fa fa-envelope" aria-hidden="true"></i>
												<p class="contact-txt">atamousse.red@gmail.com</p>
											</li>											
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">

							

							<div class="wrap-footer-item footer-item-second">
								<h3 class="item-header">S'INSCRIRE</h3>
								<div class="item-content">
									<div class="wrap-newletter-footer">
										<form action="#" class="frm-newletter" id="frm-newletter">
											<input type="email" class="input-email" name="email" value="" placeholder="Entrer votre email">
											<button class="btn-submit">S'abonner</button>
										</form>
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12 box-twin-content ">
							<div class="row">
								<div class="wrap-footer-item twin-item">
									<h3 class="item-header">Mon Compte</h3>
									<div class="item-content">
										<div class="wrap-vertical-nav">
											<ul>
												<li class="menu-item"><a href="#" class="link-term">Mon Compte</a></li>
												<li class="menu-item"><a href="/shop" class="link-term">Categories</a></li>
												<li class="menu-item"><a href="/cart" class="link-term">Panier</a></li>
												<li class="menu-item"><a href="/shop" class="link-term">Boutique</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="wrap-footer-item twin-item">
									<h3 class="item-header">contact</h3>
									<div class="item-content">
										<div class="wrap-vertical-nav">
											<ul>
													<li class="menu-item"><a href="https://github.com/radouane-tamouss" class="link-term">GitHub</a></li>
													<li class="menu-item"><a href="https://www.linkedin.com/in/radouane-tamouss-778139206/" class="link-term">LinkedIn</a></li>
													
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="row">

						<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">
							<div class="wrap-footer-item">
								<h3 class="item-header">NOUS UTILISONS DES PAIEMENTS SÉCURISÉS:</h3>
								<div class="item-content">
									<div class="wrap-list-item wrap-gallery">
										<img src="{{ asset('assets/images/payment.png')}}" style="max-width: 260px;">
									</div>
								</div>
							</div>
						</div>

			

						

					</div>
				</div>

				<div class="wrap-back-link">
					
				</div>

			</div>

			<div class="coppy-right-box">
				<div class="container">
					<div class="coppy-right-item item-left">
						<p class="coppy-right-text">Copyright © 2021 Radouane TAMOUSS</p>
					</div>
					
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</footer>

	<script src="{{ asset('assets/js/jquery-1.12.4.minb8ff.js?ver=1.12.4')}}"></script>
	<script src="{{ asset('assets/js/jquery-ui-1.12.4.minb8ff.js?ver=1.12.4')}}"></script>
	<script src="{{ asset('assets/js/bootstrap.min.js')}}"></script>
	<script src="{{ asset('assets/js/jquery.flexslider.js')}}"></script>
	<script src="{{ asset('assets/js/chosen.jquery.min.js')}}"></script>
	<script src="{{ asset('assets/js/owl.carousel.min.js')}}"></script>
	<script src="{{ asset('assets/js/jquery.countdown.min.js')}}"></script>
	<script src="{{ asset('assets/js/jquery.sticky.js')}}"></script>
	<script src="{{ asset('assets/js/functions.js')}}"></script>
	<script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
    <script nomodule src="https://unpkg.com/@google/model-viewer/dist/model-viewer-legacy.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>

    @livewireScripts


	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
	@livewireChartsScripts
</body>
</html>