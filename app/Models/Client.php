<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Src\Classes\Mail;

class Client extends Model{
	public $table = 'clients';
	protected $fillable = ['name', 'email', 'password', 'telephone', 'cell', 'cpf', 'cnpj', 'token', 'google_id', 'facebook_id', 'validated', 'shipping_address_id', 'billing_address_id'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'name' 		=> 'required|min:1|max:100',
			'email' 	=> "required|email|min:1|max:100|unique:{$this->table},email",
			'password' 	=> 'required|min:8|max:100',
			'telephone' => 'numeric|min:10|max:10',
			'cell' 		=> 'required|numeric|min:11|max:11',
			'cpf' 		=> 'numeric|min:11|max:11',
			'cnpj' 		=> 'numeric|min:14|max:14'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 		=> 'required|min:1|max:100',
			'email' 	=> "required|email|min:1|max:100|unique:{$this->table},email,{$this->id},id",
			'password' 	=> 'min:8|max:100',
			'telephone' => 'numeric|min:10|max:10',
			'cell' 		=> 'required|numeric|min:11|max:11',
			'cpf' 		=> 'numeric|min:11|max:11',
			'cnpj' 		=> 'numeric|min:14|max:14'
		];
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 		=> 'O preenchimento do campo nome é obrigatório!',
			'name.min' 				=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 				=> 'O campo nome deve conter no máximo %max% caracteres!',
			'email.required' 		=> 'O preenchimento do campo email é obrigatório!',
			'email.email' 			=> 'Informe um email válido!',
			'email.min' 			=> 'O campo email deve conter no mínimo %min% caracteres!',
			'email.max' 			=> 'O campo email deve conter no máximo %max% caracteres!',
			'email.unique' 			=> 'Este email já está sendo utilizado, Tente outro email!',
			'password.required' 	=> 'O preenchimento do campo nome é obrigatório!',
			'password.min' 			=> 'O campo senha deve conter no mínimo %min% caracteres!',
			'password.max' 			=> 'O campo senha deve conter no máximo %max% caracteres!',
			'telephone.numeric' 	=> 'O telefone deve ser composto somente por números!',
			'telephone.min' 		=> 'O campo telefone deve conter no mínimo %min% caracteres!',
			'telephone.max' 		=> 'O campo telefone deve conter no máximo %max% caracteres!',
			'cell.required' 		=> 'O preenchimento do campo celular é obrigatório!',
			'cell.numeric' 			=> 'O celular deve ser composto somente por números!',
			'cell.min' 				=> 'O campo celular deve conter no mínimo %min% caracteres!',
			'cell.max' 				=> 'O campo celular deve conter no máximo %max% caracteres!',
			'cpf.numeric' 			=> 'O cpf deve ser composto somente por números!',
			'cpf.min' 				=> 'O campo cpf deve conter no mínimo %min% caracteres!',
			'cpf.max' 				=> 'O campo cpf deve conter no máximo %max% caracteres!',
			'cnpj.numeric' 			=> 'O cnpj deve ser composto somente por números!',
			'cnpj.min' 				=> 'O campo cnpj deve conter no mínimo %min% caracteres!',
			'cnpj.max' 				=> 'O campo cnpj deve conter no máximo %max% caracteres!'
		];
	}

	public function getCreatedAtFormatAttribute(){
		if(empty($this->created_at))
			return null;

		return date('d/m/Y H:i:s', strtotime($this->created_at));
	}

	public function getUpdatedAtFormatAttribute(){
		if(empty($this->updated_at))
			return null;

		return date('d/m/Y H:i:s', strtotime($this->updated_at));
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->orWhere('name', 'LIKE', "%{$filter}%")
					->orWhere('email', 'LIKE', "%{$filter}%")
					->orWhere('telephone', 'LIKE', "%{$filter}%")
					->orWhere('cell', 'LIKE', "%{$filter}%")
					->orWhere('cpf', 'LIKE', "%{$filter}%")
					->orWhere('cnpj', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
		
		
					->limit($limit);
	}

	public function checkValidateAccount(){
		// Verifica se a conta desse cliente já foi validada
		$client = $this;

		if(!$this->validated){
			Mail::isHtml(true)
					->charset(config('mail.charset'))
					->addFrom(config('mail.to'), config('app.name'))
					->subject('Parabéns por criar sua conta em nosso site, agora basta validá-la!: ' . config('app.name'))
					->message(view('mail.account.validate', compact('client')))
					->send($this->email, $this->name);

			redirect(route('site.login'), ['error' => 'Esta conta não está validada, Verique seu e-mail e veja se tem um link de validação!'], true);
		}
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}
	
	public function adresses(){
		return $this->hasMany(ClientAddress::class, 'client_id', 'id');
	}

	public function shipping_address(){
		return $this->belongsTo(ClientAddress::class, 'shipping_address_id', 'id');
	}

	public function billing_address(){
		return $this->belongsTo(ClientAddress::class, 'billing_address_id', 'id');
	}

	public function ratings(){
		return $this->hasMany(Rating::class, 'client_id', 'id');
	}

	public function favorites(){
		return $this->belongsToMany(Product::class, 'favorites', 'client_id', 'product_id');
	}

	public function requests(){
		return $this->hasMany(Request::class, 'client_id', 'id');
	}

	public function products_requests(){
		return $this->hasManyThrough(RequestProduct::class, Request::class);
	}
}