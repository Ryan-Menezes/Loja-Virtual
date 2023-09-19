<form action="{{ route('site.account.store') }}" method="POST" class="form form-validate">
	@include('includes.messages')

	@if($type == 1)
	<h2>Criar Conta como pessoa física:</h2>
	@else
	<h2>Criar Conta como pessoa jurídica:</h2>
	@endif
	<hr />

	@php
		$first_name = null;
		$last_name = null;

		if ($auth_user) {
			$parts = explode(' ', $auth_user->getName());
			$first_name = isset($parts[0]) ? $parts[0] : null;
			array_shift($parts);
			$last_name = !empty($parts) ? implode(' ', $parts) : null;
		}
	@endphp

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Nome',
				'name' => 'first_name',
				'type' => 'text',
				'value' => $first_name,
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Sobrenome',
				'name' => 'last_name',
				'type' => 'text',
				'value' => $last_name,
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@if($type == 1)
		<input type="hidden" name="redirect" value="pf">
		@include('includes.components.form.input', [
			'title' => 'CPF',
			'name' => 'cpf',
			'type' => 'text',
			'class' => 'required cpf-mask',
			'required' => true
		])
	@else
		<input type="hidden" name="redirect" value="pj">
		@include('includes.components.form.input', [
			'title' => 'CNPJ',
			'name' => 'cnpj',
			'type' => 'text',
			'class' => 'required cnpj-mask',
			'required' => true
		])
	@endif

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'E-Mail',
				'name' => 'email',
				'type' => 'email',
				'value' => ($auth_user ? $auth_user->getEmail() : null),
				'class' => 'required email',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Senha',
				'name' => 'password',
				'type' => 'password',
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text',
				'title' => 'Telefone',
				'name' => 'telephone',
				'class' => 'phone-mask'
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Celular',
				'name' => 'cell',
				'type' => 'text',
				'class' => 'required cell-mask',
				'required' => true
			])
		</div>
	</div>

	<br /><h3>Endereço</h3><hr />

	@include('includes.components.form.input', [
		'title' => 'CEP',
		'name' => 'postal_code',
		'type' => 'text',
		'class' => 'required cep-mask postal-code-search',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Logradouro',
				'name' => 'street',
				'type' => 'text',
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Número',
				'name' => 'number',
				'type' => 'text',
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.input', [
		'title' => 'Bairro',
		'name' => 'district',
		'type' => 'text',
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'city', 
				'title' => 'Cidade', 
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'title' => 'Estado',
				'name' => 'state',
				'options' => config('states.BRL'),
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@include('includes.components.form.textarea', [
		'name' => 'complement',
		'title' => 'Complemento'
	])

	<br />
	<input type="checkbox" name="terms_conditions" id="terms_conditions" class="required" required>
	<label for="terms_conditions">Aceitos os <a href="{{ route('site.terms_conditions') }}" title="Termos e Condições" target="_blank">termos e condições</a></label>

	<br /><br />
	<p><a href="{{ route('site.login') }}" title="Fazer login">Já possuo conta</a></p>
	<br />

	<input type="submit" class="primary-btn cta-btn" value="Criar Conta">
</form>