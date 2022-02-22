<div>
    <div class="container" style="padding: 30px 0;">

    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-6">
                    Ajouter un Attribut
                    </div>
                    <div class="col-md-6">
                        <a href="{{route('admin.attributes')}}" class="btn btn-success pull-right"> toutes les attributs</a>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                @if(Session::has('message'))
                <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                @endif
                <form action="" class="form-horizontal" wire:submit.prevent="storeAttribute" >
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Nom d'attribut</label>
                        <div class="col-md-4">
                            <input type="text" placeholder="Attribute Name" class="form-control input-md" wire:model="name"   />
                        </div>
                    </div>  
                    
                  
                    
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