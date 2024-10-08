@php
	$currentPage = (int) (filter_input(INPUT_GET, 'page', FILTER_SANITIZE_NUMBER_INT) ?? 1);
	$limitPage = 4;
	$limitPageItems = $currentPage + $limitPage;
	$pages = (int) $pages;
@endphp

@if($pages > 1)
<div style="display: flex; gap: 20px;">
    <nav class="m-0">
        <ul class="pagination m-0">
            @if($currentPage !== 1)
                @if (empty($builder))
                    <li class="page-item"><a class="page-link" href="?page=1" title="Primeira página">Primeiro</a></li>
                @else
                    <li class="page-item"><a class="page-link" href="?page=1&{{ http_build_query($builder) }}" title="Primeira página">Primeiro</a></li>
                @endif
            @endif

            @if(empty($builder))
                @for($i = $currentPage - $limitPage; $i < $currentPage && $i <= $limitPageItems; $i++)
                    @if($i > 0)
                        <li class="page-item"><a class="page-link" href="?page={{ $i }}" title="Página {{ $i }}">{{ $i }}</a></li>
                    @endif
                @endfor
            @else
                @for($i = $currentPage - $limitPage; $i < $currentPage && $i <= $limitPageItems; $i++)
                    @if($i > 0)
                        <li class="page-item"><a class="page-link" href="?page={{ $i }}&{{ http_build_query($builder) }}" title="Página {{ $i }}">{{ $i }}</a></li>
                    @endif
                @endfor
            @endif

            <li class="page-item active"><a class="page-link" href="#" title="Página {{ $currentPage }}">{{ $currentPage }}</a></li>

            @if(empty($builder))
                @for($i = $currentPage + 1; $i <= $pages && $i <= $limitPageItems; $i++)
                    <li class="page-item"><a class="page-link" href="?page={{ $i }}" title="Página {{ $i }}">{{ $i }}</a></li>
                @endfor
            @else
                @for($i = $currentPage + 1; $i <= $pages && $i <= $limitPageItems; $i++)
                    <li class="page-item"><a class="page-link" href="?page={{ $i }}&{{ http_build_query($builder) }}" title="Página {{ $i }}">{{ $i }}</a></li>
                @endfor
            @endif

            @if($currentPage !== $pages)
                @if (empty($builder))
                    <li class="page-item"><a class="page-link" href="?page={{$pages}}" title="Última página">Último</a></li>
                @else
                    <li class="page-item"><a class="page-link" href="?page={{$pages}}&{{ http_build_query($builder) }}" title="Última página">Último</a></li>
                @endif
            @endif
        </ul>
    </nav>

    <form method="GET" style="width: 150px; display: flex; gap: 5px;">
        <input type="number" name="page" placeholder="Página" class="form-control" value="{{ $currentPage }}" />
        <button type="submit" class="btn btn-primary">IR</button>
    </form>
</div>
@endif
