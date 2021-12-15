@if($pages > 0)
<nav aria-label="Page navigation example">
	<ul class="pagination">
		@if(empty($builder))
			@for($i = 1; $i <= $pages; $i++)
			 	<li class="page-item"><a class="page-link" href="{{ route($route, $params ?? []) }}?page={{ $i }}" title="Página {{ $i }}">{{ $i }}</a></li>
            @endfor
        @else
        	@for($i = 1; $i <= $pages; $i++)
			 	<li class="page-item"><a class="page-link" href="{{ route($route, $params ?? []) }}?page={{ $i }}&{{ http_build_query($builder) }}" title="Página {{ $i }}">{{ $i }}</a></li>
            @endfor
        @endif
	</ul>
</nav>
@endif