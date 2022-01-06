<form action="{{ route('site.account.create') }}" method="POST" class="form form-validate">
	@include('includes.messages')

	@if($type == 1)
	<h2>Criar Conta como pessoa física:</h2>
	@else
	<h2>Criar Conta como pessoa jurídica:</h2>
	@endif
	<hr />

	@include('includes.components.form.input', [
		'title' => 'Nome',
		'name' => 'name',
		'type' => 'text',
		'class' => 'required',
		'required' => true
	])

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'E-Mail',
				'name' => 'email',
				'type' => 'email',
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
				'title' => 'Telefone',
				'name' => 'telephone',
				'type' => 'text'
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'title' => 'Celular',
				'name' => 'cell',
				'type' => 'text',
				'class' => 'required',
				'required' => true
			])
		</div>
	</div>

	@if($type == 1)
		@include('includes.components.form.input', [
			'title' => 'CPF',
			'name' => 'cpf',
			'type' => 'text',
			'class' => 'required',
			'required' => true
		])
	@else
		@include('includes.components.form.input', [
			'title' => 'CNPJ',
			'name' => 'cnpj',
			'type' => 'text',
			'class' => 'required',
			'required' => true
		])
	@endif

	<br /><h3>Endereço</h3><hr />

	@include('includes.components.form.input', [
		'title' => 'CEP',
		'name' => 'postal_code',
		'type' => 'text',
		'class' => 'required',
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

	{{-- <div class="row">
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'title' => 'Cidade',
				'name' => 'city',
				'options' => [],
				'class' => 'required',
				'required' => true
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.select', [
				'title' => 'Estado',
				'name' => 'state',
				'options' => [],
				'class' => 'required',
				'required' => true
			])
		</div>
	</div> --}}

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
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'state', 
				'title' => 'Estado', 
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