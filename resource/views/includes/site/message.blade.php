<div class="row" style="padding: 20px; border: 1px solid #e3e3e3;">
    <div class="col-md-8">
        <h2>{{ $title ?? null }}</h2>
        <p style="margin: 0px;">{{ $message ?? null }}</p>
    </div>
    <div class="col-md-4 text-right text-end" style="font-size: 50px;">
        @if(isset($success) && $success)
        <i class="fa fa-check text-success"></i>
        @else
        <i class="fa fa-times text-danger"></i>
        @endif
    </div>
    @if(isset($link))
    <div class="col-md-12" style="margin-top: 20px;">
        @if(isset($success) && $success)
        <a href="{{ $url }}" class="btn btn-success">{{ $btntext ?? 'Acessar Link' }}</a>
        @else
        <a href="{{ $url }}" class="btn btn-danger">{{ $btntext ?? 'Acessar Link' }}</a>
        @endif
    </div>
    @endif
</div>