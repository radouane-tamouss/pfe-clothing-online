
<style>
.list-me{
    list-style: none;
    display: flex;
  flex-direction: row;
  
  margin : 10px;

}
.list-me li{
    margin : 10px;
}
</style>
<div class="container mx-auto space-y-4 p-4 sm:p-0">
        <ul class="list-me">
            <li>
                <input type="checkbox" value="travel" wire:model="types"/>
                <span>Travel</span>
            </li>
            <li>
                <input type="checkbox" value="shopping" wire:model="types"/>
                <span>Shopping</span>
            </li>
            <li>
                <input type="checkbox" value="food" wire:model="types"/>
                <span>Food</span>
            </li>
            <li>
                <input type="checkbox" value="entertainment" wire:model="types"/>
                <span>Entertainment</span>
            </li>
            <li>
                <input type="checkbox" value="other" wire:model="types"/>
                <span>Other</span>
            </li>
        </ul>
    <div class="row" style="height: 32rem !important">
        <div style="float:left; width: 70%; height: 32rem">
            <livewire:livewire-column-chart
                key="{{ $columnChartModel->reactiveKey() }}"
                :column-chart-model="$columnChartModel"
            />
        </div>      
        <div style="float:right; height: 32rem">
            <livewire:livewire-pie-chart
                key="{{ $pieChartModel->reactiveKey() }}"
                :pie-chart-model="$pieChartModel"
            />
        </div>
    </div>        
</div>    

