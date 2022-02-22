<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Order;

use Illuminate\Support\Facades\DB;

class AdminOrderComponent extends Component
{
    
    
    public function updateOrderStatus($order_id,$status)
    {
        $order = Order::find($order_id);
        $order->status = $status;
        if($status == "delivered")
        {
            $order->delivered_date = DB::raw('CURRENT_DATE');
        }

        $order->save();
        session()->flash('order_message','Le statut de la commande a été mis à jour avec succès!');
    }  
    public function render()
    {
        $orders = Order::orderBy('created_at', 'DESC')->paginate(12);
        return view('livewire.admin.admin-order-component',['orders'=>$orders])->layout('layouts.base');
    }
}
