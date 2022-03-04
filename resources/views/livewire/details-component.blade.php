<main id="main" class="main-site">

		<div class="container">

			<div class="wrap-breadcrumb">
				<ul>
					<li class="item-link"><a href="/" class="link">home</a></li>
					<li class="item-link"><span>detail</span></li>
				</ul>
			</div>
			<div class="row">

				<div class="col-lg-9 col-md-8 col-sm-8 col-xs-12 main-content-area">
					<div class="wrap-product-detail">
						<div class="detail-media">
							<div class="product-gallery">
							  <ul class="slides">

							   

							    <li data-thumb="{{ asset('assets/images/products') }}/{{ $product->image}}">
							    	<img src="{{ asset('assets/images/products') }}/{{ $product->image}}" alt="{{ $product->name }}" />
								
							    </li>
								@php 
									$images = explode(",",$product->images);

								@endphp
								@foreach($images as $image)
								@if($image)
									<li data-thumb="{{ asset('assets/images/products') }}/{{$image}}">
										<img src="{{ asset('assets/images/products') }}/{{$image}}" alt="{{ $product->name }}" />
									
									</li>
									
									
								@endif
								@endforeach
							  

							  </ul>
							</div>
						</div>
						<div class="detail-info">
							
                            <h2 class="product-name">{{$product->name}}</h2>
                            <div class="short-desc">
                               {{$product->short_description}}
                            </div>
                            <div class="wrap-social">
                            
                            </div>
                            <div class="wrap-price"><span class="product-price">{{$product->regular_price}} MAD</span></div>
                            <div class="stock-info in-stock">
                                <p class="availability">Disponibilité : <b>{{$product->stock_status}}</b></p>
								<p class="availability">Quantity en Stock : <b>{{$product->quantity}}</b></p>
                            </div>
                            <div class="quantity">
                            	<span>Quantity:</span>
								<div class="quantity-input">
									<input type="text" name="product-quatity" value="1" data-max="{{$product->quantity}}" pattern="[0-9]*" >
									
									<a class="btn btn-reduce" href="#"></a>
									<a class="btn btn-increase" href="#"></a>
								</div>
							</div>
							<div class="wrap-butons">
								<a href="#" class="btn add-to-cart"  wire:click.prevent="store({{ $product->id }}, '{{ $product->name }}', {{ $product->sale_price }})">Ajouter Au Panier</a>
                               
							</div>
						</div>
						<div class="advance-info">
							<div class="tab-control normal">
								<a href="#description" class="tab-control-item active">description</a>
								
							</div>
							<div class="tab-contents">
								<div class="tab-content-item active" id="description">
									{{$product->description}}
								</div>
								
								
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 sitebar">
					<div class="widget widget-our-services ">
						<div class="widget-content">
							<ul class="our-services">

								<li class="service">
									<a class="link-to-service" href="#">
										<i class="fa fa-truck" aria-hidden="true"></i>
										<div class="right-content">
											<b class="title">Paiement à la livraison</b>
											<span class="subtitle">Livraison Gratuit</span>
											<p class="desc">Lorem ipsum dolor sit, amet consectetur adipisicing elit...</p>
										</div>
									</a>
								</li>

								<li class="service">
									<a class="link-to-service" href="#">
										<i class="fa fa-gift" aria-hidden="true"></i>
										<div class="right-content">
											<b class="title">Offre Special</b>
											<span class="subtitle">lorem ipsum dolor!</span>
											<p class="desc">Lorem ipsum dolor sit, amet consectetur adipisicing elit...</p>
										</div>
									</a>
								</li>

								<li class="service">
									<a class="link-to-service" href="#">
										<i class="fa fa-reply" aria-hidden="true"></i>
										<div class="right-content">
											<b class="title">Possibilite de Routeur</b>
											<span class="subtitle">Return within 7 days</span>
											<p class="desc">Lorem Ipsum is simply dummy text of the printing...</p>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div><!-- Categories widget-->

					<div class="widget mercado-widget widget-product">
						<h2 class="widget-title">Produits Populaire</h2>
						<div class="widget-content">
							<ul class="products">
								@foreach($popular_products as $p_product)
								<li class="product-item">
									<div class="product product-widget-style">
										<div class="thumbnnail">
											<a href="{{route('product.details' , ['slug' => $p_product->slug])}}" title="{{$p_product->name}}">
												<figure><img src="{{ asset('assets/images/products') }}/{{$p_product->image}}" alt="{{$p_product->name}}"></figure>
											</a>
										</div>
										<div class="product-info">
											<a href="{{route('product.details' , ['slug' => $p_product->slug])}}" class="product-name"><span>{{$p_product->name}}</span></a>
											<div class="wrap-price"><span class="product-price">{{$product->regular_price}} MAD</span></div>
										</div>
									</div>
								</li>
								@endforeach
							</ul>
						</div>
					</div>

				</div><!--end sitebar-->

				<div class="single-advance-box col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="wrap-show-advance-info-box style-1 box-in-site">
						<h3 class="title-box">Produits Similaire</h3>
						<div class="wrap-products">
							<div class="products slide-carousel owl-carousel style-nav-1 equal-container" data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"5"}}' >
								@foreach ($related_products as $r_product)
								<div class="product product-style-2 equal-elem ">
									<div class="product-thumnail">
										<a href="{{route('product.details' , ['slug' => $r_product->slug])}}" title="{{$r_product->name}}">
											<figure><img src="{{ asset('assets/images/products') }}/{{$r_product->image}}" width="214" height="214" alt="{{$r_product->name}}"></figure>
										</a>
										<div class="group-flash">
											<span class="flash-item new-label">Nouveau</span>
										</div>
										
									</div>
									<div class="product-info">
										<a href="{{route('product.details' , ['slug' => $r_product->slug])}}" class="product-name"><span>{{$r_product->name}}</span></a>
										<div class="wrap-price"><span class="product-price">{{$r_product->regular_price}} MAD</span></div>
									</div>
								</div>
								@endforeach
							</div>
						</div><!--End wrap-products-->
					</div>
				</div>

			</div><!--end row-->

		</div><!--end container-->

	</main>