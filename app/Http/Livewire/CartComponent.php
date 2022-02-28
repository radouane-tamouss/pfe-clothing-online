<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;


class CartComponent extends Component
{
    public function increaseQuantity($rowId){
        $product = Cart::get($rowId);
        $qty = $product->qty + 1;
        Cart::update($rowId, $qty);
        return redirect()->route('product.cart');

    }
    public function decreaseQuantity($rowId)
    {
        $product = Cart::get($rowId);
        if($product->qty >1){
            $qty = $product->qty - 1;
            Cart::update($rowId, $qty);
            return redirect()->route('product.cart');
        }
    }

    public function destroy($rowId)
    {
        Cart::remove($rowId);
        session()->flash('success_message', 'L\'élément a été supprimé');
        return redirect()->route('product.cart');

       
    }

    public function destroyAll(){
        Cart::destroy();
        return redirect()->route('product.cart');//for refresh the page
    }


    public function checkout()
    {
        if(Auth::check())
        {
            return redirect()->route('checkout');

        }
        else{
            return redirect()->route('login');
        }
    }


    // public function setAmountForCheckout()
    // {
    //     if(!Cart::count()>0)
    //     {
    //         session()->forget('checkout');
    //         return;
    //     }
    //     session()->put('checkout',
    //     [
    //         'subtotal'=>Cart::subtotal(),
    //         'tax'=>0,
    //         'total'=>Cart::total()
    //     ]);
    // }


    public function setAmountForCheckout()
{ 
	if(!Cart::count() > 0)
	{
		session()->forget('checkout');
		return;
	}    

	
		session()->put('checkout',[
			'discount' => 0,
			'subtotal' => Cart::subtotal(),
			'tax' => Cart::tax(),
			'total' => Cart::total()
		]);
}
  
    public function render()
    {
        $this->setAmountForCheckout();

        if(Auth::check())
        {
            Cart::store(Auth::user()->email);
        }
      
        return view('livewire.cart-component')->layout("layouts.base");
    }
}
