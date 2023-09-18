<?php
namespace App\Controllers\Site\MyAccount;

use Exception;
use Src\Classes\Controller;
use App\Models\Client;
use App\Classes\Payment\PicPay;

class PicPayController extends Controller{
	private $client;

	public function __construct(){
		$this->client = auth('site');

		if($this->client)
			$this->client = Client::find($this->client->id);

		if(!$this->client)
			abort(404);
	}

	public function pix($id){
        $requestmodel = $this->client->requests()->findOrFail($id);

        $qrcode = null;
        $paymentLink = null;

        try{
            $client = $requestmodel->client;
            $address = $requestmodel->address;
            $payment = $requestmodel->payment;
            $products = $requestmodel->products;

            // Objeto do picpay
            $token = config('store.payment.credentials.picpay.token');
            $seller_token = config('store.payment.credentials.picpay.seller_token');
            $production = config('store.payment.production');

            $picpay = new PicPay($token, $seller_token);

            // Verifica se a transação para este pedido já foi feita
            if(update_payment_request_picpay($picpay, $requestmodel)){
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
            $sender_doc = !empty($client->cpf) ? mask($client->cpf, '###.###.###-##') : mask($client->cnpj, '##.###.###/####-##');
            $sender_phone = !empty($client->telephone) ? mask($client->telephone, '+55 ## ####-####') : mask($client->cell, '+55 ## #####-####');
            $firstName = explode(' ', $client->name)[0];
            $lastName = substr($client->name, strpos($client->name, ' '));

            $picpay->setValue($payment->amount + $payment->shipping_value - $discount);
            $picpay->setCallbackUrl(route('site.notification.picpay'));
            $picpay->setReturnUrl(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
            $picpay->setReference(config('store.reference_prefix') . $requestmodel->id);
            $picpay->setExpiresAt(config('store.payment.credentials.picpay.expiration_minutes'));
            $picpay->setBuyer($firstName, $lastName, $sender_doc, $client->email, $sender_phone);
            
            $response = $picpay->pix();

            if(isset($response->paymentUrl) && isset($response->qrcode) && isset($response->qrcode->base64)){
                $qrcode = $response->qrcode->base64;
                $paymentLink = $response->paymentUrl;

                $payment->update([
                    'type'                      => 'PC',
                    'method'                    => 'PX',
                    'status_type'               => 'AP',
                    'discount_installment'      => $discount_installment,
                    'link'                      => $paymentLink,
                    'qrcode'                    => $qrcode,
                    'details'                   => json_encode($response)
                ]);
            }
        }catch(Exception $e){
            $qrcode = null;
            $paymentLink = null;
        }

        if(!$qrcode || !$paymentLink){
            redirect(route('site.myaccount.requests.show', ['id' => $requestmodel->id]));
        }
		
		return view('site.myaccount.requests.picpay.pix.index', compact('requestmodel', 'qrcode', 'paymentLink'));
	}
}