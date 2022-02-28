<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Asantibanez\LivewireCharts\Facades\LivewireCharts;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
use Asantibanez\LivewireCharts\Models\PieChartModel;
use Asantibanez\LivewireCharts\Models\AreaChartModel;
use Asantibanez\LivewireCharts\Models\RadarChartModel;
use Asantibanez\LivewireCharts\Models\TreeMapChartModel;
class AdminChartComponent extends Component
{
    public function render()
    {
        
        $columnChartModel = 
        (new ColumnChartModel())
        ->setTitle('Revenue')
        ->addColumn('lundi', 100, '#f6ad55')
        ->addColumn('mardi', 200, '#fc8181')
        ->addColumn('mercredi', 300, '#90cdf4')
        ->addColumn('jeudi', 200, '#fc8181')
        ->addColumn('vendredi', 300, '#90cdf4')
        ->addColumn('samedi', 300, '#90cdf4')
        ->addColumn('dimanche', 300, '#90cdf4')
    ;
         $pieChartModel = 
        (new PieChartModel())
        ->setTitle('Expenses by dwaea')
        ->addSlice('Food', 100, '#f6ad55')
        ->addSlice('Shopping', 200, '#fc8181')
        ->addSlice('Travel', 300, '#90cdf4')
    ;

   

        return view('livewire.admin.admin-chart-component',[
           'columnChartModel'=>$columnChartModel,
           'pieChartModel'=>$pieChartModel
       
            
            
            ]
        )->layout('layouts.base');
    }
}
