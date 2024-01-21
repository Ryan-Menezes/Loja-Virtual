-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Mar-2022 às 23:17
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
  `emphasis` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(29, 'Masculino', 'masculino', 'Masculino'),
(30, 'Feminino', 'feminino', 'Feminino');

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
(9, 'Ryan Menezes', 'ryan@gmail.com', '$2y$10$7cz.QGiN3LEPvlSxT0pFL.ewITfVsXramI2IDiEeMt6AMxJDzJ07q', '1199999999', '11999999999', '53881489800', '', NULL, '103769345409668859766', NULL, 1, 11, 11, '2022-01-14 20:42:09', '2022-02-01 18:26:36'),
(10, 'Carlos Oliveira', 'carlos@gmail.com', '$2y$10$Kj62o6wwccASfYUMEZtus.s8U/x2/igo/0Znx6n.8GnAnFGGbsNMK', '', '11985111561', '', '84053838000133', NULL, NULL, NULL, 1, 14, 14, '2022-01-21 22:30:43', '2022-01-30 18:50:24');

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons_products`
--

CREATE TABLE `coupons_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons_subcategories`
--

CREATE TABLE `coupons_subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(24, 9, 41),
(27, 9, 36),
(29, 9, 38),
(30, 9, 35),
(31, 9, 34),
(33, 9, 37),
(34, 9, 40),
(35, 9, 39);

-- --------------------------------------------------------

--
-- Estrutura da tabela `form_contact`
--

