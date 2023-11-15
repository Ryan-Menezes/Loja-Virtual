<?php
namespace App\Controllers\Site\MyAccount;

use Exception;
use Src\Classes\{
	Request,
	Controller,
    Validator
};
use App\Classes\Payment\MercadoPago;
use App\Models\{
	Client,
    Request as RequestModel
};

class MercadoPagoController extends Controller{
	private $client;
	private $requestmodel;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
		
		$this->requestmodel = new RequestModel();

		if(config('store.payment.credentials.mercadopago.access_token')){
			\MercadoPago\SDK::setAccessToken(config('store.payment.credentials.mercadopago.access_token'));
		}
	}

	public function checkout($id){
		$requestmodel = $this->client->requests()->findOrFail($id);
        $preference = null;

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            if(update_payment_request_mercadopago($requestmodel)){
				redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
			}

            // Desconto total
            $discount = $payment->discount_cart + $payment->discount_coupon;
            
            if($discount > $payment->amount){
                $discount = $payment->amount - 1;

                if($payment->shipping_value > 0){
                    $payment->shipping_value--;
                    $payment->save();
                }
            }

			if($products->count() > 0){
				$extra_item = ($payment->shipping_value - $discount) / $products->count();
			}
            
            // Configurando checkout
			$preference = new \MercadoPago\Preference();
			$preference->external_reference = config('store.reference_prefix') . $requestmodel->id;
			$preference->notification_url = route('site.notification.mercadopago');
			$preference->statement_descriptor = config('app.name');

			// Excluir meios de pagamento
			$excludes = [];

            if(!config('store.payment.methods.credit_card')){
                $excludes[] = [
					'id' => 'credit_card'
				];
            }

			if(!config('store.payment.methods.debit_card')){
                $excludes[] = [
					'id' => 'debit_card'
				];
            }

            if(!config('store.payment.methods.bolet') && !config('store.payment.methods.bank_transfer')){
                $excludes[] = [
					'id' => 'ticket'
				];
            }

			if(!config('store.payment.methods.pix')){
                $excludes[] = [
					'id' => 'bank_transfer'
				];
            }

			if(!config('store.payment.credentials.paypal.active')){
                $excludes[] = [
					'id' => 'digital_wallet'
				];
            }

			/*
            if(!config('store.payment.methods.balance')){
                $excludes[] = [
					'id' => 'account_money'
				];
            }
			*/

			// Excluindo outros meios
			$excludes[] = [
				'id' => 'atm'
			];
			$excludes[] = [
				'id' => 'digital_currency'
			];

			$preference->payment_methods = [
				'excluded_payment_types' => $excludes,
				"installments" => config('store.installments_amount')
			];

            // Produtos do pedido
			$items = [];

            foreach($products as $product){
				$item = new \MercadoPago\Item();
				$item->currency_id = 'BRL';
				$item->title = $product->product->name;
				$item->description = $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size;
				$item->quantity = $product->quantity;
				$item->unit_price = $product->price + ($extra_item / $product->quantity);

                $items[] = $item;
            }
			
			$preference->items = $items;

			// Cliente
			$name = explode(' ', $client->name);

			$payer = new \MercadoPago\Payer();
			$payer->first_name = $name[0] ?? null;
			$payer->last_name = $name[1] ?? null;
			$payer->email = $client->email;
			$payer->date_created = date('Y-m-d', strtotime($client->created_at)) .'T' . date('H:i:s', strtotime($client->created_at)) . '-00:00';

			if(!empty($client->telephone)){
				$payer->phone = [
					'area_code' => mb_substr($client->telephone, 0, 2),
					'number' => mask(mb_substr($client->telephone, 2), '####-####')
				];
			}else{
				$payer->phone = [
					'area_code' => mb_substr($client->cell, 0, 2),
					'number' => mask(mb_substr($client->cell, 2), '#####-####')
				];
			}
			
			if(!empty($client->cpf)){
				$payer->identification = [
					'type' => 'CPF',
					'number' => $client->cpf
				];
			}else{
				$payer->identification = [
					'type' => 'CNPJ',
					'number' => $client->cnpj
				];
			}	
					
			$payer->address = array(
				'street_name' => $client->billing_address->street,
				'street_number' => $client->billing_address->number,
				'zip_code' => $client->billing_address->postal_code
			);

			$preference->payer = $payer;

			// URLS
			$preference->back_urls = [
				'success' => route('site.myaccount.requests.show', ['id' => $requestmodel->id]),
				'failure' => route('site.myaccount.requests.show', ['id' => $requestmodel->id]),
				'pending' => route('site.myaccount.requests.show', ['id' => $requestmodel->id])
			];

			$preference->auto_return = 'approved';

			$preference->save();
        }catch(Exception $e){
            $preference = null;
        }
		
		return view('site.myaccount.requests.mercadopago.checkout.index', compact('requestmodel', 'preference'));
	}

	public function creditCard($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		// Verifica se a transação para este pedido já foi feita
		if(update_payment_request_mercadopago($requestmodel)){
			redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
		}
		
		return view('site.myaccount.requests.mercadopago.credit_card.index', compact('requestmodel'));
	}

	public function creditCardStore($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            // Configurando checkout
			$payment_mp = new \MercadoPago\Payment();
			$payment_mp->setCustomHeader('X-Idempotency-Key', $requestmodel->id);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_mercadopago($requestmodel)){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
					'message' 	=> 'Já foi realizado o pagamento para este pedido!'
                ]);
            }

            $request = new Request();
            $data = $request->all();

            // Validando os dados
            $validator = Validator::make($data, [
                'brand'                 => 'required|min:1',
                'credit_card_token'     => 'required|min:1',
                'number'                => 'required|numeric|min:16|max:16',
                'cvv'                   => 'required|min:3|max:10',
                'month'                 => 'required|numeric|min:1|max:2',
                'year'                  => 'required|numeric|min:2|max:2',
                'name'                  => 'required|min:1',
                'installments'          => 'required|min:1'
            ]);

            if(!$validator){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
					'message'	=> 'Preencha o formulário corretamente com os dados de seu cartão de crédito!'
                ]);
            }

			// Desconto pela parcela selecionada
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount($data['installments']);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

			$discount_installment = 0;
            if($discount_percent > 0){
                $discount_installment = ($payment->amountFormat * ($discount_percent / 100));
            }

            // Configurando checkout
            $payment_mp->transaction_amount = number_format($payment->amountFormat - $discount_installment, 2, '.', '');;
			$payment_mp->token = $data['credit_card_token'];
			$payment_mp->installments = (int)$data['installments'];
			$payment_mp->payment_method_id = $data['brand'];
			$payment_mp->issuer_id = (int)$data['issuer'];
			$payment_mp->external_reference = config('store.reference_prefix') . $requestmodel->id;
			$payment_mp->notification_url = route('site.notification.mercadopago');
			$payment_mp->statement_descriptor = config('app.name');

			// Cliente
			$name = explode(' ', $client->name);

			$payer = new \MercadoPago\Payer();
			$payer->first_name = $name[0] ?? null;
			$payer->last_name = $name[1] ?? null;
			$payer->email = $client->email;
			
			if(!empty($client->cpf)){
				$payer->identification = [
					'type' 		=> 'CPF',
					'number' 	=> $client->cpf
				];
			}else{
				$payer->identification = [
					'type' 		=> 'CNPJ',
					'number' 	=> $client->cnpj
				];
			}	
					
			$payer->address = array(
				'zip_code' 		=> $client->billing_address->postal_code,
				'street_name' 	=> $client->billing_address->street,
				'street_number' => $client->billing_address->number,
				'neighborhood' 	=> $client->billing_address->district,
				'city' 			=> $client->billing_address->city,
				'federal_unit' 	=> $client->billing_address->state
			);

			$payment_mp->payer = $payer;
			$payment_mp->save();

            update_payment_request_mercadopago($requestmodel);
			
			if($payment_mp->status && $payment_mp->status != 'rejected'){
				$payment->discount_installment = $discount_installment;
				$payment->save();

				return json_encode([
					'result'	=> true,
					'data' 		=> $payment_mp,
					'message' 	=> MercadoPago::message($payment_mp)
				]);
			}

			return json_encode([
                'result'	=> false,
                'data' 		=> $payment_mp,
				'message' 	=> MercadoPago::message($payment_mp)
            ]);
        }catch(Exception $e){
            return json_encode([
                'result'	=> false,
                'data' 		=> $e->getMessage(),
				'message' 	=> MercadoPago::message($payment_mp)
            ]);
        }
    }

	public function bolet($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		// Verifica se a transação para este pedido já foi feita
		if(update_payment_request_mercadopago($requestmodel)){
			redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
		}

		// Desconto pela parcela selecionada
        $discount_percent = 0;
        foreach($requestmodel->products as $product){
            $product = $product->product;
            $discount = $product->getDiscount(1);

            if($discount){
                $discount_percent += $discount / $requestmodel->products->count();
            }
        }
		
		return view('site.myaccount.requests.mercadopago.bolet.index', compact('requestmodel', 'discount_percent'));
	}

	public function boletStore($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            // Configurando checkout
			$payment_mp = new \MercadoPago\Payment();
			$payment_mp->setCustomHeader('X-Idempotency-Key', $requestmodel->id);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_mercadopago($requestmodel)){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
					'message' 	=> 'Já foi realizado o pagamento para este pedido!'
                ]);
            }

			// Desconto por pagamento à vista
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount(1);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

            $discount_installment = 0;
            if($discount_percent > 0){
                $discount_installment = ($payment->amountFormat * ($discount_percent / 100));
            }

            // Configurando checkout
            $payment_mp->transaction_amount = number_format($payment->amountFormat - $discount_installment, 2, '.', '');
			$payment_mp->payment_method_id = 'bolbradesco';
			$payment_mp->external_reference = config('store.reference_prefix') . $requestmodel->id;
			$payment_mp->notification_url = route('site.notification.mercadopago');
			$payment_mp->statement_descriptor = config('app.name');

			// Cliente
			$name = explode(' ', $client->name);

			$payer = new \MercadoPago\Payer();
			$payer->first_name = $name[0] ?? null;
			$payer->last_name = $name[1] ?? null;
			$payer->email = $client->email;
			
			if(!empty($client->cpf)){
				$payer->identification = [
					'type' 		=> 'CPF',
					'number' 	=> $client->cpf
				];
			}else{
				$payer->identification = [
					'type' 		=> 'CNPJ',
					'number' 	=> $client->cnpj
				];
			}	
					
			$payer->address = array(
				'zip_code' 		=> $client->billing_address->postal_code,
				'street_name' 	=> $client->billing_address->street,
				'street_number' => $client->billing_address->number,
				'neighborhood' 	=> $client->billing_address->district,
				'city' 			=> $client->billing_address->city,
				'federal_unit' 	=> $client->billing_address->state
			);

			$payment_mp->payer = $payer;
			$payment_mp->save();

            update_payment_request_mercadopago($requestmodel);
			
			if($payment_mp->status && $payment_mp->status != 'rejected'){
				$payment->discount_installment = $discount_installment;
				$payment->save();

				return json_encode([
					'result'		=> true,
					'data' 			=> $payment_mp,
					'paymentLink' 	=> $payment_mp->transaction_details->external_resource_url,
					'message' 		=> MercadoPago::message($payment_mp)
				]);
			}

			return json_encode([
                'result'	=> false,
                'data' 		=> $payment_mp,
				'message' 	=> MercadoPago::message($payment_mp)
            ]);
        }catch(Exception $e){
            return json_encode([
                'result'	=> false,
                'data' 		=> $e->getMessage(),
				'message' 	=> MercadoPago::message(null)
            ]);
        }
    }

	public function bankTransfer($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		// Verifica se a transação para este pedido já foi feita
		if(update_payment_request_mercadopago($requestmodel)){
			redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
		}

		// Desconto pela parcela selecionada
        $discount_percent = 0;
        foreach($requestmodel->products as $product){
            $product = $product->product;
            $discount = $product->getDiscount(1);

            if($discount){
                $discount_percent += $discount / $requestmodel->products->count();
            }
        }
		
		return view('site.myaccount.requests.mercadopago.bank_transfer.index', compact('requestmodel', 'discount_percent'));
	}

	public function bankTransferStore($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            // Configurando checkout
			$payment_mp = new \MercadoPago\Payment();
			$payment_mp->setCustomHeader('X-Idempotency-Key', $requestmodel->id);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_mercadopago($requestmodel)){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
					'message' 	=> 'Já foi realizado o pagamento para este pedido!'
                ]);
            }

			// Desconto por pagamento à vista
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount(1);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

            $discount_installment = 0;
            if($discount_percent > 0){
                $discount_installment = ($payment->amountFormat * ($discount_percent / 100));
            }

            // Configurando checkout
            $payment_mp->transaction_amount = number_format($payment->amountFormat - $discount_installment, 2, '.', '');
			$payment_mp->payment_method_id = 'pec';
			$payment_mp->external_reference = config('store.reference_prefix') . $requestmodel->id;
			$payment_mp->notification_url = route('site.notification.mercadopago');
			$payment_mp->statement_descriptor = config('app.name');

			// Cliente
			$name = explode(' ', $client->name);

			$payer = new \MercadoPago\Payer();
			$payer->first_name = $name[0] ?? null;
			$payer->last_name = $name[1] ?? null;
			$payer->email = $client->email;
			
			if(!empty($client->cpf)){
				$payer->identification = [
					'type' 		=> 'CPF',
					'number' 	=> $client->cpf
				];
			}else{
				$payer->identification = [
					'type' 		=> 'CNPJ',
					'number' 	=> $client->cnpj
				];
			}	
					
			$payer->address = array(
				'zip_code' 		=> $client->billing_address->postal_code,
				'street_name' 	=> $client->billing_address->street,
				'street_number' => $client->billing_address->number,
				'neighborhood' 	=> $client->billing_address->district,
				'city' 			=> $client->billing_address->city,
				'federal_unit' 	=> $client->billing_address->state
			);

			$payment_mp->payer = $payer;
			$payment_mp->save();

            update_payment_request_mercadopago($requestmodel);
			
			if($payment_mp->status && $payment_mp->status != 'rejected'){
				$payment->discount_installment = $discount_installment;
				$payment->save();

				return json_encode([
					'result'		=> true,
					'data' 			=> $payment_mp,
					'paymentLink' 	=> $payment_mp->transaction_details->external_resource_url,
					'message' 		=> MercadoPago::message($payment_mp)
				]);
			}

			return json_encode([
                'result'	=> false,
                'data' 		=> $payment_mp,
				'message' 	=> MercadoPago::message($payment_mp)
            ]);
        }catch(Exception $e){
            return json_encode([
                'result'	=> false,
                'data' 		=> $e->getMessage(),
				'message' 	=> MercadoPago::message(null)
            ]);
        }
    }

	public function pix($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		$qrcode_hash = null;
		$qrcode = null;
		$paymentLink = null;

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            // Configurando checkout
			$payment_mp = new \MercadoPago\Payment();
			$payment_mp->setCustomHeader('X-Idempotency-Key', $requestmodel->id);

            // Verifica se a transação para este pedido já foi feita
			if(update_payment_request_mercadopago($requestmodel)){
				redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
			}

			// Desconto por pagamento à vista
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount(1);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

            $discount_installment = 0;
            if($discount_percent > 0){
                $discount_installment = ($payment->amountFormat * ($discount_percent / 100));
            }

            // Configurando checkout
			$minutes = config('store.payment.credentials.picpay.expiration_minutes');

            $payment_mp->transaction_amount = number_format($payment->amountFormat - $discount_installment, 2, '.', '');
			$payment_mp->payment_method_id = 'pix';
			$payment_mp->external_reference = config('store.reference_prefix') . $requestmodel->id;
			$payment_mp->notification_url = route('site.notification.mercadopago');
			$payment_mp->statement_descriptor = config('app.name');
			$payment_mp->date_of_expiration = date('Y-m-d\TH:i:s', strtotime("+{$minutes} minutes", strtotime(date('Y-m-d H:i:s')))) . '.000-00:00';

			// Cliente
			$name = explode(' ', $client->name);

			$payer = new \MercadoPago\Payer();
			$payer->first_name = $name[0] ?? null;
			$payer->last_name = $name[1] ?? null;
			$payer->email = $client->email;
			
			if(!empty($client->cpf)){
				$payer->identification = [
					'type' 		=> 'CPF',
					'number' 	=> $client->cpf
				];
			}else{
				$payer->identification = [
					'type' 		=> 'CNPJ',
					'number' 	=> $client->cnpj
				];
			}	
					
			$payer->address = array(
				'zip_code' 		=> $client->billing_address->postal_code,
				'street_name' 	=> $client->billing_address->street,
				'street_number' => $client->billing_address->number,
				'neighborhood' 	=> $client->billing_address->district,
				'city' 			=> $client->billing_address->city,
				'federal_unit' 	=> $client->billing_address->state
			);

			$payment_mp->payer = $payer;
			$payment_mp->save();

            update_payment_request_mercadopago($requestmodel);
			
			if($payment_mp->status && $payment_mp->status != 'rejected'){
				$qrcode_hash = $payment_mp->point_of_interaction->transaction_data->qr_code;
				$qrcode = 'data:image/jpeg;base64,' . $payment_mp->point_of_interaction->transaction_data->qr_code_base64;
                $paymentLink = $payment_mp->transaction_details->external_resource_url;

                $payment->update([
                    'type'                      => 'PC',
                    'method'                    => 'PX',
                    'status_type'               => 'AP',
                    'discount_installment'      => $discount_installment,
                    'link'                      => $paymentLink,
                    'qrcode'                    => $qrcode,
					'qrcode_hash'				=> $qrcode_hash,
                    'details'                   => json_encode($payment_mp)
                ]);
			}
        }catch(Exception $e){
			$qrcode_hash = null;
			$qrcode = null;
            $paymentLink = null;
        }

		if(!$qrcode_hash || !$qrcode){
            redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
        }
		
		return view('site.myaccount.requests.mercadopago.pix.index', compact('requestmodel', 'qrcode_hash', 'qrcode', 'paymentLink'));
	}
}