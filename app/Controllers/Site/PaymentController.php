<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller,
    Mail
};
use App\Classes\Payment\{
    PagSeguro,
    PicPay
};
use App\Models\Request as RequestModel;

class PaymentController extends Controller{
	private $requestmodel;

	public function __construct(){
		$this->requestmodel = new RequestModel();
	}

	public function notificationPagseguro(){
        $request = new Request();

        if($request->has('notificationCode')){
            $notificationCode = $request->input('notificationCode');
            $email = config('store.payment.credentials.pagseguro.email');
            $token = config('store.payment.credentials.pagseguro.token');
            $production = config('store.payment.production');

            $pagseguro = new PagSeguro($email, $token, !$production);

            $transaction = $pagseguro->notification($notificationCode);

            if($transaction && is_object($transaction) && $transaction->code){
                $reference = str_ireplace(config('store.reference_prefix'), '', parse_object($transaction->reference));
                $requestmodel = $this->requestmodel->find($reference);

                if($requestmodel){
                    $status = $requestmodel->status;

                    // Atualiza status da transação
                    if(update_payment_request_pagseguro($pagseguro, $requestmodel)){
                        $requestmodel = $this->requestmodel->find(parse_object($requestmodel->id));

                        if($status != $requestmodel->status){
                            Mail::isHtml(true)
                                ->charset(config('mail.charset'))
                                ->addFrom(config('mail.to'), config('app.name'))
                                ->subject('Seu pedido teve seu status atualizado: ' . $requestmodel->statusFormat)
                                ->message(view('mail.request.update_status', compact('requestmodel')))
                                ->send($requestmodel->client->email, $requestmodel->client->name);
                        }
                    }
                }
            }
        }
    }

    public function notificationMercadopago(){
        $request = new Request();
        $response = json_decode(trim(file_get_contents('php://input')));

        if($request->has('data_id') || isset($response->data)){
            $id = ($request->has('data_id') ? $request->input('data_id') : $response->data->id);

            \MercadoPago\SDK::setAccessToken(config('store.payment.credentials.mercadopago.access_token'));

            $transaction = \MercadoPago\Payment::find_by_id($id);

            if($transaction && is_object($transaction) && $transaction->id){
                $reference = str_ireplace(config('store.reference_prefix'), '', parse_object($transaction->external_reference));
                $requestmodel = $this->requestmodel->find($reference);

                if($requestmodel){
                    $status = $requestmodel->status;

                    // Atualiza status da transação
                    if(update_payment_request_mercadopago($requestmodel)){
                        $requestmodel = $this->requestmodel->find(parse_object($requestmodel->id));

                        if($status != $requestmodel->status){
                            Mail::isHtml(true)
                                ->charset(config('mail.charset'))
                                ->addFrom(config('mail.to'), config('app.name'))
                                ->subject('Seu pedido teve seu status atualizado: ' . $requestmodel->statusFormat)
                                ->message(view('mail.request.update_status', compact('requestmodel')))
                                ->send($requestmodel->client->email, $requestmodel->client->name);
                        }
                    }
                }
            }
        }
    }

    public function notificationPicPay(){
        $content = trim(file_get_contents('php://input'));
	    $pay = json_decode($content);

        if(isset($pay->referenceId)){
            $reference = str_ireplace(config('store.reference_prefix'), '', parse_object($pay->referenceId));
            $requestmodel = $this->requestmodel->find($reference);
            $status = $requestmodel->status;

            if($requestmodel){
                // Objeto do picpay
                $token = config('store.payment.credentials.picpay.token');
                $seller_token = config('store.payment.credentials.picpay.seller_token');
                $production = config('store.payment.production');

                $picpay = new PicPay($token, $seller_token);

                // Atualiza status da transação
                if(update_payment_request_picpay($picpay, $requestmodel)){
                    $requestmodel = $this->requestmodel->find(parse_object($requestmodel->id));

                    if($status != $requestmodel->status){
                        Mail::isHtml(true)
                            ->charset(config('mail.charset'))
                            ->addFrom(config('mail.to'), config('app.name'))
                            ->subject('Seu pedido teve seu status atualizado: ' . $requestmodel->statusFormat)
                            ->message(view('mail.request.update_status', compact('requestmodel')))
                            ->send($requestmodel->client->email, $requestmodel->client->name);
                    }
                }
            }
        }
    }
}