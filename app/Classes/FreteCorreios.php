<?php
namespace App\Classes;

use Exception;

class FreteCorreios{
	private $sCepOrigem;
	private $sCepDestino;
	private $nVlPeso;
	private $nVlComprimento;
	private $nVlAltura;
	private $nVlLargura;
	private $nVlDiametro;
	private $nCdEmpresa;
	private $sDsSenha;
	private $nCdFormato;
	private $sCdMaoPropria;
	private $nVlValorDeclarado;
	private $sCdAvisoRecebimento;

	public const PAC = '04014';
	public const SEDEX = '04510';
	public const PAC_12 = '04782';
	public const SEDEX_10 = '04790';
	public const SEDEX_TODAY = '04804';

	private $services = [
		'04014' => 'SEDEX à vista',
		'04510' => 'PAC à vista',
		'04782' => 'SEDEX 12(à vista)',
		'04790' => 'SEDEX 10 (à vista)',
		'04804' => 'SEDEX hoje à vista'
	];
	private $formats = [
		1 => 'Caixa/Pacote',
		2 => 'Rolo/Prisma',
		3 => 'Envelope'
	];
	private $options = [
		'S' => 'SIM',
		'N' => 'NÃO'
	];

	private $errors = [];

	public function __construct(
		string $sCepOrigem, 
		string $sCepDestino,
		float $nVlPeso,
		float $nVlComprimento,
		float $nVlAltura,
		float $nVlLargura,
		float $nVlDiametro = 0,
		string $nCdEmpresa = null, 
		string $sDsSenha = null, 
		int $nCdFormato = 1,
		string $sCdMaoPropria = 'N',
		float $nVlValorDeclarado = 0,
		string $sCdAvisoRecebimento = 'N'){
		try{
			$sCepOrigem = preg_replace('/\D/i', '', $sCepOrigem);
			$sCepDestino = preg_replace('/\D/i', '', $sCepDestino);

			if(mb_strlen($sCepOrigem) != 8){
				throw new Exception('O cep de origem deve conter 8 caracteres!');
			}

			if(mb_strlen($sCepDestino) != 8){
				throw new Exception('O cep de destino deve conter 8 caracteres!');
			}

			if($nCdFormato == 3 && $nVlPeso > 1){
				throw new Exception('Para o formato envelope, Só é permitido no méximo 1kg!');
			}

			if($nCdFormato == 3 && $nVlPeso > 1){
				throw new Exception('Para o formato envelope, Só é permitido no méximo 1kg!');
			}

			if(!array_key_exists($nCdFormato, $this->formats)){
				throw new Exception('O valor informado para o formato é inválido!');
			}

			if(!array_key_exists($sCdMaoPropria, $this->options)){
				throw new Exception('O valor informado para a opção de mão própria é inválido!');
			}

			if(!array_key_exists($sCdAvisoRecebimento, $this->options)){
				throw new Exception('O valor informado para a opção de aviso de recebimento é inválido!');
			}

			$this->sCepOrigem 			= $sCepOrigem;
			$this->sCepDestino 			= $sCepDestino;
			$this->nVlPeso 				= number_format($nVlPeso, 2, '.', '');
			$this->nVlComprimento 		= number_format($nVlComprimento, 2, '.', '');
			$this->nVlAltura			= number_format($nVlAltura, 2, '.', '');
			$this->nVlLargura 			= number_format($nVlLargura, 2, '.', '');
			$this->nVlDiametro 			= number_format($nVlDiametro, 2, '.', '');
			$this->nCdEmpresa 			= $nCdEmpresa;
			$this->sDsSenha 			= $sDsSenha;
			$this->nCdFormato 			= $nCdFormato;
			$this->sCdMaoPropria 		= $sCdMaoPropria;
			$this->nVlValorDeclarado 	= $nVlValorDeclarado;
			$this->sCdAvisoRecebimento 	= $sCdAvisoRecebimento;
		}catch(Exception $error){
			$this->addError($error);
		}
	}

	private function addError($error){
		$this->errors[$error->getCode()] = $error;
	}

	public function calculate(string $nCdServico = self::PAC) : ?array{
		try{
			if(!array_key_exists($nCdServico, $this->services)){
				throw new Exception('O valor informado para o serviço é inválido!');
			}

			$data = [
				'sCepOrigem'			=> $this->sCepOrigem,
				'sCepDestino' 			=> $this->sCepDestino,
				'nVlPeso' 				=> $this->nVlPeso,
				'nVlComprimento' 		=> $this->nVlComprimento,
				'nVlAltura' 			=> $this->nVlAltura,
				'nVlLargura' 			=> $this->nVlLargura,
				'nVlDiametro' 			=> $this->nVlDiametro,
				'nCdServico' 			=> $nCdServico,
				'nCdFormato' 			=> $this->nCdFormato,
				'sCdMaoPropria' 		=> $this->sCdMaoPropria,
				'nVlValorDeclarado' 	=> $this->nVlValorDeclarado,
				'sCdAvisoRecebimento' 	=> $this->sCdAvisoRecebimento,
				'StrRetorno'			=> 'xml'
			];

			$url = "http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa={$this->nCdEmpresa}&sDsSenha={$this->sDsSenha}&" . http_build_query($data);
			
			$curl = curl_init($url);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			$response = curl_exec($curl);
			$response = simplexml_load_string($response);

			return (array)$response->cServico;
		}catch(Exception $error){
			$this->addError($error);
			return null;
		}	
	}
}