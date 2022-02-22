<?php

namespace App\Http\Livewire;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Category;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Cart;



class ShopComponent extends Component
{

    public function store($product_id, $product_name, $product_price)
    {
        Cart::add($product_id, $product_name, 1, $product_price)->associate('App\Models\Product');
        session()->flash('success_message','ajouté au panier avec succès!');
        return redirect()->route('product.cart');
    }
    

    use WithPagination;
    public function render()
    {
        $products = Product::Paginate(12);
        $categories = Category::all();

        if(Auth::check())
        {
            Cart::store(Auth::user()->email);
        }
        
        


        return view('livewire.shop-component',['products' => $products,'categories'=>$categories])->layout("layouts.base");
        

        
    }
}