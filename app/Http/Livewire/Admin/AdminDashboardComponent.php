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
       

      

        

        $columnChartModel = 
        (new ColumnChartModel())
        ->setTitle('Revenue')
        ->setAnimated(true)
        ->withoutLegend()
       
        
        
    ;
        $i = 6 ;
    for($j=0 ; $j<=6 ; $j++){
        $d  = Carbon::now()->subDays($i);
        $re = Order::where('status','delivered')->whereDate('created_at',$d)->sum('total');
        $columnChartModel->addColumn($d->format('l jS'),$re,'#fc8181');
        $i--;
    }
         $pieChartModel = 
        (new PieChartModel())
        ->setTitle('Categories')
        ->setAnimated(true)
        ->addSlice('Food', 100, '#f6ad55')
        ->addSlice('Shopping', 200, '#fc8181')
        ->addSlice('Travel', 300, '#428bcd')
    ;


        
       
        

        $lineChartModel = (new LineChartModel());
        $lineChartModel->setTitle('visitors');
        $lineChartModel->setAnimated(true);
        // for($i= 0 ; $i<12 ; $i++ ){
        //     $lineChartModel->addPoint($i,rand(10,200));
        // }
        // foreach ($weekMap as $day){
        //     $lineChartModel->addPoint($day,rand(10,200));
        // }

        $i = 30 ;
        for($j=0 ; $j<=30 ; $j++){
            $d  = Carbon::now()->subDays($i);
            $re = Order::where('status','delivered')->whereDate('created_at',$d)->sum('total');
            $lineChartModel->addPoint($d->format('l jS'),$re);
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
