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
                                toutes les Attributs
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.add_attribute')}}" class="btn btn-success pull-right"> Ajouter Attribut </a>
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
                                    <th>Nom d'attribut</th>
                                    <th>date de creation</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($pattributes as $pattribute)
                                <tr>
                                    <td>{{$pattribute->id}}</td>
                                    <td>{{$pattribute->name}}</td>
                                    <td>{{$pattribute->created_at}}</td>
                                    
                                    <td>
                                        <a href="{{ route('admin.edit_attribute',['attribute_id'=>$pattribute->id])}}" ><i class="fa fa-edit fa-2x"  ></i></a>
                                        <a href="#" ><i class="fa fa-times fa-2x" style="margin-left:10px ; color:red;"></i></a>

                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$pattributes->links()}}

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>