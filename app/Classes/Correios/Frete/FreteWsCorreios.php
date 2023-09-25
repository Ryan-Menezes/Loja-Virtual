<?php
namespace App\Classes\Correios\Frete;

use Exception;

class FreteWsCorreios extends FreteCorreios {
	public function calculate(string $nCdServico = self::PAC) : ?array{
		try {
			if (!array_key_exists($nCdServico, $this->services)) {
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
		} catch(Exception $error) {
			$this->addError($error);
			return null;
		}	
	}
}