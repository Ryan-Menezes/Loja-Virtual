<?php
namespace App\Controllers\Site\MyAccount;

use Exception;
use Src\Classes\{
	Request,
	Controller,
    Validator
};
use App\Models\{
	Client,
    Request as RequestModel
};
use App\Classes\Payment\PagSeguro;

class PagSeguroController extends Controller{
	private $client;
	private $requestmodel;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
		
		$this->requestmodel = new RequestModel();
	}

	public function checkout($id){
        $requestmodel = $this->client->requests()->findOrFail($id);
        $code = null;

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;
            $shipping_types = [
                'PC' => PagSeguro::SHIPPING_PAC,
                'SX' => PagSeguro::SHIPPING_SEDEX,
                'PE' => PagSeguro::SHIPPING_ALT
            ];
            $groups = [];
            $excludes = [];

            // Objeto do pagseguro
            $email = config('store.payment.credentials.pagseguro.email');
            $token = config('store.payment.credentials.pagseguro.token');
            $production = config('store.payment.production');

            $pagseguro = new PagSeguro($email, $token, !$production);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
                redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
            }

            // Parcelas do cartão sem juros
            $installment_no_interest = 0;
            foreach($products as $product){
                $product = $product->product;

                if($product){
                    $installment_no_interest += $product->installment_no_interest;
                }
            }
            $installment_no_interest = floor($installment_no_interest / $products->count());

            if($installment_no_interest > 1){
                $groups['CREDIT_CARD'] = [
                    'MAX_INSTALLMENTS_NO_INTEREST' => $installment_no_interest
                ];
            }

            // Desconto pelo método de pagamento
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount(1);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

            if($discount_percent > 0){
                $discount_percent = number_format($discount_percent, 2, '.', '');

                $groups['BOLETO'] = [
                    'DISCOUNT_PERCENT' => $discount_percent
                ];

                $groups['DEPOSIT'] = [
                    'DISCOUNT_PERCENT' => $discount_percent
                ];

                $groups['EFT'] = [
                    'DISCOUNT_PERCENT' => $discount_percent
                ];
            }

            // Excluir meios de pagamento
            if(!config('store.payment.methods.credit_card')){
                $excludes['groups'][] = 'CREDIT_CARD';
            }

            if(!config('store.payment.methods.balance')){
                $excludes['groups'][] = 'BALANCE';
            }

            if(!config('store.payment.methods.bolet')){
                $excludes['groups'][] = 'BOLETO';
            }

            if(!config('store.payment.methods.deposit')){
                $excludes['groups'][] = 'DEPOSIT';
            }

            if(!config('store.payment.methods.debit_online')){
                $excludes['groups'][] = 'EFT';
            }

            // Outros descontos
            $discount = $payment->discount_cart + $payment->discount_coupon;
            
            if($discount > $payment->amount){
                $discount = $payment->amount - 1;

                if($payment->shipping_value > 0){
                    $payment->shipping_value--;
                    $payment->save();
                }
            }
            
            // Configurando checkout
            $sender_doc = !empty($client->cpf) ? $client->cpf : $client->cnpj;
            $sender_phone = !empty($client->telephone) ? $client->telephone : $client->cell;

            $pagseguro->setReceiverEmail($email);
            $pagseguro->setCurrency('BRL');
            $pagseguro->setExtraAmount(-$discount);
            $pagseguro->setNotificationURL(route('site.notification.pagseguro'));
            $pagseguro->setReference(config('store.reference_prefix') . $requestmodel->id);
            $pagseguro->setSender($client->name, $sender_doc, $sender_phone, $client->email);
            $pagseguro->setShippingAddress(true, $shipping_types[$payment->shipping_type], $payment->shipping_value, $address->postal_code, $address->street, $address->number, $address->district, $address->city, $address->state, $address->complement);

            // Produtos do pedido
            foreach($products as $product){
                $pagseguro->addItem(md5($product->id . $product->product->id), $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size, $product->price, $product->quantity);
            }
            
            $response = $pagseguro->checkout(route('site.myaccount.requests.show', ['id' => $requestmodel->id]), $groups, $excludes);
            $code = $response->code ?? null;
        }catch(Exception $e){
            $code = null;
        }
		
		return view('site.myaccount.requests.pagseguro.checkout.index', compact('requestmodel', 'code'));
	}

    public function creditCard($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		// Objeto do pagseguro
		$email = config('store.payment.credentials.pagseguro.email');
		$token = config('store.payment.credentials.pagseguro.token');
		$production = config('store.payment.production');

		$pagseguro = new PagSeguro($email, $token, !$production);

		// Verifica se a transação para este pedido já foi feita
		if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
			redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
		}

        // Parcelas do cartão sem juros
		$installment_no_interest = 0;
		foreach($requestmodel->products as $product){
			$product = $product->product;

			if($product){
				$installment_no_interest += $product->installment_no_interest;
			}
		}
        $installment_no_interest = floor($installment_no_interest / $requestmodel->products->count());

        // Descontos das parcelas
        $installments_discounts = [];
        foreach($requestmodel->products as $product){
            foreach($product->product->discounts as $discount){
                if($discount->percent){
                    if(!isset($installments_discounts[$discount->installment])){
                        $installments_discounts[$discount->installment] = $discount->percent / $requestmodel->products->count();
                    }else{
                        $installments_discounts[$discount->installment] += $discount->percent / $requestmodel->products->count();
                    }
                }
            }
        }

		$session = $pagseguro->getSession();
		$session_id = $session->id ?? null;
		
		return view('site.myaccount.requests.pagseguro.credit_card.index', compact('requestmodel', 'session_id', 'installment_no_interest', 'installments_discounts'));
	}

    public function creditCardStore($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;
            $shipping_types = [
                'PC' => PagSeguro::SHIPPING_PAC,
                'SX' => PagSeguro::SHIPPING_SEDEX,
                'PE' => PagSeguro::SHIPPING_ALT
            ];

            // Objeto do pagseguro
            $email = config('store.payment.credentials.pagseguro.email');
            $token = config('store.payment.credentials.pagseguro.token');
            $production = config('store.payment.production');

            $pagseguro = new PagSeguro($email, $token, !$production);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
                    'message' 	=> 'Já foi realizado o pagamento para este pedido!'
                ]);
            }

            $request = new Request();
            $data = $request->all();

            // Validando os dados
            $data['number'] = preg_replace('/\D/i', '', $data['number']);
            $data['document'] = preg_replace('/\D/i', '', $data['document']);
            $data['telephone'] = preg_replace('/\D/i', '', $data['telephone']);

            $validator = Validator::make($data, [
                'sender_hash'           => 'required|min:1',
                'brand'                 => 'required|min:1',
                'credit_card_token'     => 'required|min:1',
                'number'                => 'required|numeric|min:16|max:16',
                'cvv'                   => 'required|min:3|max:10',
                'month'                 => 'required|numeric|min:1|max:2',
                'year'                  => 'required|numeric|min:2|max:2',
                'name'                  => 'required|min:1',
                'document'              => 'required|numeric|min:11|max:11',
                'birth'                 => 'required|min:10|max:10',
                'telephone'             => 'required|numeric|min:10|max:11',
                'installments'          => 'required|min:1'
            ]);

            if(!$validator){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
                    'message'   => 'Preencha o formulário corretamente com os dados de seu cartão de crédito!'
                ]);
            }  

            $name = $data['name'];
            $document = preg_replace('/\D/i', '', $data['document']);
            $birth = date('d/m/Y', strtotime($data['birth']));
            $telephone = preg_replace('/\D/i', '', $data['telephone']);

            $installments = explode('x', $data['installments']);
            $installment_quantity = $installments[0] ?? 1;
            $installment_value = number_format((float)($installments[1] ?? 0.00), 2, '.', '');

            // Desconto pela parcela selecionada
            $discount_percent = 0;
            foreach($products as $product){
                $product = $product->product;
                $discount = $product->getDiscount($installment_quantity);

                if($discount){
                    $discount_percent += $discount / $products->count();
                }
            }

            $discount_installment = 0;
            if($discount_percent > 0){
                $discount_installment = ($payment->amountFormat * ($discount_percent / 100));
            }

            $discount = $payment->discount_cart + $discount_installment + $payment->discount_coupon;
            
            if($discount > $payment->amount){
                $discount = $payment->amount - 1;

                if($payment->shipping_value > 0){
                    $payment->shipping_value--;
                    $payment->save();
                }
            }

            // Parcelas do cartão sem juros
            $installment_no_interest = 0;
            foreach($products as $product){
                $product = $product->product;

                if($product){
                    $installment_no_interest += $product->installment_no_interest;
                }
            }
            $installment_no_interest = floor($installment_no_interest / $products->count());

            // Configurando checkout
            $sender_doc = !empty($client->cpf) ? $client->cpf : $client->cnpj;
            $sender_phone = !empty($client->telephone) ? $client->telephone : $client->cell;

            $pagseguro->setReceiverEmail($email);
            $pagseguro->setCurrency('BRL');
            $pagseguro->setExtraAmount(-$discount);
            $pagseguro->setNotificationURL(route('site.notification.pagseguro'));
            $pagseguro->setReference(config('store.reference_prefix') . $requestmodel->id);
            $pagseguro->setSender($client->name, $sender_doc, $sender_phone, $client->email, $data['sender_hash']);
            $pagseguro->setInstallment($installment_quantity, $installment_value, $installment_no_interest);
            $pagseguro->setCreditCard($data['credit_card_token'], $name, $document, $birth, $telephone);
            $pagseguro->setShippingAddress(true, $shipping_types[$payment->shipping_type], $payment->shipping_value, $address->postal_code, $address->street, $address->number, $address->district, $address->city, $address->state, $address->complement);
            $pagseguro->setBillingAddress($client->billing_address->postal_code, $client->billing_address->street, $client->billing_address->number, $client->billing_address->district, $client->billing_address->city, $client->billing_address->state, $client->billing_address->complement);

            // Produtos do pedido
            foreach($products as $product){
                $pagseguro->addItem(md5($product->id . $product->product->id), $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size, $product->price, $product->quantity);
            }
            
            $response = $pagseguro->creditCard();

            update_payment_request_pagseguro($pagseguro, $requestmodel);
            
            if(is_object($response) && $response->code){
                return json_encode([
                    'result'	=> true,
                    'data' 		=> $response,
                    'message' 	=> PagSeguro::message($response)
                ]);
            }
            
            return json_encode([
                'result'	=> false,
                'data' 		=> $response,
                'message' 	=> PagSeguro::message($response)
            ]);
        }catch(Exception $e){
            return json_encode([
                'result'	=> false,
                'data' 		=> $e->getMessage(),
                'message' 	=> PagSeguro::message(null)
            ]);
        }
    }

	public function bolet($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		// Objeto do pagseguro
		$email = config('store.payment.credentials.pagseguro.email');
		$token = config('store.payment.credentials.pagseguro.token');
		$production = config('store.payment.production');

		$pagseguro = new PagSeguro($email, $token, !$production);

		// Verifica se a transação para este pedido já foi feita
		if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
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

		$session = $pagseguro->getSession();
		$session_id = $session->id ?? null;
		
		return view('site.myaccount.requests.pagseguro.bolet.index', compact('requestmodel', 'discount_percent', 'session_id'));
	}

	public function boletStore($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;
            $shipping_types = [
                'PC' => PagSeguro::SHIPPING_PAC,
                'SX' => PagSeguro::SHIPPING_SEDEX,
                'PE' => PagSeguro::SHIPPING_ALT
            ];

            // Objeto do pagseguro
            $email = config('store.payment.credentials.pagseguro.email');
            $token = config('store.payment.credentials.pagseguro.token');
            $production = config('store.payment.production');

            $pagseguro = new PagSeguro($email, $token, !$production);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
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
                'sender_hash' => 'required|min:1'
            ]);

            if(!$validator){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
                    'message'   => 'Ocorreu um erro ao tentar gerar o seu boleto, por favor tente novamente!'
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

            // Desconto total
            $discount = $payment->discount_cart + $discount_installment + $payment->discount_coupon;
            
            if($discount > $payment->amount){
                $discount = $payment->amount - 1;

                if($payment->shipping_value > 0){
                    $payment->shipping_value--;
                    $payment->save();
                }
            }

            // Configurando checkout
            $sender_doc = !empty($client->cpf) ? $client->cpf : $client->cnpj;
            $sender_phone = !empty($client->telephone) ? $client->telephone : $client->cell;

            $pagseguro->setReceiverEmail($email);
            $pagseguro->setCurrency('BRL');
            $pagseguro->setExtraAmount(-$discount);
            $pagseguro->setNotificationURL(route('site.notification.pagseguro'));
            $pagseguro->setReference(config('store.reference_prefix') . $requestmodel->id);
            $pagseguro->setSender($client->name, $sender_doc, $sender_phone, $client->email, $data['sender_hash']);
            $pagseguro->setShippingAddress(true, $shipping_types[$payment->shipping_type], $payment->shipping_value, $address->postal_code, $address->street, $address->number, $address->district, $address->city, $address->state, $address->complement);

            // Produtos do pedido
            foreach($products as $product){
                $pagseguro->addItem(md5($product->id . $product->product->id), $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size, $product->price, $product->quantity);
            }
            
            $response = $pagseguro->bolet();

            update_payment_request_pagseguro($pagseguro, $requestmodel);
            
            if(is_object($response) && $response->code && $response->paymentLink){
                return json_encode([
                    'result'	=> true,
                    'data' 		=> $response,
                    'message' 	=> PagSeguro::message($response)
                ]);
            }
            
            return json_encode([
                'result'	=> false,
                'data' 		=> $response,
                'message' 	=> PagSeguro::message($response)
            ]);
        }catch(Exception $e){
            return json_encode([
                'result'	=> false,
                'data' 		=> $e->getMessage(),
                'message' 	=> PagSeguro::message(null)
            ]);
        }
	}

	public function debitOnline($id){
		$requestmodel = $this->client->requests()->findOrFail($id);

		// Objeto do pagseguro
		$email = config('store.payment.credentials.pagseguro.email');
		$token = config('store.payment.credentials.pagseguro.token');
		$production = config('store.payment.production');

		$pagseguro = new PagSeguro($email, $token, !$production);

		// Verifica se a transação para este pedido já foi feita
		if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
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

		$session = $pagseguro->getSession();
		$session_id = $session->id ?? null;
		
		return view('site.myaccount.requests.pagseguro.debit_online.index', compact('requestmodel', 'session_id', 'discount_percent'));
	}

    public function debitOnlineStore($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;
            $shipping_types = [
                'PC' => PagSeguro::SHIPPING_PAC,
                'SX' => PagSeguro::SHIPPING_SEDEX,
                'PE' => PagSeguro::SHIPPING_ALT
            ];

            // Objeto do pagseguro
            $email = config('store.payment.credentials.pagseguro.email');
            $token = config('store.payment.credentials.pagseguro.token');
            $production = config('store.payment.production');

            $pagseguro = new PagSeguro($email, $token, !$production);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
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
                'sender_hash'  => 'required|min:1',
                'bank'         => 'required|min:1'
            ]);

            if(!$validator){
                return json_encode([
                    'result'	=> false,
                    'data' 		=> null,
                    'message' 	=> 'Ocorreu um erro ao tentar processar o seu pagamento, por favor tente novamente!'
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

            // Desconto total
            $discount = $payment->discount_cart + $discount_installment + $payment->discount_coupon;
            
            if($discount > $payment->amount){
                $discount = $payment->amount - 1;

                if($payment->shipping_value > 0){
                    $payment->shipping_value--;
                    $payment->save();
                }
            }
            
            // Configurando checkout
            $sender_doc = !empty($client->cpf) ? $client->cpf : $client->cnpj;
            $sender_phone = !empty($client->telephone) ? $client->telephone : $client->cell;

            $pagseguro->setReceiverEmail($email);
            $pagseguro->setCurrency('BRL');
            $pagseguro->setExtraAmount(-$discount);
            $pagseguro->setNotificationURL(route('site.notification.pagseguro'));
            $pagseguro->setReference(config('store.reference_prefix') . $requestmodel->id);
            $pagseguro->setSender($client->name, $sender_doc, $sender_phone, $client->email, $data['sender_hash']);
            $pagseguro->setShippingAddress(true, $shipping_types[$payment->shipping_type], $payment->shipping_value, $address->postal_code, $address->street, $address->number, $address->district, $address->city, $address->state, $address->complement);

            // Produtos do pedido
            foreach($products as $product){
                $pagseguro->addItem(md5($product->id . $product->product->id), $product->product->name . ' | COR: ' . $product->color . ' | TAMANHO: ' . $product->size, $product->price, $product->quantity);
            }
            
            $response = $pagseguro->debitOnline($data['bank']);

            update_payment_request_pagseguro($pagseguro, $requestmodel);
            
            if(is_object($response) && $response->code && $response->paymentLink){
                return json_encode([
                    'result'	=> true,
                    'data' 		=> $response,
                    'message' 	=> PagSeguro::message($response)
                ]);
            }
            
            return json_encode([
                'result'	=> false,
                'data' 		=> $response,
                'message' 	=> PagSeguro::message($response)
            ]);
        }catch(Exception $e){
            return json_encode([
                'result'	=> false,
                'data' 		=> $e->getMessage(),
                'message' 	=> PagSeguro::message(null)
            ]);
        }
	}
}