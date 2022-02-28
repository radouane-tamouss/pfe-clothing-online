<?php

namespace App\Http\Livewire\Admin;
use Asantibanez\LivewireCharts\Facades\LivewireCharts;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
use Asantibanez\LivewireCharts\Models\PieChartModel;
use Asantibanez\LivewireCharts\Models\AreaChartModel;
use Asantibanez\LivewireCharts\Models\RadarChartModel;
use Asantibanez\LivewireCharts\Models\TreeMapChartModel;
use Asantibanez\LivewireCharts\Models\LineChartModel;
use Livewire\Component;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Category;
use App\Models\User;
use Carbon\Carbon;

class AdminDashboardComponent extends Component
{


   
    public function render()
    {
        
        $categories = Category::all();

        $date  = Carbon::now()->subDays(1);

        $orders = Order::orderBy('created_at','DESC')->get()->take(10);
        $totalSales = Order::where('status', 'delivered')->count();
        $totalRevenue = Order::where('status','delivered')->sum('total');
        $todaySales = Order::where('status', 'delivered')->whereDate('created_at',Carbon::today())->count();
        $todayRevenue = Order::where('status','delivered')->whereDate('created_at',Carbon::now()->subDays(0))->sum('total');
        $tadayRevenue1 = Order::where('status','delivered')->whereDate('created_at',Carbon::now()->subDays(3))->sum('total');
        $ordered = Order::where('status','ordered')->count();


            $columnChartModel =  (new ColumnChartModel())
                                ->setTitle('Revenue de cette semaine')
                                ->setAnimated(true)
                                ->withoutLegend()
                                ->withOnColumnClickEventName('onColumnClick')  
                                ;
            $i = 6 ;
            for($j=0 ; $j<=6 ; $j++){
                $d  = Carbon::now()->subDays($i);
                // $re = Order::where('status','delivered')->whereDate('created_at',$d)->sum('total');
                $sl = Order::where('status', 'delivered')->whereDate('created_at',$d)->count();
                $columnChartModel->addColumn($d->format('l jS'),$sl,'#428bca');
                $i--;
            }
         $pieChartModel = 
        (new PieChartModel())
        ->setTitle('état des commandes')
        ->setAnimated(true)
        ->addSlice('livré', $totalSales, '#f6ad55')
        ->addSlice('commandé', $ordered, '#fc8181')
        
    ;


    
        
       
        

        $lineChartModel = (new LineChartModel());
        
        $lineChartModel->setTitle('Orders '. Carbon::now()->format('F Y'));
        $lineChartModel->setAnimated(true);
        
        
        $i = 30 ;
        for($j=0 ; $j<=30 ; $j++){
            $d  = Carbon::now()->subDays($i);
            // $re = Order::where('status','delivered')->whereDate('created_at',$d)->sum('total');
            $re = Order::whereDate('created_at',$d)->count();
            $lineChartModel->addPoint($d->format('j'),$re);
            $i--;
        }
   
       
      
    

       
        return view('livewire.admin.admin-dashboard-component',[
            'orders'=>$orders,
            'totalRevenue'=>$totalRevenue,
            'totalSales'=>$totalSales,
            'todaySales'=>$todaySales,
            'todayRevenue'=>$todayRevenue,
            'columnChartModel'=>$columnChartModel,
            'pieChartModel'=>$pieChartModel,
            'lineChartModel'=>$lineChartModel,
         
    
            'date' => $date,
            'tadayRevenue1'=> $tadayRevenue1,
            'categories'=>$categories
           
            
            
            ])->layout('layouts.base');
    }
}
