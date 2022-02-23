<?php
namespace App\Http\Livewire;
use App\Models\Expense;
use Asantibanez\LivewireCharts\Models\AreaChartModel;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
use Asantibanez\LivewireCharts\Models\LineChartModel;
use Asantibanez\LivewireCharts\Models\PieChartModel;
use Livewire\Component;
class LivewireCharts extends Component
{
public $types = ['food', 'shopping', 'entertainment', 'travel', 'other'];
public $colors = [
'food' => '#f6ad55',
'shopping' => '#fc8181',
'entertainment' => '#90cdf4',
'travel' => '#66DA26',
'other' => '#cbd5e0',
];
public $firstRun = true;
protected $listeners = [
'onPointClick' => 'handleOnPointClick',
'onSliceClick' => 'handleOnSliceClick',
'onColumnClick' => 'handleOnColumnClick',
];
public function handleOnPointClick($point)
{
dd($point);
}
public function handleOnSliceClick($slice)
{
dd($slice);
}
public function handleOnColumnClick($column)
{
dd($column);
}
public function render()
{
$expenses = Expense::whereIn('type', $this->types)->get();
$columnChartModel = $expenses->groupBy('type')
->reduce(function (ColumnChartModel $columnChartModel, $data) {
$type = $data->first()->type;
$value = $data->sum('amount');
return $columnChartModel->addColumn($type, $value, $this->colors[$type]);
}, (new ColumnChartModel())
->setTitle('Expenses by Type')
->setAnimated($this->firstRun)
->withOnColumnClickEventName('onColumnClick')
);
$pieChartModel = $expenses->groupBy('type')
->reduce(function (PieChartModel $pieChartModel, $data) {
$type = $data->first()->type;
$value = $data->sum('amount');
return $pieChartModel->addSlice($type, $value, $this->colors[$type]);
}, (new PieChartModel())
->setTitle('Expenses by Type')
->setAnimated($this->firstRun)
->withOnSliceClickEvent('onSliceClick')
);
$lineChartModel = $expenses
->reduce(function (LineChartModel $lineChartModel, $data) use ($expenses) {
$index = $expenses->search($data);
$amountSum = $expenses->take($index + 1)->sum('amount');
if ($index == 6) {
$lineChartModel->addMarker(7, $amountSum);
}
if ($index == 11) {
$lineChartModel->addMarker(12, $amountSum);
}
return $lineChartModel->addPoint($index, $amountSum, ['id' => $data->id]);
}, (new LineChartModel())
->setTitle('Expenses Evolution')
->setAnimated($this->firstRun)
->withOnPointClickEvent('onPointClick')
);
$areaChartModel = $expenses
->reduce(function (AreaChartModel $areaChartModel, $data) use ($expenses) {
return $areaChartModel->addPoint($data->description, $data->amount, ['id' => $data->id]);
}, (new AreaChartModel())
->setTitle('Expenses Peaks')
->setAnimated($this->firstRun)
->setColor('#f6ad55')
->withOnPointClickEvent('onAreaPointClick')
->setXAxisVisible(false)
->setYAxisVisible(true)
);
$this->firstRun = false;
return view('livewire.livewire-charts')
->with([
'columnChartModel' => $columnChartModel,
'pieChartModel' => $pieChartModel,
'lineChartModel' => $lineChartModel,
'areaChartModel' => $areaChartModel,
]);
}
}