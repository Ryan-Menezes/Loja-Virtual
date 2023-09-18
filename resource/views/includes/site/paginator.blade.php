@if($pages > 1)
<div class="store-filter clearfix">
	<ul class="store-pagination">
		@if(empty($builder))
			@for($i = 1; $i <= $pages; $i++)
			 	<li><a href="{{ route($route, $params ?? []) }}?page={{ $i }}" title="Página {{ $i }}">{{ $i }}</a></li>
            @endfor
        @else
        	@for($i = 1; $i <= $pages; $i++)
			 	<li><a href="{{ route($route, $params ?? []) }}?page={{ $i }}&{{ http_build_query($builder) }}" title="Página {{ $i }}">{{ $i }}</a></li>
            @endfor
        @endif
	</ul>
</div>
@endif