@if($pages > 0)
<nav class="m-0">
	<ul class="pagination m-0">
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