<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Order;
use Illuminate\Support\Facades\DB;
class AdminOrderComponent extends Component
{
    //fonction pour changer le status de la commande
    public function updateOrderStatus($order_id,$status)
    {
        $order = Order::find($order_id);//recherche de la commande dans la BDD
        $order->status = $status;
        if($status == "delivered")
        {
            $order->delivered_date = DB::raw('CURRENT_DATE');
        }

        $order->save();
        session()->flash('order_message','Le statut de la commande 
                            a été mis à jour avec succès!'); // message de succès
    }
    public function render()
    {
        $orders = Order::orderBy('created_at', 'DESC')->paginate(12);
        return view('livewire.admin.admin-order-component',['orders'=>$orders])->layout('layouts.base');
    }
}
