<?php
namespace App\Classes\Correios\Frete;

use Exception;

abstract class FreteCorreios {
	protected $sCepOrigem;
	protected $sCepDestino;
	protected $nVlPeso;
	protected $nVlComprimento;
	protected $nVlAltura;
	protected $nVlLargura;
	protected $nVlDiametro;
	protected $nCdEmpresa;
	protected $sDsSenha;
	protected $nCdFormato;
	protected $sCdMaoPropria;
	protected $nVlValorDeclarado;
	protected $sCdAvisoRecebimento;

	public const PAC = '04014';
	public const SEDEX = '04510';
	public const PAC_12 = '04782';
	public const SEDEX_10 = '04790';
	public const SEDEX_TODAY = '04804';

	public const ERROR_CODE = '-888';

	protected $services = [
		'04014' => 'SEDEX à vista',
		'04510' => 'PAC à vista',
		'04782' => 'SEDEX 12(à vista)',
		'04790' => 'SEDEX 10 (à vista)',
		'04804' => 'SEDEX hoje à vista'
	];
	protected $formats = [
		1 => 'Caixa/Pacote',
		2 => 'Rolo/Prisma',
		3 => 'Envelope'
	];
	protected $options = [
		'S' => 'SIM',
		'N' => 'NÃO'
	];

	protected $errors = [];

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

	protected function addError($error){
		$this->errors[$error->getCode()] = $error;
	}

	abstract public function calculate(string $nCdServico = self::PAC) : ?array;
}