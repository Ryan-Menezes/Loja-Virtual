@extends('templates.site')

@section('title', 'Meus Cartões')
@section('url', route('site.myaccount'))
@section('keywords', config('app.keywords'))
@section('description', config('app.description'))
@section('image', public_path('assets/img/site/core-img/favicon.ico'))
@section('image_width', 200)
@section('image_height', 200)

@section('container')
@include('includes.site.modais.delete', [
    'title' => 'Deletar Cartão',
    'message' => 'Deseja realmente deletar este cartão?',
    'btnmsg' => 'Deletar'
])

<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <div class="text-right" style="margin-bottom: 20px;">
                <a href="{{ route('site.myaccount.cards.create') }}" class="btn btn-danger" title="Novo Endereço">Novo <i class="fa fa-plus-circle"></i></a>
            </div>

            @include('includes.messages')

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Marca</th>
                        <th>Tipo</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($cards as $card)
                    <tr>
                        <td>{{ $card->name }}</td>
                        <td>{{ $card->brand }}</td>
                        <td>{{ $card->typeFormat }}</td>
                        <td>
                            <a href="{{ route('site.myaccount.cards.edit', ['id' => $card->id]) }}" class="btn btn-sm btn-primary" title="Editar Cartão"><i class="fa fa-pencil"></i></a>

                            <a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('site.myaccount.cards.destroy', ['id' => $card->id]) }}" data-toggle="modal" data-target="#modalDelete" title="Deletar Cartão"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            @include('includes.site.paginator', ['route' => 'site.myaccount.cards'])
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection