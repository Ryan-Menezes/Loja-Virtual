# Loja Virtual
Uma loja virtual simples, para à venda de diversos produtos.
## Configuração
Tenha o [Composer](https://getcomposer.org/) instalado em sua máquina e através de seu terminal entre no diretório do projeto e rode o comando "composer update":
```sh
cd "diretório do projeto"
composer update
```
<br>Vá ao arquivo "storage/database/database.sql" e rode todas as querys que estiverem por lá.<br><br>
Após essa configuração inicial, vá na raiz do projeto e procure pelo diretório "config/", por lá faça as configurações da aplicação, principalmente no arquivo "config/app.php".

## OBS!!!
Quando você conseguir acessar o painel de controle faça as configurações dos métodos de pagamento na rota "/painel/configuracoes/sistema/loja-online", por padrão os pagamentos vem desabilitados, pela falta das credências que são disponibilizadas nas plataformas de seus respectivos donos que são o pagseguro, mercadopago e picpay

## Informações Adicionais
Template do Site: [ELECTRO](https://themewagon.com/themes/free-bootstrap-ecommerce-template-electro/)<br>