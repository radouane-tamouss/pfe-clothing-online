<div class="wrap-search center-section">
    <div class="wrap-search-form">
        <form action="{{route('product.search')}}" id="form-search-top" name="form-search-top">
            <input type="text" name="search" value="{{$search}}" placeholder="Rechercher Nos Produits...">
            <button form="form-search-top" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
        </form>
    </div>
</div>