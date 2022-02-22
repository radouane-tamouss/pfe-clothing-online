<div>
    <style>

        nav svg{
            height: 20px;

        }
        nav .hidden
        {
            display : block !important;
        }

</style>

    <div class="container" style="padding:30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6"> 
                                toutes catégories
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.addcategory')}}" class="btn btn-success pull-right"> Ajouter une nouvelle catégorie </a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-succes"  role="alert">{{Session::get('message')}}</div>
                        @endif
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nom de catégorie</th>
                           

                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($categories as $category)
                                <tr>
                                    <td>{{$category->id}}</td>
                                    <td>{{$category->name}}</td>
                                    
                                    <td>
                                        <a href="{{ route('admin.editcategory',['category_slug'=>$category->slug])}}" ><i class="fa fa-edit fa-2x"  ></i></a>
                                        <a href="#" ><i class="fa fa-times fa-2x" style="margin-left:10px ; color:red;" wire:click.prevent="deleteCategory({{ $category->id}})"></i></a>

                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$categories->links()}}

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>