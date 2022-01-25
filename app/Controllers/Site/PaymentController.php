<?php
namespace App\Controllers\Site;

use Src\Classes\{
	Request,
	Controller,
    Mail
};
use App\Classes\Payment\{
    PagSeguro,
    PicPayPIX
};
use App\Models\{
	Request as RequestModel,
	RequestPayment,
	RequestAddress,
	RequestProduct
};

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
                $requestmodel = $this->requestmodel->find(parse_object($transaction->reference));

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

    public function notificationPicPay(){
        $content = trim(file_get_contents("php://input"));
	    $pay = json_decode($content);

        if(isset($pay->referenceId)){
            $requestmodel = $this->requestmodel->find(parse_object($pay->referenceId));

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