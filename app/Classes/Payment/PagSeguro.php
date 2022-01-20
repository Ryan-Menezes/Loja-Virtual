<?php
namespace App\Classes\Payment;

class PagSeguro{
    public const SHIPPING_PAC = 1;
    public const SHIPPING_SEDEX = 2;
    public const SHIPPING_ALT = 3;

	private $url;
    private $email;
    private $token;

    private $receiverEmail      = null;
    private $currency           = 'BRL';
    private $extraAmount        = '0.00';
    private $itens              = [];
    private $notificationURL    = null;
    private $reference          = 'REF1234';
    private $sender             = [
        'name'      => null,
        'cpf'       => null,
        'telephone' => [
            'ddd'       => null,
            'number'    => null
        ],
        'email'     => null,
        'hash'      => null
    ];
    private $shippingAddress   = [
        'required'      => false,
        'type'          => null,
        'cost'          => '0.00',
        'postal_code'   => null,
        'street'        => null,
        'number'        => null,
        'district'      => null,
        'city'          => null,
        'state'         => null,
        'country'       => 'BRA'
    ];
    private $billingAddress   = [
        'postal_code'   => null,
        'street'        => null,
        'number'        => null,
        'district'      => null,
        'city'          => null,
        'state'         => null,
        'country'       => 'BRA'
    ];
    private $installment        = [
        'quantity'              => null,
        'value'                 => null,
        'no_interest_quantity'  => null
    ];
    private $creditCard        = [
        'token'     => null,
        'holder'    => [
            'name'          => null,
            'cpf'           => null,
            'birth_date'    => null,
            'telephone' => [
                'ddd'       => null,
                'number'    => null
            ]
        ]
    ];

    public function __construct(string $email, string $token, bool $sandbox = false){
        if($sandbox){
            $this->url = 'https://ws.sandbox.pagseguro.uol.com.br/';
        }else{
            $this->url = 'https://ws.pagseguro.uol.com.br/';
        }

        $this->email = $email;
        $this->token = $token;
    }

    private function curl(string $url, array $header = [], bool $return = true, bool $ssl_verifypeer = true, bool $post = false, array $postfields = null){
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
    }

    public function setReceiverEmail(string  $value){
        $this->receiverEmail = $value;
    }

    public function setCurrency(string $value){
        $this->currency = $value;
    }

    public function setExtraAmount(float $value){
        $this->extraAmount = number_format($value, 2, '.', '');
    }

    public function addItem(string $id, string $description, float $amount, int $quantity){
        $this->itens[] = [
            'id'            => $id,
            'description'   => $description,
            'amount'        => number_format($amount, 2, '.', ''),
            'quantity'      => $quantity
        ];
    }

    public function setNotificationURL(string $value){
        $this->notificationURL = $value;
    }

    public function setReference(string $value){
        $this->reference = $value;
    }

    public function setSender(string $name, string $cpf, string $telephone, string $email, string $hash = null){
        $this->sender['name']                   = $name;
        $this->sender['cpf']                    = $cpf;
        $this->sender['telephone']['ddd']       = mb_substr($telephone, 0, 2);
        $this->sender['telephone']['number']    = mb_substr($telephone, 2);
        $this->sender['email']                  = $email;
        $this->sender['hash']                   = $hash;
    }

    public function setShippingAddress(
        bool $required,
        int $type = self::SHIPPING_PAC,
        float $cost = 0,
        string $postal_code = null, 
        string $street = null, 
        string $number = null, 
        string $district = null, 
        string $city = null, 
        string $state = null, 
        string $complement = null,
        string $country = 'BRA'
    ){
        $this->shippingAddress['required']         = $required;
        $this->shippingAddress['type']             = $type;
        $this->shippingAddress['cost']             = number_format($cost, 2, '.', '');
        $this->shippingAddress['postal_code']      = $postal_code;
        $this->shippingAddress['street']           = $street;
        $this->shippingAddress['number']           = $number;
        $this->shippingAddress['district']         = $district;
        $this->shippingAddress['city']             = $city;
        $this->shippingAddress['state']            = $state;
        $this->shippingAddress['complement']       = $complement;
        $this->shippingAddress['country']          = $country;
    }

    public function setBillingAddress(
        string $postal_code = null, 
        string $street = null, 
        string $number = null, 
        string $district = null, 
        string $city = null, 
        string $state = null, 
        string $complement = null,
        string $country = 'BRA'
    ){
        $this->billingAddress['postal_code']      = $postal_code;
        $this->billingAddress['street']           = $street;
        $this->billingAddress['number']           = $number;
        $this->billingAddress['district']         = $district;
        $this->billingAddress['city']             = $city;
        $this->billingAddress['state']            = $state;
        $this->billingAddress['complement']       = $complement;
        $this->billingAddress['country']          = $country;
    }

    public function setInstallment(int $quantity, float $value, int $no_interest_quantity){
        $this->installment['quantity']              = $quantity;
        $this->installment['value']                 = number_format($value, 2, '.', '');
        $this->installment['no_interest_quantity']  = $no_interest_quantity;
    }

    public function setCreditCard($token, $cpf, $birth_date, $telephone){
        $this->creditCard['token']                              = $token;
        $this->creditCard['sender']['cpf']                      = $cpf;
        $this->creditCard['sender']['birth_date']               = $birth_date;
        $this->creditCard['sender']['telephone']['ddd']         = mb_substr($telephone, 0, 2);
        $this->creditCard['sender']['telephone']['number']      = mb_substr($telephone, 2);
    }

    public function notification(string $notificationCode){
        $url = $this->url . "v3/transactions/notifications/{$notificationCode}?";

        $data = [
            'email'     => $this->email,
            'token'     => $this->token
        ];
    
        $response = $this->curl($url . http_build_query($data), ['Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function transaction(string $reference){
        $url = $this->url . 'v2/transactions?';

        $data = [
            'email'      => $this->email,
            'token'      => $this->token,
            'reference'  => $reference
        ];

        $response = $this->curl($url . http_build_query($data), [], true, true);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function transactionDetails(string $transactionCode){
        $url = $this->url . "v3/transactions/{$transactionCode}?";

        $data = [
            'email' => $this->email,
            'token' => $this->token
        ];

        $response = $this->curl($url . http_build_query($data), [], true, true);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function getSession() : ?object{
        $url = $this->url . 'v2/sessions';

        $data = [
            'email' => $this->email,
            'token' => $this->token
        ];

        $response = $this->curl($url, ['Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function checkout(string $redirectURL, array $groups = [], array $excludes = []) : ?object{
        $url = $this->url . 'v2/checkout';

        $data = [
            'email'                     => $this->email,
            'token'                     => $this->token,
            'receiverEmail'             => $this->receiverEmail,
            'currency'                  => $this->currency,
            'extraAmount'               => $this->extraAmount,
            'notificationURL'           => $this->notificationURL,
            'redirectURL'               => $redirectURL,
            'reference'                 => $this->reference,
            'senderName'                => $this->sender['name'],
            'senderCPF'                 => $this->sender['cpf'],
            'senderAreaCode'            => $this->sender['telephone']['ddd'],
            'senderPhone'               => $this->sender['telephone']['number'],
            'senderEmail'               => $this->sender['email'],
            'shippingAddressRequired'   => $this->shippingAddress['required'] ? 'true' : 'false'
        ];

        // Itens
        for($i = 1; $i <= count($this->itens); $i++){
            $id             = $this->itens[$i - 1]['id'];
            $description    = $this->itens[$i - 1]['description'];
            $amount         = $this->itens[$i - 1]['amount'];
            $quantity       = $this->itens[$i - 1]['quantity'];

            $data["itemId{$i}"]             = $id;
            $data["itemDescription{$i}"]    = $description;
            $data["itemAmount{$i}"]         = $amount;
            $data["itemQuantity{$i}"]       = $quantity;
        }

        // Shipping Address
        if($this->shippingAddress['required']){
            $data['shippingAddressStreet']        = $this->shippingAddress['street'];
            $data['shippingAddressNumber']        = $this->shippingAddress['number'];
            $data['shippingAddressComplement']    = $this->shippingAddress['complement'];
            $data['shippingAddressDistrict']      = $this->shippingAddress['district'];
            $data['shippingAddressPostalCode']    = $this->shippingAddress['postal_code'];
            $data['shippingAddressCity']          = $this->shippingAddress['city'];
            $data['shippingAddressState']         = $this->shippingAddress['state'];
            $data['shippingAddressCountry']       = $this->shippingAddress['country'];
            $data['shippingType']                 = $this->shippingAddress['type'];
            $data['shippingCost']                 = $this->shippingAddress['cost'];
        }

        // Groups
        $i = 1;
        foreach($groups as $group => $params){
            $data["paymentMethodGroup{$i}"] = $group;

            $j = 1;
            foreach($params as $key => $value){
                $data["paymentMethodConfigKey{$i}_{$j}"] = $key;
                $data["paymentMethodConfigValue{$i}_{$j}"] = $value;
                $j++;
            }

            $i++;
        }

        // Excludes
        if(!empty($excludes)){
            if(array_key_exists('groups', $excludes) && !empty($excludes['groups'])){
                $data['excludePaymentMethodGroup'] = implode(',', $excludes['groups']);
            } 

            if(array_key_exists('methods', $excludes) && !empty($excludes['groups'])){
                $data['excludePaymentMethodName'] = implode(',', $excludes['methods']);
            }
        }

        $response = $this->curl($url, ['Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function creditCard(){
        $url = $this->url . 'v2/transactions/';

        $data = [
            'email'                     => $this->email,
            'token'                     => $this->token,
            'paymentMode'               => 'default',
            'paymentMethod'             => 'creditCard',
            'receiverEmail'             => $this->receiverEmail,
            'currency'                  => $this->currency,
            'extraAmount'               => $this->extraAmount,
            'notificationURL'           => $this->notificationURL,
            'reference'                 => $this->reference,
            'senderName'                => $this->sender['name'],
            'senderCPF'                 => $this->sender['cpf'],
            'senderAreaCode'            => $this->sender['telephone']['ddd'],
            'senderPhone'               => $this->sender['telephone']['number'],
            'senderEmail'               => $this->sender['email'],
            'shippingAddressRequired'   => $this->shippingAddress['required'] ? 'true' : 'false'
        ];

        // Itens
        for($i = 1; $i <= count($this->itens); $i++){
            $id             = $this->itens[$i - 1]['id'];
            $description    = $this->itens[$i - 1]['description'];
            $amount         = $this->itens[$i - 1]['amount'];
            $quantity       = $this->itens[$i - 1]['quantity'];

            $data["itemId{$i}"]             = $id;
            $data["itemDescription{$i}"]    = $description;
            $data["itemAmount{$i}"]         = $amount;
            $data["itemQuantity{$i}"]       = $quantity;
        }

        // Installment
        $data['installmentQuantity']                = $this->installment['quantity'];
        $data['installmentValue']                   = $this->installment['value'];
        $data['noInterestInstallmentQuantity']      = $this->installment['no_interest_quantity'];

        // CreditCard Credentials
        $data['creditCardToken']                = $this->creaditCard['token'];
        $data['creditCardHolderName']           = $this->creaditCard['holder']['name'];
        $data['creditCardHolderCPF']            = $this->creaditCard['holder']['cpf'];
        $data['creditCardHolderBirthDate']      = $this->creaditCard['holder']['birth'];
        $data['creditCardHolderAreaCode']       = $this->creaditCard['holder']['telephone']['ddd'];
        $data['creditCardHolderPhone']          = $this->creaditCard['holder']['telephone']['number'];

        // Shipping Address
        if($this->shippingAddress['required']){
            $data['shippingAddressStreet']        = $this->shippingAddress['street'];
            $data['shippingAddressNumber']        = $this->shippingAddress['number'];
            $data['shippingAddressComplement']    = $this->shippingAddress['complement'];
            $data['shippingAddressDistrict']      = $this->shippingAddress['district'];
            $data['shippingAddressPostalCode']    = $this->shippingAddress['postal_code'];
            $data['shippingAddressCity']          = $this->shippingAddress['city'];
            $data['shippingAddressState']         = $this->shippingAddress['state'];
            $data['shippingAddressCountry']       = $this->shippingAddress['country'];
            $data['shippingType']                 = $this->shippingAddress['type'];
            $data['shippingCost']                 = $this->shippingAddress['cost'];
        }

        // Billing Address
        $data['billingAddressStreet']        = $this->billingAddress['street'];
        $data['billingAddressNumber']        = $this->billingAddress['number'];
        $data['billingAddressComplement']    = $this->billingAddress['complement'];
        $data['billingAddressDistrict']      = $this->billingAddress['district'];
        $data['billingAddressPostalCode']    = $this->billingAddress['postal_code'];
        $data['billingAddressCity']          = $this->billingAddress['city'];
        $data['billingAddressState']         = $this->billingAddress['state'];
        $data['billingAddressCountry']       = $this->billingAddress['country'];

        $response = $this->curl($url, ['Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function bolet(){
        $url = $this->url . 'v2/transactions/';

        $data = [
            'email'                     => $this->email,
            'token'                     => $this->token,
            'paymentMode'               => 'default',
            'paymentMethod'             => 'boleto',
            'receiverEmail'             => $this->receiverEmail,
            'currency'                  => $this->currency,
            'extraAmount'               => $this->extraAmount,
            'notificationURL'           => $this->notificationURL,
            'reference'                 => $this->reference,
            'senderName'                => $this->sender['name'],
            'senderCPF'                 => $this->sender['cpf'],
            'senderAreaCode'            => $this->sender['telephone']['ddd'],
            'senderPhone'               => $this->sender['telephone']['number'],
            'senderEmail'               => $this->sender['email'],
            'shippingAddressRequired'   => $this->shippingAddress['required'] ? 'true' : 'false'
        ];

        // Itens
        for($i = 1; $i <= count($this->itens); $i++){
            $id             = $this->itens[$i - 1]['id'];
            $description    = $this->itens[$i - 1]['description'];
            $amount         = $this->itens[$i - 1]['amount'];
            $quantity       = $this->itens[$i - 1]['quantity'];

            $data["itemId{$i}"]             = $id;
            $data["itemDescription{$i}"]    = $description;
            $data["itemAmount{$i}"]         = $amount;
            $data["itemQuantity{$i}"]       = $quantity;
        }

        // Shipping Address
        if($this->shippingAddress['required']){
            $data['shippingAddressStreet']        = $this->shippingAddress['street'];
            $data['shippingAddressNumber']        = $this->shippingAddress['number'];
            $data['shippingAddressComplement']    = $this->shippingAddress['complement'];
            $data['shippingAddressDistrict']      = $this->shippingAddress['district'];
            $data['shippingAddressPostalCode']    = $this->shippingAddress['postal_code'];
            $data['shippingAddressCity']          = $this->shippingAddress['city'];
            $data['shippingAddressState']         = $this->shippingAddress['state'];
            $data['shippingAddressCountry']       = $this->shippingAddress['country'];
            $data['shippingType']                 = $this->shippingAddress['type'];
            $data['shippingCost']                 = $this->shippingAddress['cost'];
        }

        $response = $this->curl($url, ['Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }

    public function debitOnline(string $bankName){
        $url = $this->url . 'v2/transactions/';

        $data = [
            'email'                     => $this->email,
            'token'                     => $this->token,
            'paymentMode'               => 'default',
            'paymentMethod'             => 'eft',
            'bankName'                  => $bankName,
            'receiverEmail'             => $this->receiverEmail,
            'currency'                  => $this->currency,
            'extraAmount'               => $this->extraAmount,
            'notificationURL'           => $this->notificationURL,
            'reference'                 => $this->reference,
            'senderName'                => $this->sender['name'],
            'senderCPF'                 => $this->sender['cpf'],
            'senderAreaCode'            => $this->sender['telephone']['ddd'],
            'senderPhone'               => $this->sender['telephone']['number'],
            'senderEmail'               => $this->sender['email'],
            'shippingAddressRequired'   => $this->shippingAddress['required'] ? 'true' : 'false'
        ];

        // Itens
        for($i = 1; $i <= count($this->itens); $i++){
            $id             = $this->itens[$i - 1]['id'];
            $description    = $this->itens[$i - 1]['description'];
            $amount         = $this->itens[$i - 1]['amount'];
            $quantity       = $this->itens[$i - 1]['quantity'];

            $data["itemId{$i}"]             = $id;
            $data["itemDescription{$i}"]    = $description;
            $data["itemAmount{$i}"]         = $amount;
            $data["itemQuantity{$i}"]       = $quantity;
        }

        // Shipping Address
        if($this->shippingAddress['required']){
            $data['shippingAddressStreet']        = $this->shippingAddress['street'];
            $data['shippingAddressNumber']        = $this->shippingAddress['number'];
            $data['shippingAddressComplement']    = $this->shippingAddress['complement'];
            $data['shippingAddressDistrict']      = $this->shippingAddress['district'];
            $data['shippingAddressPostalCode']    = $this->shippingAddress['postal_code'];
            $data['shippingAddressCity']          = $this->shippingAddress['city'];
            $data['shippingAddressState']         = $this->shippingAddress['state'];
            $data['shippingAddressCountry']       = $this->shippingAddress['country'];
            $data['shippingType']                 = $this->shippingAddress['type'];
            $data['shippingCost']                 = $this->shippingAddress['cost'];
        }

        $response = $this->curl($url, ['Content-Type: application/x-www-form-urlencoded; charset=utf-8'], true, true, true, $data);

        if($response != 'Unauthorized'){
            $response = simplexml_load_string($response);
        }else{
            $response = null;
        }

        return $response;
    }
}