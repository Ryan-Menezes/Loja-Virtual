<?php
namespace App\Classes\Payment;

use Exception;

class PicPay{
    public const PURCHASE_MODE_ONLINE      = 'online';
    public const PURCHASE_MODE_IN_STORE    = 'in-store';

    private $url;
    private $picpay_token           = null;
    private $seller_token           = null;

    private $reference              = null;
    private $callbackUrl            = null;
    private $returnUrl              = null;
    private $value                  = 0;
    private $expiresAt              = null;
    private $channel                = null;
    private $purchaseMode           = null;
    private $buyer                  = [
        'firstName'     => null,
        'lastName'      => null,
        'document'      => null,
        'email'         => null,
        'phone'         => null,
        'description'   => null
    ];

    public function __construct(string $picpay_token, string $seller_token){
        $this->url = 'https://appws.picpay.com/ecommerce/public/';
        $this->picpay_token = $picpay_token;
        $this->seller_token = $seller_token;
        $this->purchaseMode = self::PURCHASE_MODE_ONLINE;
    }

    private function curl(string $url, array $header = [], bool $return = true, bool $ssl_verifypeer = true, bool $post = false, array $postfields = null){
        try{
            $curl = curl_init($url);

            if(!empty($header)){
                curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
            }
            
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, $return);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, $ssl_verifypeer);
            curl_setopt($curl, CURLOPT_POST, $post);

            if(!empty($postfields)){
                curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($postfields));
            }

            $response = curl_exec($curl);
            curl_close($curl);

            return $response;
        }catch(Exception $e){
            return null;
        }
    }

    public function setReference(string $reference){
        $this->reference = $reference;
    }

    public function setCallbackUrl(string $callbackUrl){
        $this->callbackUrl = $callbackUrl;
    }

    public function setReturnUrl(string $returnUrl){
        $this->returnUrl = $returnUrl;
    }

    public function setValue(string $value){
        $this->value = number_format($value, 2, '.', '');
    }

    public function setExpiresAt(int $minutes){
        $this->expiresAt = date('Y-m-d\TH:i:s', strtotime("+{$minutes} minutes", strtotime(date('Y-m-d H:i:s'))));
    }

    public function setChannel(string $channel){
        $this->channel = $channel;
    }

    public function setPurchaseMode(string $purchaseMode = self::PURCHASE_MODE_ONLINE){
        $this->purchaseMode = $purchaseMode;
    }

    public function setBuyer(string $firstName, string $lastName, string $document, string $email, string $phone, string $description = null){
        $this->buyer['firstName']       = $firstName;
        $this->buyer['lastName']        = $lastName;
        $this->buyer['document']        = $document;
        $this->buyer['email']           = $email;
        $this->buyer['phone']           = $phone;
        $this->buyer['description']     = $description;
    }

    public function pix(){
        try{
            $url = $this->url . 'payments';

            $data = [
                'referenceId'   => $this->reference,
                'callbackUrl'   => $this->callbackUrl,
                'returnUrl'     => $this->returnUrl,
                'value'         => $this->value,
                'expiresAt'     => $this->expiresAt,
                'purchaseMode'  => $this->purchaseMode,
                'buyer'         => [
                    'firstName' => $this->buyer['firstName'],
                    'lastName'  => $this->buyer['lastName'],
                    'email'     => $this->buyer['email'],
                    'phone'     => $this->buyer['phone']
                ]
            ];

            if(!empty($this->channel)){
                $data['channel'] = $this->channel;
            }

            if(!empty($this->buyer['document'])){
                $data['buyer']['document'] = $this->buyer['document'];
            }

            $response = $this->curl($url, ["x-picpay-token: {$this->picpay_token}", 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);
            
            if(!empty($response)){
                $response = json_decode($response);
            }else{
                $response = null;
            }

            return $response;
        }catch(Exception $e){
            return null;
        }
    }

    public function cancel(string $reference, string $authorizationId = null){
        try{
            $url = $this->url . "payments/{$reference}/cancellations";
            $data = [];

            if(!empty($authorizationId)){
                $data['authorizationId'] = $authorizationId;
            }

            $response = $this->curl($url, ["x-picpay-token: {$this->picpay_token}", 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);

            if(!empty($response)){
                $response = json_decode($response);
            }else{
                $response = null;
            }

            return $response;
        }catch(Exception $e){
            return null;
        }
    }

    public function status(string $reference){
        try{
            $url = $this->url . "payments/{$reference}/status";
            $response = $this->curl($url, ["x-picpay-token: {$this->picpay_token}", 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true);

            if(!empty($response)){
                $response = json_decode($response);
            }else{
                $response = null;
            }

            return $response;
        }catch(Exception $e){
            return null;
        }
    }
}