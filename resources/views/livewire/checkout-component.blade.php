<div>
<!--main area-->

<style>
    .summary-item .row-in-form input[type="password"], .summary-item .row-in-form input[type=text], .summary-item .row-in-form input[type=tel] {
    font-size: 13px;
    line-height: 19px;
    display: inline-block;
    height: 43px;
    padding: 2px 20px;
    max-width: 300px;
    width: 100%;
    border: 1px solid #e6e6e6;
}
</style>
<main id="main" class="main-site">

<div class="container">

    <div class="wrap-breadcrumb">
        <ul>
            <li class="item-link"><a href="/" class="link">home</a></li>
            <li class="item-link"><span>commande</span></li>
        </ul>
    </div>
    <div class=" main-content-area">
        <form  wire:submit.prevent="placeOrder">

      
            <div class="row">
                <div class="col-md-12">
                <div class="wrap-address-billing">
                <h3 class="box-title">Adresse de facturation</h3>
                <div class="billing-address">
                    <p class="row-in-form">
                        <label for="fname">Prénom<span>*</span></label>
                        <input type="text" name="fname" value="" placeholder="Votre Prenom" wire:model="firstname" >
                        @error('firstname') <span class="text-danger">{{$message}}</span> @enderror
				    </p>
                    <p class="row-in-form">
                        <label for="lname">Nom<span>*</span></label>
                        <input  type="text" name="lname" value="" placeholder="Votre Nom" wire:model="lastname" >
                        @error('lastname') <span class="text-danger">{{$message}}</span> @enderror

                    </p>
                    <p class="row-in-form">
                        <label for="email">Email :</label>
                        <input  type="email" name="email" value="" placeholder="Votre email" wire:model="email">
                        @error('email') <span class="text-danger">{{$message}}</span> @enderror
                    </p>
                    <p class="row-in-form">
                        <label for="phone">Tele:<span>*</span></label>
                        <input id="phone" type="number" name="phone" value="" placeholder="Numero de tele" wire:model="mobile">
                        @error('mobile') <span class="text-danger">{{$message}}</span> @enderror
                    </p>
                    <p class="row-in-form">
                        <label for="add">Address:</label>
                        <input  type="text" name="add" value="" placeholder="votre adresse" wire:model="line1">
                        @error('line1') <span class="text-danger">{{$message}}</span> @enderror
                    </p>
                   
                    <p class="row-in-form">
                        <label for="zip-code">Code Postal:</label>
                        <input  type="number" name="zip-code" value="" placeholder="Code Postal" wire:model="zipcode">
                        @error('zipcode') <span class="text-danger">{{$message}}</span> @enderror

                    </p>
                    <p class="row-in-form">
                        <label for="city">Ville:<span>*</span></label>
                        <input  type="text" name="city" value="" placeholder="Ville" wire:model="city">
                        @error('city') <span class="text-danger">{{$message}}</span> @enderror

                    </p>
                
                </div>
            </div>
                </div>
            </div>
            
            <div class="summary summary-checkout">
                <div class="summary-item payment-method">
                    <h4 class="title-box">Methode de Payement</h4>
                    
                    <div class="choose-payment-methods">
                            <label class="payment-method">
								<input name="payment-method" id="payment-method-bank" value="cod" type="radio" wire:model="paymentmode">
								<span>paiement à la livraison</span>
								<span class="payment-desc">Commandez maintenant Paiement en espèces à la livraison</span>
							</label>
                        <label class="payment-method">
                            <input name="payment-method" id="payment-method-visa" value="card" type="radio" wire:model="paymentmode">
                            <span>carte bancaire</span>
                            <span class="payment-desc">commander maintenant avec carte bancaire</span>
                        </label>
                        @if($paymentmode == 'card')
                    
                        <div class="wrap-address-billing">
                            @if(Session::has('stripe_error'))
                                <div class="alert alert-danger" role="alert">{{Session::get('stripe_error')}}</div>
                            @endif
                            <p class="row-in-form">
                                <label for="card-no">Numéro de carte:<span>*</span></label>
                                <input  type="text" name="card-no" value="" placeholder="Carte de crédit" wire:model="card_no">
                                @error('card_no') <span class="text-danger">{{$message}}</span> @enderror

                            </p>

                            <p class="row-in-form">
                                <label for="exp-month">mois d'expiration:<span>*</span></label>
                                <input  type="text" name="exp-month" value="" placeholder="MM" wire:model="exp_month">
                                @error('exp_month') <span class="text-danger">{{$message}}</span> @enderror

                            </p>

                            <p class="row-in-form">
                                <label for="exp-year">année d'expiration:<span>*</span></label>
                                <input  type="text" name="exp-year" value="" placeholder="AAAA" wire:model="exp_year">
                                @error('exp_year') <span class="text-danger">{{$message}}</span> @enderror

                            </p>
                            <p class="row-in-form">
                                <label for="CVC">numéro CVC:<span>*</span></label>
                                <input  type="password" name="CVC" value="" placeholder="CVC" wire:model="cvc">
                                @error('cvc') <span class="text-danger">{{$message}}</span> @enderror

                            </p>
                            
                        </div>
                    
                    @endif
                       
                        @error('paymentmode') <span class="text-danger">{{$message}}</span> @enderror
                        

                    </div>
                    @if(Session::has('checkout'))
                    <p class="summary-info grand-total"><span>Montant Total</span> <span class="grand-total-price">{{Session::get('checkout')['total']}} MAD</span></p>
                    @endif
                    <button type="submit" class="btn btn-medium">Passer la commande</button>
                </div>
                <div class="summary-item shipping-method">
                    <h4 class="title-box f-title">methode de livraison</h4>
                    <p class="summary-info"><span class="title">profitez de la livraison gratuite dans notre site web</span></p>
                    <p class="summary-info"><span class="title">Gratuit!</span></p>
                    
                </div>
            </div>
        </form>

        

    </div><!--end main content area-->
</div><!--end container-->

</main>
<!--main area-->
</div>