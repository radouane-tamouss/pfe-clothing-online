<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Product;
use App\Models\Category;

class AdminProductComponent extends Component
{
    use WithPagination;

    public function deleteProduct($id){
        Product::find($id)->delete();
        session()->flash('message', 'le produit a ete supprimer avec succès');
    } 

    public function render()
    {
        $products = Product::paginate(10);

        return view('livewire.admin.admin-product-component' , ['products' => $products])->layout('layouts.base');
    }
}
