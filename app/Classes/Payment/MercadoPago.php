<?php
namespace App\Classes\Payment;

use Exception;

class MercadoPago{
	private $url;
    private $access_token;

    public function __construct(string $access_token){
        $this->access_token = $access_token;
        $this->url = 'https://api.mercadopago.com/';

        \MercadoPago\SDK::setAccessToken($access_token);
    }

    private function curl(string $url, array $header = [], bool $return = true, bool $ssl_verifypeer = true, bool $post = false, array $postfields = null, string $method = null){
        try{
            $curl = curl_init($url);

            if(!empty($header)){
                curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
            }
            
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, $return);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, $ssl_verifypeer);
            curl_setopt($curl, CURLOPT_POST, $post);

            if(!empty($method)){
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
            }
            
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

    public function transaction(string $reference){
        try{
           $url = $this->url . 'v1/payments/search?';

            $data = [
                'sort'                  => 'date_created',
                'criteria'              => null,
                'external_reference'    => $reference
            ];

            $response = $this->curl($url . http_build_query($data), ["Authorization: Bearer {$this->access_token}"], true, true);

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

    public function transactionDetails(string $id){
        try{
            $url = $this->url . 'v1/payments/' . $id;

            $response = $this->curl($url, ["Authorization: Bearer {$this->access_token}"], true, true);

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

    public function cancel(string $id) : bool{
        try{
            $payment = \MercadoPago\Payment::find_by_id($id);
            $payment->status = 'cancelled';
            return (bool)$payment->update(); 
        }catch(Exception $e){
            return false;
        }
    }

    public function refund(string $id){
        try{
            $url = $this->url . "v1/payments/{$id}/refunds";

            $response = $this->curl($url, ["Authorization: Bearer {$this->access_token}"], true, true, true);

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