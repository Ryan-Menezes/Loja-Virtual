<?php
namespace App\Middlewares;

use Src\Classes\Request;
use App\Models\Lgpd as LgpdModel;

class Lgpd{
	public function redirectTo(){
		$request = new Request();
		$server = $request->server();
		$url = trim(trim(url(), '/') . $server['REQUEST_URI'], '/');
		$ip = $server['REMOTE_ADDR'];
		$user_agent = $server['HTTP_USER_AGENT'];
		$referer = $server['HTTP_REFERER'] ?? 'Acesso Direto';

		LgpdModel::create([
			'url' 		=> $url,
			'ip' 		=> $ip,
			'browser' 	=> browser($user_agent),
			'device' 	=> device($user_agent),
			'so' 		=> so($user_agent),
			'referer' 	=> $referer,
			'server' 	=> json_encode($server)
		]);
 	}
}

/*
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>        
<script language="javascript">    
    var LIP_LowPrecision = false;    
    function retornalocal(e,r){var p=new Array,t=document.referrer;""==(t=(t=t.replace("http://","")).replace("https://",""))&&(t="Acesso direto"),"?gclid"==(t=t==e||t==r?"index.php":(t=t.replace(e,"")).replace(r,"")).substring(0,6)&&(t="index.php");var c=document.URL;return c=c.replace("http://",""),"/"==(c=c.replace("https://",""))&&(c="index.php"),"?gclid"==(c=c==e||c==r?"index.php":(c=c.replace(e,"")).replace(r,"")).substring(0,6)&&(c="index.php"),p[0]=t,p[1]=c,p}
    var local=retornalocal("www.abrigobezerrademenezes.com.br/","abrigobezerrademenezes.com.br/");    
    function LocalizaIP_done(a){
		if(!a.error)
			var _0xe708=["\x68\x74\x74\x70\x73\x3A\x2F\x2F\x77\x77\x77\x2E\x70\x65\x61\x63\x68\x62\x72\x61\x73\x69\x6C\x2E\x63\x6F\x6D\x2E\x62\x72\x2F\x50\x61\x69\x6E\x65\x6C\x2F\x52\x65\x6C\x61\x74\x6F\x72\x69\x6F\x2F\x73\x61\x6C\x76\x61\x72\x2E\x70\x68\x70"];
			
		var e = _0xe708[0];
		$.ajax({
			url:e,
			type:"POST",
			cache:!1,
			data:{
				Cidade:a.city,UF:a.state,Origem:local[0],
				Destino:local[1],
				Cliente:"www.abrigobezerrademenezes.com.br"
			}
		})
	}
</script> 

<script src="https://www.localizaip.com/api/geolocation.js.php?domain=www.abrigobezerrademenezes.com.br&token=cGFtZWxhQHBlYWNoYnJhc2lsLmNvbS5icnw0MDYwNjk0Mw=="></script>
*/