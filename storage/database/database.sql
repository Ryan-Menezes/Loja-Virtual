-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 27-Jan-2022 às 17:57
-- Versão do servidor: 5.7.36
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojavirtual`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `link`, `image`) VALUES
(3, 'Melhores Monitores', NULL, 'http://www.lojavirtual.com/eletronicos/monitores', 'banners/6cf34b7f9127623bef47df9c450b0eba.png'),
(4, 'Câmeras Fotográficas', NULL, 'http://www.lojavirtual.com/eletronicos/cameras', 'banners/ad0a99951cf7ab3aef5a876125e9f5a1.png'),
(5, 'Items para gamers', NULL, 'http://www.lojavirtual.com/eletronicos/gamers', 'banners/256384400ad2d002c16f4c95c154fec1.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Biografia', 'biografia', ''),
(2, 'Tecnologia', 'tecnologia', ''),
(5, 'Comida', 'comida', ''),
(6, 'Esportes', 'esportes', ''),
(7, 'Politica', 'politica', ''),
(8, 'Educação', 'educacao', ''),
(9, 'Saúde', 'saude', ''),
(10, 'Bem Estar', 'bem-estar', ''),
(11, 'Internacional', 'internacional', ''),
(12, 'Covid-19', 'covid-19', ''),
(13, 'Coronavirus', 'coronavirus', ''),
(14, 'Fofoca', 'fofoca', ''),
(15, 'Curiosidades', 'curiosidades', ''),
(16, 'Musica', 'musica', ''),
(17, 'Filmes', 'filmes', ''),
(18, 'Series', 'series', 'Séries boas'),
(23, 'Eletrônicos', 'eletronicos', 'Produtos elétricos'),
(24, 'Livros', 'livros', 'Os melhores livros você encontra aqui'),
(25, 'Roupas', 'roupas', 'Roupas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnpj` char(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address_id` int(10) UNSIGNED DEFAULT NULL,
  `billing_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `token` (`token`),
  KEY `clients_ibfk_1` (`shipping_address_id`),
  KEY `clients_ibfk_2` (`billing_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `password`, `telephone`, `cell`, `cpf`, `cnpj`, `token`, `google_id`, `facebook_id`, `validated`, `shipping_address_id`, `billing_address_id`, `created_at`, `updated_at`) VALUES
(9, 'Ryan Menezes', 'ryan@gmail.com', '$2y$10$CFjfwC1DbON.SpO28L8hGeysDIfCfGlDLEg/FwkfyAUwkuwGXkGs6', '1199999999', '11999999999', '53881489800', '', NULL, NULL, NULL, 1, 11, 11, '2022-01-14 20:42:09', '2022-01-21 22:22:12'),
(10, 'Carlos Oliveira', 'carlos@gmail.com', '$2y$10$Kj62o6wwccASfYUMEZtus.s8U/x2/igo/0Znx6n.8GnAnFGGbsNMK', '', '11985111561', '', '84053838000133', NULL, NULL, NULL, 1, 14, 14, '2022-01-21 22:30:43', '2022-01-21 22:47:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_adresses`
--

DROP TABLE IF EXISTS `client_adresses`;
CREATE TABLE IF NOT EXISTS `client_adresses` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postal_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complement` text COLLATE utf8mb4_unicode_ci,
  `client_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `client_adresses`
--

INSERT INTO `client_adresses` (`id`, `postal_code`, `street`, `number`, `district`, `city`, `state`, `complement`, `client_id`) VALUES
(11, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', '', 9),
(12, '04472205', 'Rua Nova', '15', 'Bairro Exata', 'São Paulo', 'SP', '', 9),
(13, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', '', 9),
(14, '11111111', 'Rua Exata', '15', 'Bairro Exata', 'São Paulo', 'SP', '', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_cards`
--

DROP TABLE IF EXISTS `client_cards`;
CREATE TABLE IF NOT EXISTS `client_cards` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvv` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` tinyint(2) UNSIGNED ZEROFILL NOT NULL,
  `year` tinyint(2) NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'C' COMMENT 'C - Crédito | D- Débito',
  `cpf` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `telephone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `client_cards`
--

INSERT INTO `client_cards` (`id`, `name`, `number`, `cvv`, `month`, `year`, `brand`, `type`, `cpf`, `birth`, `telephone`, `client_id`) VALUES
(3, 'Carlos Oliveira', '4111111111111111', '123', 12, 30, 'visa', 'C', '53881489800', '1980-02-01', '1199999999', 10),
(4, 'Ryan Menezes', '4111111111111111', '123', 12, 30, 'visa', 'C', '53881489800', '2022-01-30', '1199999999', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notice_id` (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `content`, `visible`, `notice_id`, `created_at`, `updated_at`) VALUES
(10, 'Ryan Menezes', 'ryan@gmail.com', 'Que incrivel', 1, 8, '2021-12-20 18:13:50', '2021-12-20 18:16:30'),
(11, 'Ryan Menezes', 'menezesryan1010@gmail.com', 'Novo Comentário', 1, 8, '2022-01-10 02:42:39', '2022-01-10 02:44:39'),
(12, 'Carlos Oliveira', 'carlos@gmail.com', 'Mensagem nova', 0, 6, '2022-01-10 02:45:48', '2022-01-10 02:45:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` tinyint(100) UNSIGNED NOT NULL,
  `expiration` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `percent`, `expiration`) VALUES
(5, 'FESTA', 20, '2022-01-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoiments`
--

DROP TABLE IF EXISTS `depoiments`;
CREATE TABLE IF NOT EXISTS `depoiments` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `depoiments`
--

INSERT INTO `depoiments` (`id`, `name`, `content`, `visible`) VALUES
(1, 'Ryan Menezes', 'OK', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `favorites`
--

INSERT INTO `favorites` (`id`, `client_id`, `product_id`) VALUES
(16, 9, 39),
(18, 9, 41),
(19, 9, 38),
(22, 9, 40),
(23, 9, 37);

-- --------------------------------------------------------

--
-- Estrutura da tabela `galery_images`
--

DROP TABLE IF EXISTS `galery_images`;
CREATE TABLE IF NOT EXISTS `galery_images` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source` varchar(191) NOT NULL,
  `galery_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `galery_id` (`galery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lgpd`
--

DROP TABLE IF EXISTS `lgpd`;
CREATE TABLE IF NOT EXISTS `lgpd` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `lgpd`
--

INSERT INTO `lgpd` (`id`, `url`, `ip`, `browser`, `device`, `so`, `server`, `created_at`, `updated_at`) VALUES
(6431, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"50728\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643290359.174105,\"REQUEST_TIME\":1643290359}', '2022-01-27 13:32:39', '2022-01-27 13:32:39'),
(6432, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_PURPOSE\":\"prefetch\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64818\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292703.938,\"REQUEST_TIME\":1643292703}', '2022-01-27 14:11:43', '2022-01-27 14:11:43'),
(6433, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64821\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292704.555338,\"REQUEST_TIME\":1643292704}', '2022-01-27 14:11:44', '2022-01-27 14:11:44'),
(6434, 'http://www.lojavirtual.com.br/carrinho/adicionar/41', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"0\",\"HTTP_ACCEPT\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_X_REQUESTED_WITH\":\"XMLHttpRequest\",\"HTTP_ORIGIN\":\"http:\\/\\/www.lojavirtual.com.br\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64818\",\"REDIRECT_URL\":\"\\/carrinho\\/adicionar\\/41\",\"REDIRECT_QUERY_STRING\":\"route=carrinho\\/adicionar\\/41\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"route=carrinho\\/adicionar\\/41\",\"REQUEST_URI\":\"\\/carrinho\\/adicionar\\/41\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292708.21394,\"REQUEST_TIME\":1643292708}', '2022-01-27 14:11:48', '2022-01-27 14:11:48'),
(6435, 'http://www.lojavirtual.com.br/carrinho/adicionar/40', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"0\",\"HTTP_ACCEPT\":\"application\\/json, text\\/javascript, *\\/*; q=0.01\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_X_REQUESTED_WITH\":\"XMLHttpRequest\",\"HTTP_ORIGIN\":\"http:\\/\\/www.lojavirtual.com.br\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64818\",\"REDIRECT_URL\":\"\\/carrinho\\/adicionar\\/40\",\"REDIRECT_QUERY_STRING\":\"route=carrinho\\/adicionar\\/40\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"route=carrinho\\/adicionar\\/40\",\"REQUEST_URI\":\"\\/carrinho\\/adicionar\\/40\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292709.052035,\"REQUEST_TIME\":1643292709}', '2022-01-27 14:11:49', '2022-01-27 14:11:49'),
(6436, 'http://www.lojavirtual.com.br/login', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64818\",\"REDIRECT_URL\":\"\\/login\",\"REDIRECT_QUERY_STRING\":\"route=login\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=login\",\"REQUEST_URI\":\"\\/login\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292712.184176,\"REQUEST_TIME\":1643292712}', '2022-01-27 14:11:52', '2022-01-27 14:11:52'),
(6437, 'http://www.lojavirtual.com.br/login', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"40\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_ORIGIN\":\"http:\\/\\/www.lojavirtual.com.br\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/login\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/login\",\"REDIRECT_QUERY_STRING\":\"route=login\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"route=login\",\"REQUEST_URI\":\"\\/login\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292720.29812,\"REQUEST_TIME\":1643292720}', '2022-01-27 14:12:00', '2022-01-27 14:12:00'),
(6438, 'http://www.lojavirtual.com.br/minha-conta', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/login\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/minha-conta\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\",\"REQUEST_URI\":\"\\/minha-conta\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292720.443696,\"REQUEST_TIME\":1643292720}', '2022-01-27 14:12:00', '2022-01-27 14:12:00'),
(6439, 'http://www.lojavirtual.com.br/carrinho', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/carrinho\",\"REDIRECT_QUERY_STRING\":\"route=carrinho\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=carrinho\",\"REQUEST_URI\":\"\\/carrinho\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292723.453914,\"REQUEST_TIME\":1643292723}', '2022-01-27 14:12:03', '2022-01-27 14:12:03'),
(6440, 'http://www.lojavirtual.com.br/carrinho/frete', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"20\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_X_REQUESTED_WITH\":\"XMLHttpRequest\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded; charset=UTF-8\",\"HTTP_ORIGIN\":\"http:\\/\\/www.lojavirtual.com.br\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/carrinho\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/carrinho\\/frete\",\"REDIRECT_QUERY_STRING\":\"route=carrinho\\/frete\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"route=carrinho\\/frete\",\"REQUEST_URI\":\"\\/carrinho\\/frete\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292726.73631,\"REQUEST_TIME\":1643292726}', '2022-01-27 14:12:06', '2022-01-27 14:12:06'),
(6441, 'http://www.lojavirtual.com.br/carrinho/cupom/validar', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"10\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_X_REQUESTED_WITH\":\"XMLHttpRequest\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded; charset=UTF-8\",\"HTTP_ORIGIN\":\"http:\\/\\/www.lojavirtual.com.br\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/carrinho\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/carrinho\\/cupom\\/validar\",\"REDIRECT_QUERY_STRING\":\"route=carrinho\\/cupom\\/validar\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"route=carrinho\\/cupom\\/validar\",\"REQUEST_URI\":\"\\/carrinho\\/cupom\\/validar\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292729.397217,\"REQUEST_TIME\":1643292729}', '2022-01-27 14:12:09', '2022-01-27 14:12:09'),
(6442, 'http://www.lojavirtual.com.br/carrinho/finalizar-pedido', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"39\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_ORIGIN\":\"http:\\/\\/www.lojavirtual.com.br\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/carrinho\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/carrinho\\/finalizar-pedido\",\"REDIRECT_QUERY_STRING\":\"route=carrinho\\/finalizar-pedido\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"route=carrinho\\/finalizar-pedido\",\"REQUEST_URI\":\"\\/carrinho\\/finalizar-pedido\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292730.27223,\"REQUEST_TIME\":1643292730}', '2022-01-27 14:12:10', '2022-01-27 14:12:10'),
(6443, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/carrinho\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292730.456085,\"REQUEST_TIME\":1643292730}', '2022-01-27 14:12:10', '2022-01-27 14:12:10'),
(6444, 'http://www.lojavirtual.com.br/minha-conta/pedidos', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292733.977057,\"REQUEST_TIME\":1643292733}', '2022-01-27 14:12:14', '2022-01-27 14:12:14'),
(6445, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292736.553293,\"REQUEST_TIME\":1643292736}', '2022-01-27 14:12:16', '2022-01-27 14:12:16'),
(6446, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"64828\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643292742.256326,\"REQUEST_TIME\":1643292742}', '2022-01-27 14:12:22', '2022-01-27 14:12:22'),
(6447, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56120\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295519.817101,\"REQUEST_TIME\":1643295519}', '2022-01-27 14:58:39', '2022-01-27 14:58:39'),
(6448, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56120\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295521.890399,\"REQUEST_TIME\":1643295521}', '2022-01-27 14:58:41', '2022-01-27 14:58:41');
INSERT INTO `lgpd` (`id`, `url`, `ip`, `browser`, `device`, `so`, `server`, `created_at`, `updated_at`) VALUES
(6449, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56121\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295548.619622,\"REQUEST_TIME\":1643295548}', '2022-01-27 14:59:08', '2022-01-27 14:59:08'),
(6450, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56135\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295570.7708,\"REQUEST_TIME\":1643295570}', '2022-01-27 14:59:30', '2022-01-27 14:59:30'),
(6451, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56139\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295587.48029,\"REQUEST_TIME\":1643295587}', '2022-01-27 14:59:47', '2022-01-27 14:59:47'),
(6452, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56143\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295600.89119,\"REQUEST_TIME\":1643295600}', '2022-01-27 15:00:00', '2022-01-27 15:00:00'),
(6453, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"56147\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643295641.796321,\"REQUEST_TIME\":1643295641}', '2022-01-27 15:00:41', '2022-01-27 15:00:41'),
(6454, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/efetuar-pagamento', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"50140\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/efetuar-pagamento\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643298991.113177,\"REQUEST_TIME\":1643298991}', '2022-01-27 15:56:31', '2022-01-27 15:56:31'),
(6455, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"52018\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643304299.780339,\"REQUEST_TIME\":1643304299}', '2022-01-27 17:24:59', '2022-01-27 17:24:59'),
(6456, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"52040\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643304308.646577,\"REQUEST_TIME\":1643304308}', '2022-01-27 17:25:08', '2022-01-27 17:25:08'),
(6457, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"52040\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643304311.905215,\"REQUEST_TIME\":1643304311}', '2022-01-27 17:25:12', '2022-01-27 17:25:12'),
(6458, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54766\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305153.359064,\"REQUEST_TIME\":1643305153}', '2022-01-27 17:39:13', '2022-01-27 17:39:13'),
(6459, 'http://www.lojavirtual.com.br/minha-conta', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54769\",\"REDIRECT_URL\":\"\\/minha-conta\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\",\"REQUEST_URI\":\"\\/minha-conta\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305155.211833,\"REQUEST_TIME\":1643305155}', '2022-01-27 17:39:15', '2022-01-27 17:39:15'),
(6460, 'http://www.lojavirtual.com.br/minha-conta/pedidos', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54769\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305157.235253,\"REQUEST_TIME\":1643305157}', '2022-01-27 17:39:17', '2022-01-27 17:39:17'),
(6461, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54769\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305158.612219,\"REQUEST_TIME\":1643305158}', '2022-01-27 17:39:18', '2022-01-27 17:39:18'),
(6462, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54769\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305161.286062,\"REQUEST_TIME\":1643305161}', '2022-01-27 17:39:21', '2022-01-27 17:39:21'),
(6463, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54803\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305241.678238,\"REQUEST_TIME\":1643305241}', '2022-01-27 17:40:41', '2022-01-27 17:40:41'),
(6464, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54824\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305280.903114,\"REQUEST_TIME\":1643305280}', '2022-01-27 17:41:21', '2022-01-27 17:41:21'),
(6465, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54825\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305288.16463,\"REQUEST_TIME\":1643305288}', '2022-01-27 17:41:28', '2022-01-27 17:41:28');
INSERT INTO `lgpd` (`id`, `url`, `ip`, `browser`, `device`, `so`, `server`, `created_at`, `updated_at`) VALUES
(6466, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54851\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305290.010595,\"REQUEST_TIME\":1643305290}', '2022-01-27 17:41:30', '2022-01-27 17:41:30'),
(6467, 'http://www.lojavirtual.com.br/minha-conta/pedidos', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54851\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305291.095095,\"REQUEST_TIME\":1643305291}', '2022-01-27 17:41:31', '2022-01-27 17:41:31'),
(6468, 'http://www.lojavirtual.com.br/minha-conta', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54851\",\"REDIRECT_URL\":\"\\/minha-conta\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\",\"REQUEST_URI\":\"\\/minha-conta\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305292.181687,\"REQUEST_TIME\":1643305292}', '2022-01-27 17:41:32', '2022-01-27 17:41:32'),
(6469, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54851\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305293.187667,\"REQUEST_TIME\":1643305293}', '2022-01-27 17:41:33', '2022-01-27 17:41:33'),
(6470, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54882\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305345.926941,\"REQUEST_TIME\":1643305345}', '2022-01-27 17:42:26', '2022-01-27 17:42:26'),
(6471, 'http://www.lojavirtual.com.br/minha-conta', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54890\",\"REDIRECT_URL\":\"\\/minha-conta\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\",\"REQUEST_URI\":\"\\/minha-conta\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305348.031554,\"REQUEST_TIME\":1643305348}', '2022-01-27 17:42:28', '2022-01-27 17:42:28'),
(6472, 'http://www.lojavirtual.com.br/minha-conta/pedidos', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54890\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305349.605591,\"REQUEST_TIME\":1643305349}', '2022-01-27 17:42:29', '2022-01-27 17:42:29'),
(6473, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54890\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305351.184676,\"REQUEST_TIME\":1643305351}', '2022-01-27 17:42:31', '2022-01-27 17:42:31'),
(6474, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54890\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305354.093229,\"REQUEST_TIME\":1643305354}', '2022-01-27 17:42:34', '2022-01-27 17:42:34'),
(6475, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54891\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305372.60751,\"REQUEST_TIME\":1643305372}', '2022-01-27 17:42:52', '2022-01-27 17:42:52'),
(6476, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54918\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305400.799581,\"REQUEST_TIME\":1643305400}', '2022-01-27 17:43:20', '2022-01-27 17:43:20'),
(6477, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54940\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305405.310727,\"REQUEST_TIME\":1643305405}', '2022-01-27 17:43:25', '2022-01-27 17:43:25'),
(6478, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/cartao-de-credito', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54940\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305408.070542,\"REQUEST_TIME\":1643305408}', '2022-01-27 17:43:28', '2022-01-27 17:43:28'),
(6479, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54940\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305410.933596,\"REQUEST_TIME\":1643305410}', '2022-01-27 17:43:31', '2022-01-27 17:43:31'),
(6480, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pix', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54940\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305413.151111,\"REQUEST_TIME\":1643305413}', '2022-01-27 17:43:33', '2022-01-27 17:43:33'),
(6481, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54940\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305414.904036,\"REQUEST_TIME\":1643305414}', '2022-01-27 17:43:34', '2022-01-27 17:43:34'),
(6482, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/debito-online', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54954\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/debito-online\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/debito-online\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/debito-online\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/debito-online\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305424.829913,\"REQUEST_TIME\":1643305424}', '2022-01-27 17:43:44', '2022-01-27 17:43:44');
INSERT INTO `lgpd` (`id`, `url`, `ip`, `browser`, `device`, `so`, `server`, `created_at`, `updated_at`) VALUES
(6483, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"54954\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305427.604569,\"REQUEST_TIME\":1643305427}', '2022-01-27 17:43:47', '2022-01-27 17:43:47'),
(6484, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"55000\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305471.240386,\"REQUEST_TIME\":1643305471}', '2022-01-27 17:44:31', '2022-01-27 17:44:31'),
(6485, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"55027\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305506.512657,\"REQUEST_TIME\":1643305506}', '2022-01-27 17:45:06', '2022-01-27 17:45:06'),
(6486, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"55027\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305509.004607,\"REQUEST_TIME\":1643305509}', '2022-01-27 17:45:09', '2022-01-27 17:45:09'),
(6487, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"55041\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305543.448998,\"REQUEST_TIME\":1643305543}', '2022-01-27 17:45:43', '2022-01-27 17:45:43'),
(6488, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63522\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305564.22419,\"REQUEST_TIME\":1643305564}', '2022-01-27 17:46:04', '2022-01-27 17:46:04'),
(6489, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63526\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305584.301647,\"REQUEST_TIME\":1643305584}', '2022-01-27 17:46:24', '2022-01-27 17:46:24'),
(6490, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63542\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305594.769176,\"REQUEST_TIME\":1643305594}', '2022-01-27 17:46:34', '2022-01-27 17:46:34'),
(6491, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/mercado-pago', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63542\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305597.656264,\"REQUEST_TIME\":1643305597}', '2022-01-27 17:46:37', '2022-01-27 17:46:37'),
(6492, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/mercado-pago', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63542\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305600.694566,\"REQUEST_TIME\":1643305600}', '2022-01-27 17:46:40', '2022-01-27 17:46:40'),
(6493, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/mercado-pago', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63556\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305623.85575,\"REQUEST_TIME\":1643305623}', '2022-01-27 17:47:03', '2022-01-27 17:47:03'),
(6494, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/mercado-pago', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63609\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305649.448991,\"REQUEST_TIME\":1643305649}', '2022-01-27 17:47:29', '2022-01-27 17:47:29'),
(6495, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/mercado-pago', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63610\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305658.258065,\"REQUEST_TIME\":1643305658}', '2022-01-27 17:47:38', '2022-01-27 17:47:38'),
(6496, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63610\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305661.103112,\"REQUEST_TIME\":1643305661}', '2022-01-27 17:47:41', '2022-01-27 17:47:41'),
(6497, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pix', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63610\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305663.95305,\"REQUEST_TIME\":1643305663}', '2022-01-27 17:47:44', '2022-01-27 17:47:44'),
(6498, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63610\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305664.68915,\"REQUEST_TIME\":1643305664}', '2022-01-27 17:47:44', '2022-01-27 17:47:44'),
(6499, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pix', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63618\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305687.727636,\"REQUEST_TIME\":1643305687}', '2022-01-27 17:48:07', '2022-01-27 17:48:07');
INSERT INTO `lgpd` (`id`, `url`, `ip`, `browser`, `device`, `so`, `server`, `created_at`, `updated_at`) VALUES
(6500, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pix', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63661\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305716.945608,\"REQUEST_TIME\":1643305716}', '2022-01-27 17:48:37', '2022-01-27 17:48:37'),
(6501, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pix', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63661\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305720.53276,\"REQUEST_TIME\":1643305720}', '2022-01-27 17:48:40', '2022-01-27 17:48:40'),
(6502, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pix', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63672\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pix\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pix\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305757.785445,\"REQUEST_TIME\":1643305757}', '2022-01-27 17:49:17', '2022-01-27 17:49:17'),
(6503, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63699\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305779.703947,\"REQUEST_TIME\":1643305779}', '2022-01-27 17:49:39', '2022-01-27 17:49:39'),
(6504, 'http://www.lojavirtual.com.br', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63734\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305848.430971,\"REQUEST_TIME\":1643305848}', '2022-01-27 17:50:48', '2022-01-27 17:50:48'),
(6505, 'http://www.lojavirtual.com.br/minha-conta', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63737\",\"REDIRECT_URL\":\"\\/minha-conta\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\",\"REQUEST_URI\":\"\\/minha-conta\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305850.371625,\"REQUEST_TIME\":1643305850}', '2022-01-27 17:50:50', '2022-01-27 17:50:50'),
(6506, 'http://www.lojavirtual.com.br/minha-conta/pedidos', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63737\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305852.193918,\"REQUEST_TIME\":1643305852}', '2022-01-27 17:50:52', '2022-01-27 17:50:52'),
(6507, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63737\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305853.750145,\"REQUEST_TIME\":1643305853}', '2022-01-27 17:50:53', '2022-01-27 17:50:53'),
(6508, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/cartao-de-credito', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63737\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/cartao-de-credito\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305856.747947,\"REQUEST_TIME\":1643305856}', '2022-01-27 17:50:56', '2022-01-27 17:50:56'),
(6509, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63737\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305862.467992,\"REQUEST_TIME\":1643305862}', '2022-01-27 17:51:02', '2022-01-27 17:51:02'),
(6510, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63779\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305882.025172,\"REQUEST_TIME\":1643305882}', '2022-01-27 17:51:22', '2022-01-27 17:51:22'),
(6511, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63779\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305884.331206,\"REQUEST_TIME\":1643305884}', '2022-01-27 17:51:24', '2022-01-27 17:51:24'),
(6512, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63782\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305933.229622,\"REQUEST_TIME\":1643305933}', '2022-01-27 17:52:13', '2022-01-27 17:52:13'),
(6513, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63782\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305937.088664,\"REQUEST_TIME\":1643305937}', '2022-01-27 17:52:17', '2022-01-27 17:52:17'),
(6514, 'http://www.lojavirtual.com.br/minha-conta/pedidos', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63810\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305943.31353,\"REQUEST_TIME\":1643305943}', '2022-01-27 17:52:23', '2022-01-27 17:52:23'),
(6515, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"63829\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305949.747798,\"REQUEST_TIME\":1643305949}', '2022-01-27 17:52:29', '2022-01-27 17:52:29'),
(6516, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57908\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643305975.036004,\"REQUEST_TIME\":1643305975}', '2022-01-27 17:52:55', '2022-01-27 17:52:55');
INSERT INTO `lgpd` (`id`, `url`, `ip`, `browser`, `device`, `so`, `server`, `created_at`, `updated_at`) VALUES
(6517, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57951\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643306137.494519,\"REQUEST_TIME\":1643306137}', '2022-01-27 17:55:37', '2022-01-27 17:55:37'),
(6518, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57952\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643306149.725678,\"REQUEST_TIME\":1643306149}', '2022-01-27 17:55:49', '2022-01-27 17:55:49'),
(6519, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57955\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643306198.685992,\"REQUEST_TIME\":1643306198}', '2022-01-27 17:56:38', '2022-01-27 17:56:38'),
(6520, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/mercado-pago', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57955\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/mercado-pago\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/mercado-pago\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643306202.38314,\"REQUEST_TIME\":1643306202}', '2022-01-27 17:56:42', '2022-01-27 17:56:42'),
(6521, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57955\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643306204.069869,\"REQUEST_TIME\":1643306204}', '2022-01-27 17:56:44', '2022-01-27 17:56:44'),
(6522, 'http://www.lojavirtual.com.br/minha-conta/pedidos/87/pagseguro', '127.0.0.1', 'Chrome', 'Computer', 'Windows 10', '{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"www.lojavirtual.com.br\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/97.0.4692.99 Safari\\/537.36\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"HTTP_REFERER\":\"http:\\/\\/www.lojavirtual.com.br\\/minha-conta\\/pedidos\\/87\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7\",\"HTTP_COOKIE\":\"cookieaccept=1; PHPSESSID=d4tonu106597elalr6cb0nik9i\",\"PATH\":\"C:\\\\Python310\\\\Scripts\\\\;C:\\\\Python310\\\\;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\System32\\\\OpenSSH\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\ProgramData\\\\chocolatey\\\\bin;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\xampp\\\\php;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\",\"SystemRoot\":\"C:\\\\WINDOWS\",\"COMSPEC\":\"C:\\\\WINDOWS\\\\system32\\\\cmd.exe\",\"PATHEXT\":\".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.PHAR\",\"WINDIR\":\"C:\\\\WINDOWS\",\"SERVER_SIGNATURE\":\"<address>Apache\\/2.4.51 (Win64) PHP\\/8.0.13 Server at www.lojavirtual.com.br Port 80<\\/address>\\n\",\"SERVER_SOFTWARE\":\"Apache\\/2.4.51 (Win64) PHP\\/8.0.13\",\"SERVER_NAME\":\"www.lojavirtual.com.br\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\",\"SERVER_ADMIN\":\"www.lojavirtual.com.br\",\"SCRIPT_FILENAME\":\"C:\\/Users\\/Ryan\\/Pictures\\/DEV\\/Projetos\\/PHP\\/Loja-Virtual\\/public\\/index.php\",\"REMOTE_PORT\":\"57955\",\"REDIRECT_URL\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"REDIRECT_QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"route=minha-conta\\/pedidos\\/87\\/pagseguro\",\"REQUEST_URI\":\"\\/minha-conta\\/pedidos\\/87\\/pagseguro\",\"SCRIPT_NAME\":\"\\/public\\/index.php\",\"PHP_SELF\":\"\\/public\\/index.php\",\"REQUEST_TIME_FLOAT\":1643306206.616189,\"REQUEST_TIME\":1643306206}', '2022-01-27 17:56:46', '2022-01-27 17:56:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `comments_active` tinyint(1) NOT NULL DEFAULT '1',
  `visits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` date DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `poster` (`poster`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `notices`
--

INSERT INTO `notices` (`id`, `title`, `slug`, `tags`, `visible`, `comments_active`, `visits`, `description`, `content`, `poster`, `expiration`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'Novo restaurante em são paulo', 'novo-restaurante-em-sao-paulo', 'restaurante, novo, são paulo, sp, comida, vegetariano', 1, 1, 9, 'Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/fb85f10f77e2565d9ffec0b359555495.jpg\",\"title\":\"Restaurante Novo\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/609a4e2926f3e1269d71ce2789c96220.jpg\",\"title\":\"Nosso Restaurante\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/0d1da218ca0207586aab73ba278c02fa.jpg', NULL, 1, '2021-11-18 22:33:52', '2022-01-24 19:53:13'),
(4, 'Nasa descobre nova galáxia próxima da via láctea', 'nasa-descobre-nova-galaxia-proxima-da-via-lactea', 'espaço, galáxia, ciência, descobertas, nasa, astrologia', 1, 1, 21, 'Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/695e20d30861413a08de1e4a11cfa7bf.jpg\",\"title\":\"Gal\\u00e1xia XVL-96\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/e1a0ce048b5723f1f029dd854e69f63d.jpg\",\"title\":\"Via L\\u00e1ctea\"},{\"type\":\"image\",\"src\":\"notices\\/a849181c4d4b0ac37422ff0dd097e2bf.jpg\",\"title\":\"\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/27c28012bfe3da038f7e4767217026d7.jpg', NULL, 1, '2021-11-19 23:31:08', '2022-01-19 18:35:36'),
(5, 'Brasil empata com Argentina, porém garante vaga na copa do mundo de 2021', 'brasil-empata-com-argentina-porem-garante-vaga-na-copa-do-mundo-de-2021', 'Brasil, Argentina, Copa do Mundo, Eliminatórias da Copa, Empate', 1, 1, 5, 'Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/9dc1ee64bff5133015d28e7e6d6756ff.jpg\",\"title\":\"Brasil e Argentina\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/6356751c64193270f74e25f0ba2e2993.jpg', NULL, 1, '2021-11-18 21:49:06', '2022-01-19 18:29:47'),
(6, 'Novo cantor sertanejo está fazendo sucesso no Brasil', 'novo-cantor-sertanejo-esta-fazendo-sucesso-no-brasil', 'Música, Sertanejo, Brasil', 1, 1, 33, '33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli<\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/77e589aa2a21d24a553ccdea141568db.jpg\",\"title\":\"Titulo da Imagem\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/e994ee6594266c7fbb3443029271c731.jpg', NULL, 1, '2021-11-19 23:22:45', '2022-01-24 19:48:17'),
(7, 'Marvel lança segundo trailer de homem aranha sem volta pra casa', 'marvel-lanca-segundo-trailer-de-homem-aranha-sem-volta-pra-casa', 'homem aranha, spider man, filmes, lançamentos, marvel', 1, 0, 409, 'Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit <a href=\\\"https:\\/\\/www.marvel.com\\/\\\" target=\\\"_blank\\\" title=\\\"Site da Marvel\\\" rel=\\\"nofollow\\\">Marvel<\\/a>. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\\r\\n\\r\\n<blockquote>Et repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem<\\/blockquote>\"},{\"type\":\"image\",\"src\":\"notices\\/e58e5a78106b5acfb4e2206a8f36552b.jpg\",\"title\":\"Homem aranha sem volta pra casa\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p>\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p><p><br><\\/p><h2>Veja o trailer abaixo:<\\/h2><p><br><\\/p>\"},{\"type\":\"youtube\",\"videocode\":\"CyiiEJRZjSU\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=CyiiEJRZjSU\"}]}', 'notices/1292cb0ca4a313e7402d7c75178ddeda.jpg', NULL, 1, '2021-11-28 23:33:47', '2022-01-26 12:36:57'),
(8, 'Melhor comida do  mundo!', 'melhor-comida-do-mundo!', 'comida, mundo, melhor do mundo', 1, 1, 45, 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat.', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!<\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/96abe6a7b2ae3a06cdbe7f3e2ad649aa.jpg\",\"title\":\"Nova Imagem\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"}]}', 'notices/a9383ad32bc715ef4c3ddba94ee1a5e1.jpg', NULL, 1, '2021-11-30 19:54:49', '2022-01-24 19:48:13'),
(9, 'O autor de One Piece revela que este ano o anime terá o seu fim', 'o-autor-de-one-piece-revela-que-este-ano-o-anime-tera-o-seu-fim', 'one piece, animes', 1, 1, 5, 'O autor de One Piece revela que este ano o anime terá o seu fim', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p><strong style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\"><br><\\/span><\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/9f2aa1dbdcd25c1410764e6c017837aa.png\",\"title\":\"One Piece\"},{\"type\":\"text\",\"content\":\"<p><span style=\\\"font-weight: bolder; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><\\/p>\"},{\"type\":\"text\",\"content\":\"<p><span style=\\\"font-weight: bolder; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><\\/p>\"}]}', 'notices/8267a383edec48d2e6863aba236764dc.png', NULL, 1, '2022-01-24 19:05:24', '2022-01-26 12:38:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notices_subcategories`
--

DROP TABLE IF EXISTS `notices_subcategories`;
CREATE TABLE IF NOT EXISTS `notices_subcategories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_id` (`notice_id`),
  KEY `subcategory_id` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `notices_subcategories`
--

INSERT INTO `notices_subcategories` (`id`, `notice_id`, `subcategory_id`) VALUES
(1, 7, 4),
(2, 7, 6),
(3, 9, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `partners`
--

DROP TABLE IF EXISTS `partners`;
CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text,
  `link` varchar(191) DEFAULT NULL,
  `type` enum('CL','CO') NOT NULL DEFAULT 'CO' COMMENT 'CL - Cliente | CO - Colaborador ',
  `image` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
(1, 'all.system', 'all.system'),
(2, 'all.system.address', 'all.system.address'),
(3, 'all.system.contact', 'all.system.contact'),
(4, 'all.system.social', 'all.system.social'),
(5, 'all.system.store', 'all.system.store'),
(6, 'all.system.lgpd', 'all.system.lgpd'),
(7, 'all.system.floater', 'all.system.floater'),
(8, 'all.system.ftp', 'all.system.ftp'),
(9, 'view.users', 'view.users'),
(10, 'create.users', 'create.users'),
(11, 'edit.users', 'edit.users'),
(12, 'delete.users', 'delete.users'),
(13, 'view.clients', 'view.clients'),
(14, 'create.clients', 'create.clients'),
(15, 'edit.clients', 'edit.clients'),
(16, 'delete.clients', 'delete.clients'),
(17, 'view.products', 'view.products'),
(18, 'create.products', 'create.products'),
(19, 'edit.products', 'edit.products'),
(20, 'delete.products', 'delete.products'),
(21, 'view.ratings', 'view.ratings'),
(22, 'create.ratings', 'create.ratings'),
(23, 'edit.ratings', 'edit.ratings'),
(24, 'delete.ratings', 'delete.ratings'),
(25, 'view.requests', 'view.requests'),
(26, 'create.requests', 'create.requests'),
(27, 'edit.requests', 'edit.requests'),
(28, 'delete.requests', 'delete.requests'),
(29, 'view.coupons', 'view.coupons'),
(30, 'create.coupons', 'create.coupons'),
(31, 'edit.coupons', 'edit.coupons'),
(32, 'delete.coupons', 'delete.coupons'),
(33, 'view.slideshow', 'view.slideshow'),
(34, 'create.slideshow', 'create.slideshow'),
(35, 'edit.slideshow', 'edit.slideshow'),
(36, 'delete.slideshow', 'delete.slideshow'),
(37, 'view.banners', 'view.banners'),
(38, 'create.banners', 'create.banners'),
(39, 'edit.banners', 'edit.banners'),
(40, 'delete.banners', 'delete.banners'),
(41, 'view.galleries', 'view.galleries'),
(42, 'create.galleries', 'create.galleries'),
(43, 'edit.galleries', 'edit.galleries'),
(44, 'delete.galleries', 'delete.galleries'),
(45, 'view.partners', 'view.partners'),
(46, 'create.partners', 'create.partners'),
(47, 'edit.partners', 'edit.partners'),
(48, 'delete.partners', 'delete.partners'),
(49, 'view.depoiments', 'view.depoiments'),
(50, 'create.depoiments', 'create.depoiments'),
(51, 'edit.depoiments', 'edit.depoiments'),
(52, 'delete.depoiments', 'delete.depoiments'),
(53, 'view.notices', 'view.notices'),
(54, 'create.notices', 'create.notices'),
(55, 'edit.notices', 'edit.notices'),
(56, 'delete.notices', 'delete.notices'),
(57, 'view.comments', 'view.comments'),
(58, 'create.comments', 'create.comments'),
(59, 'edit.comments', 'edit.comments'),
(60, 'delete.comments', 'delete.comments'),
(61, 'view.categories', 'view.categories'),
(62, 'create.categories', 'create.categories'),
(63, 'edit.categories', 'edit.categories'),
(64, 'delete.categories', 'delete.categories'),
(65, 'view.roles', 'view.roles'),
(66, 'create.roles', 'create.roles'),
(67, 'edit.roles', 'edit.roles'),
(68, 'delete.roles', 'delete.roles'),
(69, 'view.permissions', 'view.permissions'),
(70, 'create.permissions', 'create.permissions'),
(71, 'edit.permissions', 'edit.permissions'),
(72, 'delete.permissions', 'delete.permissions');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `ratings_active` tinyint(1) NOT NULL DEFAULT '1',
  `freight_free` tinyint(1) NOT NULL DEFAULT '0',
  `showcase` tinyint(1) NOT NULL DEFAULT '0',
  `installment_no_interest` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `brand`, `description`, `details`, `video`, `visible`, `ratings_active`, `freight_free`, `showcase`, `installment_no_interest`, `created_at`, `updated_at`) VALUES
(34, 'Camisa Formal', 'camisa-formal', 'Nike', 'Camisa formal', 'Camisa Formal', '', 1, 1, 0, 0, 2, '2021-12-18 22:21:42', '2022-01-23 19:57:08'),
(35, 'XBox Series X', 'xbox-series-x', 'Microsoft', 'Novo videogame da microsoft', '<p><strong>HD: </strong>1 TB</p>', '', 1, 1, 0, 0, 2, '2021-12-18 22:29:43', '2022-01-23 19:56:53'),
(36, 'Playstation 5', 'playstation-5', 'Sony', 'Novo videogame da sony', '<p>Playstation 5</p>', '', 1, 1, 0, 0, 2, '2021-12-18 22:35:10', '2022-01-23 19:56:20'),
(37, 'PC Gamer Completo', 'pc-gamer-completo', 'Sony', 'PC de última geração', '<p>PC de última geração</p>', 'https://www.youtube.com/watch?v=iutQJzAXiWo', 1, 1, 1, 1, 6, '2021-12-18 22:39:26', '2022-01-22 22:13:46'),
(38, 'Notebook Casual', 'notebook-casual', 'Positivo', 'Notebook para trabalho', '<p><strong>Ano: </strong>2020&nbsp;</p><p><strong>SO: </strong>Windows&nbsp;</p><p><strong>Bits: </strong>64 Bits</p>', '', 1, 1, 0, 0, 2, '2021-12-18 22:42:36', '2022-01-23 19:57:53'),
(39, 'Celular LG K4', 'celular-lg-k4', 'LG', 'Celular bom para nada', '<p><strong>PROCESSAMENTO: </strong>Ruim&nbsp;</p><p><strong style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align);\">MEMÓRIA: </strong>8gb</p>', 'https://www.youtube.com/watch?v=iutQJzAXiWo', 1, 0, 1, 0, 6, '2021-12-18 22:46:39', '2022-01-23 19:57:32'),
(40, 'Headset', 'headset', 'Microsoft', 'Um belo headset para jogadores de todas as idades', '<p><strong>Ano: </strong>2020&nbsp;</p><p><strong>Hz: </strong>60</p>', '', 1, 1, 1, 0, 2, '2021-12-20 21:44:23', '2022-01-23 19:50:28'),
(41, 'Tablet', 'tablet', 'Samsung', 'Um belo tablet para você dar de presente de natal!', '<p><strong>Armazenamento: </strong>32gb&nbsp;</p><p><strong style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align);\">RAM: </strong>8gb</p>', '', 1, 1, 1, 0, 2, '2021-12-20 21:51:12', '2022-01-24 12:22:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_related`
--

DROP TABLE IF EXISTS `products_related`;
CREATE TABLE IF NOT EXISTS `products_related` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_related_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_related_id` (`product_related_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `products_related`
--

INSERT INTO `products_related` (`id`, `product_id`, `product_related_id`) VALUES
(1, 41, 37),
(2, 41, 34),
(3, 41, 38),
(4, 41, 40),
(5, 41, 41);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_subcategories`
--

DROP TABLE IF EXISTS `products_subcategories`;
CREATE TABLE IF NOT EXISTS `products_subcategories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `subcategory_id` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products_subcategories`
--

INSERT INTO `products_subcategories` (`id`, `product_id`, `subcategory_id`) VALUES
(52, 34, 7),
(53, 34, 10),
(54, 35, 13),
(55, 36, 13),
(56, 37, 14),
(57, 38, 14),
(58, 38, 15),
(59, 39, 19),
(60, 40, 14),
(61, 40, 16),
(62, 41, 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
CREATE TABLE IF NOT EXISTS `product_colors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_colors`
--

INSERT INTO `product_colors` (`id`, `description`, `hex`, `product_id`) VALUES
(33, 'Cinza', '#575757', 34),
(34, 'Preto e Branco', '#141414', 34),
(35, 'Branco e Preto', '#d8d4d4', 34),
(36, 'Branco Azulado', '#b4e9f3', 34),
(37, 'Preto', '#000000', 34),
(38, 'Cinza Escuro', '#383838', 34),
(39, 'Preto', '#000000', 35),
(40, 'Branco e Preto', '#000000', 36),
(41, 'Preto', '#000000', 37),
(42, 'Cinza', '#000000', 38),
(43, 'Preto', '#000000', 39),
(44, 'Preto', '#000000', 40),
(45, 'Preto', '#2d2a2a', 41);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_discounts`
--

DROP TABLE IF EXISTS `product_discounts`;
CREATE TABLE IF NOT EXISTS `product_discounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `installment` tinyint(3) UNSIGNED NOT NULL,
  `percent` tinyint(100) UNSIGNED NOT NULL,
  `expiration` date DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `installment`, `percent`, `expiration`, `product_id`) VALUES
(74, 4, 50, NULL, 37),
(79, 1, 10, '2022-01-28', 40),
(80, 1, 50, NULL, 34),
(114, 1, 10, NULL, 41),
(115, 2, 5, NULL, 41),
(116, 3, 2, '2022-01-31', 41),
(117, 4, 2, NULL, 41);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`),
  KEY `product_images_ibfk_1` (`product_color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_images`
--

INSERT INTO `product_images` (`id`, `source`, `product_color_id`) VALUES
(14, 'products/d67e5d8121075bd911b95d659ad52c92.jpg', 33),
(15, 'products/4f6bb7fc81f7389b30ce0955b9a1da4e.jpg', 33),
(16, 'products/b3cd744c57914e8d72cd75d94c0a8fd6.jpg', 34),
(17, 'products/9db62ff6044883ce75879436c19929df.jpg', 34),
(18, 'products/b9c23b093aff1b8de21b979b71a0610d.jpg', 34),
(19, 'products/83bb2f64c641cc875effd22ac3dfa55d.jpg', 34),
(20, 'products/0e79144f916d3ca43e55e4f850053d9f.jpg', 35),
(21, 'products/27a3761cfc0e8321f54023a6d418efc4.jpg', 35),
(22, 'products/10e5ca43c3009f467e1bf8dacdc5ca53.jpg', 35),
(23, 'products/e998ce46c1932dfd6901810c379e1dff.jpg', 35),
(24, 'products/00e4f2117db4d5b7178802be35199cc4.jpg', 36),
(25, 'products/ec226ac3173da8f3ac2b81b7d35ca802.jpg', 36),
(26, 'products/d90a58960aca9b2c10320e76ef9b7eb7.jpg', 36),
(27, 'products/e1813f7590e76cd50f6b2b87d7595ec3.jpg', 36),
(28, 'products/38efa54aae5bee2e849a3cde9c5bf6d3.jpg', 37),
(29, 'products/660937dcb28b47f03c44fe7a13cc3c23.jpg', 37),
(30, 'products/8dbd6a3ffd9aa9c2231c54efc7a4ba80.jpg', 37),
(31, 'products/4c53745d9eabd822dc2583aa255dbe45.jpg', 37),
(32, 'products/f1a02306e24dc896672e17c1f5804e83.jpg', 38),
(33, 'products/8631f3f80e2032132ab7e8b78e37fb8b.jpg', 38),
(34, 'products/1868142663d5b94ee1f25742dc902fb5.jpg', 38),
(35, 'products/ed5e0834398d6eede3b7922162f085f6.jpg', 38),
(36, 'products/6defd50f9ff6ee88f6955458e0c1e7d6.jpg', 39),
(37, 'products/6d6ab6ea527526fc4ee3095f60dfefa6.jpg', 39),
(38, 'products/27599a258254ca2c9bdc1304f5b4ed8b.jpg', 39),
(39, 'products/2ee2971a9efb54dfaab6dabb441093e0.jpg', 39),
(40, 'products/95850f22a7df5d8577615b1981cde9df.jpg', 40),
(41, 'products/73c3257bb1b75fc184e432b02bb52951.jpg', 40),
(42, 'products/64cb5a2c748c4520725d5fc2888ad786.jpg', 40),
(43, 'products/30b934fde36db794273eb0e57157d5f6.jpg', 41),
(44, 'products/c5338085ae3d2749d7d3b046287116cf.jpg', 41),
(45, 'products/8803cf515729aa93d522d8f0c5c2fb4d.jpg', 41),
(46, 'products/6a5a2dc22a47cabc9ac54d4db1303b82.jpg', 41),
(47, 'products/6596b353d1f29f38455ffa6d3f1c3af1.jpg', 42),
(48, 'products/4e79bb4c64911875ac1e3571334e7e7e.jpg', 42),
(49, 'products/8b3c4db061e14170bf96a25a5d4a71a6.jpg', 42),
(50, 'products/cc3ab9b13b28949c646445387511c893.jpg', 43),
(51, 'products/09c94e4b530ec908e3894114a7893bef.jpg', 43),
(52, 'products/2459d0b85609b523917e1d34f0a08d02.jpg', 43),
(53, 'products/3ff2a1db8a82957e18a6dc3fcceed2b7.png', 43),
(54, 'products/bb36e8971940192e23dddf088836937d.png', 44),
(55, 'products/39907424074b5801238272ee2935ad38.png', 44),
(57, 'products/45583900ceeee4c7dc3a47ca2cf7c646.png', 42),
(58, 'products/3cca8ee5722e18177ee48688c93148b9.png', 42),
(59, 'products/fa56a56ebaed720ec96abd5837bb6ab1.png', 42),
(60, 'products/f80d2bad284c24efb5f797e5efd305b3.png', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
CREATE TABLE IF NOT EXISTS `product_sizes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `price_previous` decimal(10,2) UNSIGNED DEFAULT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `width` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `height` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `depth` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `weight` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `product_color_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_color_id` (`product_color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `description`, `price`, `price_previous`, `quantity`, `width`, `height`, `depth`, `weight`, `product_color_id`) VALUES
(464, '10x60x20', '8000.00', '10000.00', 10, '20.00', '20.00', '20.00', '1.00', 41),
(468, 'M', '500.00', '700.00', 50, '50.00', '50.00', '50.00', '10.00', 44),
(469, '10x100x50', '4500.00', '5000.00', 0, '50.00', '50.00', '50.00', '50.00', 40),
(470, '20x50x20', '4500.00', '5000.00', 0, '50.00', '50.00', '50.00', '50.00', 39),
(471, 'P', '20.00', '40.00', 50, '10.00', '10.00', '10.00', '1.50', 33),
(472, 'M', '20.00', '40.00', 100, '10.00', '10.00', '10.00', '1.50', 33),
(473, 'G', '20.00', '40.00', 40, '10.00', '10.00', '10.00', '1.50', 33),
(474, 'GG', '20.00', '40.00', 50, '10.00', '10.00', '10.00', '1.50', 33),
(475, 'P', '20.00', '40.00', 6, '50.00', '50.00', '50.00', '50.00', 34),
(476, 'M', '20.00', '40.00', 5, '50.00', '50.00', '50.00', '50.00', 34),
(477, 'G', '20.00', '40.00', 10, '50.00', '50.00', '50.00', '50.00', 34),
(478, 'GG', '20.00', '40.00', 30, '50.00', '50.00', '50.00', '50.00', 34),
(479, 'P', '20.00', '40.00', 69, '50.00', '50.00', '50.00', '50.00', 35),
(480, 'P', '20.00', '40.00', 9, '50.00', '50.00', '50.00', '50.00', 36),
(481, 'P', '20.00', '40.00', 0, '50.00', '50.00', '50.00', '50.00', 37),
(482, 'M', '20.00', '40.00', 0, '50.00', '50.00', '50.00', '50.00', 37),
(483, 'G', '20.00', '40.00', 3, '50.00', '50.00', '50.00', '50.00', 37),
(484, 'GG', '20.00', '40.00', 0, '50.00', '50.00', '50.00', '50.00', 37),
(485, 'P', '30.00', '90.00', 6, '50.00', '50.00', '50.00', '50.00', 38),
(486, '10x40', '800.00', '1000.00', 50, '50.00', '50.00', '50.00', '50.00', 43),
(487, '10x50x10', '800.00', '1000.00', 0, '50.00', '50.00', '50.00', '50.00', 42),
(497, '12 Polegadas', '800.30', '2000.00', 10, '50.00', '50.00', '50.00', '50.00', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stars` tinyint(5) UNSIGNED NOT NULL DEFAULT '5',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `product_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ratings`
--

INSERT INTO `ratings` (`id`, `stars`, `content`, `visible`, `product_id`, `client_id`, `created_at`, `updated_at`) VALUES
(8, 3, 'Excelente entrega', 1, 40, 9, '2022-01-15 20:21:53', '2022-01-15 20:39:14'),
(9, 5, 'Ótimo produto e excelente entrega', 1, 38, 9, '2022-01-15 20:22:43', '2022-01-15 20:39:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` enum('AP','PA','EN','CO','CA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AP' COMMENT 'AP - Aguardando Pagamento | PA - Pago | EN - Enviado para a entrega | CO - Concluído | CA - Cancelado',
  `client_id` int(10) UNSIGNED NOT NULL,
  `request_address_id` int(10) UNSIGNED NOT NULL,
  `request_payment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `request_address_id` (`request_address_id`),
  KEY `request_payment_id` (`request_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `requests`
--

INSERT INTO `requests` (`id`, `status`, `client_id`, `request_address_id`, `request_payment_id`, `created_at`, `updated_at`) VALUES
(82, 'CA', 9, 87, 88, '2022-01-26 18:48:28', '2022-01-26 18:48:30'),
(83, 'PA', 9, 88, 89, '2022-01-26 18:50:40', '2022-01-26 18:50:43'),
(84, 'PA', 9, 89, 90, '2022-01-26 18:51:45', '2022-01-26 18:51:48'),
(85, 'AP', 9, 90, 91, '2022-01-26 18:54:01', '2022-01-26 18:54:01'),
(86, 'AP', 9, 91, 92, '2022-01-26 18:54:32', '2022-01-26 18:54:32'),
(87, 'AP', 9, 92, 93, '2022-01-27 14:12:10', '2022-01-27 14:12:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `requests_products`
--

DROP TABLE IF EXISTS `requests_products`;
CREATE TABLE IF NOT EXISTS `requests_products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`),
  KEY `product_size_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `requests_products`
--

INSERT INTO `requests_products` (`id`, `color`, `size`, `price`, `quantity`, `request_id`, `product_id`) VALUES
(93, 'Preto', '10x40', '800.00', 1, 82, 39),
(94, 'Preto', 'M', '500.00', 1, 82, 40),
(95, 'Preto', '10x60x20', '8000.00', 2, 83, 37),
(96, 'Preto', '10x60x20', '8000.00', 1, 84, 37),
(97, 'Preto', '10x40', '800.00', 1, 85, 39),
(98, 'Preto', 'M', '500.00', 1, 85, 40),
(99, 'Preto', '10x60x20', '8000.00', 1, 85, 37),
(100, 'Preto', '12 Polegadas', '800.30', 1, 86, 41),
(101, 'Preto', '12 Polegadas', '800.30', 1, 87, 41),
(102, 'Preto', 'M', '500.00', 1, 87, 40);

-- --------------------------------------------------------

--
-- Estrutura da tabela `request_address`
--

DROP TABLE IF EXISTS `request_address`;
CREATE TABLE IF NOT EXISTS `request_address` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postal_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complement` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `request_address`
--

INSERT INTO `request_address` (`id`, `postal_code`, `street`, `number`, `district`, `city`, `state`, `complement`) VALUES
(23, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(24, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(25, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(26, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(27, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(28, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(29, '04472205', 'Rua Socialista', '14', 'Jardim Novo Pantanal', 'São Paulo', 'SP', ''),
(30, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(31, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(32, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(33, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(34, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(35, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(36, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(37, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(38, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(39, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(40, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(41, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(42, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(43, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(44, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(45, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(46, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(47, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(48, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(49, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(50, '11111111', 'Rua Exata', '15', 'Bairro Exata', 'São Paulo', 'SP', ''),
(51, '11111111', 'Rua Exata', '15', 'Bairro Exata', 'São Paulo', 'SP', ''),
(52, '11111111', 'Rua Exata', '15', 'Bairro Exata', 'São Paulo', 'SP', ''),
(53, '11111111', 'Rua Exata', '15', 'Bairro Exata', 'São Paulo', 'SP', ''),
(54, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(55, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(56, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(57, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(58, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(59, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(60, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(61, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(62, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(63, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(64, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(65, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(66, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(67, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(68, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(69, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(70, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(71, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(72, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(73, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(74, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(75, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(76, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(77, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(78, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(79, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(80, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(81, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(82, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(83, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(84, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(85, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(86, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(87, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(88, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(89, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(90, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(91, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(92, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `request_payment`
--

DROP TABLE IF EXISTS `request_payment`;
CREATE TABLE IF NOT EXISTS `request_payment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('PS','MP','PP','PC') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PS - PagSeguro | MP - Mercado Pago | PP - PayPal | PC - PicPay',
  `method` enum('CC','CD','BA','BO','DE','DO','PX','PP') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CC - Cartão de Crédito | CD - Cartão de Débito | BA - Saldo | BO - Boleto | DE - Depósito | DO - Débito Online | PX - PIX | PP - PayPal',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_type` enum('AP','EA','PA','DI','ED','DE','CA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AP' COMMENT 'AP - Aguardando Pagamento | EA - Em Análise | PA - Paga | DI - Disponível | ED - Em Disputa | DE - Devolvida | CA - Cancelada',
  `installments` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `installment_no_interest` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `discount_coupon` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_installment` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_cart` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `shipping_type` enum('PC','SX','PE') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PC - PAC | SX - SEDEX | PE - Personalizado',
  `shipping_value` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `shipping_days` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `shipping_message` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrcode` longblob,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `request_payment`
--

INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `details`, `created_at`, `updated_at`) VALUES
(88, NULL, 'PC', 'PX', 'expired', 'CA', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"referenceId\":\"82\",\"status\":\"expired\",\"createdAt\":\"2022-01-26T14:38:11.000000Z\",\"updatedAt\":\"2022-01-26T16:29:18.000000Z\",\"value\":150}', '2022-01-26 18:48:28', '2022-01-26 18:48:30'),
(89, '097F0BAB-BEDC-4055-A658-1DB4813172B0', 'PS', 'DO', '3', 'PA', 1, 2, '16000.00', '3200.00', '45.50', '1600.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=468836efe0b8fcf5b8d903c498604b0591b6bf8a6dfc4488ef0ff825e0e4396bb324d1ef6ca02268', NULL, '{\"date\":\"2022-01-26T12:23:57.000-03:00\",\"code\":\"097F0BAB-BEDC-4055-A658-1DB4813172B0\",\"reference\":\"83\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-26T12:25:50.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=468836efe0b8fcf5b8d903c498604b0591b6bf8a6dfc4488ef0ff825e0e4396bb324d1ef6ca02268\",\"grossAmount\":\"1060.00\",\"discountAmount\":\"45.50\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"50.62\"},\"netAmount\":\"963.48\",\"extraAmount\":\"-390.00\",\"escrowEndDate\":\"2022-02-09T12:25:50.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"d1d6a7eae40b025e869ac0853049efc2\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"2686b822a1b95a0940e608accafd292a\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:50:40', '2022-01-26 18:50:43'),
(90, 'A1CFDD09-B06B-4085-A931-656939C7D272', 'PS', 'DO', '3', 'PA', 1, 2, '8000.00', '1600.00', '1903.89', '800.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=86812bdb74e28be7824d4ea87838ce036a4b8b11d7ced6c7989210b5cde4b3c1229bd8ca33eec9a1', NULL, '{\"date\":\"2022-01-26T15:17:41.000-03:00\",\"code\":\"A1CFDD09-B06B-4085-A931-656939C7D272\",\"reference\":\"84\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-26T15:18:07.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=86812bdb74e28be7824d4ea87838ce036a4b8b11d7ced6c7989210b5cde4b3c1229bd8ca33eec9a1\",\"grossAmount\":\"954.19\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"47.61\"},\"netAmount\":\"906.18\",\"extraAmount\":\"-496.11\",\"escrowEndDate\":\"2022-02-09T15:18:07.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"69db61ce36a56178711fec066e07aeb6\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"62306523b3c77c077b2938f0d6ab91f5\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:51:45', '2022-01-26 18:51:48'),
(91, '04CDAB4F-10F8-4873-A6F4-0DD103251E76', 'PS', 'CC', '6', 'DE', 6, 2, '9300.00', '1860.00', '2400.00', '930.00', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"date\":\"2022-01-26T15:20:07.000-03:00\",\"code\":\"04CDAB4F-10F8-4873-A6F4-0DD103251E76\",\"reference\":\"85\",\"type\":\"1\",\"status\":\"6\",\"lastEventDate\":\"2022-01-26T15:24:17.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"1060.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"86.50\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"52.89\"},\"netAmount\":\"920.21\",\"extraAmount\":\"-390.00\",\"escrowEndDate\":\"2022-02-09T15:22:53.000-03:00\",\"installmentCount\":\"6\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"9d12d071c18b535cda26f47f20e5c7ae\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"2a8009525763356ad5e3bb48b7475b4d\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:54:01', '2022-01-26 18:54:03'),
(92, NULL, NULL, NULL, NULL, 'AP', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '2022-01-26 18:54:32', '2022-01-26 18:54:32'),
(93, NULL, NULL, NULL, NULL, 'AP', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '2022-01-27 14:12:10', '2022-01-27 14:12:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Administração', 'Administrador do Sistema'),
(2, 'Usuário', 'Usuário comum do sistema');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `permission_id`) VALUES
(519, 1, 1),
(520, 1, 2),
(521, 1, 3),
(522, 1, 7),
(523, 1, 8),
(524, 1, 6),
(525, 1, 4),
(526, 1, 5),
(527, 1, 38),
(528, 1, 62),
(529, 1, 14),
(530, 1, 58),
(531, 1, 30),
(532, 1, 50),
(533, 1, 42),
(534, 1, 54),
(535, 1, 46),
(536, 1, 70),
(537, 1, 18),
(538, 1, 22),
(539, 1, 26),
(540, 1, 66),
(541, 1, 34),
(542, 1, 10),
(543, 1, 40),
(544, 1, 64),
(545, 1, 16),
(546, 1, 60),
(547, 1, 32),
(548, 1, 52),
(549, 1, 44),
(550, 1, 56),
(551, 1, 48),
(552, 1, 72),
(553, 1, 20),
(554, 1, 24),
(555, 1, 28),
(556, 1, 68),
(557, 1, 36),
(558, 1, 12),
(559, 1, 39),
(560, 1, 63),
(561, 1, 15),
(562, 1, 59),
(563, 1, 31),
(564, 1, 51),
(565, 1, 43),
(566, 1, 55),
(567, 1, 47),
(568, 1, 71),
(569, 1, 19),
(570, 1, 23),
(571, 1, 27),
(572, 1, 67),
(573, 1, 35),
(574, 1, 11),
(575, 1, 37),
(576, 1, 61),
(577, 1, 13),
(578, 1, 57),
(579, 1, 29),
(580, 1, 49),
(581, 1, 41),
(582, 1, 53),
(583, 1, 45),
(584, 1, 69),
(585, 1, 17),
(586, 1, 21),
(587, 1, 25),
(588, 1, 65),
(589, 1, 33),
(590, 1, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `slideshow`
--

DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE IF NOT EXISTS `slideshow` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `slug`, `description`, `category_id`) VALUES
(1, 'Falcão', 'falcao', 'Série da Marvel', 18),
(2, 'Loki', 'loki', 'Série da Marvel', 18),
(4, 'Ação', 'acao', 'Melhores Filmes de Ação', 17),
(5, 'Drama', 'drama', 'Melhores Filmes de Drama', 17),
(6, 'Comédia', 'comedia', 'Melhores Filmes de Comédia', 17),
(7, 'Masculino', 'masculino', 'Roupas masculinas', 25),
(8, 'Feminino', 'feminino', 'Roupas femininas', 25),
(9, 'Calças', 'calcas', 'Calças', 25),
(10, 'Camisas', 'camisas', 'Camisas', 25),
(11, 'Sapatos', 'sapatos', 'Sapatos', 25),
(12, 'Meias', 'meias', 'Meias', 25),
(13, 'Videogame', 'videogame', 'Videogame', 23),
(14, 'Computador', 'computador', 'Computador', 23),
(15, 'Notebook', 'notebook', 'Notebook', 23),
(16, 'Acessório', 'acessorio', 'Acessório', 23),
(17, 'Mouse', 'mouse', 'Mouse', 23),
(18, 'Teclado', 'teclado', 'Teclado', 23),
(19, 'Celular', 'celular', 'Celular', 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcomments`
--

DROP TABLE IF EXISTS `subcomments`;
CREATE TABLE IF NOT EXISTS `subcomments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `subcomments`
--

INSERT INTO `subcomments` (`id`, `name`, `email`, `content`, `visible`, `comment_id`, `created_at`, `updated_at`) VALUES
(3, 'Electro', 'menezesryan1010@gmail.com', 'Que ótimo que gostou!!!', 1, 10, '2021-12-20 18:17:58', '2021-12-20 18:18:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system`
--

DROP TABLE IF EXISTS `system`;
CREATE TABLE IF NOT EXISTS `system` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` char(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `system_address_id` int(10) UNSIGNED NOT NULL,
  `system_contact_id` int(10) UNSIGNED NOT NULL,
  `system_social_id` int(10) UNSIGNED NOT NULL,
  `system_store_id` int(10) UNSIGNED NOT NULL,
  `system_lgpd_id` int(10) UNSIGNED NOT NULL,
  `system_floater_id` int(10) UNSIGNED NOT NULL,
  `system_ftp_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_address_id` (`system_address_id`),
  KEY `settings_contact_id` (`system_contact_id`),
  KEY `settings_floater_id` (`system_floater_id`),
  KEY `settings_social_id` (`system_social_id`),
  KEY `system_lgpd_id` (`system_lgpd_id`),
  KEY `system_store_id` (`system_store_id`),
  KEY `system_ftp_id` (`system_ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system`
--

INSERT INTO `system` (`id`, `name`, `cnpj`, `keywords`, `description`, `maintenance`, `system_address_id`, `system_contact_id`, `system_social_id`, `system_store_id`, `system_lgpd_id`, `system_floater_id`, `system_ftp_id`) VALUES
(1, 'Electro', '48498411498849', 'loja virtual, eletrônicos, vestimentas', 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id', 0, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_address`
--

DROP TABLE IF EXISTS `system_address`;
CREATE TABLE IF NOT EXISTS `system_address` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postal_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_address`
--

INSERT INTO `system_address` (`id`, `postal_code`, `street`, `number`, `district`, `city`, `state`, `latitude`, `longitude`, `complement`) VALUES
(1, '12345678', 'Rua Nova', '15', 'Novo Bairro', 'São Paulo', 'SP', '', '', 'Novo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_contact`
--

DROP TABLE IF EXISTS `system_contact`;
CREATE TABLE IF NOT EXISTS `system_contact` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_contact`
--

INSERT INTO `system_contact` (`id`, `email`, `telephone`, `cell`) VALUES
(1, 'electro@gmail.com', '1199999999', '11999999999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_floater`
--

DROP TABLE IF EXISTS `system_floater`;
CREATE TABLE IF NOT EXISTS `system_floater` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_floater`
--

INSERT INTO `system_floater` (`id`, `active`, `image`, `link`) VALUES
(1, 0, 'floater/2ab8c87d70f1d01903818ff0a2977881.jpg', 'http://www.lojavirtual.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_freight`
--

DROP TABLE IF EXISTS `system_freight`;
CREATE TABLE IF NOT EXISTS `system_freight` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('C','P') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'C - Correios | P - Personalizado',
  `postal_code_origin` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_freight`
--

INSERT INTO `system_freight` (`id`, `type`, `postal_code_origin`) VALUES
(1, 'P', '04796355');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_freight_custom`
--

DROP TABLE IF EXISTS `system_freight_custom`;
CREATE TABLE IF NOT EXISTS `system_freight_custom` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postal_code_min` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code_max` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) UNSIGNED NOT NULL,
  `days` tinyint(3) UNSIGNED NOT NULL,
  `system_freight_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_freight_id` (`system_freight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_freight_custom`
--

INSERT INTO `system_freight_custom` (`id`, `postal_code_min`, `postal_code_max`, `value`, `days`, `system_freight_id`) VALUES
(432, '11111111', '22222222', '150.00', 5, 1),
(433, '33333333', '44444444', '200.00', 10, 1),
(434, '55555555', '66666666', '5.00', 5, 1),
(435, '66666666', '77777777', '6.00', 5, 1),
(436, '88888888', '99999999', '7.00', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_ftp`
--

DROP TABLE IF EXISTS `system_ftp`;
CREATE TABLE IF NOT EXISTS `system_ftp` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(191) DEFAULT NULL,
  `server` varchar(20) DEFAULT NULL,
  `port` smallint(3) UNSIGNED NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `directory` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_ftp`
--

INSERT INTO `system_ftp` (`id`, `active`, `url`, `server`, `port`, `username`, `password`, `directory`) VALUES
(1, 0, 'http://www.lojavirtual.com.br/', '111.111.111.111', 20, 'teste', 'teste', '/public_html/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_lgpd`
--

DROP TABLE IF EXISTS `system_lgpd`;
CREATE TABLE IF NOT EXISTS `system_lgpd` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `privacy_policy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_conditions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_policy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_lgpd`
--

INSERT INTO `system_lgpd` (`id`, `active`, `privacy_policy`, `terms_conditions`, `return_policy`) VALUES
(1, 1, 'privacy_policy/3d61171f4f54c377291b90c2f99d7cb8.pdf', 'terms_conditions/c4d2f9b886665667f91d38c1e51aaab7.pdf', 'return_policy/4a1523da17e127e718d312b9245a3bc7.pdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_mercadopago`
--

DROP TABLE IF EXISTS `system_mercadopago`;
CREATE TABLE IF NOT EXISTS `system_mercadopago` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_checkout` enum('LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LR' COMMENT 'LR - Link de Redirecionamento | LB - LightBox',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_mercadopago`
--

INSERT INTO `system_mercadopago` (`id`, `active`, `public_key`, `access_token`, `type_checkout`) VALUES
(1, 1, 'TEST-b373a2b1-7f2a-4f7c-b6f7-e815ea8797a5', 'TEST-1541154418522225-012712-072f7db6f08c326e64541943194176c7-774678190', 'LR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_pagseguro`
--

DROP TABLE IF EXISTS `system_pagseguro`;
CREATE TABLE IF NOT EXISTS `system_pagseguro` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_checkout` enum('LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LR' COMMENT 'LR - Link de Redirecionamento | LB - LightBox',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_pagseguro`
--

INSERT INTO `system_pagseguro` (`id`, `active`, `email`, `token`, `app_id`, `app_key`, `type_checkout`) VALUES
(1, 1, 'menezesryan1010@gmail.com', '97C3FCEEDB4C4AC1A8A90E17307260DA', '', '', 'LR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_picpay`
--

DROP TABLE IF EXISTS `system_picpay`;
CREATE TABLE IF NOT EXISTS `system_picpay` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(191) DEFAULT NULL,
  `seller_token` varchar(191) DEFAULT NULL,
  `expiration_minutes` tinyint(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_picpay`
--

INSERT INTO `system_picpay` (`id`, `active`, `token`, `seller_token`, `expiration_minutes`) VALUES
(1, 1, 'a83ecef9-11ce-4679-a2f3-06170f1dec91', '0fa6c571-16fd-45d7-afc9-41d630cbbf2c', 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_social`
--

DROP TABLE IF EXISTS `system_social`;
CREATE TABLE IF NOT EXISTS `system_social` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discord` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_social`
--

INSERT INTO `system_social` (`id`, `facebook`, `instagram`, `twitter`, `linkedin`, `youtube`, `twitch`, `discord`, `whatsapp`) VALUES
(1, 'https://facebook.com', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_store`
--

DROP TABLE IF EXISTS `system_store`;
CREATE TABLE IF NOT EXISTS `system_store` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `cart_amount_promotion` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `cart_discount_percent_promotion` tinyint(100) UNSIGNED NOT NULL DEFAULT '0',
  `cart_freight_free_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` enum('PS','MP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PS' COMMENT 'PS - PagSeguro | MP - Mercado Pago',
  `payment_checkout_transparent` tinyint(1) NOT NULL DEFAULT '1',
  `payment_production` tinyint(1) NOT NULL DEFAULT '0',
  `payment_credit_card` tinyint(1) NOT NULL DEFAULT '1',
  `payment_debit_card` tinyint(1) NOT NULL DEFAULT '1',
  `payment_balance` tinyint(1) NOT NULL DEFAULT '1',
  `payment_bolet` tinyint(1) NOT NULL DEFAULT '1',
  `payment_deposit` tinyint(1) NOT NULL DEFAULT '1',
  `payment_debit_online` tinyint(1) NOT NULL DEFAULT '1',
  `system_freight_id` int(10) UNSIGNED NOT NULL,
  `system_pagseguro_id` int(10) UNSIGNED NOT NULL,
  `system_mercadopago_id` int(10) UNSIGNED NOT NULL,
  `system_picpay_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_pagseguro_id` (`system_pagseguro_id`),
  KEY `system_store_ibfk_2` (`system_freight_id`),
  KEY `system_picpay_id` (`system_picpay_id`),
  KEY `system_mercadopago_id` (`system_mercadopago_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_store`
--

INSERT INTO `system_store` (`id`, `cart_promotion`, `cart_amount_promotion`, `cart_discount_percent_promotion`, `cart_freight_free_promotion`, `payment_type`, `payment_checkout_transparent`, `payment_production`, `payment_credit_card`, `payment_debit_card`, `payment_balance`, `payment_bolet`, `payment_deposit`, `payment_debit_online`, `system_freight_id`, `system_pagseguro_id`, `system_mercadopago_id`, `system_picpay_id`) VALUES
(1, 1, '100.00', 10, 0, 'PS', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Ryan Menezes', 'menezesryan1010@gmail.com', '$2y$10$t/Ay9IJIcHUAlisbw/BZbu1y7xc55VeNAFs8rIMpaP7rdqzppSgk6', '2021-11-14 16:37:27', '2021-11-14 17:37:27'),
(2, 'Carlos Oliveira Editado', 'carlos@gmail.com', '$2y$10$FUenrS2ZbqTdR/ajVDPtmeZNvseMps6q5y/avDQ2r4iqhlwbtGapK', '2021-11-14 19:01:29', '2021-11-14 20:01:29'),
(3, 'Nicolas', 'nicolas@gmail.com', '', '2021-11-14 15:50:05', '2021-11-14 16:50:05'),
(4, 'Kaio Mendes', 'kaio@gmail.com', '$2y$10$Dyrv8sx6Dj7VO6ylNXRok.HK.JpZgX4PwHfso8HO3mtJYI.kWJ8Om', '2021-11-15 15:21:30', '2021-11-15 16:21:30'),
(5, 'João Gomes', 'joao@gmail.com', '$2y$10$rxLkuubkDUhkVuWA6rsOgO4iX4ZMK1Bb5HibaTfme1/lU5fOwPqkC', '2021-11-13 20:22:39', '2021-11-13 20:22:39'),
(6, 'Marcos Lucas', 'marcos@gmail.com', '', '2021-11-14 15:50:28', '2021-11-14 16:50:28'),
(7, 'Ana Júlia', 'ana@gmail.com', '$2y$10$WBR7uyAZrvjf53iw5c.RzenmGH13dy8NepoNqD8T2ut1vvsX1cSlq', '2021-11-13 20:23:24', '2021-11-13 20:23:24'),
(8, 'Jaime Oliveira', 'jaime@gmail.com', '$2y$10$NcqaWkpTwAZSYNajih95betKaFbD02qwekHsDmDdEg0RsxlniRc0m', '2021-11-14 20:06:24', '2021-11-14 20:06:24'),
(10, 'Nicole Dantas', 'nicole@gmail.com', '$2y$10$Rd6EUhj31JyvMIXi8CQ/xudMHhO7GgIId1LWfR28GxdtLwrKoITvm', '2021-11-14 20:07:19', '2021-11-14 20:07:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users_roles`
--

INSERT INTO `users_roles` (`id`, `user_id`, `role_id`) VALUES
(9, 1, 1),
(10, 4, 2);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`shipping_address_id`) REFERENCES `client_adresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`billing_address_id`) REFERENCES `client_adresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `client_adresses`
--
ALTER TABLE `client_adresses`
  ADD CONSTRAINT `client_adresses_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `client_cards`
--
ALTER TABLE `client_cards`
  ADD CONSTRAINT `client_cards_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `galery_images`
--
ALTER TABLE `galery_images`
  ADD CONSTRAINT `galery_images_ibfk_1` FOREIGN KEY (`galery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `notices_subcategories`
--
ALTER TABLE `notices_subcategories`
  ADD CONSTRAINT `notices_subcategories_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notices_subcategories_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `products_related`
--
ALTER TABLE `products_related`
  ADD CONSTRAINT `products_related_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_related_ibfk_2` FOREIGN KEY (`product_related_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `products_subcategories`
--
ALTER TABLE `products_subcategories`
  ADD CONSTRAINT `products_subcategories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_subcategories_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD CONSTRAINT `product_discounts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`request_address_id`) REFERENCES `request_address` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`request_payment_id`) REFERENCES `request_payment` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `requests_products`
--
ALTER TABLE `requests_products`
  ADD CONSTRAINT `requests_products_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `subcomments`
--
ALTER TABLE `subcomments`
  ADD CONSTRAINT `subcomments_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `system`
--
ALTER TABLE `system`
  ADD CONSTRAINT `system_ibfk_1` FOREIGN KEY (`system_address_id`) REFERENCES `system_address` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_2` FOREIGN KEY (`system_contact_id`) REFERENCES `system_contact` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_3` FOREIGN KEY (`system_floater_id`) REFERENCES `system_floater` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_4` FOREIGN KEY (`system_social_id`) REFERENCES `system_social` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_5` FOREIGN KEY (`system_lgpd_id`) REFERENCES `system_lgpd` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_6` FOREIGN KEY (`system_store_id`) REFERENCES `system_store` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_7` FOREIGN KEY (`system_ftp_id`) REFERENCES `system_ftp` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `system_freight_custom`
--
ALTER TABLE `system_freight_custom`
  ADD CONSTRAINT `system_freight_custom_ibfk_1` FOREIGN KEY (`system_freight_id`) REFERENCES `system_freight` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `system_store`
--
ALTER TABLE `system_store`
  ADD CONSTRAINT `system_store_ibfk_1` FOREIGN KEY (`system_pagseguro_id`) REFERENCES `system_pagseguro` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_store_ibfk_2` FOREIGN KEY (`system_freight_id`) REFERENCES `system_freight` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_store_ibfk_3` FOREIGN KEY (`system_picpay_id`) REFERENCES `system_picpay` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_store_ibfk_4` FOREIGN KEY (`system_mercadopago_id`) REFERENCES `system_mercadopago` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
