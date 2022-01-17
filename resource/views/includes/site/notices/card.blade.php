<div class="notice-card">
    <div class="notice-image">
        <img src="{{ url('storage/app/public/' . $notice->poster) }}" alt="{{ $notice->title }}" title="{{ $notice->title }}">
    </div>
    <div class="notice-info">
        <h2 class="notice-title"><a href="{{ route('site.notices.show', ['slug' => $notice->slug]) }}" title="{{ $notice->title }}">{{ $notice->title }}</a></h2>
        <p class="notice-desc">{{ mb_substr($notice->description, 0, 100) }}...</p>
        <p class="notice-status"><i class="fa fa-comment"></i> {{ $notice->comments->where('visible', true)->count() }} <i class="fa fa-eye"></i> {{ $notice->visits }}</p>
    </div>
</div>