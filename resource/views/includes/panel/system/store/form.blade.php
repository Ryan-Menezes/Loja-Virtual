<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Promoção para o Carrinho</strong></div>
		<div class="card-body">	
			@include('includes.components.form.select', [
				'name' => 'cart_promotion', 
				'title' => 'Promoção para o Carrinho',
				'value' => (isset($system) && $system->store ? $system->store->cart_promotion : 0),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])

			@include('includes.components.form.input', [
				'type' => 'text',
				'name' => 'cart_amount_promotion', 
				'title' => 'Valor da Promoção(Caso o total do carrinho últrapasse esse valor, será aplicado um desconto por porcentagem ou frete grátis)',
				'value' => (isset($system) && $system->store ? $system->store->cart_amount_promotion : 0),
				'class' => 'float-mask'
			])

			<div class="row">
				<div class="col-md-6">
					@include('includes.components.form.input', [
						'type' => 'number',
						'name' => 'cart_discount_percent_promotion', 
						'title' => 'Desconto Aplicado Na Compra(%)',
						'value' => (isset($system) && $system->store ? $system->store->cart_discount_percent_promotion : 0),
						'min' => 0,
						'max' => 100
					])
				</div>
				<div class="col-md-6">
					@include('includes.components.form.select', [
						'name' => 'cart_freight_free_promotion', 
						'title' => 'Frete Grátis Disponível',
						'value' => (isset($system) && $system->store ? $system->store->cart_freight_free_promotion : 0),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])
				</div>
			</div>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header p-3"><strong>Configurações de Frete</strong></div>
		<div class="card-body">
			@include('includes.components.form.select', [
				'name' => 'type', 
				'title' => 'Tipo de Pagamento',
				'value' => (isset($system) && $system->store && $system->store->freight ? $system->store->freight->type : 'C'),
				'options' => [
					'C' => 'Correios',
					'P' => 'Personalizado'
				],
				'class' => 'required',
				'required' => true
			])

			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'postal_code_origin', 
				'title' => 'CEP de Origem(Para o frete dos correios)', 
				'value' => (isset($system) && $system->store && $system->store->freight ? $system->store->freight->postal_code_origin : null),
				'class' => 'required cep-mask',
				'required' => true
			])

			@php
				$freight_range = '';

				if(isset($system) && $system->store && $system->store->freight){
					foreach($system->store->freight->freight_customized as $freight){
						$freight_range .= "{$freight->postal_code_min};{$freight->postal_code_max};{$freight->value};{$freight->days}\n";
					}
				}
			@endphp

			@include('includes.components.form.textarea', [
				'name' => 'freight_range',
				'title' => 'Faixa de Cep(Para o frete personalizado)',
				'value' => $freight_range,
				'class' => 'freight_range'
			])
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalFreightRange">Adicionar Faixa <i class="fas fa-plus-circle"></i></button>

			<br /><br /><span><small>OBS: cep minímo;cep máximo;valor(R$);dias para à entega</small></span>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header p-3"><strong>Configurações de Pagamento</strong></div>
		<div class="card-body">
			@include('includes.components.form.select', [
				'name' => 'payment_production', 
				'title' => 'Modo de Produção',
				'value' => (isset($system) && $system->store ? $system->store->payment_production : 0),
				'options' => [
					1 => 'Ativado',
					0 => 'Desativado'
				],
				'class' => 'required',
				'required' => true
			])

			<div class="card mb-4">
				<div class="card-header p-3"><strong>Checkout Transparente</strong></div>
				<div class="card-body">	
					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_type', 
								'title' => 'Tipo de Pagamento',
								'value' => (isset($system) && $system->store ? $system->store->payment_type : 'PS'),
								'options' => [
									'PS' => 'PagSeguro',
									'MP' => 'Mercado Pago'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_checkout_transparent', 
								'title' => 'Situação',
								'value' => (isset($system) && $system->store ? $system->store->payment_checkout_transparent : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
					</div>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header p-3"><strong>Métodos de Pagamento</strong></div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_credit_card', 
								'title' => 'Cartão de Crédito',
								'value' => (isset($system) && $system->store ? $system->store->payment_credit_card : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_debit_card', 
								'title' => 'Cartão de Débito',
								'value' => (isset($system) && $system->store ? $system->store->payment_debit_card : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_balance', 
								'title' => 'Saldo',
								'value' => (isset($system) && $system->store ? $system->store->payment_balance : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_bolet', 
								'title' => 'Boleto',
								'value' => (isset($system) && $system->store ? $system->store->payment_bolet : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_deposit', 
								'title' => 'Depósito',
								'value' => (isset($system) && $system->store ? $system->store->payment_deposit : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_debit_online', 
								'title' => 'Débito Online',
								'value' => (isset($system) && $system->store ? $system->store->payment_debit_online : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_bank_transfer', 
								'title' => 'Transferência Bancária',
								'value' => (isset($system) && $system->store ? $system->store->payment_bank_transfer : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.select', [
								'name' => 'payment_pix', 
								'title' => 'PIX',
								'value' => (isset($system) && $system->store ? $system->store->payment_pix : 1),
								'options' => [
									1 => 'Ativado',
									0 => 'Desativado'
								],
								'class' => 'required',
								'required' => true
							])
						</div>
					</div>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header p-3"><strong>PagSeguro</strong></div>
				<div class="card-body">	
					@include('includes.components.form.select', [
						'name' => 'active_pagseguro', 
						'title' => 'Situação',
						'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->active : null),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])
					
					@include('includes.components.form.input', [
						'type' => 'email', 
						'name' => 'email_pagseguro', 
						'title' => 'E-Mail', 
						'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->email : null)
					])

					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'token_pagseguro', 
						'title' => 'Token', 
						'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->token : null)
					])

					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.input', [
								'type' => 'text', 
								'name' => 'app_id_pagseguro', 
								'title' => 'Id da Aplicação', 
								'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->app_id : null)
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.input', [
								'type' => 'text', 
								'name' => 'app_key_pagseguro', 
								'title' => 'Chave da Aplicação', 
								'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->app_key : null)
							])
						</div>
					</div>

					@include('includes.components.form.select', [
						'name' => 'type_checkout_pagseguro', 
						'title' => 'Tipo de Checkout',
						'value' => (isset($system) && $system->store && $system->store->pagseguro ? $system->store->pagseguro->type_checkout : 'LR'),
						'options' => [
							'LR' => 'Link de Redirecionamento',
							'LB' => 'LightBox'
						],
						'class' => 'required',
						'required' => true
					])
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header p-3"><strong>MercadoPago</strong></div>
				<div class="card-body">	
					@include('includes.components.form.select', [
						'name' => 'active_mercadopago', 
						'title' => 'Situação',
						'value' => (isset($system) && $system->store && $system->store->mercadopago ? $system->store->mercadopago->active : null),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])

					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'public_key_mercadopago', 
						'title' => 'Chave Pública', 
						'value' => (isset($system) && $system->store && $system->store->mercadopago ? $system->store->mercadopago->public_key : null)
					])
					
					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'access_token_mercadopago', 
						'title' => 'Token de Acesso', 
						'value' => (isset($system) && $system->store && $system->store->mercadopago ? $system->store->mercadopago->access_token : null)
					])

					@include('includes.components.form.select', [
						'name' => 'type_checkout_mercadopago', 
						'title' => 'Tipo de Checkout',
						'value' => (isset($system) && $system->store && $system->store->mercadopago ? $system->store->mercadopago->type_checkout : 'LR'),
						'options' => [
							'LR' => 'Link de Redirecionamento',
							'LB' => 'LightBox'
						],
						'class' => 'required',
						'required' => true
					])

					<div class="row">
						<div class="col-md-6">
							@include('includes.components.form.input', [
								'type' => 'color', 
								'name' => 'header_color_mercadopago', 
								'title' => 'Cor do Cabeçalho', 
								'value' => (isset($system) && $system->store && $system->store->mercadopago ? $system->store->mercadopago->header_color : null)
							])
						</div>
						<div class="col-md-6">
							@include('includes.components.form.input', [
								'type' => 'color', 
								'name' => 'elements_color_mercadopago', 
								'title' => 'Cor dos Elementos', 
								'value' => (isset($system) && $system->store && $system->store->mercadopago ? $system->store->mercadopago->elements_color : null)
							])
						</div>
					</div>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header p-3"><strong>PayPal</strong></div>
				<div class="card-body">	
					@include('includes.components.form.select', [
						'name' => 'active_paypal', 
						'title' => 'Situação',
						'value' => (isset($system) && $system->store && $system->store->paypal ? $system->store->paypal->active : null),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])

					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'secret_key_paypal', 
						'title' => 'Chave Secreta', 
						'value' => (isset($system) && $system->store && $system->store->paypal ? $system->store->paypal->secret_key : null)
					])
					
					@include('includes.components.form.input', [
						'type' => 'email', 
						'name' => 'email_paypal', 
						'title' => 'E-Mail', 
						'value' => (isset($system) && $system->store && $system->store->paypal ? $system->store->paypal->email : null)
					])

					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'client_id_paypal', 
						'title' => 'Id do Cliente', 
						'value' => (isset($system) && $system->store && $system->store->paypal ? $system->store->paypal->client_id : null)
					])
				</div>
			</div>

			<div class="card">
				<div class="card-header p-3"><strong>PicPay</strong></div>
				<div class="card-body">
					@include('includes.components.form.select', [
						'name' => 'active_picpay', 
						'title' => 'Situação',
						'value' => (isset($system) && $system->store && $system->store->picpay ? $system->store->picpay->active : null),
						'options' => [
							1 => 'Ativado',
							0 => 'Desativado'
						],
						'class' => 'required',
						'required' => true
					])

					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'token_picpay', 
						'title' => 'Token', 
						'value' => (isset($system) && $system->store && $system->store->picpay ? $system->store->picpay->token : null)
					])

					@include('includes.components.form.input', [
						'type' => 'text', 
						'name' => 'seller_token_picpay',
						'title' => 'Token do Vendedor', 
						'value' => (isset($system) && $system->store && $system->store->picpay ? $system->store->picpay->seller_token : null)
					])

					@include('includes.components.form.input', [
						'type' => 'number', 
						'name' => 'expiration_minutes_picpay', 
						'title' => 'Minutos para expirar o pagamento', 
						'value' => (isset($system) && $system->store && $system->store->picpay ? $system->store->picpay->expiration_minutes : null),
						'min' => 1,
						'max' => 8000,
					])
				</div>
			</div>
		</div>
	</div>
	<br />
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>