<div>
            <style>
                nav svg {
                    height: 20px;
                }
                nav .hidden{
                    display: block !important;
                }

            </style>
   <div class="container" style="padding: 30px 0">

       <div class="row">
           
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Touts les Client
                    </div>
                    <div class="panel-body">
                        @if(Session::has('user_message'))
                            <div class="alert alert-success" role="alert">{{Session::get('user_message')}}</div>
                        @endif
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>id </th>
                                    <th>nom </th>
                                    <th>email</th>
                                    <th>date d'inscription</th>
                                
                                   

                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $user)
                                @if($user->utype=='USR')
                                <tr>
                                    <td>{{$user->id}}</td>                                   
                                    <td>{{$user->name}}</td>
                                    <td>{{$user->email}}</td>
                                    <td>{{$user->created_at}}</td>
                                    <td><a href="#" style="margin-left:10px; margin-bottom:2px;" wire:click.prevent="deleteUser({{$user->id}})"><i class="fa fa-thin fa-trash fa-2x text-danger"></i></a>
</td>
                                @endif
                                   
                                    
                                @endforeach  
                                </tr>                   
                              
                            </tbody>
                        </table>
                        {{$users->links()}}
                    </div>
                </div>
            </div>
       </div>
   </div>
</div>
