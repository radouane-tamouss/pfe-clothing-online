<?php
namespace App\Models;
class Cart{
    public $items; 
    public $totalQuantity;
    public $totalPrice;
    public function __construct($prevCart)
    {
       

        if($prevCart != null)
        {
            $this->items = $prevCart->items;
            $this->totalQuantity = $prevCart->totalQuantity;
            $this->totalPrice = $prevCart->totalPrice;
        }else{
            $this->items = [];
            $this->totalQuantity = 0;
            $this->totalPrice = 0;
        }
    }
    //the product already exist

    public function addItem($id,$product){
        $price = (double) str_replace( "MAD","",$product->price);
        if(array_key_exists($id , $this->items)){

            $productToAdd = $this->items[$id];
            $productToAdd['quantity'] ++;
            $productToAdd['totalSinglePrice'] = $productToAdd['quantity'] * $price;
            //first time to add the product to cart
        }else{
            $productToAdd = ['quantity' =>1 , 'totalSinglePrice'=> $price, 'data'=>$product];
        }

        $this->items[$id]= $productToAdd; 
        $this->totalQuantity++;
        $this->totalPrice = $this->totalPrice + $price; 
    }
} 