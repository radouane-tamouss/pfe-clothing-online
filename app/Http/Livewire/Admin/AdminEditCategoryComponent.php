<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Illuminate\Support\Str;
use App\Models\Category;

class AdminEditCategoryComponent extends Component
{
    public $category_slug;
    public $category_id;
    public $slug;
    public $name;

    public function mount($category_slug){
        $category = Category::where('slug', $category_slug)->first();
        $this->category_id = $category->id;
        $this->name = $category->name;
        $this->slug = $category->slug;

        
    }

    public function generateslug()
    {
        $this->slug = Str::slug($this->name);
    }

    public function updateCategory()
    {
        $category = Category::find($this->category_id);
        $category->name = $this->name;
        $category->slug = $this->slug;
        $category->save();
        session()->flash('message','Category updated seccessfully');
    }

    public function render()
    {
        return view('livewire.admin.admin-edit-category-component')->layout('layouts.base');
    }
}
