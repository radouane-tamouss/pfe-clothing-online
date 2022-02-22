<div>
    <style>
        nav svg 
        {
            height : 20px;

        }
        nav .hidden{
            display : block !important;
        }
    </style>
    <div class="container" style="padding:30px 0;">
        <div class="row">
            <div class="com-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    <div class="row">
                            <div class="col-md-6">
                            Tous les produits
                            </div>
                            <div class="col-md-6 ">
                                <a href="{{ route('admin.addproduct') }}" class="pull-right btn btn-success">Ajouter un nouveau produit</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <table class="table table-stripped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Stock</th>
                                    <th>Prix(DH)</th>
                                    <th>catégorie</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ( $products as $product )
                                    <tr>
                                        <td>{{$product->id}}</td>
                                        <td><img src="{{asset('assets/images/products')}}/{{$product->image}}" width="60"></td>
                                        <td>{{$product->name}}</td>
                                        <td>{{$product->stock_status}}</td>
                                        <td>{{$product->regular_price}} MAD</td>
                                        <td>{{$product->category->name }}</td>
                                        
                                        <td>{{$product->created_at}}</td>
                                        <td>
                                            <a href="{{route('admin.editproduct',['product_slug'=>$product->slug]) }}" title="Edit"><i class="fa fa-edit fa-2x"></i> </a>
                                            <a href="#" style="margin-left:10px; margin-bottom:2px;" wire:click.prevent="deleteProduct({{$product->id}})"><i class="fa fa-thin fa-trash fa-2x text-danger"></i></a>

                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>

                        </table>
                        {{$products->links()}}
                    </div>
                </div>
            </div>  
        </div>

    </div>
</div>