<?php
namespace App\Controllers\Panel;

use Src\Classes\{
	Request,
	Controller
};
use Src\Classes\Storage\Storage;
use App\Models\{
	System,
	SystemAddress,
	SystemContact,
	SystemFloater
};

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

		$this->validator($data, $system->rolesUpdate, $system->messages);

		if($system->update($data)){
			redirect(route('panel.system'), ['success' => 'Dados editados com sucesso']);
		}

		redirect(route('panel.system'), ['error' => 'dados NÃO editados, Ocorreu um erro no processo de edição!'], true);
	}

	public function updateAddress(){
		$this->system->verifyPermission('all.system.address');

		$address = $this->system->address->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$data['postal_code'] = preg_replace('/[^\d]/i', '', $data['postal_code']);

		$this->validator($data, $address->rolesUpdate, $address->messages);

		if($address->update($data)){
			redirect(route('panel.system'), ['success' => 'Endereço editado com sucesso']);
		}

		redirect(route('panel.system'), ['error' => 'Endereço NÃO editado, Ocorreu um erro no processo de edição!'], true);
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
			redirect(route('panel.system'), ['success' => 'Contato editado com sucesso']);
		}

		redirect(route('panel.system'), ['error' => 'Contato NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}

	public function updateSocial(){
		$this->system->verifyPermission('all.system.social');

		$social = $this->system->social->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$data['whatsapp'] = preg_replace('/[^\d]/i', '', $data['whatsapp']);

		$this->validator($data, $social->rolesUpdate, $social->messages);

		if($social->update($data)){
			redirect(route('panel.system'), ['success' => 'Redes Socias editadas com sucesso']);
		}

		redirect(route('panel.system'), ['error' => 'Redes Socias NÃO editadas, Ocorreu um erro no processo de edição!'], true);
	}

	public function updateStore(){
		$this->system->verifyPermission('all.system.store');

		$store = $this->system->store->firstOrFail();

		$request = new Request();
		$data = $request->all();

		$this->validator($data, $store->rolesUpdate, $store->messages);

		if($store->update($data)){
			redirect(route('panel.system'), ['success' => 'Loja virtual editada com sucesso']);
		}

		redirect(route('panel.system'), ['error' => 'Loja virtual NÃO editada, Ocorreu um erro no processo de edição!'], true);
	}

	public function updateLgpd(){
		$this->system->verifyPermission('all.system.lgpd');

		$lgpd = $this->system->lgpd->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$privacy = $request->file('privacy_policy');
		$terms = $request->file('terms_conditions');
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
		
		if($lgpd->update($data)){
			foreach($removes as $remove){
				Storage::delete($remove);
			}

			redirect(route('panel.system'), ['success' => 'LGPD editado com sucesso']);
		}

		// Detando arquivos no caso de erro
		if($privacy && isset($data['privacy_policy'])){
			Storage::delete($data['privacy_policy']);
		}

		if($terms && isset($data['terms_conditions'])){
			Storage::delete($data['terms_conditions']);
		}
		
		redirect(route('panel.system'), ['error' => 'LGPD NÃO editado, Ocorreu um erro no processo de edição!'], true);
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

			redirect(route('panel.system'), ['success' => 'Floater editado com sucesso']);
		}

		if($image && isset($data['image'])){
			Storage::delete($data['image']);
		}
		
		redirect(route('panel.system'), ['error' => 'Floater NÃO editado, Ocorreu um erro no processo de edição!'], true);
	}
}