<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Product;
use App\Models\Category;

use App\Models\HomeCategory;
use Illuminate\Support\Facades\Auth;

use Cart;
class HomeComponent extends Component
{
    public function render()
    {
        $lproducts = Product::orderBy('created_at', 'DESC')->get()->take(8);
        if(Auth::check()){
            Cart::restore(Auth::user()->email);
        }
        $category = HomeCategory::find(1);
          $cats =explode(',',$category->sel_categories );
          $categories = Category::whereIn('id',$cats)->get();
          $no_of_products = $category->no_products;
        return view('livewire.home-component',['lproducts'=>$lproducts,
                    'categories'            => $categories,
                    'no_of_products' =>$no_of_products
            ])->layout('layouts.base');

           
            
    }
}
