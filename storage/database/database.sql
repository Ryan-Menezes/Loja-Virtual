-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Jan-2022 às 00:12
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

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
-- Estrutura da tabela `client_cards`
--

CREATE TABLE `client_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvv` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` tinyint(2) UNSIGNED ZEROFILL NOT NULL,
  `year` year(2) NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'C' COMMENT 'C - Crédito | D- Débito',
  `cpf` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `telephone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `only_one_time` tinyint(1) NOT NULL DEFAULT 1,
  `expiration` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `percent`, `only_one_time`, `expiration`) VALUES
(5, 'FESTA', 20, 0, '2022-01-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoiments`
--

CREATE TABLE `depoiments` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(22, 9, 40);

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
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `notices`
--

INSERT INTO `notices` (`id`, `title`, `slug`, `tags`, `visible`, `comments_active`, `visits`, `description`, `content`, `poster`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'Novo restaurante em são paulo', 'novo-restaurante-em-sao-paulo', 'restaurante, novo, são paulo, sp, comida, vegetariano', 1, 1, 9, 'Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/fb85f10f77e2565d9ffec0b359555495.jpg\",\"title\":\"Restaurante Novo\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/609a4e2926f3e1269d71ce2789c96220.jpg\",\"title\":\"Nosso Restaurante\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/0d1da218ca0207586aab73ba278c02fa.jpg', 1, '2021-11-18 22:33:52', '2022-01-18 23:26:56'),
(4, 'Nasa descobre nova galáxia próxima da via láctea', 'nasa-descobre-nova-galaxia-proxima-da-via-lactea', 'espaço, galáxia, ciência, descobertas, nasa, astrologia', 1, 1, 21, 'Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/695e20d30861413a08de1e4a11cfa7bf.jpg\",\"title\":\"Gal\\u00e1xia XVL-96\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/e1a0ce048b5723f1f029dd854e69f63d.jpg\",\"title\":\"Via L\\u00e1ctea\"},{\"type\":\"image\",\"src\":\"notices\\/a849181c4d4b0ac37422ff0dd097e2bf.jpg\",\"title\":\"\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/27c28012bfe3da038f7e4767217026d7.jpg', 1, '2021-11-19 23:31:08', '2022-01-19 18:35:36'),
(5, 'Brasil empata com Argentina, porém garante vaga na copa do mundo de 2021', 'brasil-empata-com-argentina-porem-garante-vaga-na-copa-do-mundo-de-2021', 'Brasil, Argentina, Copa do Mundo, Eliminatórias da Copa, Empate', 1, 1, 5, 'Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"},{\"type\":\"image\",\"src\":\"notices\\/9dc1ee64bff5133015d28e7e6d6756ff.jpg\",\"title\":\"Brasil e Argentina\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/6356751c64193270f74e25f0ba2e2993.jpg', 1, '2021-11-18 21:49:06', '2022-01-19 18:29:47'),
(6, 'Novo cantor sertanejo está fazendo sucesso no Brasil', 'novo-cantor-sertanejo-esta-fazendo-sucesso-no-brasil', 'Música, Sertanejo, Brasil', 1, 1, 32, '33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli<\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/77e589aa2a21d24a553ccdea141568db.jpg\",\"title\":\"Titulo da Imagem\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Est maiores beatae ea molestiae facere ex earum dolores sed accusantium error. Aut rerum nulla et repudiandae cumque quo recusandae expedita et mollitia nemo et quasi odit qui ullam aliquam. Aut fugit minima sed enim consequuntur non omnis optio sed saepe.\\r\\n\\r\\n33 velit beatae qui quia aspernatur 33 officiis praesentium vel porro enim. Aut autem nihil eum pariatur eius qui voluptate possimus. Ad cumque magnam ut consectetur autem ex temporibus quia et delectus minima eos veniam tempore ea dolor atque. Aut labore aperiam sit consequatur accusamus hic sequi reprehenderit.\\r\\n\\r\\nQui error quam cum unde expedita non inventore modi qui inventore quae. Doloribus quis in voluptas unde aut exercitationem tempore sit quia enim ut aperiam magni eos quia veli\"}]}', 'notices/e994ee6594266c7fbb3443029271c731.jpg', 1, '2021-11-19 23:22:45', '2022-01-23 00:01:32'),
(7, 'Marvel lança segundo trailer de homem aranha sem volta pra casa', 'marvel-lanca-segundo-trailer-de-homem-aranha-sem-volta-pra-casa', 'homem aranha, spider man, filmes, lançamentos, marvel', 1, 0, 408, 'Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit <a href=\\\"https:\\/\\/www.marvel.com\\/\\\" target=\\\"_blank\\\" title=\\\"Site da Marvel\\\" rel=\\\"nofollow\\\">Marvel<\\/a>. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\\r\\n\\r\\n<blockquote>Et repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem<\\/blockquote>\"},{\"type\":\"image\",\"src\":\"notices\\/e58e5a78106b5acfb4e2206a8f36552b.jpg\",\"title\":\"Homem aranha sem volta pra casa\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p>\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p><p><br><\\/p><h2>Veja o trailer abaixo:<\\/h2><p><br><\\/p>\"},{\"type\":\"youtube\",\"videocode\":\"CyiiEJRZjSU\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=CyiiEJRZjSU\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"}]}', 'notices/1292cb0ca4a313e7402d7c75178ddeda.jpg', 1, '2021-11-28 23:33:47', '2022-01-23 00:08:31'),
(8, 'Melhor comida do  mundo!', 'melhor-comida-do-mundo!', 'comida, mundo, melhor do mundo', 1, 1, 44, 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat.', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!<\\/p>\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"},{\"type\":\"image\",\"src\":\"notices\\/96abe6a7b2ae3a06cdbe7f3e2ad649aa.jpg\",\"title\":\"Nova Imagem\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"}]}', 'notices/a9383ad32bc715ef4c3ddba94ee1a5e1.jpg', 1, '2021-11-30 19:54:49', '2022-01-23 00:08:25');

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
(2, 7, 6);

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
(8, 'view.users', 'view.users'),
(9, 'create.users', 'create.users'),
(10, 'edit.users', 'edit.users'),
(11, 'delete.users', 'delete.users'),
(12, 'view.clients', 'view.clients'),
(13, 'create.clients', 'create.clients'),
(14, 'edit.clients', 'edit.clients'),
(15, 'delete.clients', 'delete.clients'),
(16, 'view.products', 'view.products'),
(17, 'create.products', 'create.products'),
(18, 'edit.products', 'edit.products'),
(19, 'delete.products', 'delete.products'),
(20, 'view.ratings', 'view.ratings'),
(21, 'create.ratings', 'create.ratings'),
(22, 'edit.ratings', 'edit.ratings'),
(23, 'delete.ratings', 'delete.ratings'),
(24, 'view.requests', 'view.requests'),
(25, 'create.requests', 'create.requests'),
(26, 'edit.requests', 'edit.requests'),
(27, 'delete.requests', 'delete.requests'),
(28, 'view.coupons', 'view.coupons'),
(29, 'create.coupons', 'create.coupons'),
(30, 'edit.coupons', 'edit.coupons'),
(31, 'delete.coupons', 'delete.coupons'),
(32, 'view.slideshow', 'view.slideshow'),
(33, 'create.slideshow', 'create.slideshow'),
(34, 'edit.slideshow', 'edit.slideshow'),
(35, 'delete.slideshow', 'delete.slideshow'),
(36, 'view.banners', 'view.banners'),
(37, 'create.banners', 'create.banners'),
(38, 'edit.banners', 'edit.banners'),
(39, 'delete.banners', 'delete.banners'),
(40, 'view.galleries', 'view.galleries'),
(41, 'create.galleries', 'create.galleries'),
(42, 'edit.galleries', 'edit.galleries'),
(43, 'delete.galleries', 'delete.galleries'),
(44, 'view.partners', 'view.partners'),
(45, 'create.partners', 'create.partners'),
(46, 'edit.partners', 'edit.partners'),
(47, 'delete.partners', 'delete.partners'),
(48, 'view.depoiments', 'view.depoiments'),
(49, 'create.depoiments', 'create.depoiments'),
(50, 'edit.depoiments', 'edit.depoiments'),
(51, 'delete.depoiments', 'delete.depoiments'),
(52, 'view.notices', 'view.notices'),
(53, 'create.notices', 'create.notices'),
(54, 'edit.notices', 'edit.notices'),
(55, 'delete.notices', 'delete.notices'),
(56, 'view.comments', 'view.comments'),
(57, 'create.comments', 'create.comments'),
(58, 'edit.comments', 'edit.comments'),
(59, 'delete.comments', 'delete.comments'),
(60, 'view.categories', 'view.categories'),
(61, 'create.categories', 'create.categories'),
(62, 'edit.categories', 'edit.categories'),
(63, 'delete.categories', 'delete.categories'),
(64, 'view.roles', 'view.roles'),
(65, 'create.roles', 'create.roles'),
(66, 'edit.roles', 'edit.roles'),
(67, 'delete.roles', 'delete.roles'),
(68, 'view.permissions', 'view.permissions'),
(69, 'create.permissions', 'create.permissions'),
(70, 'edit.permissions', 'edit.permissions'),
(71, 'delete.permissions', 'delete.permissions');

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
(41, 'Tablet', 'tablet', 'Samsung', 'Um belo tablet para você dar de presente de natal!', '<p><strong>Armazenamento: </strong>32gb&nbsp;</p><p><strong style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align);\">RAM: </strong>8gb</p>', '', 1, 1, 1, 0, 5, '2021-12-20 21:51:12', '2022-01-23 21:07:40');

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
(73, 1, 90, '2022-01-20', 37),
(74, 4, 50, NULL, 37),
(79, 1, 10, '2022-01-28', 40),
(80, 1, 50, NULL, 34),
(94, 1, 10, NULL, 41),
(95, 2, 5, NULL, 41),
(96, 3, 2, '2022-01-31', 41),
(97, 4, 2, NULL, 41);

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
(492, '12 Polegadas', '800.30', '2000.00', 10, '50.00', '50.00', '50.00', '50.00', 45);

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
(18, 'EN', 9, 23, 24, '2022-01-19 16:02:32', '2022-01-19 23:56:51'),
(19, 'EN', 9, 24, 25, '2022-01-20 00:04:18', '2022-01-20 00:10:41'),
(20, 'AP', 9, 25, 26, '2022-01-20 17:10:20', '2022-01-20 17:10:20'),
(21, 'AP', 9, 26, 27, '2022-01-20 19:00:29', '2022-01-20 19:00:29'),
(22, 'PA', 9, 27, 28, '2022-01-20 19:20:55', '2022-01-20 19:44:56'),
(23, 'CA', 9, 28, 29, '2022-01-20 19:56:43', '2022-01-21 12:08:45'),
(24, 'AP', 9, 29, 30, '2022-01-20 20:07:10', '2022-01-20 20:07:10'),
(25, 'AP', 9, 30, 31, '2022-01-21 01:39:41', '2022-01-21 01:39:41'),
(26, 'PA', 9, 31, 32, '2022-01-21 01:43:58', '2022-01-21 12:15:23'),
(27, 'AP', 9, 32, 33, '2022-01-21 12:24:23', '2022-01-21 12:24:23'),
(28, 'AP', 9, 33, 34, '2022-01-21 12:53:00', '2022-01-21 12:53:00'),
(29, 'AP', 9, 34, 35, '2022-01-21 12:54:25', '2022-01-21 12:54:25'),
(30, 'AP', 9, 35, 36, '2022-01-21 12:56:11', '2022-01-21 12:56:11'),
(31, 'AP', 9, 36, 37, '2022-01-21 12:58:01', '2022-01-21 12:58:01'),
(32, 'AP', 9, 37, 38, '2022-01-21 13:10:42', '2022-01-21 13:10:42'),
(33, 'AP', 9, 38, 39, '2022-01-21 13:33:50', '2022-01-21 13:33:50'),
(34, 'PA', 9, 39, 40, '2022-01-21 13:39:40', '2022-01-21 14:02:28'),
(35, 'AP', 9, 40, 41, '2022-01-21 14:03:13', '2022-01-21 14:03:13'),
(36, 'AP', 9, 41, 42, '2022-01-21 14:30:58', '2022-01-21 14:30:58'),
(37, 'AP', 9, 42, 43, '2022-01-21 14:34:13', '2022-01-21 14:34:13'),
(38, 'AP', 9, 43, 44, '2022-01-21 14:38:02', '2022-01-21 14:38:02'),
(39, 'AP', 9, 44, 45, '2022-01-21 14:47:01', '2022-01-21 14:47:01'),
(40, 'AP', 9, 45, 46, '2022-01-21 14:52:01', '2022-01-21 14:52:01'),
(41, 'AP', 9, 46, 47, '2022-01-21 16:18:08', '2022-01-21 16:18:08'),
(42, 'AP', 9, 47, 48, '2022-01-21 19:43:02', '2022-01-21 19:43:02'),
(43, 'AP', 9, 48, 49, '2022-01-21 19:51:14', '2022-01-21 19:51:14'),
(44, 'AP', 9, 49, 50, '2022-01-21 19:56:59', '2022-01-21 19:56:59'),
(45, 'AP', 10, 50, 51, '2022-01-21 22:32:43', '2022-01-21 22:32:43'),
(46, 'AP', 10, 51, 52, '2022-01-21 22:48:44', '2022-01-21 22:48:44'),
(47, 'AP', 10, 52, 53, '2022-01-21 22:58:52', '2022-01-21 22:58:52'),
(48, 'AP', 10, 53, 54, '2022-01-21 23:36:48', '2022-01-21 23:36:48'),
(49, 'PA', 9, 54, 55, '2022-01-22 20:07:42', '2022-01-22 20:08:54'),
(50, 'AP', 9, 55, 56, '2022-01-23 18:38:00', '2022-01-23 18:38:00'),
(51, 'AP', 9, 56, 57, '2022-01-23 18:41:11', '2022-01-23 18:41:11'),
(52, 'AP', 9, 57, 58, '2022-01-23 19:48:24', '2022-01-23 19:48:24'),
(53, 'AP', 9, 58, 59, '2022-01-23 19:48:44', '2022-01-23 19:48:44'),
(54, 'AP', 9, 59, 60, '2022-01-23 20:18:55', '2022-01-23 20:18:55'),
(55, 'AP', 9, 60, 61, '2022-01-23 20:21:10', '2022-01-23 20:21:10'),
(56, 'AP', 9, 61, 62, '2022-01-23 20:29:58', '2022-01-23 20:29:58'),
(57, 'AP', 9, 62, 63, '2022-01-23 20:57:20', '2022-01-23 20:57:20'),
(58, 'AP', 9, 63, 64, '2022-01-23 20:58:51', '2022-01-23 20:58:51'),
(59, 'AP', 9, 64, 65, '2022-01-23 21:08:49', '2022-01-23 21:08:49'),
(60, 'AP', 9, 65, 66, '2022-01-23 21:14:47', '2022-01-23 21:14:47'),
(61, 'AP', 9, 66, 67, '2022-01-23 21:21:31', '2022-01-23 21:21:31'),
(62, 'AP', 9, 67, 68, '2022-01-23 22:53:20', '2022-01-23 22:53:20'),
(63, 'AP', 9, 68, 69, '2022-01-23 22:55:02', '2022-01-23 22:55:02'),
(64, 'AP', 9, 69, 70, '2022-01-23 22:59:08', '2022-01-23 22:59:08'),
(65, 'AP', 9, 70, 71, '2022-01-23 23:03:27', '2022-01-23 23:03:27'),
(66, 'AP', 9, 71, 72, '2022-01-23 23:07:20', '2022-01-23 23:07:20');

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
(7, 'Preto', '10x40', '800.00', 1, 18, 39),
(8, 'Preto', '10x60x20', '8000.00', 1, 19, 37),
(9, 'Preto', 'M', '500.00', 1, 20, 40),
(10, 'Preto', 'M', '500.00', 1, 21, 40),
(11, 'Preto', 'M', '500.00', 1, 22, 40),
(12, 'Preto', 'M', '500.00', 1, 23, 40),
(13, 'Preto', '12 Polegadas', '800.30', 1, 24, 41),
(14, 'Preto', '10x60x20', '8000.00', 1, 25, 37),
(15, 'Preto', '10x40', '800.00', 1, 26, 39),
(16, 'Preto', '10x60x20', '8000.00', 1, 26, 37),
(17, 'Cinza', 'P', '20.00', 1, 27, 34),
(18, 'Cinza', 'P', '20.00', 1, 28, 34),
(19, 'Branco e Preto', 'P', '20.00', 1, 28, 34),
(20, 'Preto', '12 Polegadas', '800.30', 1, 29, 41),
(21, 'Preto', '10x40', '800.00', 1, 30, 39),
(22, 'Preto', 'M', '500.00', 1, 31, 40),
(23, 'Preto', '10x40', '800.00', 1, 31, 39),
(24, 'Preto', '12 Polegadas', '800.30', 4, 31, 41),
(25, 'Preto', '10x40', '800.00', 1, 32, 39),
(26, 'Preto', 'M', '500.00', 1, 33, 40),
(27, 'Preto', '10x40', '800.00', 1, 34, 39),
(28, 'Preto', '10x60x20', '8000.00', 1, 35, 37),
(29, 'Preto', '10x60x20', '8000.00', 1, 36, 37),
(30, 'Preto', '10x60x20', '8000.00', 1, 37, 37),
(31, 'Preto', '10x60x20', '8000.00', 1, 38, 37),
(32, 'Preto', 'M', '500.00', 1, 39, 40),
(33, 'Preto', '10x40', '800.00', 1, 40, 39),
(34, 'Preto', '10x60x20', '8000.00', 1, 40, 37),
(35, 'Preto', '12 Polegadas', '800.30', 1, 41, 41),
(36, 'Preto', '10x60x20', '8000.00', 1, 42, 37),
(37, 'Preto', '10x60x20', '8000.00', 1, 43, 37),
(38, 'Preto', '10x60x20', '8000.00', 1, 44, 37),
(39, 'Preto', 'M', '500.00', 1, 45, 40),
(40, 'Preto', '12 Polegadas', '800.30', 1, 46, 41),
(41, 'Preto', '12 Polegadas', '800.30', 1, 47, 41),
(42, 'Preto', '10x40', '800.00', 1, 48, 39),
(43, 'Branco e Preto', 'P', '20.00', 9, 49, 34),
(44, 'Preto', '10x40', '800.00', 1, 49, 39),
(45, 'Preto', '12 Polegadas', '800.30', 1, 50, 41),
(46, 'Preto', '12 Polegadas', '800.30', 1, 51, 41),
(47, 'Preto', 'M', '500.00', 1, 51, 40),
(48, 'Preto', '10x40', '800.00', 1, 51, 39),
(49, 'Preto', '10x60x20', '8000.00', 1, 51, 37),
(50, 'Preto', 'M', '500.00', 1, 52, 40),
(51, 'Preto', 'M', '500.00', 1, 53, 40),
(52, 'Preto', '12 Polegadas', '800.30', 1, 54, 41),
(53, 'Preto', '12 Polegadas', '800.30', 1, 55, 41),
(54, 'Preto', '12 Polegadas', '800.30', 1, 56, 41),
(55, 'Preto', '12 Polegadas', '800.30', 1, 57, 41),
(56, 'Preto', '12 Polegadas', '800.30', 1, 58, 41),
(57, 'Preto', '12 Polegadas', '800.30', 1, 59, 41),
(58, 'Preto', '12 Polegadas', '800.30', 1, 60, 41),
(59, 'Preto', '12 Polegadas', '800.30', 1, 61, 41),
(60, 'Preto', '12 Polegadas', '800.30', 2, 62, 41),
(61, 'Preto', '12 Polegadas', '800.30', 1, 63, 41),
(62, 'Preto', 'M', '500.00', 1, 63, 40),
(63, 'Preto', '10x40', '800.00', 1, 63, 39),
(64, 'Preto', '10x60x20', '8000.00', 1, 63, 37),
(65, 'Preto', '12 Polegadas', '800.30', 1, 64, 41),
(66, 'Preto', 'M', '500.00', 1, 64, 40),
(67, 'Preto', '10x40', '800.00', 1, 64, 39),
(68, 'Preto', '10x60x20', '8000.00', 1, 64, 37),
(69, 'Preto', '10x60x20', '8000.00', 2, 65, 37),
(70, 'Preto', '10x60x20', '8000.00', 2, 66, 37);

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
(71, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `request_payment`
--

CREATE TABLE `request_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('PS','MP','PP') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PS - PagSeguro | MP - Mercado Pago | PP - PayPal',
  `method` enum('CC','CD','BA','BO','DE','DO','PX','PP') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CC - Cartão de Crédito | CD - Cartão de Débito | BA - Saldo | BO - Boleto | DE - Depósito | DO - Débito Online | PX - PIX | PP - PayPal',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_type` enum('AP','EA','PA','DI','ED','DE','CA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AP' COMMENT 'AP - Aguardando Pagamento | EA - Em Análise | PA - Paga | DI - Disponível | ED - Em Disputa | DE - Devolvida | CA - Cancelada',
  `installments` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `installment_no_interest` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `discount_coupon` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_installment` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_cart` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_type` enum('PC','SX','PE') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PC - PAC | SX - SEDEX | PE - Personalizado',
  `shipping_value` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_days` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `shipping_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `request_payment`
--

INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `details`, `created_at`, `updated_at`) VALUES
(24, 'EFCCC9A3-01C4-4915-AA93-CC23B48EADB1', 'PS', 'DO', '3', 'PA', 1, 1, '800.00', '160.00', '0.00', '0.00', 'PC', '0.00', 6, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=07434fe3c1ff42246fd6e26b5849aa3f4076682afc7d9284f47c14ba458a7a87a678057c4e481867', '{\"date\":\"2022-01-19T18:33:44.000-03:00\",\"code\":\"EFCCC9A3-01C4-4915-AA93-CC23B48EADB1\",\"reference\":\"18\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-19T20:37:19.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=07434fe3c1ff42246fd6e26b5849aa3f4076682afc7d9284f47c14ba458a7a87a678057c4e481867\",\"grossAmount\":\"640.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"31.94\"},\"netAmount\":\"607.66\",\"extraAmount\":\"-160.00\",\"escrowEndDate\":\"2022-02-02T20:37:19.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"df263d996281d984952c07998dc54358\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}},\"sender\":{\"email\":\"c02479818189570415673@sandbox.pagseguro.com.br\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"1\",\"cost\":\"0.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-19 16:02:32', '2022-01-21 12:22:33'),
(25, 'B3DF4075-A90E-4583-B3AF-72CF6DD4DC2B', 'PS', 'CC', '4', 'DI', 6, 1, '8000.00', '1600.00', '0.00', '0.00', 'SX', '90.50', 10, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', NULL, '{\"date\":\"2022-01-19T21:04:34.000-03:00\",\"code\":\"B3DF4075-A90E-4583-B3AF-72CF6DD4DC2B\",\"reference\":\"19\",\"type\":\"1\",\"status\":\"4\",\"lastEventDate\":\"2022-01-19T21:09:50.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"6490.50\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"529.62\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"323.88\"},\"netAmount\":\"5636.60\",\"extraAmount\":\"-1600.00\",\"escrowEndDate\":\"2022-01-19T21:09:50.000-03:00\",\"installmentCount\":\"6\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"b0b183c207f46f0cca7dc63b2604f5cc\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"email\":\"c02479818189570415673@sandbox.pagseguro.com.br\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"2\",\"cost\":\"90.50\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-20 00:04:18', '2022-01-21 23:20:38'),
(26, '57C0F8E2-5E35-427D-A9E8-4EA8F2A31E94', 'PS', 'BO', '1', 'AP', 1, 1, '500.00', '100.00', '0.00', '0.00', 'SX', '95.60', 10, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=c06c7ef99022eb108477b2c0bbdf66b89371cbc9c42c6cc3e42e8290d241c9cffcf9ea32f3096109', '{\"date\":\"2022-01-20T15:53:20.000-03:00\",\"code\":\"57C0F8E2-5E35-427D-A9E8-4EA8F2A31E94\",\"reference\":\"20\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-20T15:53:22.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=c06c7ef99022eb108477b2c0bbdf66b89371cbc9c42c6cc3e42e8290d241c9cffcf9ea32f3096109\",\"grossAmount\":\"495.60\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"24.73\"},\"netAmount\":\"470.47\",\"extraAmount\":\"-100.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"8d6dc35e506fc23349dd10ee68dabb64\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"2\",\"cost\":\"95.60\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-20 17:10:20', '2022-01-20 19:44:48'),
(27, '599E2DDC-B708-4365-ABC0-C839A2197670', 'PS', 'BO', '1', 'AP', 1, 1, '500.00', '100.00', '200.00', '0.00', 'PC', '106.60', 6, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=1992e17ab3535248b51484c001a6e3df6b14e26653a984e7fd8ce022e8ada8f0fc942594a6b12d9c', '{\"date\":\"2022-01-20T16:07:13.000-03:00\",\"code\":\"599E2DDC-B708-4365-ABC0-C839A2197670\",\"reference\":\"21\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-20T16:07:15.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=1992e17ab3535248b51484c001a6e3df6b14e26653a984e7fd8ce022e8ada8f0fc942594a6b12d9c\",\"grossAmount\":\"506.60\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"25.28\"},\"netAmount\":\"480.92\",\"extraAmount\":\"-100.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"537d9b6c927223c796cac288cced29df\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"1\",\"cost\":\"106.60\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-20 19:00:29', '2022-01-20 19:20:37'),
(28, 'C9E25C61-F4CD-4E7B-B852-616468DE8532', 'PS', 'BO', '3', 'PA', 1, 1, '500.00', '100.00', '50.00', '0.00', 'SX', '95.60', 10, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=3bd1cd2f94971405cbdcb6b9d84455147e39286de57d62ab9f579f312d0435db4018231a292f333a', '{\"date\":\"2022-01-20T16:22:58.000-03:00\",\"code\":\"C9E25C61-F4CD-4E7B-B852-616468DE8532\",\"reference\":\"22\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-20T16:42:44.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=3bd1cd2f94971405cbdcb6b9d84455147e39286de57d62ab9f579f312d0435db4018231a292f333a\",\"grossAmount\":\"445.60\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"22.24\"},\"netAmount\":\"422.96\",\"extraAmount\":\"-150.00\",\"escrowEndDate\":\"2022-02-03T16:42:43.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"8248a99e81e752cb9b41da3fc43fbe7f\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"2\",\"cost\":\"95.60\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-20 19:20:55', '2022-01-20 19:56:24'),
(29, '471647CC-E3D4-4551-B6FF-AC87F6A21ADF', 'PS', 'BO', '7', 'CA', 1, 1, '500.00', '100.00', '50.00', '0.00', 'PC', '106.60', 6, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=03a5725c1c9b7dd3530db78f3553e7104b2b2fab1a85a41efd5486e781d9f27a4a65b571c5194641', '{\"date\":\"2022-01-20T17:04:31.000-03:00\",\"code\":\"471647CC-E3D4-4551-B6FF-AC87F6A21ADF\",\"reference\":\"23\",\"type\":\"1\",\"status\":\"7\",\"cancellationSource\":\"INTERNAL\",\"lastEventDate\":\"2022-01-21T09:08:33.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=03a5725c1c9b7dd3530db78f3553e7104b2b2fab1a85a41efd5486e781d9f27a4a65b571c5194641\",\"grossAmount\":\"456.60\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"22.78\"},\"netAmount\":\"433.42\",\"extraAmount\":\"-150.00\",\"escrowEndDate\":\"2022-02-04T09:08:33.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"a9078e8653368c9c291ae2f8b74012e7\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"1\",\"cost\":\"106.60\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-20 19:56:43', '2022-01-21 12:08:45'),
(30, '0B8FA6D4-6AC1-4A82-A2A8-00FBE8B3D24D', 'PS', 'BO', '1', 'AP', 1, 1, '800.30', '160.06', '0.00', '0.00', 'PC', '271.90', 6, 'O CEP de destino está sujeito a condições especiais de entrega pela  ECT e será realizada com o acréscimo de até 5 (cinco) dias úteis ao prazo regular.', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b2e3a30ca779423b086bb7b0bdd1d1f48808ae3e667ae91154aa1044a24f28881914cb4f2f378f44', '{\"date\":\"2022-01-20T17:07:55.000-03:00\",\"code\":\"0B8FA6D4-6AC1-4A82-A2A8-00FBE8B3D24D\",\"reference\":\"24\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-20T17:10:39.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=b2e3a30ca779423b086bb7b0bdd1d1f48808ae3e667ae91154aa1044a24f28881914cb4f2f378f44\",\"grossAmount\":\"912.14\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"45.52\"},\"netAmount\":\"866.22\",\"extraAmount\":\"-160.06\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"33ebd5b07dc7e407752fe773eed20635\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Socialista\",\"number\":\"14\",\"complement\":{},\"district\":\"Jardim Novo Pantanal\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"04472205\"},\"type\":\"1\",\"cost\":\"271.90\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-20 20:07:10', '2022-01-21 01:33:43'),
(31, 'B3F81B19-15F0-4D89-AE2C-1F83DDE8363B', 'PS', 'BO', '1', 'AP', 1, 1, '8000.00', '1600.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=3ad64faa9e98909204f11884860a6d90aaa4a1ef39b52c64ddf1608430b32d689d74df3958c1cac2', '{\"date\":\"2022-01-20T22:40:08.000-03:00\",\"code\":\"B3F81B19-15F0-4D89-AE2C-1F83DDE8363B\",\"reference\":\"25\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-20T22:41:32.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=3ad64faa9e98909204f11884860a6d90aaa4a1ef39b52c64ddf1608430b32d689d74df3958c1cac2\",\"grossAmount\":\"6550.00\",\"discountAmount\":\"5760.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.42\"},\"netAmount\":\"750.18\",\"extraAmount\":\"-1600.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"a8f8f60264024dca151f164729b76c0b\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 01:39:41', '2022-01-21 12:07:29'),
(32, '07604D24-808F-432D-BEFB-106B874F85F1', 'PS', 'BO', '3', 'PA', 1, 1, '8800.00', '1760.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=409f45f458fef8a36aaa4a0dac6cfde10a0f1a1e1ddc7f59ebedffbeb825f7aebcd3ddfc8e367912', '{\"date\":\"2022-01-20T22:44:08.000-03:00\",\"code\":\"07604D24-808F-432D-BEFB-106B874F85F1\",\"reference\":\"26\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-20T22:48:55.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=409f45f458fef8a36aaa4a0dac6cfde10a0f1a1e1ddc7f59ebedffbeb825f7aebcd3ddfc8e367912\",\"grossAmount\":\"7190.00\",\"discountAmount\":\"3168.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"200.70\"},\"netAmount\":\"3820.90\",\"extraAmount\":\"-1760.00\",\"escrowEndDate\":\"2022-02-03T22:48:55.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"17e23e50bedc63b4095e3d8204ce063b\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"},{\"id\":\"52c5189391854c93e8a0e1326e56c14f\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 01:43:58', '2022-01-21 12:23:44'),
(33, '64DF77CA-CBB0-4853-8D9F-5C95F244A005', 'PS', 'BO', '1', 'AP', 1, 1, '20.00', '4.00', '10.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=97536141d6a7fed12301d31f231d80f0152b9ae923a673104289495c31b84cfd28285d5658bbc877', '{\"date\":\"2022-01-21T09:51:34.000-03:00\",\"code\":\"64DF77CA-CBB0-4853-8D9F-5C95F244A005\",\"reference\":\"27\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T09:51:36.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=97536141d6a7fed12301d31f231d80f0152b9ae923a673104289495c31b84cfd28285d5658bbc877\",\"grossAmount\":\"156.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"7.78\"},\"netAmount\":\"147.82\",\"extraAmount\":\"-14.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"ab2b41c63853f0a651ba9fbf502b0cd8\",\"description\":\"Camisa Formal | COR: Cinza | TAMANHO: P\",\"quantity\":\"1\",\"amount\":\"20.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 12:24:23', '2022-01-21 12:52:30'),
(34, 'B4192F14-40B5-41C7-9202-B4E1973CF906', 'PS', 'BO', '1', 'AP', 1, 1, '40.00', '8.00', '20.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=f8ec2a8fb0fdb073550b01d521ef906fca24ea2edd6ce19645ac73020a37d57743be99efdad9d49e', '{\"date\":\"2022-01-21T09:53:36.000-03:00\",\"code\":\"B4192F14-40B5-41C7-9202-B4E1973CF906\",\"reference\":\"28\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T09:53:38.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=f8ec2a8fb0fdb073550b01d521ef906fca24ea2edd6ce19645ac73020a37d57743be99efdad9d49e\",\"grossAmount\":\"162.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"8.08\"},\"netAmount\":\"153.52\",\"extraAmount\":\"-28.00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"d757719ed7c2b66dd17dcee2a3cb29f4\",\"description\":\"Camisa Formal | COR: Cinza | TAMANHO: P\",\"quantity\":\"1\",\"amount\":\"20.00\"},{\"id\":\"8562ae5e286544710b2e7ebe9858833b\",\"description\":\"Camisa Formal | COR: Branco e Preto | TAMANHO: P\",\"quantity\":\"1\",\"amount\":\"20.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 12:53:00', '2022-01-21 12:53:53'),
(35, '5D142566-BEF0-4D7E-A927-8A2AF03B844D', 'PS', 'BO', '1', 'AP', 1, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=8bd77a600de6fde003868e72e609b70a3f316c96074b72a73a69fdab4db76597d64c143611ee9ebc', '{\"date\":\"2022-01-21T09:54:50.000-03:00\",\"code\":\"5D142566-BEF0-4D7E-A927-8A2AF03B844D\",\"reference\":\"29\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T09:54:53.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=8bd77a600de6fde003868e72e609b70a3f316c96074b72a73a69fdab4db76597d64c143611ee9ebc\",\"grossAmount\":\"790.24\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.43\"},\"netAmount\":\"750.41\",\"extraAmount\":\"-160.06\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"89885ff2c83a10305ee08bd507c1049c\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 12:54:25', '2022-01-21 12:55:43'),
(36, '51B5E9BE-DCD2-4585-B5EC-94F3DAF84682', 'PS', 'BO', '1', 'AP', 1, 1, '800.00', '160.00', '0.00', '0.00', 'PE', '0.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=a6c63c45cc064c99ae7da92ed634c5c4304c56df52cfd01f49a7cdd1fe5dba378166d33ba99d3027', '{\"date\":\"2022-01-21T09:56:31.000-03:00\",\"code\":\"51B5E9BE-DCD2-4585-B5EC-94F3DAF84682\",\"reference\":\"30\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T09:56:33.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=a6c63c45cc064c99ae7da92ed634c5c4304c56df52cfd01f49a7cdd1fe5dba378166d33ba99d3027\",\"grossAmount\":\"640.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"31.94\"},\"netAmount\":\"607.66\",\"extraAmount\":\"-160.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"37d097caf1299d9aa79c2c2b843d2d78\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 12:56:11', '2022-01-21 12:57:26'),
(37, '7089BEF6-3A7D-4E2D-BEE3-2B903D9F3281', 'PS', 'BO', '1', 'AP', 1, 1, '4501.20', '900.24', '150.04', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b03895cf5d50fe072923d2230a129c8768449f897d13cd0fb170e0d2ee98f347f2296037ba8ed10b', '{\"date\":\"2022-01-21T09:58:34.000-03:00\",\"code\":\"7089BEF6-3A7D-4E2D-BEE3-2B903D9F3281\",\"reference\":\"31\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T09:58:37.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=b03895cf5d50fe072923d2230a129c8768449f897d13cd0fb170e0d2ee98f347f2296037ba8ed10b\",\"grossAmount\":\"3600.92\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"179.69\"},\"netAmount\":\"3420.83\",\"extraAmount\":\"-1050.28\",\"installmentCount\":\"1\",\"itemCount\":\"3\",\"items\":{\"item\":[{\"id\":\"d4dd111a4fd973394238aca5c05bebe3\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"35936504a37d53e03abdfbc7318d9ec7\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"},{\"id\":\"7a68443f5c80d181c42967cd71612af1\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"4\",\"amount\":\"800.30\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 12:58:01', '2022-01-21 12:58:37'),
(38, '0DED7AC5-62D3-4AD9-9364-F89E2AB0E119', 'PS', 'BO', '1', 'AP', 1, 1, '800.00', '0.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=34a91e2db7e808de73a435260e83bd2829e650deb7b73a7f68dd6de2c55aab2edce3096d3c1365ee', '{\"date\":\"2022-01-21T10:32:48.000-03:00\",\"code\":\"0DED7AC5-62D3-4AD9-9364-F89E2AB0E119\",\"reference\":\"32\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T10:32:51.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=34a91e2db7e808de73a435260e83bd2829e650deb7b73a7f68dd6de2c55aab2edce3096d3c1365ee\",\"grossAmount\":\"950.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"47.41\"},\"netAmount\":\"902.19\",\"extraAmount\":\"0.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"2aedcba61ca55ceb62d785c6b7f10a83\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 13:10:42', '2022-01-21 13:33:15'),
(39, '63D09EF5-1D90-4BF5-824A-1EEF1FE2C0B6', 'PS', 'BO', '1', 'AP', 1, 1, '500.00', '100.00', '50.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b1ebdc91359922f3d7751315ee9d9b2328281115454ff1a798c2022637676b511d2bc6aae81f69c4', '{\"date\":\"2022-01-21T10:34:01.000-03:00\",\"code\":\"63D09EF5-1D90-4BF5-824A-1EEF1FE2C0B6\",\"reference\":\"33\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T10:34:04.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=b1ebdc91359922f3d7751315ee9d9b2328281115454ff1a798c2022637676b511d2bc6aae81f69c4\",\"grossAmount\":\"500.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"24.95\"},\"netAmount\":\"474.65\",\"extraAmount\":\"-150.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"9a5748a2fbaa6564d05d7f2ae29a9355\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 13:33:50', '2022-01-21 13:39:19'),
(40, '284A7ED7-5348-41ED-BC6F-73379206C468', 'PS', 'DO', '3', 'PA', 1, 1, '800.00', '160.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=2aa05a01b3bf3c820ca8d6c2dc93658321322ed809323088fdae250e25a1e708ff9823bad4cc6c89', '{\"date\":\"2022-01-21T11:01:29.000-03:00\",\"code\":\"284A7ED7-5348-41ED-BC6F-73379206C468\",\"reference\":\"34\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-21T11:02:11.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=2aa05a01b3bf3c820ca8d6c2dc93658321322ed809323088fdae250e25a1e708ff9823bad4cc6c89\",\"grossAmount\":\"790.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.42\"},\"netAmount\":\"750.18\",\"extraAmount\":\"-160.00\",\"escrowEndDate\":\"2022-02-04T11:02:11.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"56584778d5a8ab88d6393cc4cd11e090\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 13:39:40', '2022-01-21 14:02:30'),
(41, '89AEEA3E-FC75-4A90-A15A-449378530DB8', 'PS', 'DO', '1', 'AP', 1, 1, '8000.00', '1600.00', '6399.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=f35fdeb9f5b6ea81dd5d6d9d946872d259bef8fa509c37857f0f01f1c4725255828e689ea9ca4f88', '{\"date\":\"2022-01-21T11:16:48.000-03:00\",\"code\":\"89AEEA3E-FC75-4A90-A15A-449378530DB8\",\"reference\":\"35\",\"recoveryCode\":\"7df5a68dd88c50bb82e2c781b234ec914070bc4b960a0cdd\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T11:16:49.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"304\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=f35fdeb9f5b6ea81dd5d6d9d946872d259bef8fa509c37857f0f01f1c4725255828e689ea9ca4f88\",\"grossAmount\":\"151.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"7.53\"},\"netAmount\":\"143.07\",\"extraAmount\":\"-7999.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"353de26971b93af88da102641069b440\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 14:03:13', '2022-01-21 14:27:00'),
(42, '7F3A9E27-BD5A-4EC9-B03E-957F8C0B3969', 'PS', 'DO', '1', 'AP', 1, 1, '8000.00', '1600.00', '6399.00', '0.00', 'PE', '149.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=8b2018920068618bb58517a5b64975a716d25fb5a13b30ffcad45378e586ec460298383930844c27', '{\"date\":\"2022-01-21T11:31:53.000-03:00\",\"code\":\"7F3A9E27-BD5A-4EC9-B03E-957F8C0B3969\",\"reference\":\"36\",\"recoveryCode\":\"7df5a68dd88c50bba62e3c33b9ba42b7770b165bc73db13e\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T11:31:54.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"304\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=8b2018920068618bb58517a5b64975a716d25fb5a13b30ffcad45378e586ec460298383930844c27\",\"grossAmount\":\"150.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"7.49\"},\"netAmount\":\"142.11\",\"extraAmount\":\"-7999.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"8fc687aa152e8199fe9e73304d407bca\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"149.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 14:30:58', '2022-01-21 14:32:02'),
(43, 'BCB6F8C6-10E1-4B4F-9257-C0EED3F4CA4A', 'PS', 'BO', '1', 'AP', 1, 1, '8000.00', '1600.00', '6399.00', '0.00', 'PE', '149.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=f279c9f957e49e69ccea686c79549c4d89bbc67a13f3dd68d97eae2f441444ce66c00e7223b868b1', '{\"date\":\"2022-01-21T11:37:30.000-03:00\",\"code\":\"BCB6F8C6-10E1-4B4F-9257-C0EED3F4CA4A\",\"reference\":\"37\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T11:37:31.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=f279c9f957e49e69ccea686c79549c4d89bbc67a13f3dd68d97eae2f441444ce66c00e7223b868b1\",\"grossAmount\":\"150.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"7.49\"},\"netAmount\":\"142.11\",\"extraAmount\":\"-7999.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"10ce03a1ed01077e3e289f3e53c72813\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"149.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 14:34:13', '2022-01-21 14:37:37'),
(44, 'D27B2B39-420E-4CB3-A090-B5A2EF0ECB17', 'PS', 'DO', '1', 'AP', 1, 1, '8000.00', '1600.00', '6399.00', '0.00', 'PE', '0.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=03eabea5d4d846bdccf84a2135bfe1479f7d3b8e492df8fde1965609c85be168569e1303f96d30c0', '{\"date\":\"2022-01-21T11:38:43.000-03:00\",\"code\":\"D27B2B39-420E-4CB3-A090-B5A2EF0ECB17\",\"reference\":\"38\",\"recoveryCode\":\"7df5a68dd88c50bb1652ff637afbc29965135762771303ba\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T11:38:44.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"304\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=03eabea5d4d846bdccf84a2135bfe1479f7d3b8e492df8fde1965609c85be168569e1303f96d30c0\",\"grossAmount\":\"1.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"0.05\"},\"netAmount\":\"0.55\",\"extraAmount\":\"-7999.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"8c9a14ffebb7677d033ffce847991293\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 14:38:02', '2022-01-21 15:56:18'),
(45, '0B6EF6F2-C7FA-4696-85D4-4688D2AB8691', 'PS', 'DO', '1', 'AP', 1, 1, '500.00', '100.00', '50.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=175c158bfaf64b4f256917f5c287826363934d4d69e4ce1dfaa5ea160d17bd20f1aa8bcabf77833b', '{\"date\":\"2022-01-21T11:50:28.000-03:00\",\"code\":\"0B6EF6F2-C7FA-4696-85D4-4688D2AB8691\",\"reference\":\"39\",\"recoveryCode\":\"7df5a68dd88c50bbc45bb78286192cffaa5f8e944953112a\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T11:50:29.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=175c158bfaf64b4f256917f5c287826363934d4d69e4ce1dfaa5ea160d17bd20f1aa8bcabf77833b\",\"grossAmount\":\"500.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"24.95\"},\"netAmount\":\"474.65\",\"extraAmount\":\"-150.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"d15426b9c324676610fbb01360473ed8\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 14:47:01', '2022-01-21 14:50:29'),
(46, '665ABBE5-6F55-406D-90D7-39A5A48D710D', 'PS', 'BO', '1', 'AP', 1, 1, '8800.00', '1760.00', '3168.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=eb17ec77fab8434e98a86a6fac33e299347c6acd6fd7d46763093d01dc51c9fe8ccab471e24027de', '{\"date\":\"2022-01-21T11:53:11.000-03:00\",\"code\":\"665ABBE5-6F55-406D-90D7-39A5A48D710D\",\"reference\":\"40\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T11:54:37.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=eb17ec77fab8434e98a86a6fac33e299347c6acd6fd7d46763093d01dc51c9fe8ccab471e24027de\",\"grossAmount\":\"7190.00\",\"discountAmount\":\"3168.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"200.70\"},\"netAmount\":\"3820.90\",\"extraAmount\":\"-1760.00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"7ba0691b7777b6581397456412a41390\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"},{\"id\":\"c2f32522a84d5e6357e6abac087f1b0b\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 14:52:01', '2022-01-21 15:03:14'),
(47, '633172BA-5A03-4854-AABD-7592A699B2DF', 'PS', 'CC', '1', 'AP', 4, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-21T16:38:18.000-03:00\",\"code\":\"633172BA-5A03-4854-AABD-7592A699B2DF\",\"reference\":\"41\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T16:38:18.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"790.24\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"46.86\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.43\"},\"netAmount\":\"703.55\",\"extraAmount\":\"-160.06\",\"installmentCount\":\"4\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"c5f5c23be1b71adb51ea9dc8e9d444a8\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 16:18:08', '2022-01-21 19:41:16'),
(48, '98CCA757-EF89-45E5-A610-F31AED83C1D2', 'PS', 'CC', '1', 'AP', 7, 1, '8000.00', '1600.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-21T16:50:14.000-03:00\",\"code\":\"98CCA757-EF89-45E5-A610-F31AED83C1D2\",\"reference\":\"42\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T16:50:14.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"6550.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"410.68\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"326.85\"},\"netAmount\":\"5812.07\",\"extraAmount\":\"-1600.00\",\"installmentCount\":\"7\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"cae82d4350cc23aca7fc9ae38dab38ab\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 19:43:02', '2022-01-21 19:50:24'),
(49, NULL, NULL, NULL, NULL, 'AP', 1, 1, '8000.00', '1600.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, NULL, '2022-01-21 19:51:14', '2022-01-21 19:51:14'),
(50, 'BEE3F757-8C48-42F4-BF98-534D292F74E1', 'PS', 'CC', '1', 'AP', 3, 1, '8000.00', '1600.00', '0.00', '0.00', 'PE', '148.00', 5, NULL, NULL, '{\"date\":\"2022-01-21T17:06:28.000-03:00\",\"code\":\"BEE3F757-8C48-42F4-BF98-534D292F74E1\",\"reference\":\"44\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T17:06:28.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"6548.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"312.99\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"326.75\"},\"netAmount\":\"5907.86\",\"extraAmount\":\"-1600.00\",\"installmentCount\":\"3\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"a6ade5aa93b826f8de63c663e1159bf7\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"148.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 19:56:59', '2022-01-21 22:02:30'),
(51, '96A5CEB2-B186-41F1-AA18-1E54BD9288A7', 'PS', 'DO', '1', 'AP', 1, 1, '500.00', '100.00', '50.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=7004aca6ed1b97926f12cf840cf655b78b49cf30482011d3573b4bc2b07c90d4ee9c2fde8bb143ed', '{\"date\":\"2022-01-21T19:48:20.000-03:00\",\"code\":\"96A5CEB2-B186-41F1-AA18-1E54BD9288A7\",\"reference\":\"45\",\"recoveryCode\":\"7df5a68dd88c50bb9b33a039f129f7fd83f2afccfc9c8814\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T19:48:21.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"304\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=7004aca6ed1b97926f12cf840cf655b78b49cf30482011d3573b4bc2b07c90d4ee9c2fde8bb143ed\",\"grossAmount\":\"500.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"24.95\"},\"netAmount\":\"474.65\",\"extraAmount\":\"-150.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"3fa146219c48a4393aace23e8f353125\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Carlos Oliveira\",\"email\":\"carlos@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"985111561\"},\"documents\":{\"document\":{\"type\":\"CNPJ\",\"value\":\"84053838000133\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Exata\",\"number\":\"15\",\"complement\":{},\"district\":\"Bairro Exata\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 22:32:43', '2022-01-21 23:11:42');
INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `details`, `created_at`, `updated_at`) VALUES
(52, '85ACCC70-B8E0-42E7-811F-91A0468346B1', 'PS', 'CC', '1', 'AP', 5, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-21T19:49:30.000-03:00\",\"code\":\"85ACCC70-B8E0-42E7-811F-91A0468346B1\",\"reference\":\"46\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T19:49:30.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"790.24\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"32.08\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.43\"},\"netAmount\":\"718.33\",\"extraAmount\":\"-160.06\",\"installmentCount\":\"5\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"da0b566359c3862f20b5072c3d49bd0f\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Carlos Oliveira\",\"email\":\"carlos@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"985111561\"},\"documents\":{\"document\":{\"type\":\"CNPJ\",\"value\":\"84053838000133\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Exata\",\"number\":\"15\",\"complement\":{},\"district\":\"Bairro Exata\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 22:48:44', '2022-01-21 23:34:26'),
(53, '22D5E85D-7E2A-4105-8CC1-608FCA13719B', 'PS', 'CC', '1', 'AP', 12, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-21T20:03:15.000-03:00\",\"code\":\"22D5E85D-7E2A-4105-8CC1-608FCA13719B\",\"reference\":\"47\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T20:03:15.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"790.24\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"4.27\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.43\"},\"netAmount\":\"746.14\",\"extraAmount\":\"-160.06\",\"installmentCount\":\"12\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"5eb13cb69b6e20dd7a42030f5936a9dc\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Carlos Oliveira\",\"email\":\"carlos@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"985111561\"},\"documents\":{\"document\":{\"type\":\"CNPJ\",\"value\":\"84053838000133\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Exata\",\"number\":\"15\",\"complement\":{},\"district\":\"Bairro Exata\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 22:58:52', '2022-01-21 23:12:58'),
(54, 'FC35DD14-4F09-4B3B-9C91-B60A6DCE0B46', 'PS', 'CC', '1', 'AP', 7, 1, '800.00', '160.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-21T20:41:40.000-03:00\",\"code\":\"FC35DD14-4F09-4B3B-9C91-B60A6DCE0B46\",\"reference\":\"48\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-21T20:41:40.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"790.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"49.53\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"39.42\"},\"netAmount\":\"700.65\",\"extraAmount\":\"-160.00\",\"installmentCount\":\"7\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"887a185b1a4080193d5cf63873ac6d70\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}},\"sender\":{\"name\":\"Carlos Oliveira\",\"email\":\"carlos@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"985111561\"},\"documents\":{\"document\":{\"type\":\"CNPJ\",\"value\":\"84053838000133\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Exata\",\"number\":\"15\",\"complement\":{},\"district\":\"Bairro Exata\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-21 23:36:48', '2022-01-21 23:41:45'),
(55, '6E8DC9BA-0272-44A1-9088-A0BF17CE52F6', 'PS', 'DO', '3', 'PA', 1, 1, '980.00', '196.00', '245.00', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=a1e4eb9dfdb40d05e3b1d34aff86b9634cc0cf2db06bf7d42d4eb734a7e5c87f3f3fb2c4edec9229', '{\"date\":\"2022-01-22T17:08:19.000-03:00\",\"code\":\"6E8DC9BA-0272-44A1-9088-A0BF17CE52F6\",\"reference\":\"49\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-22T17:08:46.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"301\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=a1e4eb9dfdb40d05e3b1d34aff86b9634cc0cf2db06bf7d42d4eb734a7e5c87f3f3fb2c4edec9229\",\"grossAmount\":\"689.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"34.38\"},\"netAmount\":\"654.22\",\"extraAmount\":\"-441.00\",\"escrowEndDate\":\"2022-02-05T17:08:46.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"da6cb383f8f9e58f2c8af88a8c0eb65e\",\"description\":\"Camisa Formal | COR: Branco e Preto | TAMANHO: P\",\"quantity\":\"9\",\"amount\":\"20.00\"},{\"id\":\"7c5845cea683556d813ebd657e8cca01\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-22 20:07:42', '2022-01-23 18:37:44'),
(56, NULL, NULL, NULL, NULL, 'AP', 1, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, NULL, '2022-01-23 18:38:00', '2022-01-23 18:38:00'),
(57, '1BA33774-12E8-44D8-B159-82FD0CB99C4B', 'PS', 'CC', '1', 'AP', 2, 1, '10100.30', '2020.06', '102.88', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T16:44:51.000-03:00\",\"code\":\"1BA33774-12E8-44D8-B159-82FD0CB99C4B\",\"reference\":\"51\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T16:44:51.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"8127.36\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"293.40\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"405.56\"},\"netAmount\":\"7428.00\",\"extraAmount\":\"-2122.94\",\"installmentCount\":\"2\",\"itemCount\":\"4\",\"items\":{\"item\":[{\"id\":\"5ffaa9f5182c2a36843f438bb1fdbdea\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"0f304eddb4ad6007a3093fd6d963a1d2\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"4b0a0290ad7df100b77e86839989a75e\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"},{\"id\":\"57cd30d9088b0185cf0ebca1a472ff1d\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 18:41:11', '2022-01-23 19:44:54'),
(58, NULL, NULL, NULL, NULL, 'AP', 1, 1, '500.00', '100.00', '0.00', '0.00', 'PE', '0.00', 5, NULL, NULL, NULL, '2022-01-23 19:48:24', '2022-01-23 19:48:24'),
(59, '2A747FC0-787B-43DF-9BB8-5A49D9EC7571', 'PS', 'CC', '1', 'AP', 1, 1, '500.00', '0.00', '50.00', '0.00', 'PE', '0.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T16:50:36.000-03:00\",\"code\":\"2A747FC0-787B-43DF-9BB8-5A49D9EC7571\",\"reference\":\"53\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T16:50:36.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"450.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"0.00\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"22.46\"},\"netAmount\":\"427.14\",\"extraAmount\":\"-50.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"5ef99d16d1954578b0df2f38b866449b\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 19:48:44', '2022-01-23 19:51:03'),
(60, '9FBB5D5B-3368-48D5-8178-0FBEBAD5AFF2', 'PS', 'CC', '1', 'AP', 12, 1, '800.30', '0.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T17:19:36.000-03:00\",\"code\":\"9FBB5D5B-3368-48D5-8178-0FBEBAD5AFF2\",\"reference\":\"54\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T17:19:36.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"950.30\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"5.13\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"47.42\"},\"netAmount\":\"897.35\",\"extraAmount\":\"0.00\",\"installmentCount\":\"12\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"d14fe370bdf1664c34b258d65f8d3507\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 20:18:55', '2022-01-23 20:19:42'),
(61, 'D7F03B07-12EC-4C6F-BB12-73CB3D89FE28', 'PS', 'CC', '1', 'AP', 1, 1, '800.30', '160.06', '79.02', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T17:29:38.000-03:00\",\"code\":\"D7F03B07-12EC-4C6F-BB12-73CB3D89FE28\",\"reference\":\"55\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T17:29:38.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"711.22\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"0.00\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"35.49\"},\"netAmount\":\"675.33\",\"extraAmount\":\"-239.08\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"cf5530d9e441e0d78574353214373569\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 20:21:10', '2022-01-23 20:29:40'),
(62, NULL, NULL, NULL, NULL, 'AP', 1, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, NULL, '2022-01-23 20:29:58', '2022-01-23 20:29:58'),
(63, NULL, NULL, NULL, NULL, 'AP', 1, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, NULL, '2022-01-23 20:57:20', '2022-01-23 20:57:20'),
(64, '171685CF-0BB0-483F-B416-67422F45C876', 'PS', 'CC', '1', 'AP', 4, 1, '800.30', '160.06', '0.00', '0.00', 'PE', '0.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T18:08:18.000-03:00\",\"code\":\"171685CF-0BB0-483F-B416-67422F45C876\",\"reference\":\"58\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T18:08:18.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"640.24\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"37.97\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"31.95\"},\"netAmount\":\"569.92\",\"extraAmount\":\"-160.06\",\"installmentCount\":\"4\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"48fbab00052197bc8bd943498b89dd71\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 20:58:51', '2022-01-23 21:08:23'),
(65, '4111F65A-C220-4FCA-8C4F-C4457D8313A7', 'PS', 'CC', '1', 'AP', 4, 1, '800.30', '160.06', '12.80', '0.00', 'PE', '0.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T18:13:16.000-03:00\",\"code\":\"4111F65A-C220-4FCA-8C4F-C4457D8313A7\",\"reference\":\"59\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T18:13:16.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"627.44\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"37.21\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"31.31\"},\"netAmount\":\"558.52\",\"extraAmount\":\"-172.86\",\"installmentCount\":\"4\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"edea298442a67de045e88dfb6e5ea4a2\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 21:08:49', '2022-01-23 21:14:30'),
(66, 'E7E435B4-A8C9-422F-A2BB-65D915CABAB0', 'PS', 'CC', '1', 'AP', 4, 1, '800.30', '160.06', '12.80', '0.00', 'PE', '0.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T18:20:48.000-03:00\",\"code\":\"E7E435B4-A8C9-422F-A2BB-65D915CABAB0\",\"reference\":\"60\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T18:20:48.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"627.44\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"37.21\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"31.31\"},\"netAmount\":\"558.52\",\"extraAmount\":\"-172.86\",\"installmentCount\":\"4\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"5fc34ed307aac159a30d81181c99847e\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 21:14:47', '2022-01-23 21:20:50'),
(67, 'BF01CF15-3D81-4AA0-B264-BC38922A0669', 'PS', 'CC', '1', 'AP', 2, 1, '800.30', '160.06', '32.01', '0.00', 'PE', '0.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T19:52:40.000-03:00\",\"code\":\"BF01CF15-3D81-4AA0-B264-BC38922A0669\",\"reference\":\"61\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T19:52:40.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"608.23\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"21.96\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"30.35\"},\"netAmount\":\"555.52\",\"extraAmount\":\"-192.07\",\"installmentCount\":\"2\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"e0b60d939b4a80628dfd66b1e0bb65fa\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 21:21:31', '2022-01-23 22:52:41'),
(68, '731C8F1C-6EB1-4577-A0AB-553B370036C2', 'PS', 'CC', '1', 'AP', 3, 1, '1600.60', '320.12', '28.61', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T19:54:18.000-03:00\",\"code\":\"731C8F1C-6EB1-4577-A0AB-553B370036C2\",\"reference\":\"62\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T19:54:18.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"1401.87\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"67.01\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"69.95\"},\"netAmount\":\"1264.51\",\"extraAmount\":\"-348.73\",\"installmentCount\":\"3\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"58ee2794cc87707943624dc8db2ff5a0\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"2\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 22:53:20', '2022-01-23 22:54:20'),
(69, 'FE30B02E-B131-47E0-8F9D-133FD602BFE9', 'PS', 'BO', '1', 'AP', 1, 1, '10100.30', '2020.06', '2263.32', '0.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=4dca96bec4fcad7503d9e473fafdff5defcde724c16cfef05733703cb32ec330e2c8e65b2f1e2054', '{\"date\":\"2022-01-23T19:58:41.000-03:00\",\"code\":\"FE30B02E-B131-47E0-8F9D-133FD602BFE9\",\"reference\":\"63\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T19:58:43.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=4dca96bec4fcad7503d9e473fafdff5defcde724c16cfef05733703cb32ec330e2c8e65b2f1e2054\",\"grossAmount\":\"5966.92\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"297.75\"},\"netAmount\":\"5668.77\",\"extraAmount\":\"-4283.38\",\"installmentCount\":\"1\",\"itemCount\":\"4\",\"items\":{\"item\":[{\"id\":\"13d2b7361a27dbc9960ae158598a6a96\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"405075699f065e43581f27d67bb68478\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"9b1c93a6864c39e48417ee486b83c387\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"},{\"id\":\"498f2c21688f6451d9f5fd09d53edda7\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"1\",\"amount\":\"8000.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 22:55:02', '2022-01-23 22:58:43'),
(70, NULL, NULL, NULL, NULL, 'AP', 1, 1, '10100.30', '2020.06', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, NULL, '2022-01-23 22:59:08', '2022-01-23 22:59:08'),
(71, '1411F07F-33D8-43C3-8FEC-9BB8D692F57D', 'PS', 'CC', '1', 'AP', 2, 1, '16000.00', '3200.00', '0.00', '0.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T20:04:28.000-03:00\",\"code\":\"1411F07F-33D8-43C3-8FEC-9BB8D692F57D\",\"reference\":\"65\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T20:04:28.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"12950.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"467.50\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"646.21\"},\"netAmount\":\"11835.89\",\"extraAmount\":\"-3200.00\",\"installmentCount\":\"2\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"8963920e8b402154316d8175fa189112\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"2\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 23:03:27', '2022-01-23 23:04:39'),
(72, '1741B916-7C75-4505-A762-1707673914C9', 'PS', 'CC', '1', 'AP', 4, 1, '16000.00', '3200.00', '5675.00', '1600.00', 'PE', '150.00', 5, NULL, NULL, '{\"date\":\"2022-01-23T20:08:14.000-03:00\",\"code\":\"1741B916-7C75-4505-A762-1707673914C9\",\"reference\":\"66\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-23T20:08:14.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"5675.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"336.53\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"283.18\"},\"netAmount\":\"5054.89\",\"extraAmount\":\"-10475.00\",\"installmentCount\":\"4\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"7c39a5f991bef4a1e34187677a65871d\",\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"quantity\":\"2\",\"amount\":\"8000.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-23 23:07:20', '2022-01-23 23:08:19');

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
(448, 1, 1),
(449, 1, 2),
(450, 1, 3),
(451, 1, 7),
(452, 1, 6),
(453, 1, 4),
(454, 1, 5),
(455, 1, 37),
(456, 1, 61),
(457, 1, 13),
(458, 1, 57),
(459, 1, 29),
(460, 1, 49),
(461, 1, 41),
(462, 1, 53),
(463, 1, 45),
(464, 1, 69),
(465, 1, 17),
(466, 1, 21),
(467, 1, 25),
(468, 1, 65),
(469, 1, 33),
(470, 1, 9),
(471, 1, 39),
(472, 1, 63),
(473, 1, 15),
(474, 1, 59),
(475, 1, 31),
(476, 1, 51),
(477, 1, 43),
(478, 1, 55),
(479, 1, 47),
(480, 1, 71),
(481, 1, 19),
(482, 1, 23),
(483, 1, 27),
(484, 1, 67),
(485, 1, 35),
(486, 1, 11),
(487, 1, 38),
(488, 1, 62),
(489, 1, 14),
(490, 1, 58),
(491, 1, 30),
(492, 1, 50),
(493, 1, 42),
(494, 1, 54),
(495, 1, 46),
(496, 1, 70),
(497, 1, 18),
(498, 1, 22),
(499, 1, 26),
(500, 1, 66),
(501, 1, 34),
(502, 1, 10),
(503, 1, 36),
(504, 1, 60),
(505, 1, 12),
(506, 1, 56),
(507, 1, 28),
(508, 1, 48),
(509, 1, 40),
(510, 1, 52),
(511, 1, 44),
(512, 1, 68),
(513, 1, 16),
(514, 1, 20),
(515, 1, 24),
(516, 1, 64),
(517, 1, 32),
(518, 1, 8);

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
  `system_floater_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system`
--

INSERT INTO `system` (`id`, `name`, `cnpj`, `keywords`, `description`, `maintenance`, `system_address_id`, `system_contact_id`, `system_social_id`, `system_store_id`, `system_lgpd_id`, `system_floater_id`) VALUES
(1, 'Electro', '48498411498849', 'loja virtual, eletrônicos, vestimentas', 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id', 0, 1, 1, 1, 1, 1, 1);

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
(337, '11111111', '22222222', '150.00', 5, 1),
(338, '33333333', '44444444', '200.00', 10, 1),
(339, '55555555', '66666666', '5.00', 5, 1),
(340, '66666666', '77777777', '6.00', 5, 1),
(341, '88888888', '99999999', '7.00', 5, 1);

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
-- Estrutura da tabela `system_pagseguro`
--

CREATE TABLE `system_pagseguro` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_pagseguro`
--

INSERT INTO `system_pagseguro` (`id`, `email`, `token`, `app_id`, `app_key`) VALUES
(1, 'menezesryan1010@gmail.com', '97C3FCEEDB4C4AC1A8A90E17307260DA', '', '');

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
  `payment_type` enum('PS','MP','PP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PS',
  `payment_type_checkout` enum('CT','LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CT' COMMENT 'CT - Checkout Transparente | LR - Link de Redirecionamento | LB - LightBox',
  `payment_production` tinyint(1) NOT NULL DEFAULT 0,
  `payment_credit_card` tinyint(1) NOT NULL DEFAULT 1,
  `payment_debit_card` tinyint(1) NOT NULL DEFAULT 1,
  `payment_balance` tinyint(1) NOT NULL DEFAULT 1,
  `payment_bolet` tinyint(1) NOT NULL DEFAULT 1,
  `payment_deposit` tinyint(1) NOT NULL DEFAULT 1,
  `payment_debit_online` tinyint(1) NOT NULL DEFAULT 1,
  `payment_pix` tinyint(1) NOT NULL DEFAULT 1,
  `payment_paypal` tinyint(1) NOT NULL DEFAULT 1,
  `system_freight_id` int(10) UNSIGNED NOT NULL,
  `system_pagseguro_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_store`
--

INSERT INTO `system_store` (`id`, `cart_promotion`, `cart_amount_promotion`, `cart_discount_percent_promotion`, `cart_freight_free_promotion`, `payment_type`, `payment_type_checkout`, `payment_production`, `payment_credit_card`, `payment_debit_card`, `payment_balance`, `payment_bolet`, `payment_deposit`, `payment_debit_online`, `payment_pix`, `payment_paypal`, `system_freight_id`, `system_pagseguro_id`) VALUES
(1, 1, '100.00', 10, 0, 'PS', 'CT', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

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
-- Índices para tabela `client_cards`
--
ALTER TABLE `client_cards`
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
  ADD KEY `system_store_id` (`system_store_id`);

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
-- Índices para tabela `system_lgpd`
--
ALTER TABLE `system_lgpd`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_pagseguro`
--
ALTER TABLE `system_pagseguro`
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
  ADD KEY `system_store_ibfk_2` (`system_freight_id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT de tabela `client_cards`
--
ALTER TABLE `client_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5548;

--
-- AUTO_INCREMENT de tabela `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `notices_subcategories`
--
ALTER TABLE `notices_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

--
-- AUTO_INCREMENT de tabela `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de tabela `requests_products`
--
ALTER TABLE `requests_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de tabela `request_address`
--
ALTER TABLE `request_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `request_payment`
--
ALTER TABLE `request_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=519;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT de tabela `system_lgpd`
--
ALTER TABLE `system_lgpd`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `system_pagseguro`
--
ALTER TABLE `system_pagseguro`
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
  ADD CONSTRAINT `system_ibfk_1` FOREIGN KEY (`system_address_id`) REFERENCES `system_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_2` FOREIGN KEY (`system_contact_id`) REFERENCES `system_contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_3` FOREIGN KEY (`system_floater_id`) REFERENCES `system_floater` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_4` FOREIGN KEY (`system_social_id`) REFERENCES `system_social` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_5` FOREIGN KEY (`system_lgpd_id`) REFERENCES `system_lgpd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_ibfk_6` FOREIGN KEY (`system_store_id`) REFERENCES `system_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `system_freight_custom`
--
ALTER TABLE `system_freight_custom`
  ADD CONSTRAINT `system_freight_custom_ibfk_1` FOREIGN KEY (`system_freight_id`) REFERENCES `system_freight` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `system_store`
--
ALTER TABLE `system_store`
  ADD CONSTRAINT `system_store_ibfk_1` FOREIGN KEY (`system_pagseguro_id`) REFERENCES `system_pagseguro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_store_ibfk_2` FOREIGN KEY (`system_freight_id`) REFERENCES `system_freight` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
