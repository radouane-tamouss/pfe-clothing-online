<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Category;
use App\Models\ProductAttribute;
use App\Models\Product;
use Livewire\WithPagination;

class AdminAttributesComponent extends Component
{
    public function render()
    {
        $pattributes = ProductAttribute::paginate(10);
        return view('livewire.admin.admin-attributes-component', ['pattributes'=>$pattributes])->layout('layouts.base');
    }
}
