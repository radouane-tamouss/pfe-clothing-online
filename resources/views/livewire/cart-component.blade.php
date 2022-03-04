	<!--main area-->
	<main id="main" class="main-site">

		<div class="container">

			<div class="wrap-breadcrumb">
				<ul>
					<li class="item-link"><a href="/" class="link">home</a></li>
					<li class="item-link"><span>Panier</span></li>
				</ul>
			</div>
			<div class=" main-content-area">
			@if(Cart::count()>0)
				<div class="wrap-iten-in-cart">
					@if(Session::has('success_message'))
						<div class="alert alert-success ">
							<strong> Success! </strong>{{ Session::get('success_message') }}
						</div>
					@endif
					@if(Cart::count()>0)
					<h3 class="box-title">Produits</h3>
					<ul class="products-cart">
					@foreach (Cart::content() as $item )
						<li class="pr-cart-item">
							<div class="product-image">
								<figure><img src="{{ asset('assets/images/products') }}/{{ $item->model->image }}" alt="{{ $item->model->name }}"></figure>
							</div>
							<div class="product-name">
								<a class="link-to-product" href="{{ route('product.details', ['slug'=> $item->model->slug]) }}">{{ $item->model->name }}</a>
							</div>
							<div class="price-field produtc-price"><p class="price">{{ $item->model->regular_price }} MAD</p></div>
							<div class="quantity">
								<div class="quantity-input">
									<input type="text" name="product-quatity" value="{{ $item->qty }}" data-max="50" pattern="[0-9]*" >									
									<a class="btn btn-increase" href="#" wire:click.prevent="increaseQuantity('{{ $item->rowId }}')"></a>
									<a class="btn btn-reduce" href="#" wire:click.prevent="decreaseQuantity('{{ $item->rowId }}')"></a>

								</div>

							</div>
							<div class="price-field sub-total"><p class="price">{{ $item->subtotal}} MAD</p></div>
							<div class="delete">
								<a href="#" class="btn btn-delete" title="" wire:click.prevent="destroy('{{ $item->rowId }}')">
									<span>Delete from your cart</span>
									<i class="fa fa-times-circle" aria-hidden="true"></i>
								</a>
							</div>
						</li>	
					@endforeach  											
					</ul>
					@else
                    <p>Panier Vide!</p>
                	@endif
				</div>

				<div class="summary">
					<div class="order-summary">
						<h4 class="title-box">Résume de la commande</h4>
						<p class="summary-info"><span class="title">Sous Total</span><b class="index">{{ Cart::subtotal() }} MAD</b></p>
						<p class="summary-info"><span class="title">Tva</span><b class="index">{{ Cart::tax() }} MAD</b></p>
						<p class="summary-info"><span class="title">Livraison</span><b class="index">Gratuit!</b></p>
						<p class="summary-info total-info "><span class="title">Total</span><b class="index">{{ Cart::subtotal() }} MAD</b></p>
					</div>
					<div class="checkout-info">
						
						<a class="btn btn-checkout" href="#" wire:click.prevent="checkout">passer la commade</a>
						<a class="link-to-shop" href="/shop">Continuer vos achats<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a>
					</div>
				</div>
			@else
				<div class="text-center" style="padding: 30px 0;">
					<h1>Votre panier est vide!</h1>		
					<p>Ajoutez-y des éléments maintenant</p>
					<a href="/shop" class="btn btn-success">Achetez maintenant!</a>
				</div>
			@endif
				

			</div><!--end main content area-->
		</div><!--end container-->

	</main>
	<!--main area-->