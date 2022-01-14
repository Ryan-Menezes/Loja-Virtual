@extends('templates.panel')

@section('title', 'Configurações')

@section('container')
<div class="modal fade" id="modalFreightRange" tabindex="-1" aria-labelledby="modalFreightRange" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Adicionar Uma Faixa de CEP</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="javascript:void(0)" method="POST" class="form-validate modal-form-multiple" data-container=".freight_range">
                	<div class="row">
                		<div class="col-md-6">
                			@include('includes.components.form.input', [
								'type' => 'text', 
								'name' => 'postal_code_min', 
								'title' => 'CEP Minímo', 
								'class' => 'required cep-mask',
								'required' => true
							])
                		</div>
                		<div class="col-md-6">
                			@include('includes.components.form.input', [
								'type' => 'text', 
								'name' => 'postal_code_max', 
								'title' => 'CEP Máximo', 
								'class' => 'required cep-mask',
								'required' => true
							])
                		</div>
                	</div>

                	<div class="row">
                		<div class="col-md-6">
                			@include('includes.components.form.input', [
								'type' => 'text', 
								'name' => 'value', 
								'title' => 'Valor', 
								'class' => 'required float-mask',
								'required' => true
							])
                		</div>
                		<div class="col-md-6">
                			@include('includes.components.form.input', [
								'type' => 'number', 
								'name' => 'days', 
								'title' => 'Dias para à entrega', 
								'min' => 1,
								'max' => 300,
								'class' => 'required',
								'required' => true
							])
                		</div>
                	</div>

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger">Salvar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container-main">
	@include('includes.messages')

	@if(can('all.system'))
	<div class="accordion mt-2">
		<h2>Geral</h2>
		@include('includes.panel.system.form', ['action' => route('panel.system.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.address'))
	<div class="accordion mt-2">
		<h2>Endereço</h2>
		@include('includes.panel.system.address.form', ['action' => route('panel.system.address.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.contact'))
	<div class="accordion mt-2">
		<h2>Contato</h2>
		@include('includes.panel.system.contact.form', ['action' => route('panel.system.contact.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.social'))
	<div class="accordion mt-2">
		<h2>Redes Sociais</h2>
		@include('includes.panel.system.social.form', ['action' => route('panel.system.social.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.store'))
	<div class="accordion mt-2">
		<h2>Loja</h2>
		@include('includes.panel.system.store.form', ['action' => route('panel.system.store.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.lgpd'))
	<div class="accordion mt-2">
		<h2>LGPD</h2>
		@include('includes.panel.system.lgpd.form', ['action' => route('panel.system.lgpd.update'), 'method' => 'PUT'])
	</div>
	@endif

	@if(can('all.system.floater'))
	<div class="accordion mt-2">
		<h2>Floater</h2>
		@include('includes.panel.system.floater.form', ['action' => route('panel.system.floater.update'), 'method' => 'PUT'])
	</div>
	@endif
</div>
@endsection