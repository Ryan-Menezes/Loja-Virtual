<div class="row" style="padding: 20px; border: 1px solid #e3e3e3;">
    <div class="col-md-8">
        <h2>{{ $title ?? null }}</h2>
        <p style="margin: 0px;">{{ $message ?? null }}</p>
    </div>
    <div class="text-right text-end" style="font-size: 50px;">
        @if(isset($success) && $success)
        <i class="fa fa-check text-success"></i>
        @else
        <i class="fa fa-times text-danger"></i>
        @endif
    </div>
</div>