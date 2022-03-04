<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\User;

use Illuminate\Support\Facades\DB;

class AdminUserComponent extends Component
{

    public function deleteUser($id){
        User::find($id)->delete();
        session()->flash('message', 'le Client a ete supprimer avec succès');
    } 
    public function render()
    {
        $users = User::orderBy('created_at', 'DESC')->paginate(12);
        return view('livewire.admin.admin-user-component',['users'=>$users])->layout('layouts.base');
    }
}
