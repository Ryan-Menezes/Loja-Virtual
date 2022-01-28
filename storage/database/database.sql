-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Jan-2022 às 21:01
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

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

CREATE TABLE `banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `clients` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `validated` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address_id` int(10) UNSIGNED DEFAULT NULL,
  `billing_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `client_adresses` (
  `id` int(11) UNSIGNED NOT NULL,
  `postal_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complement` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` tinyint(100) UNSIGNED NOT NULL,
  `expiration` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `percent`, `expiration`) VALUES
(5, 'FESTA', 20, '2022-01-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoiments`
--

CREATE TABLE `depoiments` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `depoiments`
--

INSERT INTO `depoiments` (`id`, `name`, `content`, `visible`) VALUES
(1, 'Ryan Menezes', 'OK', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `galery_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(191) NOT NULL,
  `galery_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lgpd`
--

CREATE TABLE `lgpd` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notices`
--

CREATE TABLE `notices` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `comments_active` tinyint(1) NOT NULL DEFAULT 1,
  `visits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` date DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `notices_subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `partners` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `type` enum('CL','CO') NOT NULL DEFAULT 'CO' COMMENT 'CL - Cliente | CO - Colaborador ',
  `image` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `ratings_active` tinyint(1) NOT NULL DEFAULT 1,
  `freight_free` tinyint(1) NOT NULL DEFAULT 0,
  `showcase` tinyint(1) NOT NULL DEFAULT 0,
  `installment_no_interest` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `products_related` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_related_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `products_subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `product_colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `product_discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `installment` tinyint(3) UNSIGNED NOT NULL,
  `percent` tinyint(100) UNSIGNED NOT NULL,
  `expiration` date DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `installment`, `percent`, `expiration`, `product_id`) VALUES
(74, 4, 50, NULL, 37),
(80, 1, 50, NULL, 34),
(114, 1, 10, NULL, 41),
(115, 2, 5, NULL, 41),
(116, 3, 2, '2022-01-31', 41),
(117, 4, 2, NULL, 41);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `product_sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `price_previous` decimal(10,2) UNSIGNED DEFAULT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `width` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `height` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `depth` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `weight` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `product_color_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `stars` tinyint(5) UNSIGNED NOT NULL DEFAULT 5,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` enum('AP','PA','EN','CO','CA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AP' COMMENT 'AP - Aguardando Pagamento | PA - Pago | EN - Enviado para a entrega | CO - Concluído | CA - Cancelado',
  `client_id` int(10) UNSIGNED NOT NULL,
  `request_address_id` int(10) UNSIGNED NOT NULL,
  `request_payment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `requests`
--

INSERT INTO `requests` (`id`, `status`, `client_id`, `request_address_id`, `request_payment_id`, `created_at`, `updated_at`) VALUES
(82, 'CA', 9, 87, 88, '2022-01-26 18:48:28', '2022-01-26 18:48:30'),
(83, 'PA', 9, 88, 89, '2022-01-26 18:50:40', '2022-01-26 18:50:43'),
(84, 'PA', 9, 89, 90, '2022-01-26 18:51:45', '2022-01-26 18:51:48'),
(85, 'AP', 9, 90, 91, '2022-01-26 18:54:01', '2022-01-26 18:54:01'),
(86, 'AP', 9, 91, 92, '2022-01-26 18:54:32', '2022-01-26 18:54:32'),
(87, 'CA', 9, 92, 93, '2022-01-27 14:12:10', '2022-01-27 18:16:03'),
(88, 'CA', 9, 93, 94, '2022-01-27 19:02:29', '2022-01-28 19:51:14'),
(89, 'PA', 9, 94, 95, '2022-01-28 16:24:27', '2022-01-28 16:52:40'),
(90, 'PA', 9, 95, 96, '2022-01-28 17:04:25', '2022-01-28 17:08:17'),
(91, 'CA', 9, 96, 97, '2022-01-28 17:13:52', '2022-01-28 18:25:38'),
(92, 'CA', 9, 97, 98, '2022-01-28 17:59:43', '2022-01-28 18:35:46'),
(93, 'CA', 9, 98, 99, '2022-01-28 18:37:19', '2022-01-28 18:38:23'),
(94, 'CA', 9, 99, 100, '2022-01-28 18:42:53', '2022-01-28 19:45:47'),
(95, 'CA', 9, 100, 101, '2022-01-28 19:46:06', '2022-01-28 19:50:56'),
(96, 'CA', 9, 101, 102, '2022-01-28 19:48:28', '2022-01-28 19:50:50'),
(97, 'AP', 9, 102, 103, '2022-01-28 19:51:24', '2022-01-28 19:51:24'),
(98, 'AP', 9, 103, 104, '2022-01-28 19:52:32', '2022-01-28 19:52:32'),
(99, 'AP', 9, 104, 105, '2022-01-28 19:54:36', '2022-01-28 19:54:36'),
(100, 'AP', 9, 105, 106, '2022-01-28 19:57:27', '2022-01-28 19:57:27'),
(101, 'AP', 9, 106, 107, '2022-01-28 19:59:36', '2022-01-28 19:59:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `requests_products`
--

CREATE TABLE `requests_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(102, 'Preto', 'M', '500.00', 1, 87, 40),
(103, 'Preto', '12 Polegadas', '800.30', 1, 88, 41),
(104, 'Preto', 'M', '500.00', 1, 88, 40),
(105, 'Preto', '12 Polegadas', '800.30', 1, 89, 41),
(106, 'Preto', 'M', '500.00', 1, 89, 40),
(107, 'Preto', '10x40', '800.00', 1, 89, 39),
(108, 'Preto', 'M', '500.00', 1, 90, 40),
(109, 'Preto', '12 Polegadas', '800.30', 1, 90, 41),
(110, 'Preto', '10x40', '800.00', 1, 90, 39),
(111, 'Preto', '10x60x20', '8000.00', 3, 91, 37),
(112, 'Preto', '12 Polegadas', '800.30', 1, 92, 41),
(113, 'Preto', '12 Polegadas', '800.30', 1, 93, 41),
(114, 'Preto', '10x40', '800.00', 1, 94, 39),
(115, 'Preto', 'M', '500.00', 1, 95, 40),
(116, 'Preto', '10x40', '800.00', 1, 95, 39),
(117, 'Preto', 'M', '500.00', 1, 96, 40),
(118, 'Preto', '12 Polegadas', '800.30', 1, 97, 41),
(119, 'Preto', 'M', '500.00', 1, 97, 40),
(120, 'Preto', '10x40', '800.00', 1, 98, 39),
(121, 'Preto', 'M', '500.00', 1, 98, 40),
(122, 'Preto', '10x40', '800.00', 1, 99, 39),
(123, 'Preto', 'M', '500.00', 1, 99, 40),
(124, 'Preto', '10x40', '800.00', 1, 100, 39),
(125, 'Preto', '12 Polegadas', '800.30', 1, 101, 41),
(126, 'Preto', 'M', '500.00', 1, 101, 40);

-- --------------------------------------------------------

--
-- Estrutura da tabela `request_address`
--

CREATE TABLE `request_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `postal_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complement` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(92, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(93, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(94, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(95, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(96, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(97, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(98, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(99, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(100, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(101, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(102, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(103, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(104, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(105, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(106, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `request_payment`
--

CREATE TABLE `request_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('PS','MP','PP','PC') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PS - PagSeguro | MP - Mercado Pago | PP - PayPal | PC - PicPay',
  `method` enum('CC','CD','BA','BO','DE','DO','PX','PP') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CC - Cartão de Crédito | CD - Cartão de Débito | BA - Saldo | BO - Boleto | DE - Depósito | DO - Débito Online | PX - PIX | PP - PayPal',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_type` enum('AP','EA','PA','DI','ED','DE','CA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AP' COMMENT 'AP - Aguardando Pagamento | EA - Em Análise | PA - Paga | DI - Disponível | ED - Em Disputa | DE - Devolvida | CA - Cancelada',
  `installments` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `installment_no_interest` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `discount_coupon` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_installment` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_cart` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_type` enum('PC','SX','PE') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PC - PAC | SX - SEDEX | PE - Personalizado',
  `shipping_value` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_days` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `shipping_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrcode` longblob DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `request_payment`
--

INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `details`, `created_at`, `updated_at`) VALUES
(88, NULL, 'PC', 'PX', 'expired', 'CA', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"referenceId\":\"82\",\"status\":\"expired\",\"createdAt\":\"2022-01-26T14:38:11.000000Z\",\"updatedAt\":\"2022-01-26T16:29:18.000000Z\",\"value\":150}', '2022-01-26 18:48:28', '2022-01-26 18:48:30'),
(89, '097F0BAB-BEDC-4055-A658-1DB4813172B0', 'PS', 'DO', '3', 'PA', 1, 2, '16000.00', '3200.00', '45.50', '1600.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=468836efe0b8fcf5b8d903c498604b0591b6bf8a6dfc4488ef0ff825e0e4396bb324d1ef6ca02268', NULL, '{\"date\":\"2022-01-26T12:23:57.000-03:00\",\"code\":\"097F0BAB-BEDC-4055-A658-1DB4813172B0\",\"reference\":\"83\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-26T12:25:50.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=468836efe0b8fcf5b8d903c498604b0591b6bf8a6dfc4488ef0ff825e0e4396bb324d1ef6ca02268\",\"grossAmount\":\"1060.00\",\"discountAmount\":\"45.50\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"50.62\"},\"netAmount\":\"963.48\",\"extraAmount\":\"-390.00\",\"escrowEndDate\":\"2022-02-09T12:25:50.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"d1d6a7eae40b025e869ac0853049efc2\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"2686b822a1b95a0940e608accafd292a\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:50:40', '2022-01-26 18:50:43'),
(90, 'A1CFDD09-B06B-4085-A931-656939C7D272', 'PS', 'DO', '3', 'PA', 1, 2, '8000.00', '1600.00', '1903.89', '800.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=86812bdb74e28be7824d4ea87838ce036a4b8b11d7ced6c7989210b5cde4b3c1229bd8ca33eec9a1', NULL, '{\"date\":\"2022-01-26T15:17:41.000-03:00\",\"code\":\"A1CFDD09-B06B-4085-A931-656939C7D272\",\"reference\":\"84\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-26T15:18:07.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=86812bdb74e28be7824d4ea87838ce036a4b8b11d7ced6c7989210b5cde4b3c1229bd8ca33eec9a1\",\"grossAmount\":\"954.19\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"47.61\"},\"netAmount\":\"906.18\",\"extraAmount\":\"-496.11\",\"escrowEndDate\":\"2022-02-09T15:18:07.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"69db61ce36a56178711fec066e07aeb6\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"62306523b3c77c077b2938f0d6ab91f5\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:51:45', '2022-01-26 18:51:48'),
(91, '04CDAB4F-10F8-4873-A6F4-0DD103251E76', 'PS', 'CC', '6', 'DE', 6, 2, '9300.00', '1860.00', '2400.00', '930.00', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"date\":\"2022-01-26T15:20:07.000-03:00\",\"code\":\"04CDAB4F-10F8-4873-A6F4-0DD103251E76\",\"reference\":\"85\",\"type\":\"1\",\"status\":\"6\",\"lastEventDate\":\"2022-01-26T15:24:17.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"1060.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"86.50\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"52.89\"},\"netAmount\":\"920.21\",\"extraAmount\":\"-390.00\",\"escrowEndDate\":\"2022-02-09T15:22:53.000-03:00\",\"installmentCount\":\"6\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"9d12d071c18b535cda26f47f20e5c7ae\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"2a8009525763356ad5e3bb48b7475b4d\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:54:01', '2022-01-26 18:54:03'),
(92, NULL, NULL, NULL, NULL, 'AP', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '2022-01-26 18:54:32', '2022-01-26 18:54:32'),
(93, NULL, 'PC', 'PX', 'expired', 'CA', 1, 2, '1300.30', '260.06', '106.02', '130.03', 'PE', '150.00', 5, NULL, 'https://app.picpay.com/checkout/NjFmMmUxMDJhNjc0ZWIyYzBhM2UyYjI4', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141415a414141414751434149414141415033614762414141414358424957584d41414137454141414f784147564b7734624141414c48306c45515652346e4f33643230356a4f525246556170552f2f2f4a714e2b376a655353653138576a50454d4f53454a553066796a763372382f507a41794442372b6b6e4148424c734941596767584545437767686d41424d51514c6943465951417a42416d494946684244734941596767584545437767686d41424d51514c6943465951417a42416d494946684244734941596767584545437767686d41424d51514c6943465951417a42416d49494668424473494159676758452b4650786f4c392f722b7667352b666e35552f65502f6e6a5978352f2f66377139783566354d656e5650466e566e78736f6c2f352b7863352b6a2f7572367a374f77472b496c6841444d45435967675745454f77674269434263516f475773344b6c726d2f4b2f374a6437485a65505a4359614b3565324b6b593548625265366635456635784c61526841572f7366394439647175784c41493845435967675745454f7767426943426351514c43424733316a4430657957412f652f506a7573384c6774784f506965735856377a302b7a38664876502f31696747494372502f63652f63595145784241754949566841444d45435967675745454f7767426a445977327a4b74626d4b3459415a6c66484b353738374c595146527479564978666a4d38514c4f514f433467685745414d77514a6943425951513743414749494678506a525977327a612f4e7450336e763866794f783539382f4e76625a6b66756d57443433376e44416d494946684244734941596767584545437767686d41424d596248476d5a58633974573853753248486855636472467659707a4d53716530757a684978585335796663595145784241754949566841444d45435967675745454f77674268395977327a712f6a3332725a77614c7636374c42437852344d733164766d77785965434c4a75472f344a7748666c5741424d51514c6943465951417a42416d49494668436a5a4b776835527668432b635348682f7a3375795a4377764e7a6e6c5566454b2b4a58645951417a42416d49494668424473494159676758454543776752736c5951397658784263653770447946666e4835316e785a375a746a6242777734504854334c304a68392f4a654f2f432b4244734941676767584545437767686d41424d51514c694c46787434614679374570712f68744a3268552f50713978354d706a6f3550366645546b764c7239385a6e4864786841544545433467685745414d77514a694342595151374341474c387156682f6256736358616c7577663153785a44373770662f5a557a6c6d5037514c6e3779784275436e45797767686d41424d51514c6943465951417a42416d4b556a445538616c767a7274697459654542422f66615a6c7a6158766d4b575965465177414c6e314b526466387a414638524c434347594145784241754949566841444d45435976534e4e63782b51582f3264495a486266736c564667344b6e482f6d4c4e6d427773366a356134742b354e4176694b594145784241754949566841444d454359676757454f505039424e34556e475377717a5a45783857546b58635737686a5164756e7275324e472f382f57766578412f694b594145784241754949566841444d45435967675745474e3474345a4843383849534e6b42346c48305a672f333274366a697447544e7031507952305745454f7767426943426351514c434347594145784241754955624a62772b78582b64746d48653466632b47333969742b6665452b4247337a4b473350632b456f547964335745414d77514a69434259515137434147494946784241734945624a5745506274387772766b792f384869466f396e644c3259583178634f6c4e784c6d544a5a2b4e4a39754d4d436767675745454f7767426943426351514c434347594145782b673668574768324b714a746234504871332b2f2b596d466e2f6e5a62545a32546a416375634d435967675745454f7767426943426351514c434347594145784e6835434d627546772f30524134396d427941654c647a5834616a7445496f3273794d493478396164316841444d45435967675745454f7767426943426351514c4342473332344e4656386f50337063696d37624871427468586a684268494c333650374339314c4f64446b61505a442b355867467854346151514c6943465951417a42416d494946684244734941594a627331564b6a59576546783554566c7334665a437a3375367a44376c4f363148662b524d6f64557842305745454f7767426943426351514c43434759414578424175493054665738454f4f6c6a697157417875573243653356476a5976546b3063494a686f716e315059652f5256335745414d77514a69434259515137434147494946784241734945624a49525452652b38667a523661384c6a41765042776833757a692b7356463670343479727333465869753555462b4d5945433467685745414d77514a6943425951513743414743566a446663656c336a62646f413471706768754e65325a38446a5939356671474a7076324a746676616a7550424378686f414467514c6943465951417a42416d4949466842447349415966596451334b2b6e5071356b507936795070356855624532582f47742f6262486242737365487a4d364e4d5a326a377a73314e51482b367767434343426351514c4343475941457842417549495668416a4c3678686f58664d722b2f304f797777754e6b774d4b7445576274584c422f6b664b5a662b634f433467685745414d77514a69434259515137434147494946784e69345738507359315a6f5733572b762f726a536e62624b7a39374e73536a78386d56746c632b614b516a3478386534454f7767434343426351514c434347594145784241754955544c575550486c37396e392f47655056356964594c692f30464846307636396976306e326b593632715933466b3645664d556446684244734941596767584545437767686d41424d51514c6950467234654a6c3942344d7336764f7336634a7a4536757046786f346363375a66654c4433645951424442416d49494668424473494159676758454543776752743959772b7a47444c50722f55635663776d7a757a5573334271686255654e783665557373484a2b4b79444f797767686d41424d51514c6943465951417a42416d49494668426a3432344e6a7861754f732f4f45455476363944326b30634c7a2b3959754c4e4335395864595145784241754949566841444d45435967675745454f776742682f4b68353064693335636456353462344f5277753357336938304f794c5850454a656254776c4a4e7837724341474949467842417349495a6741544545433467685745434d6b7430614675354463502f72523750722f52555875746532356c307844584f556373704a78527433663647646530573477774a694342595151374341474949467842417349495a6741544532486b495266597245374f7535634c6547364b7458504d2f5a777a4965663333384d2b384f433467685745414d77514a6943425951513743414749494678436735684f4c6f63554830667046316470662b326258352b352b635851692f742f44736b725a562f4c5a5038694f374e5141634342595151374341474949467842417349495a674154464b7868706d6877416531366662546a31494f572f692f6b495637337662795252486266736c7a46366f6252626e586377544252417349495a6741544545433467685745414d77514a69444f2f57634e533273384c39727a397147344359585a392b66504a7475794173584e7166485a465a2b494a385a654e7a416a67534c434347594145784241754949566841444d45435976534e4e5278567247512f507562436f5971323878455748693378714f3344384867655374747544592b504f587371783463374c434349594145784241754949566841444d454359676757454f4e5832354a6b32334c737665697a4952592b35714f4b66523153706b7a616a7639596550572f3467344c6943465951417a42416d49494668424473494159676758454742357275446537346e367659734f446c4e47546969474174744d5a5a76644c754e663249752f386a334f48426351514c434347594145784241754949566841444d45435970534d4e63784f4d4c534e43387975347439622b4a54757a523741556647555a6c2f506f36425a68335776486342584241754949566841444d45435967675745454f7767426839757a55734e487534513975793863494e4a4e704f44326e6261754a657969752f6334735264316841444d45435967675745454f7767426943426351514c4344476e346f4854666b2b2b6c48626b3239624e6d37624d364269554b4e744969526c5a34576a7878636b614c5970342f30412b4241734949686741544545433467685745414d77514a696c497731484c55746e565a4d4272536455504334754c3777774968486a332f52347874584d58725364733749766366505a7964335745414d77514a694342595151374341474949467842417349456266574d4e527858372b6a31642f584d31744f31726933754f6b7866456e4636374e5031356f34596b6b39342f35714f49543468414b344b63544c434347594145784241754949566841444d4543596779504e5378554d576c5273554c6339704e4846584d657338397a3967794c32534d77646b3477484c6e44416d494946684244734941596767584545437767686d41424d5977312f467646476d3346462f526e6e2b66434266754b493058754c2f54344873324f4331534d695252786877584545437767686d41424d51514c6943465951417a42416d494d6a7a574d72354b2b6546794b72766a623237376666315478743065667a74426d34565345517969416e30367767426943426351514c4343475941457842417549305466574d4c76696675392b6a6262743349473267786a75663731743269426c78344b4b4e2b366f596f5a673967694d76374c784f5145634352595151374341474949467842417349495a674154462b52652b584150776f37724341474949467842417349495a6741544545433467685745414d77514a694342595151374341474949467842417349495a6741544545433467685745414d77514a694342595151374341474949467842417349495a6741544545433467685745414d77514a694342595151374341474949467842417349495a674154482b4161542f74435449695841564141414141456c46546b5375516d4343, '{\"referenceId\":\"request_87\",\"status\":\"expired\",\"createdAt\":\"2022-01-27T18:14:26.000000Z\",\"updatedAt\":\"2022-01-27T23:07:43.000000Z\",\"value\":954.19}', '2022-01-27 14:12:10', '2022-01-28 14:53:46'),
(94, '1245707677', 'MP', 'CC', 'approved', 'PA', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-28T10:31:21.000-04:00\",\"date_last_updated\":\"2022-01-28T10:31:21.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"503143\",\"id\":null,\"last_four_digits\":\"6351\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T10:31:21.628-04:00\",\"date_created\":\"2022-01-28T10:31:21.516-04:00\",\"date_last_updated\":\"2022-01-28T10:31:21.628-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_88\",\"fee_details\":[{\"amount\":72.37,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245707677,\"installments\":1,\"integrator_id\":null,\"issuer_id\":\"24\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T10:31:21.628-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"master\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"approved\",\"status_detail\":\"accredited\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450.3,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1450.3,\"net_received_amount\":1377.93,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1450.3}}', '2022-01-27 19:02:29', '2022-01-28 19:51:14'),
(95, '1245710612', 'MP', 'CC', 'refunded', 'DE', 5, 2, '2100.30', '420.06', '0.00', '210.03', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"640.27001953125\"},{\"category_id\":null,\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Headset\",\"unit_price\":\"339.9700012207031\"},{\"category_id\":null,\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Celular LG K4\",\"unit_price\":\"639.969970703125\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menzes\"},\"date_created\":\"2022-01-28T12:52:40.000-04:00\",\"date_last_updated\":\"2022-01-28T12:52:40.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"375365\",\"id\":null,\"last_four_digits\":\"6885\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T12:52:41.105-04:00\",\"date_created\":\"2022-01-28T12:52:40.901-04:00\",\"date_last_updated\":\"2022-01-28T15:51:13.784-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_89\",\"fee_details\":[{\"amount\":193.29,\"fee_payer\":\"payer\",\"type\":\"financing_fee\"},{\"amount\":80.85,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245710612,\"installments\":5,\"integrator_id\":null,\"issuer_id\":\"18\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T12:52:41.105-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044161236\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"amex\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":1620.21,\"date_created\":\"2022-01-28T15:51:13.784-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245701830,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245710612,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1620.21,\"transaction_amount_refunded\":1620.21,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":362.7,\"net_received_amount\":1539.36,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1813.5}}', '2022-01-28 16:24:27', '2022-01-28 19:51:08'),
(96, '1245710695', 'MP', 'CC', 'refunded', 'DE', 2, 2, '2100.30', '420.06', '0.00', '210.03', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-28T13:08:15.000-04:00\",\"date_last_updated\":\"2022-01-28T13:08:15.000-04:00\",\"expiration_month\":12,\"expiration_year\":2030,\"first_six_digits\":\"503143\",\"id\":null,\"last_four_digits\":\"6351\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T13:08:15.113-04:00\",\"date_created\":\"2022-01-28T13:08:15.004-04:00\",\"date_last_updated\":\"2022-01-28T15:51:06.211-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_90\",\"fee_details\":[{\"amount\":152.12,\"fee_payer\":\"payer\",\"type\":\"financing_fee\"},{\"amount\":112.29,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245710695,\"installments\":2,\"integrator_id\":null,\"issuer_id\":\"24\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T13:08:15.113-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"master\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":2250.3,\"date_created\":\"2022-01-28T15:51:06.211-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245702646,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245710695,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":2250.3,\"transaction_amount_refunded\":2250.3,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1201.21,\"net_received_amount\":2138.01,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":2402.42}}', '2022-01-28 17:04:25', '2022-01-28 19:51:01'),
(97, '1245711654', 'MP', 'CC', 'refunded', 'DE', 12, 2, '24000.00', '4800.00', '0.00', '2400.00', 'PE', '150.00', 5, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"id\":null,\"picture_url\":null,\"quantity\":\"3\",\"title\":\"PC Gamer Completo\",\"unit_price\":\"5650.0\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-28T13:39:06.000-04:00\",\"date_last_updated\":\"2022-01-28T13:39:06.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"423564\",\"id\":null,\"last_four_digits\":\"5682\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T13:39:06.114-04:00\",\"date_created\":\"2022-01-28T13:39:06.006-04:00\",\"date_last_updated\":\"2022-01-28T14:25:03.667-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":\"PC Gamer Completo\",\"differential_pricing_id\":null,\"external_reference\":\"request_91\",\"fee_details\":[{\"amount\":4025.63,\"fee_payer\":\"payer\",\"type\":\"financing_fee\"},{\"amount\":845.81,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245711654,\"installments\":12,\"integrator_id\":null,\"issuer_id\":\"25\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T13:39:06.114-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044464681\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"visa\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":16950,\"date_created\":\"2022-01-28T14:25:03.667-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245702563,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245711654,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":16950,\"transaction_amount_refunded\":16950,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1747.97,\"net_received_amount\":16104.19,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":20975.63}}', '2022-01-28 17:13:52', '2022-01-28 18:26:11'),
(98, '1245712070', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245712070&payment_method_reference_id=9913831236&caller_id=130141172&hash=721c89b5-f9a9-490c-abe1-f8950dce3d4e', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"710.2100219726562\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"barcode\":{\"content\":\"23794888200000710213380260991383123600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T14:00:22.127-04:00\",\"date_last_updated\":\"2022-01-28T14:35:26.351-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_92\",\"fee_details\":[],\"id\":1245712070,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044595398\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":710.21,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245712070&payment_method_reference_id=9913831236&caller_id=130141172&hash=721c89b5-f9a9-490c-abe1-f8950dce3d4e\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913831236\",\"total_paid_amount\":710.21,\"verification_code\":\"9913831236\"}}', '2022-01-28 17:59:43', '2022-01-28 18:35:46'),
(99, '1245712444', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245712444&payment_method_reference_id=9913848054&caller_id=130141172&hash=08e5dcb3-b651-4751-bcec-7caa96269d83', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"710.2100219726562\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"barcode\":{\"content\":\"23792888200000710213380260991384805400633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T14:37:59.532-04:00\",\"date_last_updated\":\"2022-01-28T14:38:28.349-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_93\",\"fee_details\":[],\"id\":1245712444,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044820347\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":710.21,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245712444&payment_method_reference_id=9913848054&caller_id=130141172&hash=08e5dcb3-b651-4751-bcec-7caa96269d83\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913848054\",\"total_paid_amount\":710.21,\"verification_code\":\"9913848054\"}}', '2022-01-28 18:37:19', '2022-01-28 18:38:44'),
(100, '1245712932', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '800.00', '160.00', '0.00', '80.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245712932&payment_method_reference_id=9913881315&caller_id=130141172&hash=aae64c7d-d808-4b41-9538-928e065af5ad', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888200000950003380260991388131500633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:44:13.230-04:00\",\"date_last_updated\":\"2022-01-28T15:45:52.028-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_94\",\"fee_details\":[],\"id\":1245712932,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":950,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245712932&payment_method_reference_id=9913881315&caller_id=130141172&hash=aae64c7d-d808-4b41-9538-928e065af5ad\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913881315\",\"total_paid_amount\":950,\"verification_code\":\"9913881315\"}}', '2022-01-28 18:42:53', '2022-01-28 19:45:47'),
(101, '1245713812', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245713812&payment_method_reference_id=9913882833&caller_id=130141172&hash=ac643fc7-b539-4c61-985d-7b9a03a959d4', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888200001450003380260991388283300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:46:37.496-04:00\",\"date_last_updated\":\"2022-01-28T15:51:00.894-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_95\",\"fee_details\":[],\"id\":1245713812,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245713812&payment_method_reference_id=9913882833&caller_id=130141172&hash=ac643fc7-b539-4c61-985d-7b9a03a959d4\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913882833\",\"total_paid_amount\":1450,\"verification_code\":\"9913882833\"}}', '2022-01-28 19:46:06', '2022-01-28 19:50:56'),
(102, '1245713829', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '500.00', '100.00', '0.00', '50.00', 'PE', '0.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245713829&payment_method_reference_id=9913883926&caller_id=130141172&hash=27d70b50-0743-47e2-bc5b-c2339bbed704', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23793888200000500003380260991388392600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:48:54.901-04:00\",\"date_last_updated\":\"2022-01-28T15:50:55.901-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_96\",\"fee_details\":[],\"id\":1245713829,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":500,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245713829&payment_method_reference_id=9913883926&caller_id=130141172&hash=27d70b50-0743-47e2-bc5b-c2339bbed704\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913883926\",\"total_paid_amount\":500,\"verification_code\":\"9913883926\"}}', '2022-01-28 19:48:28', '2022-01-28 19:50:50'),
(103, '1245714017', 'MP', 'BO', 'pending', 'AP', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245714017&payment_method_reference_id=9913885283&caller_id=130141172&hash=02b9be73-edd5-41cc-92bf-422493bf9abf', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888200001450303380260991388528300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:51:43.857-04:00\",\"date_last_updated\":\"2022-01-28T15:51:43.857-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_97\",\"fee_details\":[],\"id\":1245714017,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450.3,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245714017&payment_method_reference_id=9913885283&caller_id=130141172&hash=02b9be73-edd5-41cc-92bf-422493bf9abf\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913885283\",\"total_paid_amount\":1450.3,\"verification_code\":\"9913885283\"}}', '2022-01-28 19:51:24', '2022-01-28 19:52:09'),
(104, '1245714024', 'MP', 'BO', 'pending', 'AP', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245714024&payment_method_reference_id=9913886073&caller_id=130141172&hash=837e3ee1-a909-4ef6-a209-21ae5f3e3170', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888200001450003380260991388607300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:53:31.748-04:00\",\"date_last_updated\":\"2022-01-28T15:53:31.748-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_98\",\"fee_details\":[],\"id\":1245714024,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245714024&payment_method_reference_id=9913886073&caller_id=130141172&hash=837e3ee1-a909-4ef6-a209-21ae5f3e3170\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913886073\",\"total_paid_amount\":1450,\"verification_code\":\"9913886073\"}}', '2022-01-28 19:52:32', '2022-01-28 19:54:13');
INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `details`, `created_at`, `updated_at`) VALUES
(105, '1245713866', 'MP', 'BO', 'pending', 'AP', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245713866&payment_method_reference_id=9913886656&caller_id=130141172&hash=3f73f994-deff-404d-83ae-aeaa263bcadb', NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23794888200001450003380260991388665600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:54:54.284-04:00\",\"date_last_updated\":\"2022-01-28T15:54:54.284-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_99\",\"fee_details\":[],\"id\":1245713866,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245713866&payment_method_reference_id=9913886656&caller_id=130141172&hash=3f73f994-deff-404d-83ae-aeaa263bcadb\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913886656\",\"total_paid_amount\":1450,\"verification_code\":\"9913886656\"}}', '2022-01-28 19:54:36', '2022-01-28 19:55:51'),
(106, NULL, NULL, NULL, NULL, 'AP', 1, 2, '800.00', '160.00', '0.00', '80.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '2022-01-28 19:57:27', '2022-01-28 19:57:27'),
(107, NULL, NULL, NULL, NULL, 'AP', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '2022-01-28 19:59:36', '2022-01-28 19:59:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `roles_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `slideshow` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `subcomments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `subcomments`
--

INSERT INTO `subcomments` (`id`, `name`, `email`, `content`, `visible`, `comment_id`, `created_at`, `updated_at`) VALUES
(3, 'Electro', 'menezesryan1010@gmail.com', 'Que ótimo que gostou!!!', 1, 10, '2021-12-20 18:17:58', '2021-12-20 18:18:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` char(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `system_address_id` int(10) UNSIGNED NOT NULL,
  `system_contact_id` int(10) UNSIGNED NOT NULL,
  `system_social_id` int(10) UNSIGNED NOT NULL,
  `system_store_id` int(10) UNSIGNED NOT NULL,
  `system_lgpd_id` int(10) UNSIGNED NOT NULL,
  `system_floater_id` int(10) UNSIGNED NOT NULL,
  `system_ftp_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system`
--

INSERT INTO `system` (`id`, `name`, `cnpj`, `keywords`, `description`, `maintenance`, `system_address_id`, `system_contact_id`, `system_social_id`, `system_store_id`, `system_lgpd_id`, `system_floater_id`, `system_ftp_id`) VALUES
(1, 'Electro', '48498411498849', 'loja virtual, eletrônicos, vestimentas', 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id', 0, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_address`
--

CREATE TABLE `system_address` (
  `id` int(11) UNSIGNED NOT NULL,
  `postal_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_address`
--

INSERT INTO `system_address` (`id`, `postal_code`, `street`, `number`, `district`, `city`, `state`, `latitude`, `longitude`, `complement`) VALUES
(1, '12345678', 'Rua Nova', '15', 'Novo Bairro', 'São Paulo', 'SP', '', '', 'Novo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_contact`
--

CREATE TABLE `system_contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_contact`
--

INSERT INTO `system_contact` (`id`, `email`, `telephone`, `cell`) VALUES
(1, 'electro@gmail.com', '1199999999', '11999999999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_floater`
--

CREATE TABLE `system_floater` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_floater`
--

INSERT INTO `system_floater` (`id`, `active`, `image`, `link`) VALUES
(1, 0, 'floater/2ab8c87d70f1d01903818ff0a2977881.jpg', 'http://www.lojavirtual.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_freight`
--

CREATE TABLE `system_freight` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('C','P') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'C - Correios | P - Personalizado',
  `postal_code_origin` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_freight`
--

INSERT INTO `system_freight` (`id`, `type`, `postal_code_origin`) VALUES
(1, 'P', '04796355');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_freight_custom`
--

CREATE TABLE `system_freight_custom` (
  `id` int(10) UNSIGNED NOT NULL,
  `postal_code_min` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code_max` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) UNSIGNED NOT NULL,
  `days` tinyint(3) UNSIGNED NOT NULL,
  `system_freight_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_freight_custom`
--

INSERT INTO `system_freight_custom` (`id`, `postal_code_min`, `postal_code_max`, `value`, `days`, `system_freight_id`) VALUES
(457, '11111111', '22222222', '150.00', 5, 1),
(458, '33333333', '44444444', '200.00', 10, 1),
(459, '55555555', '66666666', '5.00', 5, 1),
(460, '66666666', '77777777', '6.00', 5, 1),
(461, '88888888', '99999999', '7.00', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_ftp`
--

CREATE TABLE `system_ftp` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `url` varchar(191) DEFAULT NULL,
  `server` varchar(20) DEFAULT NULL,
  `port` smallint(3) UNSIGNED NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `directory` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_ftp`
--

INSERT INTO `system_ftp` (`id`, `active`, `url`, `server`, `port`, `username`, `password`, `directory`) VALUES
(1, 0, 'http://www.lojavirtual.com.br/', '111.111.111.111', 20, 'teste', 'teste', '/public_html/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_lgpd`
--

CREATE TABLE `system_lgpd` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `privacy_policy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_conditions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_policy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_lgpd`
--

INSERT INTO `system_lgpd` (`id`, `active`, `privacy_policy`, `terms_conditions`, `return_policy`) VALUES
(1, 1, 'privacy_policy/3d61171f4f54c377291b90c2f99d7cb8.pdf', 'terms_conditions/c4d2f9b886665667f91d38c1e51aaab7.pdf', 'return_policy/4a1523da17e127e718d312b9245a3bc7.pdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_mercadopago`
--

CREATE TABLE `system_mercadopago` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_checkout` enum('LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LR' COMMENT 'LR - Link de Redirecionamento | LB - LightBox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_mercadopago`
--

INSERT INTO `system_mercadopago` (`id`, `active`, `public_key`, `access_token`, `type_checkout`) VALUES
(1, 1, 'TEST-b373a2b1-7f2a-4f7c-b6f7-e815ea8797a5', 'TEST-1541154418522225-012712-072f7db6f08c326e64541943194176c7-774678190', 'LR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_pagseguro`
--

CREATE TABLE `system_pagseguro` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_checkout` enum('LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LR' COMMENT 'LR - Link de Redirecionamento | LB - LightBox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_pagseguro`
--

INSERT INTO `system_pagseguro` (`id`, `active`, `email`, `token`, `app_id`, `app_key`, `type_checkout`) VALUES
(1, 1, 'menezesryan1010@gmail.com', '97C3FCEEDB4C4AC1A8A90E17307260DA', '', '', 'LR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_picpay`
--

CREATE TABLE `system_picpay` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `token` varchar(191) DEFAULT NULL,
  `seller_token` varchar(191) DEFAULT NULL,
  `expiration_minutes` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_picpay`
--

INSERT INTO `system_picpay` (`id`, `active`, `token`, `seller_token`, `expiration_minutes`) VALUES
(1, 1, 'a83ecef9-11ce-4679-a2f3-06170f1dec91', '0fa6c571-16fd-45d7-afc9-41d630cbbf2c', 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_social`
--

CREATE TABLE `system_social` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discord` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_social`
--

INSERT INTO `system_social` (`id`, `facebook`, `instagram`, `twitter`, `linkedin`, `youtube`, `twitch`, `discord`, `whatsapp`) VALUES
(1, 'https://facebook.com', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_store`
--

CREATE TABLE `system_store` (
  `id` int(11) UNSIGNED NOT NULL,
  `cart_promotion` tinyint(1) NOT NULL DEFAULT 0,
  `cart_amount_promotion` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cart_discount_percent_promotion` tinyint(100) UNSIGNED NOT NULL DEFAULT 0,
  `cart_freight_free_promotion` tinyint(1) NOT NULL DEFAULT 0,
  `payment_type` enum('PS','MP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PS' COMMENT 'PS - PagSeguro | MP - Mercado Pago',
  `payment_checkout_transparent` tinyint(1) NOT NULL DEFAULT 1,
  `payment_production` tinyint(1) NOT NULL DEFAULT 0,
  `payment_credit_card` tinyint(1) NOT NULL DEFAULT 1,
  `payment_debit_card` tinyint(1) NOT NULL DEFAULT 1,
  `payment_balance` tinyint(1) NOT NULL DEFAULT 1,
  `payment_bolet` tinyint(1) NOT NULL DEFAULT 1,
  `payment_deposit` tinyint(1) NOT NULL DEFAULT 1,
  `payment_debit_online` tinyint(1) NOT NULL DEFAULT 1,
  `system_freight_id` int(10) UNSIGNED NOT NULL,
  `system_pagseguro_id` int(10) UNSIGNED NOT NULL,
  `system_mercadopago_id` int(10) UNSIGNED NOT NULL,
  `system_picpay_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_store`
--

INSERT INTO `system_store` (`id`, `cart_promotion`, `cart_amount_promotion`, `cart_discount_percent_promotion`, `cart_freight_free_promotion`, `payment_type`, `payment_checkout_transparent`, `payment_production`, `payment_credit_card`, `payment_debit_card`, `payment_balance`, `payment_bolet`, `payment_deposit`, `payment_debit_online`, `system_freight_id`, `system_pagseguro_id`, `system_mercadopago_id`, `system_picpay_id`) VALUES
(1, 1, '100.00', 10, 0, 'MP', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `users_roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users_roles`
--

INSERT INTO `users_roles` (`id`, `user_id`, `role_id`) VALUES
(9, 1, 1),
(10, 4, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `clients_ibfk_1` (`shipping_address_id`),
  ADD KEY `clients_ibfk_2` (`billing_address_id`);

--
-- Índices para tabela `client_adresses`
--
ALTER TABLE `client_adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_id` (`notice_id`);

--
-- Índices para tabela `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Índices para tabela `depoiments`
--
ALTER TABLE `depoiments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `galery_images`
--
ALTER TABLE `galery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galery_id` (`galery_id`);

--
-- Índices para tabela `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lgpd`
--
ALTER TABLE `lgpd`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `poster` (`poster`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `notices_subcategories`
--
ALTER TABLE `notices_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_id` (`notice_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Índices para tabela `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices para tabela `products_related`
--
ALTER TABLE `products_related`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_related_id` (`product_related_id`);

--
-- Índices para tabela `products_subcategories`
--
ALTER TABLE `products_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Índices para tabela `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `source` (`source`),
  ADD KEY `product_images_ibfk_1` (`product_color_id`);

--
-- Índices para tabela `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_color_id` (`product_color_id`);

--
-- Índices para tabela `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Índices para tabela `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `request_address_id` (`request_address_id`),
  ADD KEY `request_payment_id` (`request_payment_id`);

--
-- Índices para tabela `requests_products`
--
ALTER TABLE `requests_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `product_size_id` (`product_id`);

--
-- Índices para tabela `request_address`
--
ALTER TABLE `request_address`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `request_payment`
--
ALTER TABLE `request_payment`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Índices para tabela `slideshow`
--
ALTER TABLE `slideshow`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices para tabela `subcomments`
--
ALTER TABLE `subcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Índices para tabela `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_address_id` (`system_address_id`),
  ADD KEY `settings_contact_id` (`system_contact_id`),
  ADD KEY `settings_floater_id` (`system_floater_id`),
  ADD KEY `settings_social_id` (`system_social_id`),
  ADD KEY `system_lgpd_id` (`system_lgpd_id`),
  ADD KEY `system_store_id` (`system_store_id`),
  ADD KEY `system_ftp_id` (`system_ftp_id`);

--
-- Índices para tabela `system_address`
--
ALTER TABLE `system_address`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_contact`
--
ALTER TABLE `system_contact`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_floater`
--
ALTER TABLE `system_floater`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_freight`
--
ALTER TABLE `system_freight`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_freight_custom`
--
ALTER TABLE `system_freight_custom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_freight_id` (`system_freight_id`);

--
-- Índices para tabela `system_ftp`
--
ALTER TABLE `system_ftp`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_lgpd`
--
ALTER TABLE `system_lgpd`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_mercadopago`
--
ALTER TABLE `system_mercadopago`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_pagseguro`
--
ALTER TABLE `system_pagseguro`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_picpay`
--
ALTER TABLE `system_picpay`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_social`
--
ALTER TABLE `system_social`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_store`
--
ALTER TABLE `system_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_pagseguro_id` (`system_pagseguro_id`),
  ADD KEY `system_store_ibfk_2` (`system_freight_id`),
  ADD KEY `system_picpay_id` (`system_picpay_id`),
  ADD KEY `system_mercadopago_id` (`system_mercadopago_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `client_adresses`
--
ALTER TABLE `client_adresses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `depoiments`
--
ALTER TABLE `depoiments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `galery_images`
--
ALTER TABLE `galery_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `lgpd`
--
ALTER TABLE `lgpd`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7185;

--
-- AUTO_INCREMENT de tabela `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `notices_subcategories`
--
ALTER TABLE `notices_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `products_related`
--
ALTER TABLE `products_related`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `products_subcategories`
--
ALTER TABLE `products_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de tabela `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT de tabela `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de tabela `requests_products`
--
ALTER TABLE `requests_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de tabela `request_address`
--
ALTER TABLE `request_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de tabela `request_payment`
--
ALTER TABLE `request_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT de tabela `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `subcomments`
--
ALTER TABLE `subcomments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_address`
--
ALTER TABLE `system_address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_contact`
--
ALTER TABLE `system_contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_floater`
--
ALTER TABLE `system_floater`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_freight`
--
ALTER TABLE `system_freight`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_freight_custom`
--
ALTER TABLE `system_freight_custom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT de tabela `system_ftp`
--
ALTER TABLE `system_ftp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_lgpd`
--
ALTER TABLE `system_lgpd`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_mercadopago`
--
ALTER TABLE `system_mercadopago`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_pagseguro`
--
ALTER TABLE `system_pagseguro`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_picpay`
--
ALTER TABLE `system_picpay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_social`
--
ALTER TABLE `system_social`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_store`
--
ALTER TABLE `system_store`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
