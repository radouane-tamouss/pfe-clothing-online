<div>
    <div class="container" style="padding : 30px 0;">

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                detail de la commaande
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.orders')}}" clas="btn btn-success pull-right">Touts les commandes</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <th>Commande Id </th>
                                <td>{{$order->id}}</td>

                                <th> Date de la commade</th>
                                <td>{{$order->created_at}}</td>

                                <th>Status </th>
                                <td>{{$order->status}}</td>
                                @if($order->status =="delivered")
                                <th>Date de livraison</th>
                                <td>{{$order->delivered_date}}</td>
                                @endif

                            </tr>

                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                 Produits Commander
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                        
                    </div>
                    <div class="panel-body">
                       <div class="wrap-iten-in-cart">   
                             <h3 class="box-title">Products Name</h3>
                            <ul class="products-cart">
                            @foreach ($order->orderItems  as $item )
                                <li class="pr-cart-item">
                                    <div class="product-image">
                                        <figure><img src="{{ asset('assets/images/products') }}/{{ $item->product->image }}" alt="{{ $item->product->name }}"></figure>
                                    </div>
                                    <div class="product-name">
                                        <a class="link-to-product" href="{{ route('product.details', ['slug'=> $item->product->slug]) }}">{{ $item->product->name }}</a>
                                    </div>
                                    <div class="price-field produtc-price"><p class="price">{{ $item->price }} MAD</p></div>
                                    <div class="quantity">
                                        <h5>{{$item->quantity}}</h5>

                                    </div>
                                    <div class="price-field sub-total"><p class="price">{{ $item->price * $item->quantity}} MAD</p></div>
                                    
                                </li>	
                            @endforeach  											
                            </ul>
                        </div>
                        <div class="summary">
                            <div class="order-summary">
                                <h4 class="title-box">résumé de la commande</h4>
						        <p class="summary-info"><span class="title">Prix HT</span><b class="index">{{   $order->tax }} MAD</b></p>
						        <p class="summary-info"><span class="title">Montant Total TTC</span><b class="index">{{   $order->total }} MAD</b></p>
						        <p class="summary-info"><span class="title">Livraison</span><b class="index">Gratuit</b></p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Details de Livraison
                    </div>
                    <div class="panel-body">
                    <table class="table">
                            <tr>
                                <th>Prenom</th>
                                <td>{{$order->firstname}}</td>
                                <th>Nom</th>
                                <td>{{$order->lastname}}</td>
                            </tr>
                            <tr>
                                <th>Mobile</th>
                                <td>{{$order->mobile}}</td>
                                <th>Email</th>
                                <td>{{$order->email}}</td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td>{{$order->line1}}</td>
                                <th>Ville</th>
                                <td>{{$order->city}}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Details de Transaction
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <th>Mode de transaction</th>
                                <td>{{$order->Transaction->mode}}</td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>{{$order->Transaction->status}}</td>
                            </tr>
                            <tr>
                                <th>Date de transaction</th>
                                <td>{{$order->Transaction->created_at}}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
