<?php

namespace App\Http\Livewire\Admin;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
use Livewire\Component;
use App\Models\Order;
use App\Models\User;
use Carbon\Carbon;

class AdminDashboardComponent extends Component
{

    
    public function render()
    {

      
        $columnChartModel = 
        (new ColumnChartModel())
            ->setTitle('Expenses by Type')
            ->addColumn('Food', 100, '#f6ad55')
            ->addColumn('Shopping', 200, '#fc8181')
            ->addColumn('Travel', 300, '#90cdf4')
        ;
        $orders = Order::orderBy('created_at','DESC')->get()->take(10);
        $totalSales = Order::where('status', 'delivered')->count();
        $totalRevenue = Order::where('status','delivered')->sum('total');
        $todaySales = Order::where('status', 'delivered')->whereDate('created_at',Carbon::today())->count();
        $todayRevenue = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->sum('total');
       
        return view('livewire.admin.admin-dashboard-component',[
            'orders'=>$orders,
            'totalRevenue'=>$totalRevenue,
            'totalSales'=>$totalSales,
            'todaySales'=>$todaySales,
            'todayRevenue'=>$todayRevenue,
            'columnChartModel'=>$columnChartModel
            
            ])->layout('layouts.base');
    }
}
