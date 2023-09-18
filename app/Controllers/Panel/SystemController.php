<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\System;

class SystemController extends Controller{
	private $system;

	public function __construct(){
		$this->system = (new System())->firstOrFail();

		$this->system->verifyPermission('all.system');
	}

	public function index(){
		$system = $this->system;

		return view('panel.system.index', compact('system'));
	}

	public function update(){
		$system = $this->system;

		$request = new Request();
		$data = $request->all();
		$data['cnpj'] = preg_replace('/[^\d]/i', '', $data['cnpj']);

		$this->validator($data, $system->rolesUpdate, $system->messages);

		if($system->update($data)){
			redirect(route('panel.system'), ['success' => 'Dados editados com sucesso']);
		}

		redirect(route('panel.system'), ['error' => 'dados NÃO editados, Ocorreu um erro no processo de edição!'], true);
	}

	public function address(){
		$this->system->verifyPermission('all.system.address');
		$system = $this->system;

		return view('panel.system.address.index', compact('system'));
	}

	public function updateAddress(){
		$this->system->verifyPermission('all.system.address');

		$address = $this->system->address->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$data['postal_code'] = preg_replace('/[^\d]/i', '', $data['postal_code']);

		$this->validator($data, $address->rolesUpdate, $address->messages);

		if($address->update($data)){
			redirect(route('panel.system.address'), ['success' => 'Endereço editado com sucesso']);
		}

		redirect(route('panel.system.address'), ['error' => 'Endereço NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function contact(){
		$this->system->verifyPermission('all.system.contact');
		$system = $this->system;

		return view('panel.system.contact.index', compact('system'));
	}

	public function updateContact(){
		$this->system->verifyPermission('all.system.contact');

		$contact = $this->system->contact->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$data['telephone'] = preg_replace('/[^\d]/i', '', $data['telephone']);
		$data['cell'] = preg_replace('/[^\d]/i', '', $data['cell']);

		$this->validator($data, $contact->rolesUpdate, $contact->messages);

		if($contact->update($data)){
			redirect(route('panel.system.contact'), ['success' => 'Contato editado com sucesso']);
		}

		redirect(route('panel.system.contact'), ['error' => 'Contato NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function social(){
		$this->system->verifyPermission('all.system.social');
		$system = $this->system;

		return view('panel.system.social.index', compact('system'));
	}

	public function updateSocial(){
		$this->system->verifyPermission('all.system.social');

		$social = $this->system->social->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$data['whatsapp'] = preg_replace('/[^\d]/i', '', $data['whatsapp']);

		$this->validator($data, $social->rolesUpdate, $social->messages);

		if($social->update($data)){
			redirect(route('panel.system.social'), ['success' => 'Redes Socias editadas com sucesso']);
		}

		redirect(route('panel.system.social'), ['error' => 'Redes Socias NÃO editadas, Ocorreu um erro no processo de edição!'], true);
	}

	public function store(){
		$this->system->verifyPermission('all.system.store');
		$system = $this->system;

		return view('panel.system.store.index', compact('system'));
	}

	public function updateStore(){
		$this->system->verifyPermission('all.system.store');

		$store = $this->system->store->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$data['cart_amount_promotion'] = number($data['cart_amount_promotion']);
		$data['postal_code_origin'] = preg_replace('/[^\d]/i', '', $data['postal_code_origin']);

		$pagseguro_data = [
			'active' => $data['active_pagseguro'] ?? 1,
			'email' => $data['email_pagseguro'] ?? null,
			'token' => $data['token_pagseguro'] ?? null,
			'app_id' => $data['app_id_pagseguro'] ?? null,
			'app_key' => $data['app_key_pagseguro'] ?? null,
			'type_checkout' => $data['type_checkout_pagseguro'] ?? 'LR'
		];

		$mercadopago_data = [
			'active' => $data['active_mercadopago'] ?? 1,
			'access_token' => $data['access_token_mercadopago'] ?? null,
			'public_key' => $data['public_key_mercadopago'] ?? null,
			'type_checkout' => $data['type_checkout_mercadopago'] ?? 'LR',
			'header_color' => $data['header_color_mercadopago'] ?? '#ffffff',
			'elements_color' => $data['elements_color_mercadopago'] ?? '#ffffff'
		];

		$paypal_data = [
			'active' => $data['active_paypal'] ?? 1,
			'secret_key' => $data['secret_key_paypal'] ?? null,
			'email' => $data['email_paypal'] ?? null,
			'client_id' => $data['client_id_paypal'] ?? null
		];

		$picpay_data = [
			'active' => $data['active_picpay'] ?? 1,
			'token' => $data['token_picpay'] ?? null,
			'seller_token' => $data['seller_token_picpay'] ?? null,
			'expiration_minutes' => $data['expiration_minutes_picpay'] ?? null
		];

		$this->validator($data, $store->rolesUpdate, $store->messages);
		$this->validator($data, $store->freight->rolesUpdate, $store->freight->messages);
		$this->validator($pagseguro_data, $store->pagseguro->rolesUpdate, $store->pagseguro->messages);
		$this->validator($mercadopago_data, $store->mercadopago->rolesUpdate, $store->mercadopago->messages);
		$this->validator($paypal_data, $store->paypal->rolesUpdate, $store->paypal->messages);
		$this->validator($picpay_data, $store->picpay->rolesUpdate, $store->picpay->messages);

		$store->freight->update($data);
		$store->pagseguro->update($pagseguro_data);
		$store->mercadopago->update($mercadopago_data);
		$store->paypal->update($paypal_data);
		$store->picpay->update($picpay_data);

		// Atualizando as faixas de cep
		$store->freight->freight_customized()->delete();
		foreach(explode("\n", $data['freight_range']) as $freight_range){
			$freight_range = explode(';', $freight_range);

			if(count($freight_range) > 3){
				$postal_code_min 	= preg_replace('/[^\d]/i', '', $freight_range[0]);
				$postal_code_max 	= preg_replace('/[^\d]/i', '', $freight_range[1]);
				$value 				= number(trim($freight_range[2]));
				$days 				= number(trim($freight_range[3]));

				if(mb_strlen($postal_code_min) == 8 && mb_strlen($postal_code_max) == 8 && is_numeric($value) && is_numeric($days)){
					$dt = compact('postal_code_min', 'postal_code_max', 'value', 'days');

					$store->freight->freight_customized()->create($dt);
				}
			}		
		}

		if($store->update($data)){
			redirect(route('panel.system.store'), ['success' => 'Loja virtual editada com sucesso']);
		}

		redirect(route('panel.system.store'), ['error' => 'Loja virtual NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function lgpd(){
		$this->system->verifyPermission('all.system.lgpd');
		$system = $this->system;

		return view('panel.system.lgpd.index', compact('system'));
	}

	public function updateLgpd(){
		$this->system->verifyPermission('all.system.lgpd');

		$lgpd = $this->system->lgpd->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$privacy = $request->file('privacy_policy');
		$terms = $request->file('terms_conditions');
		$return = $request->file('return_policy');
		$removes = [];

		// Privacy File
		if($privacy && $privacy->error == 0){
			if(!empty($lgpd->privacy_policy)){
				$removes[] = $lgpd->privacy_policy;
			}

			$data['privacy_policy'] = $privacy->store('privacy_policy');
		}else{
			unset($data['privacy_policy']);
		}

		// Terms File
		if($terms && $terms->error == 0){
			if(!empty($lgpd->terms_conditions)){
				$removes[] = $lgpd->terms_conditions;
			}

			$data['terms_conditions'] = $terms->store('terms_conditions');
		}else{
			unset($data['terms_conditions']);
		}

		// Return File
		if($return && $return->error == 0){
			if(!empty($lgpd->return_policy)){
				$removes[] = $lgpd->return_policy;
			}

			$data['return_policy'] = $return->store('return_policy');
		}else{
			unset($data['return_policy']);
		}
		
		if($lgpd->update($data)){
			foreach($removes as $remove){
				Storage::delete($remove);
			}

			redirect(route('panel.system.lgpd'), ['success' => 'LGPD editado com sucesso']);
		}

		// Detando arquivos no caso de erro
		if($privacy && isset($data['privacy_policy'])){
			Storage::delete($data['privacy_policy']);
		}

		if($terms && isset($data['terms_conditions'])){
			Storage::delete($data['terms_conditions']);
		}

		if($return && isset($data['return_policy'])){
			Storage::delete($data['return_policy']);
		}
		
		redirect(route('panel.system.lgpd'), ['error' => 'LGPD NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function floater(){
		$this->system->verifyPermission('all.system.floater');
		$system = $this->system;

		return view('panel.system.floater.index', compact('system'));
	}

	public function updateFloater(){
		$this->system->verifyPermission('all.system.floater');

		$floater = $this->system->floater->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$image = $request->file('image');
		$imagePrev = null;

		$this->validator($data, $floater->rolesUpdate, $floater->messages);

		if($image && $image->error == 0){
			$data['image'] = $image->store('floater');
			$imagePrev = $floater->image;
		}else{
			unset($data['image']);
		}

		if($floater->update($data)){
			if($imagePrev){
				Storage::delete($imagePrev);
			}

			redirect(route('panel.system.floater'), ['success' => 'Floater editado com sucesso']);
		}

		if($image && isset($data['image'])){
			Storage::delete($data['image']);
		}
		
		redirect(route('panel.system.floater'), ['error' => 'Floater NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function ftp(){
		$this->system->verifyPermission('all.system.ftp');
		$system = $this->system;

		return view('panel.system.ftp.index', compact('system'));
	}

	public function updateFtp(){
		$this->system->verifyPermission('all.system.ftp');

		$ftp = $this->system->ftp->firstOrFail();

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $ftp->rolesUpdate, $ftp->messages);

		if($ftp->update($data)){
			redirect(route('panel.system.ftp'), ['success' => 'FTP editado com sucesso']);
		}

		redirect(route('panel.system.ftp'), ['error' => 'FTP NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}
}