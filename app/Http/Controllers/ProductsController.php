<?php

namespace App\Http\Controllers;
use App\Models\Product;
use App\Models\Cart;
use resources\views\layouts\cartproducts;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;



class ProductsController extends Controller
{
    //
   
    public function index()
    {
        // $products = [0=> ["name"=>"Iphone", "category"=>"sart phones", "price"=>1000],
        // 1=> ["name"=>"galaxy", "category"=>"sart phones", "price"=>1000],
        // 2=> ["name"=>"sony", "category"=>"sart phones", "price"=>1000]];

    $products = Product::all();

    return view("allproducts", compact("products"));

    }
    

    public function addProductToCart(Request $request, $id){
        $prevCart= $request->session()->get('cart');
        $cart = new Cart($prevCart);
        $product = Product::find($id);
        $cart->addItem($id,$product);
        $request->session()->put('cart',$cart);
  
        //dump($cart);
        // return redirect()->route("allProducts");
        return redirect()->route('cartproducts');
    }
   
    public function showCart(){
       $cart= Session::get('cart');
       if($cart)//cart not empty
       {
           
         return view('cartproducts',['cartItems'=>$cart]); 
          
        //cart empty
       }else{
           
       return redirect()->route('allProducts');
       }
    }

    public function deleteItemFromCart(Request $request, $id)
    {
        $cart = $request->session()->get("cart");
        if(array_key_exists($id,$cart->items))
        {
            unset($cart->items[$id]);
        }
        $prevCart = $request->session()->get("cart");
        $updatedCart = new Cart($prevCart);
        $updatedCart->updatePriceAndQnty();

        $request = session()->put("cart",$updatedCart);
        return redirect()->route('cartproducts');

    }
}
