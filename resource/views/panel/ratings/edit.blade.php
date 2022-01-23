@extends('templates.panel')

@section('title', 'Editar Avaliação')

@section('container')
<div class="container-main">
	<div class="border mb-4 p-4 bg-white">
		<p><a href="{{ route('site.products.show', ['slug' => $rating->product->slug]) }}" title="Visualizar: {{ $rating->product->name }}" target="_blank"><strong>{{ $rating->product->name }} <i class="fas fa-external-link-alt"></i></strong></a></p>

		<p class="m-0 p-0">{!! str_ireplace("\n", '<br>', $rating->product->description) !!}</p>
	</div>
	<div class="border mb-4 p-4 bg-white">
		<p><a href="{{ route('panel.clients.show', ['id' => $rating->client->id]) }}" title="Ver Mais Sobre: {{ $rating->client->name }}" target="_blank"><strong>{{ $rating->client->name }} <i class="fas fa-external-link-alt"></i></strong></a> | <strong>{{ $rating->client->email }}</strong></p>

		<p class="mt-4 mb-0">{!! str_ireplace("\n", '<br>', $rating->content) !!}</p>
	</div>

	@include('includes.panel.ratings.form', ['action' => route('panel.ratings.update', ['id' => $rating->id]), 'method' => 'PUT'])
</div>
@endsection