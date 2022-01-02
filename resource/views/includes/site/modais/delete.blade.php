<div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="modalDelete" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title">{{ $title }}</h5>
            </div>
            <div class="modal-body">
                <p class="m-0 p-0">{{ $message }}</p>
            </div>
            <form action="{{ $action ?? null }}" method="POST" class="modal-footer modal-form-delete">
                <input type="hidden" name="_method" value="DELETE">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-danger">{{ $btnmsg }}</button>
            </form>
        </div>
    </div>
</div>