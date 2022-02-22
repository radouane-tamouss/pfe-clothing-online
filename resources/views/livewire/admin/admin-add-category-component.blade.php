<div>
    <div class="container" style="padding: 30px 0;">

    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-6">
                    Ajouter une nouvelle catégorie
                    </div>
                    <div class="col-md-6">
                        <a href="{{route('admin.categories')}}" class="btn btn-success pull-right"> toutes catégories</a>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                @if(Session::has('message'))
                <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                @endif
                <form action="" class="form-horizontal" wire:submit.prevent="soreCategory" >
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Nom de catégorie</label>
                        <div class="col-md-4">
                            <input type="text" placeholder="Category Name" class="form-control input-md" wire:model="name" wire:keyup="generateslug" />
                        </div>
                    </div>  
                    
                    <!-- <div class="form-group">
                        <label for="" class="col-md-4 control-label">Category Slug</label>
                        <div class="col-md-4">
                            <input type="text" placeholder="Category Slug" class="form-control input-md" wire:model="slug"/>
                        </div>
                    </div>   -->
                    
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                        <button class="btn btn-primary" type="submit">créer</button>
                        </div>
                    </div>   
                </form>

            </div>
        </div>
    </div>

</div>
</div>