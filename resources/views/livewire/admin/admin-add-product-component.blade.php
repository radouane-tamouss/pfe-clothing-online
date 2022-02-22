<div>
    <div class="container" style="padding:30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                Ajouter Nouveau Produit
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.products')}}" class="btn btn-success pull-right">Tous les produits</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form action="" class="form-horizontal" enctype="multipart/form-data" wire:submit.prevent="addProduct" >
                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Nom Produit</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Product Name" class="form-control input-md" wire:model="name" wire:keyup="generateSlug" />

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Produit</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Product slug" class="form-control input-md" wire:model="slug" />
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" >Short description</label>
                                <div class="col-md-4">
                                    <textarea  class="form-control" placeholder="Short Description" wire:model="short_description"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Description</label>
                                <div class="col-md-4">
                                    <textarea name=""  class="form-control" placeholder="Description" wire:model="description" ></textarea>
                                </div>
                            </div>

                            
                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Prix</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Regular Price" class="form-control input-md" wire:model="regular_price" />
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">prix de vente</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Sale price" class="form-control input-md" wire:model="sale_price"/>
                                    @error('sale_price')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                                </div>
                            </div>
                            
                            

                            <div class="form-group">
                            <label class="col-md-4 control-label"> reference</label>
                            <div class="col-md-4" >
                                <input class="form-control input-md" type="text" 
                                    placeholder="SKU" wire:model="SKU">
                                @error('SKU')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </div>                            
                        </div>

                            <div class="form-group">
                                <label  class="col-md-4 control-label">Stock</label>
                                <div class="col-md-4">
                                    <select  class="form-control" wire:model="stock" >
                                        <option value="instock">In Stock</option>
                                        <option value="outofstock">Out Of Stock</option>
                                    </select>                                    
                                </div>
                            </div>

                            

                            <div class="form-group">
                                 <label class="col-md-4 control-label"> Quantity</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Quantity" class="form-control input-md" wire:model="quantity" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Image</label>
                                <div class="col-md-4">
                                    <input type="file" placeholder="Product Image" class="input-file" wire:model="image" />
                                    @if($image)
                                        <img src="{{$image->temporaryUrl()}}" width="120" style="margin-top:10px;"/>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Gallerie de produit</label>
                                <div class="col-md-4">
                                    <input type="file" placeholder="Product Image" class="input-file" wire:model="images" multiple />
                                    @if($images)
                                        @foreach($images as $image)
                                        <img src="{{ $image->temporaryUrl() }}" width="100"  style ="margin-top : 10px;"/>
                                        @endforeach                                    
                                    @endif
                                    @error('$images')
                                    <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>


                          



                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Category</label>
                                <div class="col-md-4">
                                    <select name="" class="form-control" wire:model="category_id">
                                        <option value="">Select Category</option>
                                        @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>    
                                         @endforeach
                                    </select>   
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-md-4 control-label"></label>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary">Ajouter</button>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>