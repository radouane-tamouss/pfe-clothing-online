<div>
    <div class="container" style="padding: 30px 0">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        
Gérer les catégories d'accueil
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">
                                {{ Session::get('message') }}
                            </div>
                        @endif
                        <form action="" class="form-horizontal" wire:submit.prevent="updateHomeCategory">
                            <div class="form-group">
                                <label class="col-md-4 control-label">categories</label>
                                <div class="col-md-4" wire:ignore>
                                    <select id="select_2"class="sel_categories form-control" multiple="multiple" name="categories[]" wire:model='selected_categories' >
                                        @foreach ($categories  as $category)
                                            <option value="{{ $category->id }}" >{{ $category->name }}</option>    
                                        @endforeach
                                        
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Nombre de Produits</label>
                                <div class="col-md-4" wire:ignore>
                                   <input type="text" class="form-control input-md" wire:model="numberofproducts"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-4 control-label"></label>
                                <div class="col-md-4">
                                     <button class="btn btn-primary" type="submit">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('scripts')
    <script>
        $(document).ready(function (){
            $('#select_2').select2();
            $('.sel_categories').on('change', function(e){
                var data = $('.sel_categories').select2("val");
                @this.set('selected_categories',data);
            });     
        });
    </script>
    
@endpush