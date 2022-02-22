<div class="content">   
    <style>
        .content {
          padding-top: 40px;
          padding-bottom: 40px;
        }
        .icon-stat {
            display: block;
            overflow: hidden;
            position: relative;
            padding: 15px;
            margin-bottom: 1em;
            background-color: #fff;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
        .icon-stat-label {
            display: block;
            color: #999;
            font-size: 13px;
        }
        .icon-stat-value {
            display: block;
            font-size: 28px;
            font-weight: 600;
        }
        .icon-stat-visual {
            position: relative;
            top: 22px;
            display: inline-block;
            width: 32px;
            height: 32px;
            border-radius: 4px;
            text-align: center;
            font-size: 16px;
            line-height: 30px;
        }
        .bg-primary {
            color: #fff;
            background: #d74b4b;
        }
        .bg-secondary {
            color: #fff;
            background: #6685a4;
        }
        
        .icon-stat-footer {
            padding: 10px 0 0;
            margin-top: 10px;
            color: #aaa;
            font-size: 12px;
            border-top: 1px solid #eee;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">    
              <div class="icon-stat">    
                <div class="row">
                  <div class="col-xs-8 text-left">
                    <span class="icon-stat-label">Revenus</span>
                    <span class="icon-stat-value">{{$totalRevenue}} DH</span>
                  </div>   
                  <div class="col-xs-4 text-center">
                    <i class="fa fa-dollar icon-stat-visual bg-primary"></i>
                  </div>
                </div>    
                <div class="icon-stat-footer">
                  <i class="fa fa-clock-o"></i> Mis à jour maintenant
                </div>     
              </div>    
            </div>    
            <div class="col-md-3 col-sm-6">    
              <div class="icon-stat">    
                <div class="row">
                  <div class="col-xs-8 text-left">
                    <span class="icon-stat-label">Ventes totales</span>
                    <span class="icon-stat-value">{{$totalSales}}</span>
                  </div>    
                  <div class="col-xs-4 text-center">
                    <i class="fa fa-gift icon-stat-visual bg-secondary"></i>
                  </div>
                </div>    
                <div class="icon-stat-footer">
                  <i class="fa fa-clock-o"></i> Mis à jour maintenant
                </div>    
              </div>
            </div>
            <div class="col-md-3 col-sm-6">    
              <div class="icon-stat">    
                <div class="row">
                  <div class="col-xs-8 text-left">
                    <span class="icon-stat-label">Revenu d'aujourd'hui</span>
                    <span class="icon-stat-value">{{$todayRevenue}} DH</span>
                  </div>    
                  <div class="col-xs-4 text-center">
                    <i class="fa fa-dollar icon-stat-visual bg-primary"></i>
                  </div>
                </div>    
                <div class="icon-stat-footer">
                  <i class="fa fa-clock-o"></i> Mis à jour maintenant
                </div>   
              </div>    
            </div>    
            <div class="col-md-3 col-sm-6">    
              <div class="icon-stat">    
                <div class="row">
                  <div class="col-xs-8 text-left">
                    <span class="icon-stat-label">Ventes d'aujourd'hui</span>
                    <span class="icon-stat-value">{{$todaySales}}</span>
                  </div>    
                  <div class="col-xs-4 text-center">
                    <i class="fa fa-gift icon-stat-visual bg-secondary"></i>
                  </div>
                </div> 
                <div class="icon-stat-footer">
                  <i class="fa fa-clock-o"></i> Mis à jour maintenant
                </div>   
                    
              </div>    
            </div>    

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                       <div class="panel-heading">
                       Dernières commandes
                       </div>
                    
                        <div class="panel-body">
                        <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Commande ID</th>
                                        <th>Tax</th>
                                        <th>Montant Total</th>
                                        <th>Prenom</th>
                                        <th>Nom</th>
                                        <th>mobile</th>
                                        <th>Email</th>
                                        <th>Code Postal</th>
                                        <th>Status</th>  
                                        <th>Date de Commande</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($orders as $order)
                                    <tr>
                                        <td>{{$order->id}}</td>                                   
                                        <td>{{$order->tax}} MAD</td>
                                        <td>{{$order->total}} MAD</td>
                                        <td>{{$order->firstname}}</td>
                                        <td>{{$order->lastname}}</td>
                                        <td>{{$order->mobile}}</td>
                                        <td>{{$order->email}}</td>
                                        <td>{{$order->zipcode}}</td>
                                        <td>{{$order->status}}</td>
                                        <td>{{$order->created_at}}</td>
                                    @endforeach                     
                                    </tr>
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>
          </div>        
    </div>    
</div>
