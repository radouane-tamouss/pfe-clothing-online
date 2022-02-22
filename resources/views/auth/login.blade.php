
<x-guest-layout>

<!--main area-->
<main id="main" class="main-site left-sidebar">

    <div class="container">

        <div class="wrap-breadcrumb">
            <ul>
                <li class="item-link"><a href="/" class="link">home</a></li>
                <li class="item-link"><span>connexion</span></li>
            </ul> 
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12 col-md-offset-3">
                <div class=" main-content-area">
                    <div class="wrap-login-item ">			
                        <div class="login-form form-item form-stl">
                        <x-jet-validation-errors class="mb-4" />
                            <form name="frm-login" method="POST" action="{{route ('login')}}">
                                @csrf
                                <fieldset class="wrap-title">
                                    <h3 class="form-title">Connexion a votre compte</h3>										
                                </fieldset>
                                <fieldset class="wrap-input">
                                    <label for="frm-login-uname">Email :</label>
                                    <input type="email" id="frm-login-uname" name="email" placeholder="Type your email address" :value="old('email')" required autofocus>
                                </fieldset>
                                <fieldset class="wrap-input">
                                    <label for="frm-login-pass">Mot de pass :</label>
                                    <input type="password" id="frm-login-pass" name="password" placeholder="************" required autocomplete="current-password">
                                </fieldset>
                                
                                
                                <input type="submit" class="btn btn-submit" value="Login" name="submit">
                            </form>
                        </div>												
                    </div>
                </div><!--end main products area-->		
            </div>
        </div><!--end row-->

    </div><!--end container-->

</main>
<!--main area-->

</x-guest-layout>