	<!--main area-->
	<main id="main" class="main-site left-sidebar">

		<div class="container">

			<div class="wrap-breadcrumb">
				<ul>
					<li class="item-link"><a href="/" class="link">home</a></li>
					<li class="item-link"><span>catégorie de produit</span></li>
					<li class="item-link"><span>{{$category_name}}</span></li>
				</ul>
			</div>
			<div class="row">

				<div class="col-lg-9 col-md-8 col-sm-8 col-xs-12 main-content-area">

					<div class="row">

						<ul class="product-list grid-products equal-container">
					
							@foreach ($products as $product)
							<li class="col-lg-4 col-md-6 col-sm-6 col-xs-6 ">
								<div class="product product-style-3 equal-elem ">
									<div class="product-thumnail">
										<a href="{{route('product.details' , ['slug' => $product->slug])}}" title="{{$product->name}}">
											<figure><img src="{{ asset('assets/images/products')}}/{{$product->image}}" alt="{{$product->name}}"></figure>
										</a>
									</div>
									<div class="product-info">
										<a href="{{route('product.details' , ['slug' => $product->slug])}}" class="product-name"><span>{{$product->name}}</span></a>
										<div class="wrap-price"><span class="product-price">{{$product->regular_price}} MAD</span></div>
										<a href="#" class="btn add-to-cart" wire:click.prevent="store({{ $product->id }}, '{{ $product->name }}', {{ $product->regular_price }})">Ajouter Au Panier</a>
									</div>
								</div> 
							</li>
							@endforeach
					
						</ul>

					</div>

					<div class="wrap-pagination-info">
						{{$products->links()}}
						<!-- <ul class="page-numbers">
							<li><span class="page-number-item current" >1</span></li>
							<li><a class="page-number-item" href="#" >2</a></li>
							<li><a class="page-number-item" href="#" >3</a></li>
							<li><a class="page-number-item next-link" href="#" >Next</a></li>
						</ul>
						<p class="result-count">Showing 1-8 of 12 result</p> -->
					</div>
				</div><!--end main products area-->

				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 sitebar">
					<div class="widget mercado-widget categories-widget">
						<h2 class="widget-title"> toutes catégories</h2>
						<div class="widget-content">

							<ul class="list-category">
							@foreach ($categories as $category)
								<li class="category-item">
									<a href="{{route('product.category',['category_slug'=>$category->slug])}}" class="cate-link">{{$category->name}}</a>
								</li>
							@endforeach
							</ul>
						</div>
					</div><!-- Categories widget-->

					<!-- <div class="widget mercado-widget filter-widget brand-widget">
						<h2 class="widget-title">Brand</h2>
						<div class="widget-content">
							<ul class="list-style vertical-list list-limited" data-show="6">
								<li class="list-item"><a class="filter-link active" href="#">Tous</a></li>
								<li class="list-item"><a class="filter-link " href="#">Nike</a></li>
								<li class="list-item"><a class="filter-link " href="#">Adidas</a></li>
								<li class="list-item"><a class="filter-link " href="#">Puma</a></li>
								<li class="list-item"><a class="filter-link " href="#">LC Waikiki</a></li>
								<li class="list-item"><a class="filter-link " href="#">Defacto</a></li>
				
								<li class="list-item"><a data-label='Show less<i class="fa fa-angle-up" aria-hidden="true"></i>' class="btn-control control-show-more" href="#">Show more<i class="fa fa-angle-down" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div> -->
					<!-- brand widget-->

					<!-- <div class="widget mercado-widget filter-widget price-filter">
						<h2 class="widget-title">Prix</h2>
						<div class="widget-content">
							<div id="slider-range"></div>
							<p>
								<label for="amount">Prix:</label>
								<input type="text" id="amount" readonly>
								<button class="filter-submit">filtrer</button>
							</p>
						</div>
					</div> -->
					<!-- Price-->
<!-- 
					<div class="widget mercado-widget filter-widget">
						<h2 class="widget-title">Color</h2>
						<div class="widget-content">
							<ul class="list-style vertical-list has-count-index">
								<li class="list-item"><a class="filter-link " href="#">Rouge <span></span></a></li>
								<li class="list-item"><a class="filter-link " href="#">Jaune <span></span></a></li>
								<li class="list-item"><a class="filter-link " href="#">Noir <span></span></a></li>
								<li class="list-item"><a class="filter-link " href="#">Bleue <span></span></a></li>
								<li class="list-item"><a class="filter-link " href="#">Gris <span></span></a></li>
								<li class="list-item"><a class="filter-link " href="#">Rose <span></span></a></li>
							</ul>
						</div>
					</div> -->
					<!-- Color -->

					<div class="widget mercado-widget filter-widget">
						<!-- <h2 class="widget-title">Size</h2> -->
						<div class="widget-content">
							<!-- <ul class="list-style inline-round ">
								<li class="list-item"><a class="filter-link active" href="/shopp">s</a></li>
								<li class="list-item"><a class="filter-link " href="/shop">M</a></li>
								<li class="list-item"><a class="filter-link " href="/shop">l</a></li>
								<li class="list-item"><a class="filter-link " href="/shop">xl</a></li>
							</ul> -->
							<div class="widget-banner">
								<!-- <figure><img src="assets/images/size-banner-widget.jpg" width="270" height="331" alt=""></figure> -->
								<model-viewer src="assets/3d/glasses/scene.gltf" alt="air force" auto-rotate camera-controls ar ios-src="assets/3d/glasses/scene.gltf"  class="banner-figure">
            					</model-viewer>
							</div>
						</div>
					</div><!-- Size -->


				</div><!--end sitebar-->

			</div><!--end row-->

		</div><!--end container-->

	</main>
	<!--main area-->