CREATE TABLE `form_contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(7, 'Marvel lança segundo trailer de homem aranha sem volta pra casa', 'marvel-lanca-segundo-trailer-de-homem-aranha-sem-volta-pra-casa', 'homem aranha, spider man, filmes, lançamentos, marvel', 1, 0, 421, 'Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit <a href=\\\"https:\\/\\/www.marvel.com\\/\\\" target=\\\"_blank\\\" title=\\\"Site da Marvel\\\" rel=\\\"nofollow\\\">Marvel<\\/a>. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\\r\\n\\r\\n<blockquote>Et repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem<\\/blockquote>\"},{\"type\":\"image\",\"src\":\"notices\\/e58e5a78106b5acfb4e2206a8f36552b.jpg\",\"title\":\"Homem aranha sem volta pra casa\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p>\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p><p><br><\\/p><h2>Veja o trailer abaixo:<\\/h2><p><br><\\/p>\"},{\"type\":\"youtube\",\"videocode\":\"CyiiEJRZjSU\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=CyiiEJRZjSU\"}]}', 'notices/1292cb0ca4a313e7402d7c75178ddeda.jpg', NULL, 1, '2021-11-28 23:33:47', '2022-02-28 00:40:23'),
(8, 'Melhor comida do  mundo!', 'melhor-comida-do-mundo!', 'comida, mundo, melhor do mundo', 1, 1, 52, 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat.', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!<\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/96abe6a7b2ae3a06cdbe7f3e2ad649aa.jpg\",\"title\":\"Nova Imagem\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"}]}', 'notices/a9383ad32bc715ef4c3ddba94ee1a5e1.jpg', NULL, 1, '2021-11-30 19:54:49', '2022-02-08 22:29:21'),
(9, 'O autor de One Piece revela que este ano o anime terá o seu fim', 'o-autor-de-one-piece-revela-que-este-ano-o-anime-tera-o-seu-fim', 'one piece, animes', 1, 1, 7, 'O autor de One Piece revela que este ano o anime terá o seu fim', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p><strong style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\"><br><\\/span><\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/9f2aa1dbdcd25c1410764e6c017837aa.png\",\"title\":\"One Piece\"},{\"type\":\"text\",\"content\":\"<p><span style=\\\"font-weight: bolder; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><\\/p>\"},{\"type\":\"text\",\"content\":\"<p><span style=\\\"font-weight: bolder; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><\\/p>\"}]}', 'notices/8267a383edec48d2e6863aba236764dc.png', NULL, 1, '2022-01-24 19:05:24', '2022-01-29 22:36:59');

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
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `index_active` tinyint(1) NOT NULL DEFAULT 1,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `ld_json` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `type` enum('CL','CO','LK') NOT NULL DEFAULT 'CO' COMMENT 'CL - Cliente | CO - Colaborador | LK - Link Útil',
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
(13, 'view.pages', 'view.pages'),
(14, 'create.pages', 'create.pages'),
(15, 'edit.pages', 'edit.pages'),
(16, 'delete.pages', 'delete.pages'),
(17, 'view.clients', 'view.clients'),
(18, 'create.clients', 'create.clients'),
(19, 'edit.clients', 'edit.clients'),
(20, 'delete.clients', 'delete.clients'),
(21, 'view.products', 'view.products'),
(22, 'create.products', 'create.products'),
(23, 'edit.products', 'edit.products'),
(24, 'delete.products', 'delete.products'),
(25, 'view.ratings', 'view.ratings'),
(26, 'create.ratings', 'create.ratings'),
(27, 'edit.ratings', 'edit.ratings'),
(28, 'delete.ratings', 'delete.ratings'),
(29, 'view.requests', 'view.requests'),
(30, 'create.requests', 'create.requests'),
(31, 'edit.requests', 'edit.requests'),
(32, 'delete.requests', 'delete.requests'),
(33, 'view.coupons', 'view.coupons'),
(34, 'create.coupons', 'create.coupons'),
(35, 'edit.coupons', 'edit.coupons'),
(36, 'delete.coupons', 'delete.coupons'),
(37, 'view.slideshow', 'view.slideshow'),
(38, 'create.slideshow', 'create.slideshow'),
(39, 'edit.slideshow', 'edit.slideshow'),
(40, 'delete.slideshow', 'delete.slideshow'),
(41, 'view.banners', 'view.banners'),
(42, 'create.banners', 'create.banners'),
(43, 'edit.banners', 'edit.banners'),
(44, 'delete.banners', 'delete.banners'),
(45, 'view.galleries', 'view.galleries'),
(46, 'create.galleries', 'create.galleries'),
(47, 'edit.galleries', 'edit.galleries'),
(48, 'delete.galleries', 'delete.galleries'),
(49, 'view.partners', 'view.partners'),
(50, 'create.partners', 'create.partners'),
(51, 'edit.partners', 'edit.partners'),
(52, 'delete.partners', 'delete.partners'),
(53, 'view.depoiments', 'view.depoiments'),
(54, 'create.depoiments', 'create.depoiments'),
(55, 'edit.depoiments', 'edit.depoiments'),
(56, 'delete.depoiments', 'delete.depoiments'),
(57, 'view.notices', 'view.notices'),
(58, 'create.notices', 'create.notices'),
(59, 'edit.notices', 'edit.notices'),
(60, 'delete.notices', 'delete.notices'),
(61, 'view.comments', 'view.comments'),
(62, 'create.comments', 'create.comments'),
(63, 'edit.comments', 'edit.comments'),
(64, 'delete.comments', 'delete.comments'),
(65, 'view.categories', 'view.categories'),
(66, 'create.categories', 'create.categories'),
(67, 'edit.categories', 'edit.categories'),
(68, 'delete.categories', 'delete.categories'),
(69, 'view.roles', 'view.roles'),
(70, 'create.roles', 'create.roles'),
(71, 'edit.roles', 'edit.roles'),
(72, 'delete.roles', 'delete.roles'),
(73, 'view.permissions', 'view.permissions'),
(74, 'create.permissions', 'create.permissions'),
(75, 'edit.permissions', 'edit.permissions'),
(76, 'delete.permissions', 'delete.permissions');

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
(34, 'Camisa Formal', 'camisa-formal', 'Nike', 'Camisa formal', 'Camisa Formal', '', 1, 1, 0, 1, 2, '2021-12-18 22:21:42', '2022-01-29 23:08:35'),
(35, 'XBox Series X', 'xbox-series-x', 'Microsoft', 'Novo videogame da microsoft', '<p><strong>HD: </strong>1 TB</p>', '', 1, 1, 0, 1, 2, '2021-12-18 22:29:43', '2022-01-29 23:13:14'),
(36, 'Playstation 5', 'playstation-5', 'Sony', 'Novo videogame da sony', '<p>Playstation 5</p>', '', 1, 1, 0, 1, 2, '2021-12-18 22:35:10', '2022-01-29 23:13:36'),
(37, 'PC Gamer Completo', 'pc-gamer-completo', 'Sony', 'PC de última geração', '<p>PC de última geração</p>', 'https://www.youtube.com/watch?v=iutQJzAXiWo', 1, 1, 1, 1, 6, '2021-12-18 22:39:26', '2022-01-22 22:13:46'),
(38, 'Notebook Casual', 'notebook-casual', 'Positivo', 'Notebook para trabalho', '<p><strong>Ano: </strong>2020&nbsp;</p><p><strong>SO: </strong>Windows&nbsp;</p><p><strong>Bits: </strong>64 Bits</p>', '', 1, 1, 0, 1, 2, '2021-12-18 22:42:36', '2022-01-29 23:13:05'),
(39, 'Celular LG K4', 'celular-lg-k4', 'LG', 'Celular bom para nada', '<p><strong>PROCESSAMENTO: </strong>Ruim&nbsp;</p><p><strong style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align);\">MEMÓRIA: </strong>8gb</p>', 'https://www.youtube.com/watch?v=iutQJzAXiWo', 1, 0, 1, 1, 6, '2021-12-18 22:46:39', '2022-01-29 23:08:58'),
(40, 'Headset', 'headset', 'Microsoft', 'Um belo headset para jogadores de todas as idades', '<p><strong>Ano: </strong>2020&nbsp;</p><p><strong>Hz: </strong>60</p>', '', 1, 1, 1, 0, 2, '2021-12-20 21:44:23', '2022-01-23 19:50:28'),
(41, 'Tablet', 'tablet', 'Samsung', 'Um belo tablet para você dar de presente de natal!', '<p><strong>Armazenamento: </strong>32gb&nbsp;</p><p><strong style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align);\">RAM: </strong>8gb</p>', '', 1, 1, 1, 1, 2, '2021-12-20 21:51:12', '2022-01-29 23:08:43'),
(42, 'Controle Playstation 4 C/ Fio 2m Doubleshock 4', 'controle-playstation-4-c-fio-2m-doubleshock-4', 'Playstation', 'Controle Playstation 4 C/ Fio 2m Doubleshock 4', '<h1 class=\" css-k7ata1 eym5xli0\" style=\"outline-style: initial; outline-width: 0px; border-width: 0px; border-style: solid; border-color: rgb(204, 204, 204); font-size: 1.375rem; margin-bottom: 0px; font-weight: inherit; font-family: ‘Sarabun’, arial, sans-serif; line-height: 1.25; color: rgb(33, 33, 33);\">Controle Playstation 4 C/ Fio 2m Doubleshock 4</h1><p><br></p><p><strong>Plataforma: </strong>Playstation 4, PC</p>', '', 1, 1, 0, 1, 5, '2022-02-01 00:49:46', '2022-02-01 00:49:46'),
(43, 'KIT TECLADO E MOUSE, MOUSE GAMER TGT M4 RAINBOW RGB 7 BOTOES + TECLADO GAMER TGT TEC-9 RAINBOW RGB', 'kit-teclado-e-mouse-mouse-gamer-tgt-m4-rainbow-rgb-7-botoes-teclado-gamer-tgt-tec-9-rainbow-rgb', 'Hazer', 'KIT TECLADO E MOUSE, MOUSE GAMER TGT M4 RAINBOW RGB 7 BOTOES + TECLADO GAMER TGT TEC-9 RAINBOW RGB', '<p><span style=\"font-weight: bolder;\">KIT TECLADO E MOUSE, MOUSE GAMER TGT M4 RAINBOW RGB 7 BOTOES + TECLADO GAMER TGT TEC-9 RAINBOW RGB</span></p><p><span style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align); font-weight: bolder;\"><br></span></p><p><span style=\"background-color: initial; font-size: 1em; text-align: var(--bs-body-text-align); font-weight: bolder;\">Teclado:&nbsp;</span>Novo</p><p><span style=\"font-weight: bolder;\">Mouse:&nbsp;</span>Novo</p>', '', 1, 1, 0, 1, 2, '2022-02-01 00:55:25', '2022-02-01 01:39:15'),
(44, 'Jaqueta Masculina Preta - EGG - Boatto', 'jaqueta-masculina-preta-egg-boatto', 'Boatto Imports', 'Jaqueta Masculina Preta - EGG - Boatto', '<h3>Jaqueta Masculina Preta - EGG - Boatto</h3><p><br></p><p><strong>Tamanhos: </strong>P, M, G</p>', '', 1, 1, 0, 1, 10, '2022-02-01 01:28:18', '2022-02-01 01:39:06'),
(45, 'MONITOR AOC LED 18.5\", HD, WIDESCREEN, ULTRA HIGH - E970SWNL', 'monitor-aoc-led-18-5-hd-widescreen-ultra-high-e970swnl', 'AOC', 'MONITOR AOC LED 18.5\", HD, WIDESCREEN, ULTRA HIGH - E970SWNL', '<h3>MONITOR AOC LED 18.5\", HD, WIDESCREEN, ULTRA HIGH - E970SWNL</h3>', '', 1, 1, 0, 1, 8, '2022-02-01 01:37:26', '2022-02-01 01:38:57');

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
(6, 41, 37),
(7, 41, 34),
(8, 41, 38),
(9, 41, 40),
(10, 41, 41),
(11, 42, 36),
(12, 42, 37),
(13, 42, 38),
(14, 42, 35),
(39, 44, 34),
(40, 44, 44),
(50, 45, 37),
(51, 45, 38),
(52, 45, 40),
(53, 45, 43),
(54, 45, 42),
(103, 43, 37),
(104, 43, 38),
(105, 43, 40),
(106, 43, 41);

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
(54, 35, 13),
(55, 36, 13),
(56, 37, 14),
(57, 38, 14),
(58, 38, 15),
(59, 39, 19),
(60, 40, 14),
(61, 40, 16),
(62, 41, 19),
(63, 42, 13),
(64, 42, 14),
(65, 42, 15),
(66, 43, 14),
(67, 43, 15),
(68, 43, 16),
(69, 43, 17),
(70, 43, 18),
(71, 44, 30),
(72, 45, 14),
(73, 45, 16);

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
(45, 'Preto', '#2d2a2a', 41),
(46, 'Preto', '#000000', 42),
(47, 'Preto com Led', '#000000', 43),
(48, 'Preta', '#000000', 44),
(49, 'Preto', '#000000', 45);

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
(120, 1, 10, NULL, 41),
(121, 2, 5, NULL, 41),
(123, 4, 2, NULL, 41),
(125, 1, 5, NULL, 42),
(133, 1, 5, NULL, 44),
(136, 1, 10, NULL, 45),
(149, 1, 50, NULL, 34),
(150, 1, 10, NULL, 43);

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
(60, 'products/f80d2bad284c24efb5f797e5efd305b3.png', 45),
(61, 'products/fe17f75eeb9170e9d9aed4d65ba0902f.png', 46),
(62, 'products/c95730763b9a98977542a45059ab2cbd.webp', 46),
(63, 'products/e74d294708fb08b1aaccd1c699e2f3f1.jpg', 46),
(64, 'products/911e8610c657f2d5185999753420f1d4.jpg', 47),
(65, 'products/ffe6e438da0e7ade3d5504c437e1df99.jpg', 47),
(66, 'products/e3c2c5dc434146925ca916cd189450f8.jpg', 47),
(67, 'products/556d2446df636de110a760f07cd18912.jpg', 47),
(68, 'products/54a9be341737ca426447361ee1eda805.jpg', 47),
(69, 'products/cfd9a3a5b1c595392db374a7a134fd9b.jpg', 48),
(70, 'products/f3bfedada100d4fac6a0d0dc133e3dee.jpg', 48),
(71, 'products/f71be1aa29edfd81eecb077acbb46ae0.jpg', 48),
(72, 'products/6c6586f291d391b91138ee79363c2f47.jpg', 48),
(73, 'products/ef821de1823d21cadf517493e6945fae.webp', 49),
(74, 'products/6daa1e225652a110f95f41a4da129ce2.webp', 49),
(75, 'products/262b0679c90cce249b1843e14b0ce50a.webp', 49),
(76, 'products/b1a7b877267f4061e34c8849cc15ee51.webp', 49);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mpn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gtin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(528, '12 Polegadas', '800.30', '2000.00', 10, '50.00', '50.00', '50.00', '50.00', 45),
(529, '10x40', '800.00', '1000.00', 50, '50.00', '50.00', '50.00', '50.00', 43),
(530, '10x50x10', '800.00', '1000.00', 0, '50.00', '50.00', '50.00', '50.00', 42),
(531, '20x50x20', '4500.00', '5000.00', 0, '50.00', '50.00', '50.00', '50.00', 39),
(532, '10x100x50', '4500.00', '5000.00', 0, '50.00', '50.00', '50.00', '50.00', 40),
(533, 'P', '20.00', '40.00', 50, '10.00', '10.00', '10.00', '1.50', 33),
(534, 'M', '20.00', '40.00', 100, '10.00', '10.00', '10.00', '1.50', 33),
(535, 'G', '20.00', '40.00', 40, '10.00', '10.00', '10.00', '1.50', 33),
(536, 'GG', '20.00', '40.00', 50, '10.00', '10.00', '10.00', '1.50', 33),
(537, 'P', '20.00', '40.00', 6, '50.00', '50.00', '50.00', '50.00', 34),
(538, 'M', '20.00', '40.00', 5, '50.00', '50.00', '50.00', '50.00', 34),
(539, 'G', '20.00', '40.00', 10, '50.00', '50.00', '50.00', '50.00', 34),
(540, 'GG', '20.00', '40.00', 30, '50.00', '50.00', '50.00', '50.00', 34),
(541, 'P', '20.00', '40.00', 69, '50.00', '50.00', '50.00', '50.00', 35),
(542, 'P', '20.00', '40.00', 9, '50.00', '50.00', '50.00', '50.00', 36),
(543, 'P', '20.00', '40.00', 0, '50.00', '50.00', '50.00', '50.00', 37),
(544, 'M', '20.00', '40.00', 0, '50.00', '50.00', '50.00', '50.00', 37),
(545, 'G', '20.00', '40.00', 3, '50.00', '50.00', '50.00', '50.00', 37),
(546, 'GG', '20.00', '40.00', 0, '50.00', '50.00', '50.00', '50.00', 37),
(547, 'P', '30.00', '90.00', 6, '50.00', '50.00', '50.00', '50.00', 38),
(548, 'Único', '500.00', '800.00', 4, '30.00', '30.00', '30.00', '1.00', 46),
(560, 'P', '50.00', '100.00', 20, '50.00', '50.00', '50.00', '2.00', 48),
(561, 'M', '60.00', '120.00', 5, '50.00', '50.00', '50.00', '2.00', 48),
(562, 'G', '70.00', '140.00', 50, '50.00', '50.00', '50.00', '2.00', 48),
(565, 'Único', '1200.00', '2000.00', 3, '20.00', '20.00', '20.00', '10.00', 49),
(566, 'Único', '100.00', '200.00', 50, '20.00', '20.00', '20.00', '5.00', 47);

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
(9, 5, 'Ótimo produto e excelente entrega', 1, 38, 9, '2022-01-15 20:22:43', '2022-01-15 20:39:07'),
(10, 1, 'Horrível', 1, 40, 10, '2022-02-03 18:15:15', '2022-02-03 18:15:34');

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `request_payment`
--

CREATE TABLE `request_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('PS','MP','PP','PC') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PS - PagSeguro | MP - Mercado Pago | PP - PayPal | PC - PicPay',
  `method` enum('CC','CD','BA','BO','DE','DO','PX','PP','TB') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CC - Cartão de Crédito | CD - Cartão de Débito | BA - Saldo | BO - Boleto | DE - Depósito | DO - Débito Online | PX - PIX | PP - PayPal | TB - Transferência Bancária',
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
  `qrcode_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(591, 1, 1),
(592, 1, 2),
(593, 1, 3),
(594, 1, 7),
(595, 1, 8),
(596, 1, 6),
(597, 1, 4),
(598, 1, 5),
(599, 1, 42),
(600, 1, 66),
(601, 1, 18),
(602, 1, 62),
(603, 1, 34),
(604, 1, 54),
(605, 1, 46),
(606, 1, 58),
(607, 1, 14),
(608, 1, 50),
(609, 1, 74),
(610, 1, 22),
(611, 1, 26),
(612, 1, 30),
(613, 1, 70),
(614, 1, 38),
(615, 1, 10),
(616, 1, 44),
(617, 1, 68),
(618, 1, 20),
(619, 1, 64),
(620, 1, 36),
(621, 1, 56),
(622, 1, 48),
(623, 1, 60),
(624, 1, 16),
(625, 1, 52),
(626, 1, 76),
(627, 1, 24),
(628, 1, 28),
(629, 1, 32),
(630, 1, 72),
(631, 1, 40),
(632, 1, 12),
(633, 1, 43),
(634, 1, 67),
(635, 1, 19),
(636, 1, 63),
(637, 1, 35),
(638, 1, 55),
(639, 1, 47),
(640, 1, 59),
(641, 1, 15),
(642, 1, 51),
(643, 1, 75),
(644, 1, 23),
(645, 1, 27),
(646, 1, 31),
(647, 1, 71),
(648, 1, 39),
(649, 1, 11),
(650, 1, 41),
(651, 1, 65),
(652, 1, 17),
(653, 1, 61),
(654, 1, 33),
(655, 1, 53),
(656, 1, 45),
(657, 1, 57),
(658, 1, 13),
(659, 1, 49),
(660, 1, 73),
(661, 1, 21),
(662, 1, 25),
(663, 1, 29),
(664, 1, 69),
(665, 1, 37),
(666, 1, 9);

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

--
-- Extraindo dados da tabela `slideshow`
--

INSERT INTO `slideshow` (`id`, `title`, `description`, `link`, `image`) VALUES
(2, '', '', '', 'slideshow/dc5d798b644c8bb802e6692dfd9289f5.png'),
(3, '', '', '', 'slideshow/f4c9acbfb0dd8a29bc3e5370e2074ef5.jpg');

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
(13, 'Videogame', 'videogame', 'Videogame', 23),
(14, 'Computador', 'computador', 'Computador', 23),
(15, 'Notebook', 'notebook', 'Notebook', 23),
(16, 'Acessório', 'acessorio', 'Acessório', 23),
(17, 'Mouse', 'mouse', 'Mouse', 23),
(18, 'Teclado', 'teclado', 'Teclado', 23),
(19, 'Celular', 'celular', 'Celular', 23),
(28, 'Camisas', 'camisas', 'Camisas', 29),
(29, 'Calças', 'calcas', 'Calças', 29),
(30, 'Jaquetas', 'jaquetas', 'Jaquetas', 29),
(31, 'Moletons', 'moletons', 'Moletons', 29),
(32, 'Calçados', 'calcados', 'Calçados', 29),
(33, 'Camisas', 'camisas', 'Camisas', 30),
(34, 'Calças', 'calcas', 'Calças', 30),
(35, 'Moletons', 'moletons', 'Moletons', 30),
(36, 'Jaquetas', 'jaquetas', 'Jaquetas', 30),
(37, 'Calçados', 'calcados', 'Calçados', 30);

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
(1, 'C', '04796355');

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
(612, '11111111', '22222222', '150.00', 5, 1),
(613, '33333333', '44444444', '200.00', 10, 1),
(614, '55555555', '66666666', '5.00', 5, 1),
(615, '66666666', '77777777', '6.00', 5, 1),
(616, '88888888', '99999999', '7.00', 5, 1);

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
  `return_policy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `type_checkout` enum('LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LR' COMMENT 'LR - Link de Redirecionamento | LB - LightBox',
  `header_color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff',
  `elements_color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_mercadopago`
--

INSERT INTO `system_mercadopago` (`id`, `active`, `public_key`, `access_token`, `type_checkout`, `header_color`, `elements_color`) VALUES
(1, 1, '', '', 'LB', '#449d44', '#449d44');

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
(1, 1, '', '', '', '', 'LB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_paypal`
--

CREATE TABLE `system_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `secret_key` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `client_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_paypal`
--

INSERT INTO `system_paypal` (`id`, `active`, `secret_key`, `email`, `client_id`) VALUES
(1, 1, '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_picpay`
--

CREATE TABLE `system_picpay` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `token` varchar(191) DEFAULT NULL,
  `seller_token` varchar(191) DEFAULT NULL,
  `expiration_minutes` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_picpay`
--

INSERT INTO `system_picpay` (`id`, `active`, `token`, `seller_token`, `expiration_minutes`) VALUES
(1, 1, '', '', 5000);

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
  `payment_bank_transfer` tinyint(1) NOT NULL DEFAULT 1,
  `payment_pix` tinyint(1) NOT NULL DEFAULT 1,
  `system_freight_id` int(10) UNSIGNED NOT NULL,
  `system_pagseguro_id` int(10) UNSIGNED NOT NULL,
  `system_mercadopago_id` int(10) UNSIGNED NOT NULL,
  `system_paypal_id` int(10) UNSIGNED NOT NULL,
  `system_picpay_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_store`
--

INSERT INTO `system_store` (`id`, `cart_promotion`, `cart_amount_promotion`, `cart_discount_percent_promotion`, `cart_freight_free_promotion`, `payment_type`, `payment_checkout_transparent`, `payment_production`, `payment_credit_card`, `payment_debit_card`, `payment_balance`, `payment_bolet`, `payment_deposit`, `payment_debit_online`, `payment_bank_transfer`, `payment_pix`, `system_freight_id`, `system_pagseguro_id`, `system_mercadopago_id`, `system_paypal_id`, `system_picpay_id`) VALUES
(1, 1, '100.00', 10, 0, 'MP', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1);

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
-- Índices para tabela `coupons_products`
--
ALTER TABLE `coupons_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `coupons_subcategories`
--
ALTER TABLE `coupons_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

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
-- Índices para tabela `form_contact`
--
ALTER TABLE `form_contact`
  ADD PRIMARY KEY (`id`);

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
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

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
-- Índices para tabela `system_paypal`
--
ALTER TABLE `system_paypal`
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
  ADD KEY `system_mercadopago_id` (`system_mercadopago_id`),
  ADD KEY `system_paypal_id` (`system_paypal_id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `coupons_products`
--
ALTER TABLE `coupons_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `coupons_subcategories`
--
ALTER TABLE `coupons_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `depoiments`
--
ALTER TABLE `depoiments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `form_contact`
--
ALTER TABLE `form_contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1054;

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
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `products_related`
--
ALTER TABLE `products_related`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de tabela `products_subcategories`
--
ALTER TABLE `products_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de tabela `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de tabela `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT de tabela `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de tabela `requests_products`
--
ALTER TABLE `requests_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de tabela `request_address`
--
ALTER TABLE `request_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de tabela `request_payment`
--
ALTER TABLE `request_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;

--
-- AUTO_INCREMENT de tabela `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;

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
-- AUTO_INCREMENT de tabela `system_paypal`
--
ALTER TABLE `system_paypal`
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
-- Limitadores para a tabela `coupons_products`
--
ALTER TABLE `coupons_products`
  ADD CONSTRAINT `coupons_products_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupons_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `coupons_subcategories`
--
ALTER TABLE `coupons_subcategories`
  ADD CONSTRAINT `coupons_subcategories_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupons_subcategories_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `requests_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
  ADD CONSTRAINT `system_store_ibfk_4` FOREIGN KEY (`system_mercadopago_id`) REFERENCES `system_mercadopago` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `system_store_ibfk_5` FOREIGN KEY (`system_paypal_id`) REFERENCES `system_paypal` (`id`) ON UPDATE CASCADE;

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
