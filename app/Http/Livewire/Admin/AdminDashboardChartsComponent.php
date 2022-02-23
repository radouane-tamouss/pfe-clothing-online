<?php

namespace App\Http\Livewire\Admin;
use Livewire\Component;
use App\Models\Order;
use App\Models\User;
use Carbon\Carbon;

class AdminDashboardChartsComponent extends Component
{
    public function render()
    {
        $users = User::orderBy('created_at','DESC')->get()->take(10);
       
        $current_month_user = User::where('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->month)->count(); 
        $before_1_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(1))->count(); 
        $before_2_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(2))->count(); 
        $before_3_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(3))->count(); 
        $before_4_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(4))->count(); 
        $before_5_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(5))->count(); 
        $before_6_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(6))->count(); 
        $before_7_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(7))->count(); 
        $before_8_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(8))->count(); 
        $before_9_month_users = User::whereYear('created_at',Carbon::now()->year)->whereMonth('created_at',Carbon::now()->subMonth(9))->count(); 

        return view('livewire.admin.admin-dashboard-charts-component',[
            'current_month_user'=>$current_month_user,
            'before_1_month_users'=>$before_1_month_users,
            'before_2_month_users'=>$before_2_month_users,
            'before_3_month_users'=>$before_3_month_users,
            'before_4_month_users'=>$before_4_month_users,
            'before_5_month_users'=>$before_5_month_users,
            'before_6_month_users'=>$before_6_month_users,
            'before_7_month_users'=>$before_7_month_users,
            'before_8_month_users'=>$before_8_month_users,
            'before_9_month_users'=>$before_9_month_users
            
           
        ])->layout('layouts.base');
    }
}
