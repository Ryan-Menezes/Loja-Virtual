<div class="modal fade" tabindex="-1" id="floater">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title">{{ $title }}</h5>
            </div>
            <div class="modal-body">
                <a href="{{ $link ?? 'javascript:void(0)' }}" title="{{ $title }}" target="_blank"><img src="{{ $image }}" title="{{ $title }}" alt="{{ $title }}" style="width: 100%;"></a>
            </div>
        </div>
    </div>
</div>