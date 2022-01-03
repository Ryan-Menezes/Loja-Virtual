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

		redirect(route('panel.system'), ['error' => 'dados NÃO editados, Ocorreu um erro no processo de edição!']);
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

		redirect(route('panel.system'), ['error' => 'Endereço NÃO editado, Ocorreu um erro no processo de edição!']);
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

		redirect(route('panel.system'), ['error' => 'Contato NÃO editado, Ocorreu um erro no processo de edição!']);
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

		redirect(route('panel.system'), ['error' => 'Redes Socias NÃO editadas, Ocorreu um erro no processo de edição!']);
	}

	public function updateFloater(){
		$this->system->verifyPermission('all.system.floater');

		$floater = $this->system->floater->firstOrFail();

		$request = new Request();
		$data = $request->all();
		$image = $request->file('image');
		$imagePrev = null;

		$this->validator($data, $floater->rolesUpdate, $floater->messages);

		if($image){
			if(!empty($floater->image)){
				$imagePrev = $floater->image;
			}

			$data['image'] = $image->store('floaters');
		}else{
			$data['image'] = null;
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
		
		redirect(route('panel.system'), ['error' => 'Floater NÃO editado, Ocorreu um erro no processo de edição!']);
	}
}