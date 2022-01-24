<a href="javascript:void(0)" class="list-group-item list-group-item-action" title="{{ $title }}" data-productid="{{ $id }}" data-title="{{ $title }}">
    <div class="row">
        <div class="col-md-2">
            <img src="{{ $image }}" class="img-fluid" alt="{{ $title }}" title="{{ $title }}" />
        </div>
        <div class="col-md-10">
            <div class="d-flex w-100 justify-content-between">
                <h3 class="mb-1" style="font-size: 20px;">{{ $title }}</h3>
            </div>
            <p class="mt-3">{{ $description }}</p>
        </div>
    </div>
</a>