<main id="main">
		<div class="container">

			<!--MAIN SLIDE-->
			<div class="wrap-main-slide">
				<div class="slide-carousel owl-carousel style-nav-1" data-items="1" data-loop="1" data-nav="true" data-dots="false">
					<div class="item-slide">
						<img src="assets/images/main-slider-1-2.jpg" alt="" class="img-slide">
						
						
					</div>
					<div class="item-slide">
						<img src="assets/images/main-slider-1-1.jpg" alt="" class="img-slide">
						<!-- <model-viewer src="{{ asset('assets/3d/nike/scene.gltf')}}" alt="voltremetre" auto-rotate camera-controls ar ios-src="assets/3d/nike/scene.gltf"  class="img-slide">
            			</model-viewer> -->
						
					</div>
					<div class="item-slide">
						<model-viewer src="{{ asset('assets/3d/nike/scene.gltf')}}" alt="air force" auto-rotate camera-controls ar ios-src="assets/3d/nike/scene.gltf"  class="img-slide">
            			</model-viewer>
						<div class="slide-info slide-1">
                                <h2 class="f-title">Air Force 1 Shadow Amethyst Ash</b></h2>
                                <span class="subtitle">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero saepe maiores iure incidunt molestias iusto sapiente perferendis cum nisi dolore commodi dolor quibusdam </span>
                                <p class="sale-info">Seulement à : <span class="price"> 299 DH </span></p>
                                <a href="/shop" class="btn-link">Commander</a>
                            </div>
						
					</div>
					
				</div>
			</div>

			



			<!--DERNIERS PRODUITS-->
			<div class="wrap-show-advance-info-box style-1">
				<h3 class="title-box">DERNIERS PRODUITS</h3>
				<div class="wrap-top-banner">
					<a href="#" class="link-banner banner-effect-2">
						<figure><img src="assets/images/livraison-banner.jpg" width="1170" height="240" alt=""></figure>
					</a>
				</div>
				<div class="wrap-products">
					<div class="wrap-product-tab tab-style-1">						
						<div class="tab-contents">
							<div class="tab-content-item active" id="fashion_1a">
								<div class="wrap-products slide-carousel owl-carousel style-nav-1 equal-container" data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"4"},"1200":{"items":"5"}}' >
								@foreach($lproducts as $lproduct)
									<div class="product product-style-2 equal-elem ">
										<div class="product-thumnail">
											<a href="{{route('product.details',['slug'=>$lproduct->slug])}}" title="{{$lproduct->name}}">
												<figure><img src="{{ ('assets/images/products') }}/{{ $lproduct->image }}" width="800" height="800" alt="{{$lproduct->name}}"></figure>
											</a>
											
										</div>
										<div class="product-info">
											<a href="{{route('product.details',['slug'=>$lproduct->slug])}}" class="product-name"><span>{{$lproduct->name}}</span></a>
											<div class="wrap-price"><span class="product-price">{{$lproduct->regular_price}} MAD</span></div>
										</div>
									</div>
								@endforeach
									

									

								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>

			<!--CATÉGORIES DE PRODUITS-->
			<div class="wrap-show-advance-info-box style-1">
				<h3 class="title-box">CATÉGORIES DE PRODUITS</h3>
				<div class="wrap-top-banner">
					<a href="#" class="link-banner banner-effect-2">
						<figure><img src="assets/images/fashion-accesories-banner.jpg" width="1170" height="240" alt=""></figure>
					</a>
				</div>
				<div class="wrap-products">
					<div class="wrap-product-tab tab-style-1">
						<div class="tab-control">
							@foreach($categories as $key =>$category)
							<a href="#category_{{$category->id}}" class="tab-control-item {{$key==0 ? 'active':''}}">{{$category->name}}</a>
							@endforeach
							
						</div>
						<div class="tab-contents">
						@foreach ($categories as $key=>$category)
							<div class="tab-content-item {{$key==0 ? 'active':''}}" id="category_{{$category->id}}">
								<div class="wrap-products slide-carousel owl-carousel style-nav-1 equal-container" data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"4"},"1200":{"items":"5"}}' >
									
										@php 
											$c_products = DB::table('products')->where('category_id',$category->id)->get()->take($no_of_products);
										@endphp
										@foreach ($c_products as $c_product)
											<div class="product product-style-2 equal-elem ">
												<div class="product-thumnail">
													<a href="{{route('product.details',['slug'=>$c_product->slug])}}" title="{{$c_product->name}}">
														<figure><img src="{{ asset('assets/images/products') }}/{{$c_product->image}}" width="800" height="800" alt="{{$c_product->name}}"></figure>
													</a>
													
												</div>
												<div class="product-info">
													<a href="{{route('product.details',['slug'=>$c_product->slug])}}" class="product-name"><span>{{$c_product->name}}</span></a>
													<div class="wrap-price"><span class="product-price">{{$c_product->regular_price}} MAD</span></div>
												</div>
											</div>
										@endforeach
									
								</div>
							</div>
						@endforeach
						</div>
					</div>
				</div>
			</div>			
		</div>
	</main>