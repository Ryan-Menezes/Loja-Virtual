@php
	$currentPage = (int) (filter_input(INPUT_GET, 'page', FILTER_SANITIZE_NUMBER_INT) ?? 1);
	$limitPage = 4;
	$limitPageItems = $currentPage + $limitPage;
	$pages = (int) $pages;
@endphp

@if($pages > 1)
<div class="store-filter clearfix">
	<ul class="store-pagination">
		@if($currentPage !== 1)
			<li style="width: auto;"><a href="?page=1" title="Primeira página" style="padding: 0 20px;">Primeiro</a></li>
		@endif

		@if(empty($builder))
			@for($i = $currentPage - $limitPage; $i < $currentPage && $i <= $limitPageItems; $i++)
			 	@if($i > 0)
					<li><a href="?page={{ $i }}" title="Página {{ $i }}">{{ $i }}</a></li>
				@endif
			@endfor
        @else
        	@for($i = $currentPage - $limitPage; $i < $currentPage && $i <= $limitPageItems; $i++)
			 	@if($i > 0)
					<li><a href="?page={{ $i }}&{{ http_build_query($builder) }}" title="Página {{ $i }}">{{ $i }}</a></li>
				@endif
			@endfor
        @endif

		<li class="active"><a href="#" title="Página {{ $currentPage }}" style="color: #fff;">{{ $currentPage }}</a></li>

		@if(empty($builder))
			@for($i = $currentPage + 1; $i <= $pages && $i <= $limitPageItems; $i++)
			 	<li><a href="?page={{ $i }}" title="Página {{ $i }}">{{ $i }}</a></li>
            @endfor
        @else
        	@for($i = $currentPage + 1; $i <= $pages && $i <= $limitPageItems; $i++)
			 	<li><a href="?page={{ $i }}&{{ http_build_query($builder) }}" title="Página {{ $i }}">{{ $i }}</a></li>
            @endfor
        @endif

		@if($currentPage !== $pages)
			<li style="width: auto;"><a href="?page={{$pages}}" title="Última página" style="padding: 0 20px;">Último</a></li>
		@endif
	</ul>
</div>
@endif