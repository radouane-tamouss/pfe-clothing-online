<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Category;
use App\Models\Product;
use Livewire\WithPagination;

class AdminCategoryComponent extends Component
{

    use WithPagination;
    // function for deleting category 
    public function deleteCategory($id)
    {   
        $category = Category::find($id);
        $category->delete();
        session()->flash('message','la catégorie a été supprimée avec succès! ');
    }

    public function render()
    {
        $categories = Category::paginate('5');
        return view('livewire.admin.admin-category-component', ['categories'=>$categories])->layout('layouts.base');

    }
}
