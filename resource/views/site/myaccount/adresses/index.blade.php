@extends('templates.site')

@section('title', 'Meus Endereços')
@section('url', route('site.myaccount.adresses'))

@section('container')
@include('includes.site.modais.delete', [
    'title' => 'Deletar Endereço',
    'message' => 'Deseja realmente deletar este endereço?',
    'btnmsg' => 'Deletar'
])

<section class="container">
    <div class="content">
        @include('includes.site.account.menu')
        <div class="cont-content">
            <h1>Endereços</h1><hr />

            <div class="text-right" style="margin-bottom: 20px;">
                <a href="{{ route('site.myaccount.adresses.create') }}" class="btn btn-danger" title="Novo Endereço">Novo <i class="fa fa-plus-circle"></i></a>
            </div>

            @include('includes.messages')

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Endereço</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($adresses as $address)
                    <tr>
                        <td>
                            {{ mask($address->postal_code, '#####-###') }}, {{ $address->street }} - {{ $address->number }}, {{ $address->district }}, {{ $address->city }} - {{ $address->state }}
                        </td>
                        <td>
                            <a href="{{ route('site.myaccount.adresses.edit', ['id' => $address->id]) }}" class="btn btn-sm btn-primary" title="Editar Endereço"><i class="fa fa-pencil"></i></a>
                            
                            @if($client->shipping_address_id != $address->id && $client->billing_address_id != $address->id)
                            <a href="javascript:void(0)" class="btn btn-sm btn-danger btn-delete" data-route="{{ route('site.myaccount.adresses.destroy', ['id' => $address->id]) }}" data-toggle="modal" data-target="#modalDelete" title="Deletar Endereço"><i class="fa fa-trash"></i></a>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            @include('includes.site.paginator', ['route' => 'site.myaccount.adresses'])
        </div>
    </div>
</section>
@endsection

@section('styles')
<link rel="stylesheet" type="text/css" href="{{ public_path('assets/css/site/myaccount.css') }}">
@endsection