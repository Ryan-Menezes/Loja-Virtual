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

    public static function message($payment = null) :string{
        if($payment){
            $errors = [
                'approved.accredited'                               => 'Pronto, seu pagamento foi aprovado! No resumo, você verá a cobrança do valor como ' . $payment->statement_descriptor,
                'in_process.pending_contingency'                    => 'Estamos processando o pagamento. Não se preocupe, em menos de 2 dias úteis informaremos por e-mail se foi creditado.',
                'in_process.pending_review_manual'                  => 'Não se preocupe, em menos de 2 dias úteis informaremos por e-mail se foi creditado ou se necessitamos de mais informação.',
                'rejected.cc_rejected_bad_filled_card_number'       => 'Revise o número do cartão.',
                'rejected.cc_rejected_bad_filled_date'              => 'Revise a data de vencimento.',
                'rejected.cc_rejected_bad_filled_other'             => 'Revise os dados.',
                'rejected.cc_rejected_bad_filled_security_code'     => 'Revise o código de segurança do cartão.',
                'rejected.cc_rejected_blacklist'                    => 'Não pudemos processar seu pagamento.',
                'rejected.cc_rejected_call_for_authorize'           => 'Você deve autorizar ao ' . $payment->payment_method_id . ' o pagamento do valor ao Mercado Pago.',
                'rejected.cc_rejected_card_disabled'                => 'Ligue para o ' . $payment->payment_method_id . ' para ativar seu cartão. O telefone está no verso do seu cartão.',
                'rejected.cc_rejected_card_error'                   => 'Não conseguimos processar seu pagamento.',
                'rejected.cc_rejected_duplicated_payment'           => 'Você já efetuou um pagamento com esse valor. Caso precise pagar novamente, utilize outro cartão ou outra forma de pagamento.',
                'rejected.cc_rejected_high_risk'                    => 'Seu pagamento foi recusado. Escolha outra forma de pagamento. Recomendamos meios de pagamento em dinheiro.',
                'rejected.cc_rejected_insufficient_amount'          => 'O ' . $payment->payment_method_id . ' possui saldo insuficiente.',
                'rejected.cc_rejected_invalid_installments'         => 'O ' . $payment->payment_method_id . ' não processa pagamentos em ' . $payment->installments . ' parcelas.',
                'rejected.cc_rejected_max_attempts'                 => 'Você atingiu o limite de tentativas permitido.',
                'rejected.cc_rejected_other_reason'                 => 'Escolha outro cartão ou outra forma de pagamento.',
                'rejected.cc_rejected_card_type_not_allowed'        => $payment->payment_method_id . ' não processa o pagamento.',
                'rejected.cc_rejected_bad_filled_card_number'       => 'O pagamento foi rejeitado porque o usuário não tem a função crédito habilitada em seu cartão multiplo (débito e crédito).'
            ];

            $key = $payment->status . '.' . $payment->status_detail;

            if(array_key_exists($key, $errors)){
                return $errors[$key];
            }
        }

        return 'Não foi possível efetuar seu pagamento, Ocorreu um problema na validação do dados!';
    }
}