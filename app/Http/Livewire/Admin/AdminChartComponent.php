<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Asantibanez\LivewireCharts\Facades\LivewireCharts;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
class AdminChartComponent extends Component
{
    public function render()
    {
        
        $columnChartModel = 
        (new ColumnChartModel())
        ->setTitle('Expenses by Type')
        ->addColumn('Food', 100, '#f6ad55')
        ->addColumn('Shopping', 200, '#fc8181')
        ->addColumn('Travel', 300, '#90cdf4')
    ;


        return view('livewire.admin.admin-chart-component',[
           'columnChartModel'=>$columnChartModel
            
            
            ]
        )->layout('layouts.base');
    }
}
