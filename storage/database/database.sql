-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Fev-2022 às 02:49
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
(9, 'Ryan Menezes', 'ryan@gmail.com', '$2y$10$7cz.QGiN3LEPvlSxT0pFL.ewITfVsXramI2IDiEeMt6AMxJDzJ07q', '1199999999', '11999999999', '53881489800', '', NULL, NULL, NULL, 1, 11, 11, '2022-01-14 20:42:09', '2022-01-30 19:13:12'),
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
(25, 9, 40),
(26, 9, 39),
(27, 9, 36),
(28, 9, 37),
(29, 9, 38),
(30, 9, 35),
(31, 9, 34);

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
(7, 'Marvel lança segundo trailer de homem aranha sem volta pra casa', 'marvel-lanca-segundo-trailer-de-homem-aranha-sem-volta-pra-casa', 'homem aranha, spider man, filmes, lançamentos, marvel', 1, 0, 410, 'Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.', '{\"elements\":[{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit <a href=\\\"https:\\/\\/www.marvel.com\\/\\\" target=\\\"_blank\\\" title=\\\"Site da Marvel\\\" rel=\\\"nofollow\\\">Marvel<\\/a>. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\\r\\n\\r\\n<blockquote>Et repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem<\\/blockquote>\"},{\"type\":\"image\",\"src\":\"notices\\/e58e5a78106b5acfb4e2206a8f36552b.jpg\",\"title\":\"Homem aranha sem volta pra casa\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p>\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!\"},{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Aut odio nulla rem quod porro eum expedita voluptates est quis reprehenderit magnam repudiandae aut voluptate dolorem. Cum consequatur tempora aut culpa harum 33 delectus modi et veritatis consequatur et doloribus autem et consequatur ducimus. Sed voluptatem fuga aut labore nesciunt et minima repellat ex amet sunt.\\r\\n\\r\\nEa velit architecto ad corporis laborum sed aperiam cupiditate? Ut molestiae enim eum repudiandae mollitia vel possimus velit. Sed iusto alias non odit quisquam est quis laboriosam. Sit nihil cupiditate sed voluptates delectus 33 nisi galisum cum voluptatem galisum in iure quia aut rerum harum.\\r\\n\\r\\nEt repudiandae sapiente est veritatis facere At voluptate nostrum vel voluptate neque aut expedita nostrum ut esse quis est corrupti perferendis. Eos tenetur illo rem ratione unde cum eaque unde ut ducimus voluptatem!<\\/p><p><br><\\/p><h2>Veja o trailer abaixo:<\\/h2><p><br><\\/p>\"},{\"type\":\"youtube\",\"videocode\":\"CyiiEJRZjSU\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=CyiiEJRZjSU\"}]}', 'notices/1292cb0ca4a313e7402d7c75178ddeda.jpg', NULL, 1, '2021-11-28 23:33:47', '2022-01-28 23:06:40'),
(8, 'Melhor comida do  mundo!', 'melhor-comida-do-mundo!', 'comida, mundo, melhor do mundo', 1, 1, 45, 'Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat.', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p>Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!<\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/96abe6a7b2ae3a06cdbe7f3e2ad649aa.jpg\",\"title\":\"Nova Imagem\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"},{\"type\":\"text\",\"content\":\"Lorem ipsum dolor sit amet. Ut harum cupiditate 33 omnis enim ex itaque illo hic sapiente debitis id dolores qui minima consequuntur. Eos odit itaque ea corrupti non consequatur dolor ex consequatur dolorem! Qui dolores doloribus et reprehenderit reiciendis ab veniam dolor et praesentium laudantium accusamus quia aut temporibus placeat. Aut iusto dicta et consectetur quia sed libero voluptas ut molestias minus. Non incidunt velit et fugit voluptatem aut doloremque provident. Sit laboriosam eligendi ex quasi dolor qui laboriosam facilis et voluptas earum et assumenda consectetur est consequatur voluptatum in odio quia. Et dolorem rerum qui magni deleniti id provident tempora qui ratione mollitia. Est velit similique id laboriosam blanditiis qui quia rerum sit consectetur eveniet. Eos ratione asperiores et magni maxime ut dolorem omnis hic ipsam vitae ut veritatis laboriosam. Ut excepturi ducimus vel accusamus nisi et cumque facilis et dolores dolorum. Ea accusamus nobis nam possimus voluptatem et dolor ullam eum officia quia.\\r\\n\\r\\nSed similique officia quo vero debitis id reprehenderit consequatur rem quaerat perferendis et sint sunt! Et minima nobis eos eveniet distinctio id deserunt voluptatem et excepturi quos! Vel atque dignissimos sed placeat consequatur ut voluptatem nisi sit eaque repudiandae et dolor expedita. Aut dolores Quis 33 voluptatibus iste aut repudiandae nesciunt ab distinctio obcaecati qui commodi velit. Ut quisquam obcaecati quo saepe architecto vel vero autem ab dolor velit sed omnis quasi eum praesentium nulla ad ratione nihil. Et mollitia velit quia culpa aut galisum beatae qui deleniti sunt. Aut libero velit id velit nihil est fuga quibusdam sed eaque facilis qui incidunt ipsum. Sed tenetur illum sit minima excepturi et quia omnis.\\r\\n\\r\\nQui obcaecati suscipit rem iste expedita ex fugit aperiam. Vel beatae veritatis est reiciendis maiores sit cupiditate nobis ea quia magnam vel illo rerum. Et dolorem voluptatem in eveniet reiciendis qui similique dolor 33 voluptatibus amet eos velit nisi ut accusamus corporis et quisquam dolores. Cum rerum deserunt ex error neque et quia assumenda vel internos galisum eum aspernatur voluptatem. 33 accusamus quos ut iure distinctio sit accusantium officia aut omnis dolorum. Non dolorum voluptatum a numquam voluptatum rem aperiam modi. Aut reiciendis quis sed molestiae perferendis eum consectetur quisquam aut voluptatem neque est voluptas odit non consequuntur corporis. Ea aperiam debitis qui Quis inventore dolores tempora ut libero aperiam!\"}]}', 'notices/a9383ad32bc715ef4c3ddba94ee1a5e1.jpg', NULL, 1, '2021-11-30 19:54:49', '2022-01-24 19:48:13'),
(9, 'O autor de One Piece revela que este ano o anime terá o seu fim', 'o-autor-de-one-piece-revela-que-este-ano-o-anime-tera-o-seu-fim', 'one piece, animes', 1, 1, 7, 'O autor de One Piece revela que este ano o anime terá o seu fim', '{\"elements\":[{\"type\":\"text\",\"content\":\"<p><strong style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\"><br><\\/span><\\/p>\"},{\"type\":\"image\",\"src\":\"notices\\/9f2aa1dbdcd25c1410764e6c017837aa.png\",\"title\":\"One Piece\"},{\"type\":\"text\",\"content\":\"<p><span style=\\\"font-weight: bolder; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><\\/p>\"},{\"type\":\"text\",\"content\":\"<p><span style=\\\"font-weight: bolder; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Lorem Ipsum<\\/span><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><br><\\/p><p><span style=\\\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><\\/p>\"}]}', 'notices/8267a383edec48d2e6863aba236764dc.png', NULL, 1, '2022-01-24 19:05:24', '2022-01-29 22:36:59');

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
(34, 45, 37),
(35, 45, 38),
(36, 45, 40),
(37, 45, 43),
(38, 45, 42),
(39, 44, 34),
(40, 44, 44),
(41, 43, 37),
(42, 43, 38),
(43, 43, 40),
(44, 43, 41);

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
(124, 1, 50, NULL, 34),
(125, 1, 5, NULL, 42),
(132, 1, 10, NULL, 45),
(133, 1, 5, NULL, 44),
(134, 1, 10, NULL, 43);

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
(548, 'Único', '500.00', '800.00', 5, '30.00', '30.00', '30.00', '1.00', 46),
(559, 'Único', '1200.00', '2000.00', 5, '100.00', '100.00', '100.00', '5.00', 49),
(560, 'P', '50.00', '100.00', 20, '50.00', '50.00', '50.00', '2.00', 48),
(561, 'M', '60.00', '120.00', 5, '50.00', '50.00', '50.00', '2.00', 48),
(562, 'G', '70.00', '140.00', 50, '50.00', '50.00', '50.00', '2.00', 48),
(563, 'Único', '150.00', '300.00', 50, '100.00', '50.00', '60.00', '2.00', 47);

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
(90, 'CA', 9, 95, 96, '2022-01-28 17:04:25', '2022-01-31 14:18:04'),
(91, 'CA', 9, 96, 97, '2022-01-28 17:13:52', '2022-01-28 18:25:38'),
(92, 'CA', 9, 97, 98, '2022-01-28 17:59:43', '2022-01-28 18:35:46'),
(93, 'CA', 9, 98, 99, '2022-01-28 18:37:19', '2022-01-28 18:38:23'),
(94, 'CA', 9, 99, 100, '2022-01-28 18:42:53', '2022-01-28 19:45:47'),
(95, 'CA', 9, 100, 101, '2022-01-28 19:46:06', '2022-01-28 19:50:56'),
(96, 'CA', 9, 101, 102, '2022-01-28 19:48:28', '2022-01-28 19:50:50'),
(97, 'AP', 9, 102, 103, '2022-01-28 19:51:24', '2022-01-28 19:51:24'),
(98, 'AP', 9, 103, 104, '2022-01-28 19:52:32', '2022-01-28 19:52:32'),
(99, 'CA', 9, 104, 105, '2022-01-28 19:54:36', '2022-01-29 00:09:26'),
(100, 'AP', 9, 105, 106, '2022-01-28 19:57:27', '2022-01-28 19:57:27'),
(101, 'AP', 9, 106, 107, '2022-01-28 19:59:36', '2022-01-28 19:59:36'),
(102, 'CA', 9, 107, 108, '2022-01-28 22:46:14', '2022-01-28 23:36:30'),
(103, 'CA', 9, 108, 109, '2022-01-29 00:02:29', '2022-01-29 00:09:18'),
(104, 'CA', 9, 109, 110, '2022-01-29 00:10:42', '2022-01-29 00:11:41'),
(105, 'AP', 9, 110, 111, '2022-01-29 00:15:45', '2022-01-29 00:15:45'),
(106, 'AP', 9, 111, 112, '2022-01-29 00:19:30', '2022-01-29 00:19:30'),
(107, 'AP', 9, 112, 113, '2022-01-29 00:31:35', '2022-01-29 00:31:35'),
(108, 'AP', 9, 113, 114, '2022-01-29 00:44:24', '2022-01-29 00:44:24'),
(109, 'AP', 9, 114, 115, '2022-01-29 00:46:41', '2022-01-29 00:46:41'),
(110, 'AP', 9, 115, 116, '2022-01-29 00:48:51', '2022-01-29 00:48:51'),
(111, 'AP', 9, 116, 117, '2022-01-29 00:49:37', '2022-01-29 00:49:37'),
(112, 'AP', 9, 117, 118, '2022-01-29 02:09:46', '2022-01-29 02:09:46'),
(113, 'AP', 9, 118, 119, '2022-01-29 18:20:48', '2022-01-29 18:20:48'),
(114, 'CA', 9, 119, 120, '2022-01-29 18:24:58', '2022-01-29 19:06:30'),
(115, 'CA', 9, 120, 121, '2022-01-29 18:36:24', '2022-01-29 19:06:25'),
(116, 'CA', 9, 121, 122, '2022-01-29 18:38:42', '2022-01-29 19:06:20'),
(117, 'CA', 9, 122, 123, '2022-01-29 18:40:03', '2022-01-29 19:06:14'),
(118, 'CA', 9, 123, 124, '2022-01-29 18:41:08', '2022-01-29 19:06:09'),
(119, 'CA', 9, 124, 125, '2022-01-29 18:44:03', '2022-01-29 18:56:15'),
(120, 'CA', 9, 125, 126, '2022-01-29 18:57:07', '2022-01-29 19:06:02'),
(121, 'CA', 9, 126, 127, '2022-01-29 19:04:49', '2022-01-29 19:05:57'),
(122, 'AP', 9, 127, 128, '2022-01-29 19:23:53', '2022-01-29 19:23:53'),
(123, 'AP', 9, 128, 129, '2022-01-29 19:30:10', '2022-01-29 19:30:10'),
(124, 'AP', 9, 129, 130, '2022-01-29 20:06:39', '2022-01-29 20:06:39'),
(125, 'AP', 9, 130, 131, '2022-01-29 20:11:28', '2022-01-29 20:11:28'),
(127, 'AP', 9, 132, 133, '2022-01-29 20:15:25', '2022-01-29 20:15:25'),
(128, 'AP', 9, 133, 134, '2022-01-29 20:39:11', '2022-01-29 20:39:11'),
(129, 'AP', 9, 134, 135, '2022-01-29 22:11:56', '2022-01-29 22:11:56'),
(130, 'CA', 9, 135, 136, '2022-01-29 22:19:27', '2022-01-31 14:20:18'),
(131, 'AP', 9, 136, 137, '2022-01-29 22:30:06', '2022-01-29 22:30:06'),
(132, 'AP', 9, 137, 138, '2022-01-29 22:34:08', '2022-01-29 22:34:08'),
(133, 'CA', 9, 138, 139, '2022-01-29 22:56:28', '2022-01-31 14:17:26'),
(134, 'PA', 9, 139, 140, '2022-01-31 12:44:30', '2022-01-31 14:59:32'),
(135, 'CA', 9, 140, 141, '2022-01-31 16:04:57', '2022-01-31 16:06:41'),
(136, 'AP', 9, 141, 142, '2022-02-01 01:41:18', '2022-02-01 01:41:18');

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
(126, 'Preto', 'M', '500.00', 1, 101, 40),
(127, 'Preto', '12 Polegadas', '800.30', 1, 102, 41),
(128, 'Preto', 'M', '500.00', 1, 102, 40),
(129, 'Preto', '10x40', '800.00', 1, 102, 39),
(130, 'Preto', '12 Polegadas', '800.30', 1, 103, 41),
(131, 'Preto', 'M', '500.00', 1, 103, 40),
(132, 'Preto', '10x40', '800.00', 1, 104, 39),
(133, 'Preto', '10x40', '800.00', 1, 105, 39),
(134, 'Preto', 'M', '500.00', 1, 105, 40),
(135, 'Preto', '12 Polegadas', '800.30', 1, 106, 41),
(136, 'Cinza', 'P', '20.00', 1, 106, 34),
(137, 'Preto', '12 Polegadas', '800.30', 1, 107, 41),
(138, 'Cinza', 'P', '20.00', 1, 107, 34),
(139, 'Preto', '12 Polegadas', '800.30', 1, 108, 41),
(140, 'Cinza', 'P', '20.00', 1, 108, 34),
(141, 'Preto', '12 Polegadas', '800.30', 1, 109, 41),
(142, 'Cinza', 'P', '20.00', 1, 109, 34),
(143, 'Preto', '12 Polegadas', '800.30', 1, 110, 41),
(144, 'Cinza', 'P', '20.00', 1, 110, 34),
(145, 'Preto', '12 Polegadas', '800.30', 1, 111, 41),
(146, 'Preto', '12 Polegadas', '800.30', 1, 112, 41),
(147, 'Preto', 'M', '500.00', 1, 112, 40),
(148, 'Preto', '12 Polegadas', '800.30', 1, 113, 41),
(149, 'Preto', '12 Polegadas', '800.30', 1, 114, 41),
(150, 'Preto', 'M', '500.00', 1, 114, 40),
(151, 'Preto', '10x40', '800.00', 1, 114, 39),
(152, 'Preto', '12 Polegadas', '800.30', 1, 115, 41),
(153, 'Preto', 'M', '500.00', 1, 115, 40),
(154, 'Preto', '12 Polegadas', '800.30', 1, 116, 41),
(155, 'Preto', 'M', '500.00', 1, 116, 40),
(156, 'Preto', '12 Polegadas', '800.30', 1, 117, 41),
(157, 'Preto', 'M', '500.00', 1, 117, 40),
(158, 'Preto', '12 Polegadas', '800.30', 1, 118, 41),
(159, 'Preto', 'M', '500.00', 1, 119, 40),
(160, 'Preto', '12 Polegadas', '800.30', 1, 120, 41),
(161, 'Preto', 'M', '500.00', 1, 120, 40),
(162, 'Preto', '12 Polegadas', '800.30', 1, 121, 41),
(163, 'Preto', 'M', '500.00', 1, 121, 40),
(164, 'Preto', '12 Polegadas', '800.30', 1, 122, 41),
(165, 'Preto', 'M', '500.00', 1, 122, 40),
(166, 'Preto', '12 Polegadas', '800.30', 1, 123, 41),
(167, 'Preto', 'M', '500.00', 1, 123, 40),
(168, 'Preto', '12 Polegadas', '800.30', 1, 124, 41),
(169, 'Preto', 'M', '500.00', 1, 125, 40),
(170, 'Preto', '10x40', '800.00', 1, 125, 39),
(171, 'Preto', '12 Polegadas', '800.30', 1, 127, 41),
(172, 'Preto', 'M', '500.00', 1, 127, 40),
(173, 'Preto', '12 Polegadas', '800.30', 1, 128, 41),
(174, 'Preto', 'M', '500.00', 1, 128, 40),
(175, 'Preto', '12 Polegadas', '800.30', 1, 129, 41),
(176, 'Preto', 'M', '500.00', 1, 129, 40),
(177, 'Preto', '10x60x20', '8000.00', 1, 130, 37),
(178, 'Preto', 'M', '500.00', 1, 131, 40),
(179, 'Preto', '12 Polegadas', '800.30', 1, 132, 41),
(180, 'Cinza Escuro', 'P', '30.00', 4, 133, 34),
(181, 'Preto', '12 Polegadas', '800.30', 1, 134, 41),
(182, 'Preto', '12 Polegadas', '800.30', 1, 135, 41),
(183, 'Preto', 'M', '500.00', 1, 135, 40),
(184, 'Preto', '10x40', '800.00', 1, 136, 39),
(185, 'Preto com Led', 'Único', '150.00', 1, 136, 43);

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
(106, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(107, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(108, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(109, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(110, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(111, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(112, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(113, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(114, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(115, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(116, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(117, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(118, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(119, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(120, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(121, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(122, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(123, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(124, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(125, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(126, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(127, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(128, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(129, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(130, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(132, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(133, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(134, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(135, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(136, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(137, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(138, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(139, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(140, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', ''),
(141, '11111111', 'Rua Batista', '21', 'Jardim Batista', 'São Paulo', 'SP', '');

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

--
-- Extraindo dados da tabela `request_payment`
--

INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `qrcode_hash`, `details`, `created_at`, `updated_at`) VALUES
(88, NULL, 'PC', 'PX', 'expired', 'CA', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"referenceId\":\"82\",\"status\":\"expired\",\"createdAt\":\"2022-01-26T14:38:11.000000Z\",\"updatedAt\":\"2022-01-26T16:29:18.000000Z\",\"value\":150}', '2022-01-26 18:48:28', '2022-01-26 18:48:30'),
(89, '097F0BAB-BEDC-4055-A658-1DB4813172B0', 'PS', 'DO', '3', 'PA', 1, 2, '16000.00', '3200.00', '45.50', '1600.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=468836efe0b8fcf5b8d903c498604b0591b6bf8a6dfc4488ef0ff825e0e4396bb324d1ef6ca02268', NULL, NULL, '{\"date\":\"2022-01-26T12:23:57.000-03:00\",\"code\":\"097F0BAB-BEDC-4055-A658-1DB4813172B0\",\"reference\":\"83\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-26T12:25:50.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=468836efe0b8fcf5b8d903c498604b0591b6bf8a6dfc4488ef0ff825e0e4396bb324d1ef6ca02268\",\"grossAmount\":\"1060.00\",\"discountAmount\":\"45.50\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"50.62\"},\"netAmount\":\"963.48\",\"extraAmount\":\"-390.00\",\"escrowEndDate\":\"2022-02-09T12:25:50.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"d1d6a7eae40b025e869ac0853049efc2\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"2686b822a1b95a0940e608accafd292a\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:50:40', '2022-01-26 18:50:43'),
(90, 'A1CFDD09-B06B-4085-A931-656939C7D272', 'PS', 'DO', '3', 'PA', 1, 2, '8000.00', '1600.00', '1903.89', '800.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=86812bdb74e28be7824d4ea87838ce036a4b8b11d7ced6c7989210b5cde4b3c1229bd8ca33eec9a1', NULL, NULL, '{\"date\":\"2022-01-26T15:17:41.000-03:00\",\"code\":\"A1CFDD09-B06B-4085-A931-656939C7D272\",\"reference\":\"84\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-26T15:18:07.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"302\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=86812bdb74e28be7824d4ea87838ce036a4b8b11d7ced6c7989210b5cde4b3c1229bd8ca33eec9a1\",\"grossAmount\":\"954.19\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"47.61\"},\"netAmount\":\"906.18\",\"extraAmount\":\"-496.11\",\"escrowEndDate\":\"2022-02-09T15:18:07.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"69db61ce36a56178711fec066e07aeb6\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"62306523b3c77c077b2938f0d6ab91f5\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:51:45', '2022-01-26 18:51:48'),
(91, '04CDAB4F-10F8-4873-A6F4-0DD103251E76', 'PS', 'CC', '6', 'DE', 6, 2, '9300.00', '1860.00', '2400.00', '930.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"date\":\"2022-01-26T15:20:07.000-03:00\",\"code\":\"04CDAB4F-10F8-4873-A6F4-0DD103251E76\",\"reference\":\"85\",\"type\":\"1\",\"status\":\"6\",\"lastEventDate\":\"2022-01-26T15:24:17.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"1060.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"86.50\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"52.89\"},\"netAmount\":\"920.21\",\"extraAmount\":\"-390.00\",\"escrowEndDate\":\"2022-02-09T15:22:53.000-03:00\",\"installmentCount\":\"6\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"9d12d071c18b535cda26f47f20e5c7ae\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"},{\"id\":\"2a8009525763356ad5e3bb48b7475b4d\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-26 18:54:01', '2022-01-26 18:54:03'),
(92, NULL, NULL, NULL, NULL, 'AP', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, NULL, '2022-01-26 18:54:32', '2022-01-26 18:54:32'),
(93, NULL, 'PC', 'PX', 'expired', 'CA', 1, 2, '1300.30', '260.06', '106.02', '130.03', 'PE', '150.00', 5, NULL, 'https://app.picpay.com/checkout/NjFmMmUxMDJhNjc0ZWIyYzBhM2UyYjI4', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141415a414141414751434149414141415033614762414141414358424957584d41414137454141414f784147564b7734624141414c48306c45515652346e4f33643230356a4f525246556170552f2f2f4a714e2b376a655353653138576a50454d4f53454a553066796a763372382f507a41794442372b6b6e4148424c734941596767584545437767686d41424d51514c6943465951417a42416d494946684244734941596767584545437767686d41424d51514c6943465951417a42416d494946684244734941596767584545437767686d41424d51514c6943465951417a42416d49494668424473494159676758452b4650786f4c392f722b7667352b666e35552f65502f6e6a5978352f2f66377139783566354d656e5650466e566e78736f6c2f352b7863352b6a2f7572367a374f77472b496c6841444d45435967675745454f77674269434263516f475773344b6c726d2f4b2f374a6437485a65505a4359614b3565324b6b593548625265366635456635784c61526841572f7366394439647175784c41493845435967675745454f7767426943426351514c43424733316a4430657957412f652f506a7573384c6774784f506965735856377a302b7a38664876502f31696747494372502f63652f63595145784241754949566841444d45435967675745454f7767426a445977327a4b74626d4b3459415a6c66484b353738374c595146527479564978666a4d38514c4f514f433467685745414d77514a6943425951513743414749494678506a525977327a612f4e7450336e763866794f783539382f4e76625a6b66756d57443433376e44416d494946684244734941596767584545437767686d41424d596248476d5a58633974573853753248486855636472467659707a4d53716530757a684978585335796663595145784241754949566841444d45435967675745454f77674268395977327a712f6a3332725a77614c7636374c42437852344d733164766d77785965434c4a75472f344a7748666c5741424d51514c6943465951417a42416d49494668436a5a4b776835527668432b635348682f7a3375795a4377764e7a6e6c5566454b2b4a58645951417a42416d49494668424473494159676758454543776752736c5951397658784263653770447946666e4835316e785a375a746a6242777734504854334c304a68392f4a654f2f432b4244734941676767584545437767686d41424d51514c694c46787434614679374570712f68744a3268552f50713978354d706a6f3550366645546b764c7239385a6e4864786841544545433467685745414d77514a694342595151374341474c387156682f6256736358616c7577663153785a44373770662f5a557a6c6d5037514c6e3779784275436e45797767686d41424d51514c6943465951417a42416d4b556a445538616c767a7274697459654542422f66615a6c7a6158766d4b575965465177414c6e314b526466387a414638524c434347594145784241754949566841444d45435976534e4e63782b51582f3264495a486266736c564667344b6e482f6d4c4e6d427773366a356134742b354e4176694b594145784241754949566841444d454359676757454f505039424e34556e475377717a5a45783857546b58635737686a5164756e7275324e472f382f57766578412f694b594145784241754949566841444d45435967675745474e3474345a4843383849534e6b42346c48305a672f333274366a697447544e7031507952305745454f7767426943426351514c434347594145784241754955624a62772b78582b64746d48653466632b47333969742b6665452b4247337a4b473350632b456f547964335745414d77514a69434259515137434147494946784241734945624a5745506274387772766b792f384869466f396e644c3259583178634f6c4e784c6d544a5a2b4e4a39754d4d436767675745454f7767426943426351514c434347594145782b673668574768324b714a746234504871332b2f2b596d466e2f6e5a62545a32546a416375634d435967675745454f7767426943426351514c434347594145784e6835434d627546772f30524134396d427941654c647a5834616a7445496f3273794d493478396164316841444d45435967675745454f7767426943426351514c4342473332344e4656386f50337063696d37624871427468586a684268494c333650374339314c4f64446b61505a442b355867467854346151514c6943465951417a42416d494946684244734941594a627331564b6a59576546783554566c7334665a437a3375367a44376c4f363148662b524d6f64557842305745454f7767426943426351514c43434759414578424175493054665738454f4f6c6a697157417875573243653356476a5976546b3063494a686f716e315059652f5256335745414d77514a69434259515137434147494946784241734945624a49525452652b38667a523661384c6a41765042776833757a692b7356463670343479727333465869753555462b4d5945433467685745414d77514a6943425951513743414743566a446663656c336a62646f413471706768754e65325a38446a5939356671474a7076324a746676616a7550424378686f414467514c6943465951417a42416d4949466842447349415966596451334b2b6e5071356b507936795070356855624532582f47742f6262486242737365487a4d364e4d5a326a377a73314e51482b367767434343426351514c4343475941457842417549495668416a4c3678686f58664d722b2f304f797777754e6b774d4b7445576274584c422f6b664b5a662b634f433467685745414d77514a69434259515137434147494946784e69345738507359315a6f5733572b762f726a536e62624b7a39374e73536a78386d56746c632b614b516a3478386534454f7767434343426351514c434347594145784241754955544c575550486c37396e392f47655056356964594c692f30464846307636396976306e326b593632715933466b3645664d556446684244734941596767584545437767686d41424d51514c6950467234654a6c3942344d7336764f7336634a7a4536757046786f346363375a66654c4433645951424442416d49494668424473494159676758454543776752743959772b7a47444c50722f55635663776d7a757a5573334271686255654e783665557373484a2b4b79444f797767686d41424d51514c6943465951417a42416d49494668426a3432344e6a7861754f732f4f45455476363944326b30634c7a2b3959754c4e4335395864595145784241754949566841444d45435967675745454f776742682f4b68353064693335636456353462344f5277753357336938304f794c5850454a656254776c4a4e7837724341474949467842417349495a6741544545433467685745434d6b7430614675354463502f72523750722f52555875746532356c307844584f556373704a78527433663647646530573477774a694342595151374341474949467842417349495a6741544532486b495266597245374f7535634c6547364b7458504d2f5a777a4965663333384d2b384f433467685745414d77514a6943425951513743414749494678436735684f4c6f63554830667046316470662b326258352b352b635851692f742f44736b725a562f4c5a5038694f374e5141634342595151374341474949467842417349495a674154464b7868706d6877416531366662546a31494f572f692f6b495637337662795252486266736c7a46366f6252626e586377544252417349495a6741544545433467685745414d77514a69444f2f57634e533273384c39727a397147344359585a392b66504a7475794173584e7166485a465a2b494a385a654e7a416a67534c434347594145784241754949566841444d45435976534e4e5278567247512f507562436f5971323878455748693378714f3344384867655374747544592b504f587371783463374c434349594145784241754949566841444d454359676757454f4e5832354a6b32334c737665697a4952592b35714f4b66523153706b7a616a7639596550572f3467344c6943465951417a42416d49494668424473494159676758454742357275446537346e367659734f446c4e47546969474174744d5a5a76644c754e663249752f386a334f48426351514c434347594145784241754949566841444d45435970534d4e63784f4d4c534e43387975347439622b4a54757a523741556647555a6c2f506f36425a68335776486342584241754949566841444d45435967675745454f7767426839757a55734e487534513975793863494e4a4e704f44326e6261754a657969752f6334735264316841444d45435967675745454f7767426943426351514c4344476e346f4854666b2b2b6c48626b3239624e6d37624d364269554b4e744969526c5a34576a7878636b614c5970342f30412b4241734949686741544545433467685745414d77514a696c497731484c55746e565a4d4272536455504334754c3777774968486a332f52347874584d58725364733749766366505a7964335745414d77514a694342595151374341474949467842417349456266574d4e527858372b6a31642f584d31744f31726933754f6b7866456e4636374e5031356f34596b6b39342f35714f49543468414b344b63544c434347594145784241754949566841444d4543596779504e5378554d576c5273554c6339704e4846584d657338397a3967794c32534d77646b3477484c6e44416d494946684244734941596767584545437767686d41424d5977312f467646476d3346462f526e6e2b66434266754b493058754c2f54344873324f4331534d695252786877584545437767686d41424d51514c6943465951417a42416d494d6a7a574d72354b2b6546794b72766a623237376666315478743065667a74426d34565345517969416e30367767426943426351514c4343475941457842417549305466574d4c76696675392b6a6262743349473267786a75663731743269426c78344b4b4e2b366f596f5a673967694d76374c784f5145634352595151374341474949467842417349495a674154462b52652b584150776f37724341474949467842417349495a6741544545433467685745414d77514a694342595151374341474949467842417349495a6741544545433467685745414d77514a694342595151374341474949467842417349495a6741544545433467685745414d77514a694342595151374341474949467842417349495a674154482b4161542f74435449695841564141414141456c46546b5375516d4343, NULL, '{\"referenceId\":\"request_87\",\"status\":\"expired\",\"createdAt\":\"2022-01-27T18:14:26.000000Z\",\"updatedAt\":\"2022-01-27T23:07:43.000000Z\",\"value\":954.19}', '2022-01-27 14:12:10', '2022-01-28 14:53:46'),
(94, '1245707677', 'MP', 'CC', 'approved', 'PA', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-28T10:31:21.000-04:00\",\"date_last_updated\":\"2022-01-28T10:31:21.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"503143\",\"id\":null,\"last_four_digits\":\"6351\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T10:31:21.628-04:00\",\"date_created\":\"2022-01-28T10:31:21.516-04:00\",\"date_last_updated\":\"2022-01-28T10:31:21.628-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_88\",\"fee_details\":[{\"amount\":72.37,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245707677,\"installments\":1,\"integrator_id\":null,\"issuer_id\":\"24\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T10:31:21.628-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"master\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"approved\",\"status_detail\":\"accredited\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450.3,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1450.3,\"net_received_amount\":1377.93,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1450.3}}', '2022-01-27 19:02:29', '2022-01-28 19:51:14'),
(95, '1245710612', 'MP', 'CC', 'refunded', 'DE', 5, 2, '2100.30', '420.06', '0.00', '210.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"640.27001953125\"},{\"category_id\":null,\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Headset\",\"unit_price\":\"339.9700012207031\"},{\"category_id\":null,\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Celular LG K4\",\"unit_price\":\"639.969970703125\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menzes\"},\"date_created\":\"2022-01-28T12:52:40.000-04:00\",\"date_last_updated\":\"2022-01-28T12:52:40.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"375365\",\"id\":null,\"last_four_digits\":\"6885\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T12:52:41.105-04:00\",\"date_created\":\"2022-01-28T12:52:40.901-04:00\",\"date_last_updated\":\"2022-01-28T15:51:13.784-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_89\",\"fee_details\":[{\"amount\":193.29,\"fee_payer\":\"payer\",\"type\":\"financing_fee\"},{\"amount\":80.85,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245710612,\"installments\":5,\"integrator_id\":null,\"issuer_id\":\"18\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T12:52:41.105-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044161236\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"amex\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":1620.21,\"date_created\":\"2022-01-28T15:51:13.784-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245701830,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245710612,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1620.21,\"transaction_amount_refunded\":1620.21,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":362.7,\"net_received_amount\":1539.36,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1813.5}}', '2022-01-28 16:24:27', '2022-01-28 19:51:08'),
(96, '1245710695', 'MP', 'CC', 'refunded', 'DE', 2, 2, '2100.30', '420.06', '0.00', '210.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-28T13:08:15.000-04:00\",\"date_last_updated\":\"2022-01-28T13:08:15.000-04:00\",\"expiration_month\":12,\"expiration_year\":2030,\"first_six_digits\":\"503143\",\"id\":null,\"last_four_digits\":\"6351\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T13:08:15.113-04:00\",\"date_created\":\"2022-01-28T13:08:15.004-04:00\",\"date_last_updated\":\"2022-01-28T15:51:06.211-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_90\",\"fee_details\":[{\"amount\":152.12,\"fee_payer\":\"payer\",\"type\":\"financing_fee\"},{\"amount\":112.29,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245710695,\"installments\":2,\"integrator_id\":null,\"issuer_id\":\"24\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T13:08:15.113-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"master\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":2250.3,\"date_created\":\"2022-01-28T15:51:06.211-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245702646,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245710695,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":2250.3,\"transaction_amount_refunded\":2250.3,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1201.21,\"net_received_amount\":2138.01,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":2402.42}}', '2022-01-28 17:04:25', '2022-01-28 19:51:01'),
(97, '1245711654', 'MP', 'CC', 'refunded', 'DE', 12, 2, '24000.00', '4800.00', '0.00', '2400.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"PC Gamer Completo | COR: Preto | TAMANHO: 10x60x20\",\"id\":null,\"picture_url\":null,\"quantity\":\"3\",\"title\":\"PC Gamer Completo\",\"unit_price\":\"5650.0\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-28T13:39:06.000-04:00\",\"date_last_updated\":\"2022-01-28T13:39:06.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"423564\",\"id\":null,\"last_four_digits\":\"5682\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T13:39:06.114-04:00\",\"date_created\":\"2022-01-28T13:39:06.006-04:00\",\"date_last_updated\":\"2022-01-28T14:25:03.667-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":\"PC Gamer Completo\",\"differential_pricing_id\":null,\"external_reference\":\"request_91\",\"fee_details\":[{\"amount\":4025.63,\"fee_payer\":\"payer\",\"type\":\"financing_fee\"},{\"amount\":845.81,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245711654,\"installments\":12,\"integrator_id\":null,\"issuer_id\":\"25\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T13:39:06.114-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044464681\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"visa\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":16950,\"date_created\":\"2022-01-28T14:25:03.667-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245702563,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245711654,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":16950,\"transaction_amount_refunded\":16950,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1747.97,\"net_received_amount\":16104.19,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":20975.63}}', '2022-01-28 17:13:52', '2022-01-28 18:26:11'),
(98, '1245712070', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245712070&payment_method_reference_id=9913831236&caller_id=130141172&hash=721c89b5-f9a9-490c-abe1-f8950dce3d4e', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"710.2100219726562\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"barcode\":{\"content\":\"23794888200000710213380260991383123600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T14:00:22.127-04:00\",\"date_last_updated\":\"2022-01-28T14:35:26.351-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_92\",\"fee_details\":[],\"id\":1245712070,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044595398\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":710.21,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245712070&payment_method_reference_id=9913831236&caller_id=130141172&hash=721c89b5-f9a9-490c-abe1-f8950dce3d4e\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913831236\",\"total_paid_amount\":710.21,\"verification_code\":\"9913831236\"}}', '2022-01-28 17:59:43', '2022-01-28 18:35:46'),
(99, '1245712444', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245712444&payment_method_reference_id=9913848054&caller_id=130141172&hash=08e5dcb3-b651-4751-bcec-7caa96269d83', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"710.2100219726562\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"barcode\":{\"content\":\"23792888200000710213380260991384805400633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T14:37:59.532-04:00\",\"date_last_updated\":\"2022-01-28T14:38:28.349-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_93\",\"fee_details\":[],\"id\":1245712444,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4044820347\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":710.21,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245712444&payment_method_reference_id=9913848054&caller_id=130141172&hash=08e5dcb3-b651-4751-bcec-7caa96269d83\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913848054\",\"total_paid_amount\":710.21,\"verification_code\":\"9913848054\"}}', '2022-01-28 18:37:19', '2022-01-28 18:38:44'),
(100, '1245712932', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '800.00', '160.00', '0.00', '80.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245712932&payment_method_reference_id=9913881315&caller_id=130141172&hash=aae64c7d-d808-4b41-9538-928e065af5ad', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888200000950003380260991388131500633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:44:13.230-04:00\",\"date_last_updated\":\"2022-01-28T15:45:52.028-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_94\",\"fee_details\":[],\"id\":1245712932,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":950,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245712932&payment_method_reference_id=9913881315&caller_id=130141172&hash=aae64c7d-d808-4b41-9538-928e065af5ad\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913881315\",\"total_paid_amount\":950,\"verification_code\":\"9913881315\"}}', '2022-01-28 18:42:53', '2022-01-28 19:45:47'),
(101, '1245713812', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245713812&payment_method_reference_id=9913882833&caller_id=130141172&hash=ac643fc7-b539-4c61-985d-7b9a03a959d4', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888200001450003380260991388283300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:46:37.496-04:00\",\"date_last_updated\":\"2022-01-28T15:51:00.894-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_95\",\"fee_details\":[],\"id\":1245713812,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245713812&payment_method_reference_id=9913882833&caller_id=130141172&hash=ac643fc7-b539-4c61-985d-7b9a03a959d4\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913882833\",\"total_paid_amount\":1450,\"verification_code\":\"9913882833\"}}', '2022-01-28 19:46:06', '2022-01-28 19:50:56'),
(102, '1245713829', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '500.00', '100.00', '0.00', '50.00', 'PE', '0.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245713829&payment_method_reference_id=9913883926&caller_id=130141172&hash=27d70b50-0743-47e2-bc5b-c2339bbed704', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23793888200000500003380260991388392600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:48:54.901-04:00\",\"date_last_updated\":\"2022-01-28T15:50:55.901-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_96\",\"fee_details\":[],\"id\":1245713829,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":500,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245713829&payment_method_reference_id=9913883926&caller_id=130141172&hash=27d70b50-0743-47e2-bc5b-c2339bbed704\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913883926\",\"total_paid_amount\":500,\"verification_code\":\"9913883926\"}}', '2022-01-28 19:48:28', '2022-01-28 19:50:50'),
(103, '1245714017', 'MP', 'BO', 'pending', 'AP', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245714017&payment_method_reference_id=9913885283&caller_id=130141172&hash=02b9be73-edd5-41cc-92bf-422493bf9abf', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888200001450303380260991388528300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:51:43.857-04:00\",\"date_last_updated\":\"2022-01-28T15:51:43.857-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_97\",\"fee_details\":[],\"id\":1245714017,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450.3,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245714017&payment_method_reference_id=9913885283&caller_id=130141172&hash=02b9be73-edd5-41cc-92bf-422493bf9abf\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913885283\",\"total_paid_amount\":1450.3,\"verification_code\":\"9913885283\"}}', '2022-01-28 19:51:24', '2022-01-28 19:52:09'),
(104, '1245714024', 'MP', 'BO', 'pending', 'AP', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245714024&payment_method_reference_id=9913886073&caller_id=130141172&hash=837e3ee1-a909-4ef6-a209-21ae5f3e3170', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888200001450003380260991388607300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:53:31.748-04:00\",\"date_last_updated\":\"2022-01-28T15:53:31.748-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_98\",\"fee_details\":[],\"id\":1245714024,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245714024&payment_method_reference_id=9913886073&caller_id=130141172&hash=837e3ee1-a909-4ef6-a209-21ae5f3e3170\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913886073\",\"total_paid_amount\":1450,\"verification_code\":\"9913886073\"}}', '2022-01-28 19:52:32', '2022-01-28 19:54:13');
INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `qrcode_hash`, `details`, `created_at`, `updated_at`) VALUES
(105, '1245713866', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245713866&payment_method_reference_id=9913886656&caller_id=130141172&hash=3f73f994-deff-404d-83ae-aeaa263bcadb', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23794888200001450003380260991388665600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:54:54.284-04:00\",\"date_last_updated\":\"2022-01-28T20:09:32.200-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_99\",\"fee_details\":[],\"id\":1245713866,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245713866&payment_method_reference_id=9913886656&caller_id=130141172&hash=3f73f994-deff-404d-83ae-aeaa263bcadb\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913886656\",\"total_paid_amount\":1450,\"verification_code\":\"9913886656\"}}', '2022-01-28 19:54:36', '2022-01-29 00:09:26'),
(106, NULL, NULL, NULL, NULL, 'AP', 1, 2, '800.00', '160.00', '0.00', '80.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, NULL, '2022-01-28 19:57:27', '2022-01-28 19:57:27'),
(107, '1245714060', 'MP', 'BO', 'pending', 'AP', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245714060&payment_method_reference_id=9913888927&caller_id=130141172&hash=2de9cecb-6586-4dc7-8b4e-c606656c987f', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888200001450303380260991388892700633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T15:59:54.807-04:00\",\"date_last_updated\":\"2022-01-28T15:59:54.807-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_101\",\"fee_details\":[],\"id\":1245714060,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1450.3,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245714060&payment_method_reference_id=9913888927&caller_id=130141172&hash=2de9cecb-6586-4dc7-8b4e-c606656c987f\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913888927\",\"total_paid_amount\":1450.3,\"verification_code\":\"9913888927\"}}', '2022-01-28 19:59:36', '2022-01-29 00:09:36'),
(108, '1245717687', 'MP', 'CC', 'refunded', 'DE', 1, 2, '2100.30', '420.06', '0.00', '210.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"APRO\"},\"date_created\":\"2022-01-28T19:33:59.000-04:00\",\"date_last_updated\":\"2022-01-28T19:33:59.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"503143\",\"id\":null,\"last_four_digits\":\"6351\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-28T19:33:59.452-04:00\",\"date_created\":\"2022-01-28T19:33:59.334-04:00\",\"date_last_updated\":\"2022-01-28T19:36:24.584-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_102\",\"fee_details\":[{\"amount\":112.29,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245717687,\"installments\":1,\"integrator_id\":null,\"issuer_id\":\"24\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-28T19:33:59.452-04:00\",\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"master\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":2250.3,\"date_created\":\"2022-01-28T19:36:24.584-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245718012,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245717687,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":2250.3,\"transaction_amount_refunded\":2250.3,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":2250.3,\"net_received_amount\":2138.01,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":2250.3}}', '2022-01-28 22:46:14', '2022-01-28 23:59:50'),
(109, '05D78A05-216A-4EC3-B20A-A9CDD37D32B2', 'PS', 'CC', '7', 'CA', 12, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"date\":\"2022-01-28T21:08:18.000-03:00\",\"code\":\"05D78A05-216A-4EC3-B20A-A9CDD37D32B2\",\"reference\":\"request_103\",\"type\":\"1\",\"status\":\"7\",\"cancellationSource\":\"INTERNAL\",\"lastEventDate\":\"2022-01-28T21:08:48.000-03:00\",\"paymentMethod\":{\"type\":\"1\",\"code\":\"101\"},\"grossAmount\":\"1060.21\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"installmentFeeAmount\":\"5.73\",\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"52.90\"},\"netAmount\":\"1001.18\",\"extraAmount\":\"-390.09\",\"installmentCount\":\"12\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"2ca1ce4a65bf5b60c60bd7c4a89a33f9\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"3251b4976f4b163ea8a8eadc83115c49\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"gatewaySystem\":{\"type\":\"cielo\",\"rawCode\":{},\"rawMessage\":{},\"normalizedCode\":{},\"normalizedMessage\":{},\"authorizationCode\":\"0\",\"nsu\":\"0\",\"tid\":\"0\",\"establishmentCode\":\"1056784170\",\"acquirerName\":\"CIELO\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-29 00:02:29', '2022-01-29 00:09:18'),
(110, '05CEFD0C-BA68-4F86-A686-D2254CD01A4F', 'PS', 'BO', '7', 'CA', 1, 2, '800.00', '160.00', '0.00', '80.00', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=2bd489f79d41fd9c71e82e8b420c712bb964a7dce6f74625dcbb63b1e5a71ea9d3a35cbec2b9cc58', NULL, NULL, '{\"date\":\"2022-01-28T21:11:03.000-03:00\",\"code\":\"05CEFD0C-BA68-4F86-A686-D2254CD01A4F\",\"reference\":\"request_104\",\"type\":\"1\",\"status\":\"7\",\"cancellationSource\":\"INTERNAL\",\"lastEventDate\":\"2022-01-28T21:11:46.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=2bd489f79d41fd9c71e82e8b420c712bb964a7dce6f74625dcbb63b1e5a71ea9d3a35cbec2b9cc58\",\"grossAmount\":\"710.00\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"35.43\"},\"netAmount\":\"674.17\",\"extraAmount\":\"-240.00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"b980be726641e1ce5cfa8dde32ee3bcf\",\"description\":\"Celular LG K4 | COR: Preto | TAMANHO: 10x40\",\"quantity\":\"1\",\"amount\":\"800.00\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-29 00:10:42', '2022-01-29 00:11:45'),
(111, NULL, NULL, NULL, NULL, 'AP', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, NULL, '2022-01-29 00:15:45', '2022-01-29 00:15:45'),
(112, '5F1A3CF9-DD35-4CC5-B339-BF22E94274DC', 'PS', 'DO', '1', 'AP', 1, 2, '820.30', '164.06', '217.26', '82.03', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=c7f2788a4b8c49671b083dfceb25b9348d064b4622bfb9759f1169c86ef24a1d0a796a7c3a9528af', NULL, NULL, '{\"date\":\"2022-01-28T21:28:38.000-03:00\",\"code\":\"5F1A3CF9-DD35-4CC5-B339-BF22E94274DC\",\"reference\":\"request_106\",\"recoveryCode\":\"7df5a68dd88c50bb29b1d8888282672dbbf0d555b4236ea2\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-28T21:28:39.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"304\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=c7f2788a4b8c49671b083dfceb25b9348d064b4622bfb9759f1169c86ef24a1d0a796a7c3a9528af\",\"grossAmount\":\"506.95\",\"discountAmount\":\"0.00\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"25.30\"},\"netAmount\":\"481.25\",\"extraAmount\":\"-463.35\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"42a7e8017ab9578358f118300f4720fb\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"de6e6702f8c798ff599809dc3729e5a1\",\"description\":\"Camisa Formal | COR: Cinza | TAMANHO: P\",\"quantity\":\"1\",\"amount\":\"20.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"99999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-29 00:19:30', '2022-01-29 00:28:34'),
(113, '1245717851', 'MP', 'BO', 'pending', 'AP', 1, 2, '820.30', '164.06', '0.00', '82.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245717851&payment_method_reference_id=9913997521&caller_id=130141172&hash=89ef0d73-2764-4b2b-b255-9fbe61ebff66', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23793888200000506953380260991399752100633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T20:37:54.004-04:00\",\"date_last_updated\":\"2022-01-28T20:37:54.004-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_107\",\"fee_details\":[],\"id\":1245717851,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":506.95,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245717851&payment_method_reference_id=9913997521&caller_id=130141172&hash=89ef0d73-2764-4b2b-b255-9fbe61ebff66\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913997521\",\"total_paid_amount\":506.95,\"verification_code\":\"9913997521\"}}', '2022-01-29 00:31:35', '2022-01-29 00:38:37'),
(114, '1245719549', 'MP', 'BO', 'pending', 'AP', 1, 2, '820.30', '164.06', '0.00', '82.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245719549&payment_method_reference_id=9913999169&caller_id=130141172&hash=ffff4013-6fdf-45d9-b59f-391d9248e393', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23793888200000506953380260991399916900633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T20:44:49.863-04:00\",\"date_last_updated\":\"2022-01-28T20:44:49.863-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_108\",\"fee_details\":[],\"id\":1245719549,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":506.95,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245719549&payment_method_reference_id=9913999169&caller_id=130141172&hash=ffff4013-6fdf-45d9-b59f-391d9248e393\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9913999169\",\"total_paid_amount\":506.95,\"verification_code\":\"9913999169\"}}', '2022-01-29 00:44:24', '2022-01-29 00:46:23'),
(115, '1245719559', 'MP', 'BO', 'pending', 'AP', 1, 2, '820.30', '164.06', '0.00', '82.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245719559&payment_method_reference_id=9914000093&caller_id=130141172&hash=e9fd1698-eef9-424a-90d7-4d52f2a50f00', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888200000506953380260991400009300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T20:47:54.708-04:00\",\"date_last_updated\":\"2022-01-28T20:47:54.708-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_109\",\"fee_details\":[],\"id\":1245719559,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":506.95,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245719559&payment_method_reference_id=9914000093&caller_id=130141172&hash=e9fd1698-eef9-424a-90d7-4d52f2a50f00\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9914000093\",\"total_paid_amount\":506.95,\"verification_code\":\"9914000093\"}}', '2022-01-29 00:46:41', '2022-01-29 00:47:55'),
(116, '1245717874', 'MP', 'BO', 'pending', 'AP', 1, 2, '820.30', '164.06', '217.26', '82.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245717874&payment_method_reference_id=9914000452&caller_id=130141172&hash=693bf616-e0e3-4100-a3c4-5eceef10f518', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23798888200000506953380260991400045200633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T20:49:09.325-04:00\",\"date_last_updated\":\"2022-01-28T20:49:09.325-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_110\",\"fee_details\":[],\"id\":1245717874,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":506.95,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245717874&payment_method_reference_id=9914000452&caller_id=130141172&hash=693bf616-e0e3-4100-a3c4-5eceef10f518\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9914000452\",\"total_paid_amount\":506.95,\"verification_code\":\"9914000452\"}}', '2022-01-29 00:48:51', '2022-01-29 00:49:07'),
(117, '1245720053', 'MP', 'BO', 'pending', 'AP', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245720053&payment_method_reference_id=9914016040&caller_id=130141172&hash=ac16a965-169a-4907-8183-3bf196452201', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"710.2100219726562\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888200000710213380260991401604000633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-28T22:00:16.107-04:00\",\"date_last_updated\":\"2022-01-28T22:00:16.107-04:00\",\"date_of_expiration\":\"2022-01-31T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_111\",\"fee_details\":[],\"id\":1245720053,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":null,\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4047681906\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":710.21,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245720053&payment_method_reference_id=9914016040&caller_id=130141172&hash=ac16a965-169a-4907-8183-3bf196452201\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9914016040\",\"total_paid_amount\":710.21,\"verification_code\":\"9914016040\"}}', '2022-01-29 00:49:37', '2022-01-29 02:00:18'),
(118, NULL, 'PC', 'PX', NULL, 'AP', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c, NULL, '{}', '2022-01-29 02:09:46', '2022-01-29 18:19:37'),
(119, NULL, 'PC', 'PX', NULL, 'AP', 1, 2, '800.30', '160.06', '71.02', '80.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c, NULL, '{}', '2022-01-29 18:20:48', '2022-01-29 18:21:01'),
(120, '1245728977', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '2100.30', '420.06', '0.00', '210.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:28:59.203-04:00\",\"date_last_updated\":\"2022-01-29T15:06:37.522-04:00\",\"date_of_expiration\":\"2022-01-29T12:18:50.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_114\",\"fee_details\":[],\"id\":1245728977,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071566.205802BR5909Cablam1276006Manaos62230519mpqrinter1245728977630490B3\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1566.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1566.2,\"transaction_id\":null}}', '2022-01-29 18:24:58', '2022-01-29 19:06:30'),
(121, '1245729037', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:36:39.781-04:00\",\"date_last_updated\":\"2022-01-29T15:06:32.609-04:00\",\"date_of_expiration\":\"2022-01-29T12:26:31.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_115\",\"fee_details\":[],\"id\":1245729037,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter124572903763044916\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1007.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1007.2,\"transaction_id\":null}}', '2022-01-29 18:36:24', '2022-01-29 19:06:25'),
(122, '1245729048', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:38:57.280-04:00\",\"date_last_updated\":\"2022-01-29T15:06:26.905-04:00\",\"date_of_expiration\":\"2022-01-29T12:28:48.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_116\",\"fee_details\":[],\"id\":1245729048,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter12457290486304E4AE\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1007.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1007.2,\"transaction_id\":null}}', '2022-01-29 18:38:42', '2022-01-29 19:06:20'),
(123, '1245728741', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c6956424f5277304b47676f414141414e5355684555674141425751414141566b41514141414142373969736341414149346b6c455156523432753364515a4c6253413446304c774237332f4c76414637303931464a5436536372686a596b792b576a68554d6b5539317534486b4d41342f3643664f57687061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c702f33767457482b4f3633742f582f4c50657a2b662b50644f482b2f4e7a342f39584c66635a66373952542b76456f4f576c7061576c7061576c7061576c76596c32754d613258352b2f626c64756e7452484156312f635469486b48624d47687061576c7061576c7061576c7061562b68765162493632553158693535736762442f4e30705939627637526930744c5330744c5330744c5330744c5476303835595a52737045355a6b4f55756c626d6d6a4c475261576c7061576c7061576c7061576c72616d3579594b6e356e36635173625a736635634879704c65686b7061576c7061576c7061576c706157396a336131454f5a6a7257563432713161544a353869556634664d33656b527061576c7061576c7061576c7061576e2f644f336f6d69762f742f2f38786b7756576c7061576c7061576c7061576c726150316d62662b70517831545475373658556d537149483763367670715936476c7061576c7061576c7061576c705832324e7031656d352b766a6c445971385a5339687566445a65314870674b68647671486930744c5330744c5330744c53307437524f3150326c756c75624b4a51546d42736c36454f353633637a6e37464c517a4447556c7061576c7061576c7061576c7062323664715043534a6c577367493962756a504e2b5352564e322f4b72596433365465576c7061576c7061576c7061576c7061522b715466696c4366507531396b4e6b327a3259572b65394b536c7061576c7061576c7061576c7058324e39737a54516b716472335a694c6a325a705562594650744b682b555964577a4b5155744c5330744c5330744c5330744c2b795a745758303277707271305655426d364a6765744c79754c5633387a354630744c5330744c5330744c5330744c53506b7062366e4c4e524a4a7237612b572b456f6c3779796e356e4c585a56325576653236704b576c7061576c7061576c7061576c665a3632584e464f334a386c57625933534e6b786e5a564c68554a61576c7061576c7061576c706157747158615a643657366e6b48615541574b437a784d484e7257616f4949346353476c7061576c7061576c7061576c7061562b684c5366617a7330592f3351754c6d304579482b48456136623458366c495a53576c7061576c7061576c7061576c76624a3271556b567a784e3161373055445956756f4a7168306b75706343446c7061576c7061576c7061576c7062324a646f4350664e4a7462755462796d427a6a7756636a476d4248715465576c7061576c7061576c7061576c7061522b6c545864716c6d4a76766d4b57693975702f75304466644e315355744c5330744c5330744c5330744c2b7a7874477246663279784c7a4e76747a5337666549616c616d3043506237704561576c7061576c7061576c7061576c7058324b646a4d6a70426b44575971437835593838726a494e42326c6d3452435330744c5330744c5330744c53307637446d307176375754496a4e715361577a584649324235786c7764753236354b576c7061576c7061576c7061576c76624a326a623670584e734f66584e50484e6b4d39562f6267375730644c5330744c5330744c5330744c53766b5237354a72653955526272642f6c2f7a6843463265375a50734d6a5a347a626e6d6a7061576c7061576c7061576c7061563973725a457679503852333230314343354b512f7579336d74674a61576c7061576c7061576c706157396858616d7545324d612f703031777553514d6d79376d3458624b386d58564a5330744c5330744c5330744c533076374b4f307363306a4b55626632576572486c714a67507543576e6e3645756945744c5330744c5330744c5330744c65304c744b573538747765695276646c4a4a6478697a723157596f43703764426a5a61576c7061576c7061576c70615774706e61374e376c4b396f5631795832486955654c6c5a64723237487930744c5330744c5330744c53307437537530793664794d477a4f774b57784a4d746e6c2b624b6e4539726971536c7061576c7061576c7061576c705832543969687a51314c723564316b2f6c72374b33644a522b666d706d4f546c7061576c7061576c7061576c7062324a646f52464c556a386e72383758593866326d7a504c7339317a4f75766635714e7877744c5330744c5330744c5330744c65307a744e6334654a617049716d536c31466e324e6c577a3843566d39613065624e746a5a61576c7061576c7061576c706157396d6e616b75742b676c7962457a6546754c46663072625539504c4861476c7061576c7061576c7061576c7033367774743274654a566d624a3874646a724c6772577a47506d6c7061576c7061576c7061576c7061642b6b4c593255533651624f552b6d364a636d6c3753317679566a646b3259744c5330744c5330744c5330744c53305439613243374262365057366d524e6f753171374e4679324777454f576c7061576c7061576c7061576c726164326d506266666a78797a2f394378354e6b6b376f4752326f30726d7a56522f576c7061576c7061576c7061576c726135326c546b4e73506631794d6263646d6d6d47796647564a6d372b79673443576c7061576c7061576c7061576c765970326962313558374a747466793970686332615639334f6459576c7061576c7061576c7061576c726156326a7271625230516d37546d486d55666469355448666d4c79724a38727a4a764c5330744c5330744c5330744c533074492f53666c476d53784d67323854347864396879614c3550567061576c7061576c7061576c7061326c647072356e775977524a7958567a55365972485a597a354d6b36787639587569357061576c7061576c7061576c7061576d667030316e323870486c79644973306c326b2f6c545932627139767879427745744c5330744c5330744c5330744c65326a744576714b3466653276624a4e4147796a6f464d767936483755493562397a55496d6c7061576c7061576c7061576c7061522b6c33582f50575770362b65546238675270716e38544e4f2f2f44725330744c5330744c5330744c533074452f576c6b6d525234364965636a2f38546c62636e5a444a326435396274646c375330744c5330744c5330744c533074452f52706e456a6d647a30554c626a2f76504a743750677a357366576c7061576c7061576c7061576c7261703276504d73752f585832575a706a6372624d656f654679667134494f47372b424c5330744c5330744c5330744c533074452f5746754e5a5070586e506837333030664f4d6c4779584879454845744c5330744c5330744c5330744c532f7447375168727a7071757939782f4f5434334170786879483954493878356b7061576c7061576c7061576c706157396933616656396c4f7654572f704d53614d6d695455477866537061576c7061576c7061576c70615774716e612b2b4358447134317334635766617a7451584135666d57363835764d6938744c5330744c5330744c5330744c65317a744d636d5147626a6d592b2f4c642b647070366b4366362f6c694a7061576c7061576c7061576c7061576b6671663269644a646d6d4a5461582f32314f2b41324e6c3258593363616a7061576c7061576c7061576c7061573968336138566d2f57786f6b352f5851572b6d314850664a736c6b47384756316a3561576c7061576c7061576c7061573969336155526f754e3648794c506b7633534139576a364b5230744c5330744c5330744c5330744c2b79727439747152746c7476496d6664314a59486d5379746c7a563330744c5330744c5330744c5330744c53766b51377576726473644675536e786e586f4364646d536e3239393058644c5330744c5330744c5330744c53306a354e2b2f2f2f5130744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c533076376e326e2f41744e43724b666b534b6a714141414141456c46546b5375516d4343, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:40:19.262-04:00\",\"date_last_updated\":\"2022-01-29T15:06:21.650-04:00\",\"date_of_expiration\":\"2022-01-29T12:30:10.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_117\",\"fee_details\":[],\"id\":1245728741,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter124572874163041245\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1007.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1007.2,\"transaction_id\":null}}', '2022-01-29 18:40:03', '2022-01-29 19:06:14');
INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `qrcode_hash`, `details`, `created_at`, `updated_at`) VALUES
(124, '1245729062', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '800.30', '160.06', '71.02', '80.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c6956424f5277304b47676f414141414e5355684555674141425751414141566b41514141414142373969736341414149766b6c4551565234327533645559377a74673447554f31412b392b6c642b414339786239592f476a4d69324b6f72574f48344c4d784a614f2f455a5149736639483771755155744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c53307637393276486573332f337a482b7550666a322f392b54523970764e2f2f6e4d396e782b6533387350436f4b576c7061576c7061576c7061576c50554b375450595938356632632f526d78724b7138567a7a39527867305659474c5330744c5330744c5330744c5333744f64705077487947672f7567636e64393372784d564350476c6b464c5330744c5330744c5330744c5333756974704358714f2b52666975727572614b52397176664e445330744c5330744c5330744c5330744b755762736b473839633351797275734e514e5675596271616c7061576c7061576c7061576c70543152572f3573777347533537752b4a51575848394c49477759744c5330744c5330744c5330744c653052326e594c35442f3755526d30744c5330744c5330744c5330744c5248614e4f31354f585372376d6b796430566b79774a757a6879766d687061576c7061576c7061576c7061642b7576545a56495464562f644d4a75612f583536374c47584b453651585230744c5330744c5330744c5330744b2b5866754c4d727134726a792f337477574d6b6e624d6476794a61555a414330744c5330744c5330744c53307437524861357442623656383963785977685a6435396331392b57564d576c7061576c7061576c7061576c72615137532f78697a504c7a4d75673979643741726c4974736b3376586e6f6b6861576c7061576c7061576c706157746f33616d635876743164586d376b79767a375067436c456b71377676746e7453357061576c7061576c7061576c7061576e666f6833666772764e4e737655324871557a4f442b50615358746f313561576c7061576c7061576c7061576c70583658396e4b644f74706c6e3571325869324b355a516b62323575335666317061576c7061576c7061576c7061576c667053305a756a73666179765a75475858356235752f794d4d4c62466a3270684a5330744c5330744c5330744c5330743769725a4d57372b56465378624a6664624c362b512b7873353546787153394c5330744c5330744c5330744c5330683669585753316d47527072356165726174504b386748356d596f6c6e4c5430744c5330744c5330744c53307449656f3233796261565a5773566e5371727650387636386a47354b78364f6f36576c7061576c7061576c7061576c66624d324234477a79385a64486572757a73586c677044392b796f584c5330744c5330744c5330744c533374753757624b484a304c646447376c2b64443947316d7973663553664c484a4f576c7061576c7061576c7061576c76595962653161335a357479334f5033455937506245596c356731685a6530744c5330744c5330744c5330744c5276312b627737636f6858653643585374416c72723938376e7773646e552b654e646c375330744c5330744c5330744c533074432f5366696259726b7770714476766f55774e745650396b79795958367155304e4c5330744c5330744c5330744c53766c47375642424a67647a505674556d3750493279786e43793970756d3561576c7061576c7061576c706157397633614d65496d7a4c5352737431775764787a382b65796e334d5473394c5330744c5330744c5330744c53306836675861412f4478615879564b503750745a6769526c4157642b493130555355744c5330744c5330744c5330744c2b317274626d396b2b36334569544f554b6b6b4c756b4931796a756b2f57687061576c7061576c7061576c7061592f5131746978464e752f746b6659326d656238695535375664486f61576c7061576c7061576c7061576c50554b37424948704d4e746e414c6e4d4f4a362f33714556396c4c6b663378726d56324f784e485330744c5330744c5330744c53307235626d37716a4c62466a537661566733437a7138782f35544e7770595a4a6e5a65576c7061576c7061576c7061576c7659493762646f726a3357317262482f6c714e73757a456241705730744c5330744c5330744c5330744c5348714b743279777a71676b6255336672546650734b39633661512f6730644c5330744c5330744c5330744c534871484e5a395a327839564b376d2f6b56746a37514c4f457131635a697061576c7061576c7061576c706157397633616d7354624a4f65575a5479655458583732377868477138385330744c5330744c5330744c5330744c653536326c43573538356935326656346a6e4c6c437636354c755831342b7152744c5330744c5330744c5330744c533072394c6d596952583368475a597233636261326d2b457271726a5a6157314b4c744c5330744c5330744c5330744c533068326a546f334d545437596c48314e4a6b38396637784b757467666d756c3258744c5330744c5330744c5330744c53306239517538387a4e52306e5933586d79456833656d31563966304730744c5330744c5330744c5330744c526e61484f316b4c5a5a32696a33356457504d4e375931715838747575536c7061576c7061576c7061576c7062326a646f374e37764f702b6175304379746a7049325575623241536d6576476c7061576c7061576c7061576c7061512f52626f72743135496853796672355a686347336557764f456f577938337262427061576c7061576c7061576c7061576e66726833642b62535270393363312b374a544a55696c3571524d32516161576c7061576c7061576c7061576c7054394575354c596f2f354c6e5334665a576c6d4a447539756c487658625932576c7061576c7061576c7061576c76613932704b726d3975576131656549696341527a67444e326c7061576c7061576c7061576c7061576e6236397232524c75374532307a684b624e4d626e6c3361546c30744c5330744c5330744c5330744c5348714a74712f71503056517a6d53554c574f4b2f6c4e4e4c376262766e425438437a304961476c7061576c7061576c7061576c702f37506152353676754e7651623479526e6d3050783755707737494a383063784c7930744c5330744c5330744c533074376175307164682b5736396b6b3852723473526c2b484c667a367555304e4c5330744c5330744c5330744c53766c4637356169763359533537354864686f314c384e6d2b6b652b374c6d6c7061576c7061576c7061576c7061562b6d7654656c53685a384732307532623030614f36734e72717a63704f576c7061576c7061576c7061576c76595162513766556b482f476d4f327765666e6e7379724c4b68554c686d627a4341744c5330744c5330744c5330744c65306832684861707332794d54506c355459523432506b54526a61524a7530744c5330744c5330744c5330744c5248614e4d564e6a364f584c536b4c71305549326e61712b585464626c714a5330744c5330744c5330744c533074375a753161512f6c5a3037762f6a5a6d37707664484a684c4e662b587333492f7a4f375230744c5330744c5330744c5330744b2b52317554654a6e53724758667958707a756934646a7073687071576c7061576c7061576c7061576c7054314175347935542b4b6c6d694f7061456c2b3748366d2b4649496533324a496d6c7061576c7061576c7061576c7061512f534c67564b4e6c486b654a5930615a4f432b396e75324369626c7061576c7061576c7061576c7062324e47314f3362586e324e727a626d4d30376261584f585a34576c7061576c7061576c7061576c7261493752707546394a76467a5676364c53767372534e37765a584c6b396c45644c5330744c5330744c5330744c532f7475626250784d59575353336176546432566570504e2f35625a386f4a6f61576c7061576c7061576c7061576e667266333358375330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330663576324e3976634f6c4b6f6f4236354141414141456c46546b5375516d4343, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:41:23.279-04:00\",\"date_last_updated\":\"2022-01-29T15:06:15.764-04:00\",\"date_of_expiration\":\"2022-01-29T12:31:14.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_118\",\"fee_details\":[],\"id\":1245729062,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f75204000053039865406639.195802BR5909Cablam1276006Manaos62230519mpqrinter124572906263042229\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":639.19,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":639.19,\"transaction_id\":null}}', '2022-01-29 18:41:08', '2022-01-29 19:06:09'),
(125, '1245729067', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '500.00', '100.00', '0.00', '50.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:44:18.582-04:00\",\"date_last_updated\":\"2022-01-29T14:56:21.764-04:00\",\"date_of_expiration\":\"2022-01-29T12:34:09.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_119\",\"fee_details\":[],\"id\":1245729067,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f75204000053039865406500.005802BR5909Cablam1276006Manaos62230519mpqrinter12457290676304DEA0\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":500,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":500,\"transaction_id\":null}}', '2022-01-29 18:44:03', '2022-01-29 18:56:15'),
(126, '1245728787', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c6956424f5277304b47676f414141414e5355684555674141425751414141566b4151414141414237396973634141414979306c455156523432753364573437634e684146554f35412b392b6c6473414167513172574c665959794d494576486f777867336573696a2b53765561387a2f30584d50576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c70615774702f586a76573533702b39754d72507a39372f6e6635374f2b663768384850442f3764644556766e65584b33387861476c7061576c7061576c7061576c70443946657a35447465646e5034333663575539367568666a346c6e6349326762426930744c5330744c5330744c533074375248615a7744352f4e706f59387a6c3775586163766434766e4e37623865677061576c7061576c7061576c70615539543376484c4e743470763171687135397961574d4d69634b61576c7061576c7061576c7061576c7061574d313564566c2f4761707569786c6d312f5367795850397a476f704b576c7061576c7061576c7061576c50556462384532723279626a6c33726737753158376c4c412b5763316f725330744c5330744c5330744c53307450393362585033762f335079423133744c5330744c5330744c5330744c53306239666d707735314c446d392b2b746e5452525a556e64666a6e722b744c485130744c5330744c5330744c5330744b2b57357536312b3753394c5a50795a583437325072584b724f7a4d6b2b576c7061576c7061576c7061576c72617432766e31353631314e743235516e2b62535063306a7158536a6d5870313353526b744c5330744c5330744c5330744c2b336274456a616d524e786d56456b6151624a386470556b3369625a4e7a39456b625330744c5330744c5330744c533074472f554c7366646e334a3635622f316e6a7a44704f374454766e466771656c7061576c7061576c7061576c70583237646f513679464879664b6b537338534f4d327745714d6d2b556d45355267545230744c5330744c5330744c53307449656f7130523375616e4a6775593576616e4e3831523664776d2b32687061576c7061576c7061576c7061552f52356f72496d6f67724b6236374133776a415a674b4f4c396664556c4c5330744c5330744c5330744c532f73656261712f334c2f51566434675a667a53307a624d665a34655355744c5330744c5330744c5330744c2b3170746d764734792b526c614650466d6561566c4d724f363365724c6d6c7061576c7061576c7061576c7061642b684c524e4a5a726c6e7159314d6b79492f31576e5738396f44516b4b526c7061576c7061576c7061576c7062327a64724e3175716d455336565872595a756f4a7168306e65586138634c5330744c5330744c5330744c533374753755464f72744f74646e6c3733346a41693272734f383865664a447a45744c5330744c5330744c5330744c532f737162543170716241736839776c6c467953654f3172744d6d2b5a4b476c7061576c7061576c7061576c705431456d335a614e317577532f7958636e2f7078686d57717456746132582b435330744c5330744c5330744c533074375148614e434d6b5a6678796c655156746c755076454537525a74744a65626e6e643230744c5330744c5330744c5330744c5176316561757450705a365849623352713247535a50336957654c482b625355744c5330744c5330744c5330744c6535773262314737632f316c586f42396c35417a7658674a56362b63374b4f6c7061576c7061576c7061576c70543145652b57784a4f554e376a77474d76584b3758646b7a2f446b7436656c7061576c7061576c7061576c7054314157334a77312b6267564953353736524c576275537a7274445a6e445330744c5330744c5330744c53307449656f353068546d7a44764f58474e6a4373302f704c58397a632f6c6b75576c7061576c7061576c7061576c72615937523347557553783043326e572f4c30367868617a337441625330744c5330744c5330744c53307445646f55794e636976724b75397835676e2f4b456561354a6c64326c3643536c7061576c7061576c7061576c706232336472734875574b4568316565634a4a4763382f7473757552326d732b78447a30744c5330744c5330744c5330744c53766b32372f46594f444b2b387848714a45352b52594650556d6550545a6838324c5330744c5330744c5330744c533374496471724b3538636551442f7034724e4a4b7564622f6e654b36352f6f36576c7061576c7061576c7061576c66626532526d377070326637323955747a313457736f3175564d6e79756a5038435359744c5330744c5330744c5330744c653068326b4a656b6e684c63446643436f415268764933505844746f5355437657687061576c7061576c7061576c7061512f527069724a504e382f625645726a57756a6e644766636e39643245684c5330744c5330744c5330744c5333756574696d477a4166664a54426376726649796e6c5857664357496c5661576c7061576c7061576c70615774707a744755626461746f49385a6c774f516f72584e742f71356b415574455330744c5330744c5330744c5330744c2b3262744a6f5a72636e43353448495867616269796955393245366a704b576c7061576c7061576c7061576c50554b374477794c753335354353427a2b3975757a4849356c4a61576c7061576c7061576c70615739687874336d3539665a724358354a394d777a71762f4c386b31783157594e4b576c7061576c7061576c7061576c72615137524e314a66546556656f795579783437325a51526e69784c5631626c736a536b744c5330744c5330744c5330744c2b79707469536562305a424c335753725864786c58567539714553577334386961576c7061576c7061576c7061576c7033366939773043524a6153374d36556434372f63324462624c576d2f6b6b756b7061576c7061576c7061576c70615539514a76476b71546772743175585272685a6b3732745750382f3644716b7061576c7061576c7061576c706157397058616c4d6e4c79394b6164316d4b4e564d3662784f517a712f316e4a4f576c7061576c7061576c7061576c7659516264705158644a2b71587979397276744231486d644e364d5a5a626a517936536c7061576c7061576c7061576c70623252647076334c4d4d47576e6a795432764454543366776461576c7061576c7061576c70615774713361334d30313461493755544a6576657672365341394d2b714c6d6c7061576c7061576c7061576c7061642b6e7a5a526c30646f596f363268544c317971524575445a3363374d4f65744c5330744c5330744c5330744c53306832696641562f4b776157316155766f5637766332673635394c764c6c352f424a7930744c5330744c5330744c533074375148616c4b5a372f75705668767876786b5532425a66705464755138334d33484330744c5330744c5330744c533074375275316159526b616c4a62356a366d4d48526b61437276484f767a7261704c576c7061576c7061576c7061576c726156326c7a5331787155717648355a63634a55544d58584d316b356665697061576c7061576c7061576c7061573975336154344663616c7972512f3754612b54537937764c4a545a765430744c5330744c5330744c5330744c2b3337746c5a4e756e3473683130427a7554744e50556b7077392b4c496d6c7061576c7061576c7061576c7061562b70625773654e784e45377331386b55336e322f7a3675796d45335534706f61576c7061576c7061576c7061576c50554f376f4a5a5774396f5356325437794449467050506232543161576c7061576c7061576c706157747054744b4d55584f614973556e4f70514e53733131707862746f61576c7061576c7061576c7061576d503032362f4f355a47754a7a32613764677a3541794847583364596f3761576c7061576c7061576c7061576c704439485777736632326a4956636f546f634f594632476c48646a352b5733564a5330744c5330744c5330744c533076374e75312f2f36476c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c2f636530667748334d79674263362f79307741414141424a52553545726b4a6767673d3d, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T14:57:23.701-04:00\",\"date_last_updated\":\"2022-01-29T15:06:08.826-04:00\",\"date_of_expiration\":\"2022-01-29T12:47:15.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_120\",\"fee_details\":[],\"id\":1245728787,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter12457287876304D423\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1007.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1007.2,\"transaction_id\":null}}', '2022-01-29 18:57:07', '2022-01-29 19:06:02'),
(127, '1245728821', 'MP', 'PX', 'cancelled', 'CA', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c6956424f5277304b47676f414141414e5355684555674141425751414141566b4151414141414237396973634141414935556c455156523432753364556137624e684146554f35412b392b6c64714143525636657a4c6c44753031514e4e54785278443757654b522f775a7a4f527a58482f5136427930744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5333743739654f2b585863502f76786c612f507974767a35326466622b2f662b2f706675757a7674392f2f53777861576c7061576c7061576c7061577471486149393779666239397674326438563576394f5064593579325833466c7965342f304354746d485130744c5330744c5330744c533074492b516e7376494f39664732324e6d517649696c2f556d4858646a6b464c5330744c5330744c5330744c532f733837526d37624f5065396a742f466f626e346e745441546d312f61626e6f36576c7061576c7061576c7061576c705730536c736372366756617370753175316436684664702b39485330744c5330744c5330744c53306a3562572f41547553355265456370456164617448796c426a6a2f585561556c7061576c7061576c7061576c70623254396332612f2f582f2f7a4354425661576c7061576c7061576c706157746f2f575a746664616a6a39466d4b543559714d6e555161324c7a765957576c7061576c7061576c7061576c6e5a7662647139647062345a456c5456754f5574627a4c30686a2f49382b525848623361476c7061576c7061576c7061576c706439522b56334e3162397555784d774279626f52377636394d2b2b7a5334566d4c6b4e7061576c7061576c7061576c7061576c333137354d45476b6a6b4f3078624866794e504d2f7a54565a4e2f757554327065576c7061576c7061576c7061576c72617a6252542b6a47746b2b6232487a6d736d53764c356a7a733146387365467061576c7061576c7061576c70613267646f30375351664d373143426e4b38616f347936442b5648793237627a335530706f61576c7061576c7061576c7061576d333071594b623170373674716c4c6d424b5470626464534d38627331754c717449576c7061576c7061576c7061576c72612f62516c50726b61526a4a314152656c354656327a6558555a54306f2b384f4d4b4330744c5330744c5330744c533074375762617166315748364d3855413168726d7648556963325979567061576c7061576c7061576c7061576b667070333662615754317a5432706763713957527a71784c6c76454c4e756b786430744c5330744c5330744c5330744c533771624e703173663358485764563963576a762f4473305775385834456c7061576c7061576c7061576c70613267646f322b526b32655632687531715a7a355a72547a7a57537256596d7a36664c5330744c5330744c5330744c5330744c74724d7a52746637744b2b79314e6745775659376c733547526e4c69567061576c7061576c7061576c7061576c3331316241564d325663534e6e364d744e572b4b4f7856542f396f452b5356335330744c5330744c5330744c5330744c757030314858446374766c4c2f7053526d5776454b6836713146656a78535561556c7061576c7061576c7061576c705a3246323261455a4a4f523274546b75563036346b3838726a494e42326c6d3452435330744c5330744c5330744c533076374447325370593177705773334674766170712b556b774f75313850583371557561576c7061576c7061576c7061576c703939596534644a7055503959566e335447646d6a50475275436a59623632687061576c7061576c7061576c7061522b695863313454503237664454626c55644935693567665a55653455464c5330744c5330744c5330744c532f73513754535a6633336a7472777342655152557064744f2b384d6e63474c6c7061576c7061576c7061576c7062324d6472726e5447566565577a457055634b585835365133657a4c716b7061576c7061576c7061576c70615864536e75577353526c71317661323159507a3234446e49756e76313733796f30537771536c7061576c7061576c7061576c7064316457337036546456584b434e50384d38623570706b5a334b586f704b576c7061576c7061576c7061576c6e5a7662586150736b5361385a6a4c786c706572674f63656432446c7061576c7061576c7061576c70623249647270716c775948766b51367a53574a4c587a466b2b51726c334f564b476c7061576c7061576c7061576c706431503238596e5278374158303638506b4e6f4d74316c796d366d6457756e6b5a61576c7061576c7061576c706157646e2f74654333617068786b4765565932322b7258573535564d6d3046653871612f515a55567061576c7061576c7061576c7061327432304b51795a6e71556456564a436d44576e6d59644a48726d312b4f61304e567061576c7061576c7061576c70613274323058644a784c4f62373130786d473769635970745454792b76526b744c5330744c5330744c5330744c2b31447466653061715777626476636c526e633839686e4b792b6d7652393841704b576c7061576c7061576c7061576c66594232696a7565515a466539596f30756151556e3357712f2f5137304e4c5330744c5330744c5330744c53506b6537714f4561614270424d76583532714f31532b4379505248676f4b576c7061576c7061576c7061576c665a4c3258667178316f526c6739735279734632514d6b353367686f61576c7061576c7061576c7061576d666f3032465844377875766d73564a466e4b52616e4e6d4a4f586461696b7061576c7061576c7061576c706157396948617075724c65636d557955793134396e4e6f47786d6f6b7a344e786c52576c7061576c7061576c7061576c72616a62536c5131636a6c6530666b6e5a797031505a466b587145514f63744c5330744c5330744c5330744c5330323276625537436e776a4158692b64696c6e2f4c6132645130744c5330744c5330744c5330744c53506c46376434396343553737346c4b62726951737a3142506e766d4d374139546c375330744c5330744c5330744c533074507470322b4f7353797879684d50586a6d35415364504f5778536b3079393330644c5330744c5330744c5330744c53506b53625471677569343175656d5274414a625036747470733131714b4c377052644c5330744c5330744c5330744c53306d366c6264652b636a637537587772302f2f5456502b6d30467a3844725330744c5330744c5330744c533074492f51706b7654384d6652415a723637313538316766363959776f4c5330744c5330744c5330744c53337448747155666b776231396f4d5a526f796b6a6243706147543759535450694e4b5330744c5330744c5330744c533075376d336171452f506574716c3248486e77534a70726b6f72506152784b4c696f50576c7061576c7061576c7061576c7261683268546d2b366573477a756c417244744339756d69695a356c4b6d6f4363744c5330744c5330744c5330744c65336a74434d63633559327a44586e584c395768524661437464365757625130744c5330744c5330744c5330744c757255327663716455564235644264704d4c696e5a7a5a6662743039465330744c5330744c5330744c5330753775375a5563644f676b4c4e5565475559795a4850585773446e4c6d58654c7a576e5163744c5330744c5330744c5330744c65316a744b73524a476c635a49705a70725854314a4d3077662b66565a4730744c5330744c5330744c5330744c5262616e50724c68574755796c5a7437716c55396e4342726552553564482f466c6f61576c7061576c7061576c7061576d66713832444875764774646239305645426161514a4c5330744c5330744c5330744c5333747337587246612f4652726a7964696f2b722b366b7469753042326c7061576c7061576c7061576c70615a2b6958583533354e4f7436354f32672f727a494a4d70656a6c4b64704f576c7061576c7061576c7061576c765968326870382f4f676b744c4f7244713938415061455774782b6d62716b7061576c7061576c7061576c706158645466762f6639485330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c5330744c532f6a62745838514552513557776859374141414141456c46546b5375516d4343, '00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter12457288216304154D', '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T15:05:04.660-04:00\",\"date_last_updated\":\"2022-01-29T15:06:03.794-04:00\",\"date_of_expiration\":\"2022-01-29T12:54:55.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_121\",\"fee_details\":[],\"id\":1245728821,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter12457288216304154D\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1007.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1007.2,\"transaction_id\":null}}', '2022-01-29 19:04:49', '2022-01-29 19:05:57'),
(128, '1245729183', 'MP', 'PX', 'pending', 'AP', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, NULL, 0x646174613a696d6167652f6a7065673b6261736536342c6956424f5277304b47676f414141414e5355684555674141425751414141566b4151414141414237396973634141414932306c455156523432753364573237624f685146554d354138352b6c5a7341435251764c504a7555677853344e39547952394534747253557634337a594f732f36485532576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c70615774702f7232336a3637692b392b636a663938626672792b392f742f3535384c584e3937336567496e7a764c4c56384d576c7061576c7061576c7061576c7261683269506132533733757a7635636f31583739344b51626a34426e634c57676e44467061576c7061576c7061576c7061326b646f727748792b7248784e61544446417a7a7656386653566e307547485130744c5330744c5330744c533074492b543376474b6c744c5a622b68706a643979494a2f53364330744c5330744c5330744c5330744c53305935704c7062755870325443314c6235566834736462376255456c4c5330744c5330744c5330744c532f736362634550354662754f4c3136387477315a765a7639596a5330744c5330744c5330744c5330744c2b64473361557649662f504f4e6e537130744c5330744c5330744c5330744c512f575a746664616e6a384e36317a74646e4b544a5645462b42394f3043537773744c5330744c5330744c5330744c653365326a5339646d626a6b504147343942726d5a363062444e703552664c366834744c5330744c5330744c5330744c65324f3276342b73355a6d32343677376e396148707a734d436b4a744f6332792f4952576c7061576c7061576c7061576c72613362576654726c4e6a6d45724b30694739343553784673552b2f6f6e6d5a65576c7061576c7061576c7061576c6e597262653644484f36543976596675566c7a476b505465646970766c6a77744c5330744c5330744c5330744c53306532757675573449647a55783568374b5669714451316a4d6c357155382b36336c4e445330744c5330744c5330744c533075366e5457656e35662b6c4b6d41714255366d3638726a3174374e2b78524a5330744c5330744c5330744c533075376c626145774c73562b7932582b4d35466e32624f724b3155454e4d32536c7061576c7061576c7061576c70613274323135524e6e71383953503565684c56514230773654796344636837737561576c7061576c7061576c7061576c706439536d485939313855674f6c6173386d666f305539327756415a7061576c7061576c7061576c7061576d666f2b313563433048794c6259464c6e6f307a78434762484e4e6b2b57686c4261576c7061576c7061576c70615774716474597454713976534f447a7070454a58554e4e6c6b756538305a4f576c7061576c7061576c7061576c6e5a6e62594657514e723257484a6e5371426e3367705a386d6d6167657530744c5330744c5330744c5330744c535030645972706270633672564d59323358533032322b6b3866614e62465355744c5330744c5330744c5330744c7537633244624f317348686b6b762b6d396343307437395546564d435057347a4c7930744c5330744c5330744c5330743755626176434f6b4c645a41707163712b42344f5544767a63467a71784679655155424c5330744c5330744c5330744c533775704e743232444b354e386d54357357364b4c492f57793954634544527061576c7061576c7061576c7061576b66707330646b554f7837796731754b784957302f5356763930654859624f7a467061576c7061576c7061576c7061576e33316b36374b592f5a76704c5636467a713468796d3458703454586569304e4c5330744c5330744c5330744c533771354e706262306931534953304e765a56394a7264716c4a38325465625330744c5330744c5330744c533074492f5139684157317a47763379332b5479646a6c376d3456624b383258564a5330744c5330744c5330744c533075376c66597365306a4b7070486a4858444f6a71354f335a6c742b66513970314a61576c7061576c7061576c70615774726e61426344626d6b6b726f566a7239394b66476e72535236784f374a376d534a7061576c7061576c7061576c7061576e3330325a334b37636f4435524f764537722b567334374c71586a5a4b6c54354f576c7061576c7061576c7061576c7659703276534a38754f6b544a66576b71514a75635554314f2b57767949744c5330744c5330744c5330744c653375327252344a465879687632516b397066586c435374766f666f57327a5668707061576c7061576c7061576c7061576e33317736567646364b654d506f584d714a365279416f6241332f416d756f33676c4e6e35774e6877744c5330744c5330744c5330744c6530753270516e70382b535a7543754f62486c504a6d58535534504344692f30434e4b5330744c5330744c5330744c533076373437576c2f50594b63757654316f376355706e435a2f6e612b5a346e5332796b7061576c7061576c7061576c706156396d6e5a78377a5033583662392f696b6e446f325a5a65484a2b6635654c67445330744c5330744c5330744c533074492b5258754758486547373038614a426362494874496b576b4a79766e5a54685661576c7061576c7061576c70615774714e7449747874516f74576139716831435a58782b634348445130744c5330744c5330744c533074492b537a7370324f5575795a37624c4f2f4733315a746c75556861576c7061576c7061576c7061576c706e364a4e516137637533382b394459736d4377646d37306b78764b4e2b7a4d4961476c7061576c7061576c7061576c7074394a4f556c3861556b76646d546b376e6d3131636b446469544c676c7a3269744c5330744c5330744c5330744c53304f327237386a7a73644c44315244753479366c737158657a6c2b78346b794a7061576c7061576c7061576c7061576d333068364c4d6c32616256763061665a776c516d765a4e626850567061576c7061576c7061576c7061326b647072356e776251564a377271636c4f6c4b682b555a386d5264342f2f6c486c4661576c7061576c7061576c70615774717474436d353553374a79524d55376572773745556737652f427464505330744c5330744c5330744c53306a354557324a6a336379663279665842374c646e7045394c51586562492b6b7061576c7061576c7061576c70615864557073766e445937546d702f49667256726636547736345866776461576c7061576c7061576c706157746f4861504e58702b386c774a48427737374a307262357661354c576c7061576c7061576c7061576c72615862535a556b39434737347831414e7a456b7954623733672b38324c6c7061576c7061576c7061576c705a32622b30313845324b65494e787361446b4c453951726a4c45786a594c6c5163744c5330744c5330744c5330744c653144744b6c4d74386158712f63514f65766b572f6b54704c4f7654317061576c7061576c7061576c70613271647157316768655a53676d632b35727138454c6345316e626c393333564a5330744c5330744c5330744c533075376d7a62507352327a4b506c327566526f70554933616377634c6a39394b6c7061576c7061576c7061576c7061327432314f636974423965476873736a2f4e4e6d725a646e71435857617546393571576c7061576c7061576c7061576c70643148653451414f5a6c6a4b3265787266427036306e615a764b3146456c4c5330744c5330744c5330744c5337756c4e71572b48417a62653957756a72726c4e536631664f3146313256625463505230744c5330744c5330744c533074492b517a746375433247336b722b4f3073333552416c45333634436930744c5330744c5330744c53307437644f314e54454f595447335439625a74714647654558566339784b655a43576c7061576c7061576c7061576c7659703275566e3638306d6b323935555838504b30304759383264744c5330744c5330744c5330744c533054394c57787366706263745779456d4a4c34335444616a46355a64646c375330744c5330744c5330744c5330744c74702f2f3876576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c7061576c70615774702f70763046352f6f4b3948514e4f595941414141415355564f524b35435949493d, '00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter12457291836304BBD3', '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"callback_url\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T15:29:21.000-04:00\",\"date_last_updated\":\"2022-01-29T15:29:21.000-04:00\",\"date_of_expiration\":\"2022-01-29T13:19:12.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_122\",\"fee_details\":[],\"id\":1245729183,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pix\",\"payment_type_id\":\"bank_transfer\",\"platform_id\":null,\"point_of_interaction\":{\"application_data\":{\"name\":null,\"version\":null},\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"location\":{\"source\":null,\"state_id\":null},\"transaction_data\":{\"bank_info\":{\"collector\":{\"account_holder_name\":\"Salazar Tucker\",\"account_id\":null,\"long_name\":null,\"transfer_account_id\":null},\"is_same_bank_account_owner\":null,\"origin_bank_id\":null,\"origin_wallet_id\":null,\"payer\":{\"account_id\":null,\"external_account_id\":null,\"id\":null,\"long_name\":null}},\"bank_transfer_id\":null,\"financial_institution\":null,\"infringement_notification\":{\"status\":null,\"type\":null},\"qr_code\":\"00020126580014br.gov.bcb.pix0136d58a7469-afb3-48dd-b279-5576754cd5f752040000530398654071007.205802BR5909Cablam1276006Manaos62230519mpqrinter12457291836304BBD3\",\"transaction_id\":null},\"type\":\"OPENPLATFORM\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_transfer\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1007.2,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"bank_transfer_id\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1007.2,\"transaction_id\":null}}', '2022-01-29 19:23:53', '2022-01-29 19:29:33'),
(129, NULL, 'PC', 'PX', 'created', 'AP', 1, 2, '1300.30', '260.06', '53.01', '130.03', 'PE', '150.00', 5, NULL, 'https://app.picpay.com/checkout/NjFmNTk1ZDE1NTk2MDQxM2JmMWRjNDM0', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141415a414141414751434149414141415033614762414141414358424957584d41414137454141414f784147564b7734624141414b37306c45515652346e4f3364305534624f78524130564c312f7a385a3366657251584c6c2b6e67327250564d4d694745725a4638596e3938666e372b41696a3466667346414b77534c4342447349414d77514979424176494543776751374341444d45434d67514c7942417349454f7767417a42416a4945433867514c4342447349414d77514979424176494543776751374341444d45434d67514c7942417349454f7767417a42416a4945433867514c4342447349434d507965653950667631335877382f507a6e7a2f6e34362f35654b48316e7a7a68784e58486e6e5054324e39393366704c327679413358586f342f3236337850674b3449465a4167576b43465951495a6741526d43425751634757743464486356662f306e31312f6e6951586d7a5a64303475475078686258787936302f745a747670396a497767762f492f374239636175784c414a7345434d67514c7942417349454f7767417a42416a4c6d78686f656a5833782f6354444e37394d507a61434d4461394d54626e38656a455737662b38424d44454366632f592f623577344c7942417349454f7767417a42416a4945433867514c43446a386c6a44585866582b396664335a7a673064697377346c5269524f6a4a7966474c363750454c79514f79776751374341444d45434d67514c7942417349454f776749776650645a513261572f386a6f336e2f5075554d574a4e396b45777a2f6e446776494543776751374341444d45434d67514c79424173494f5079574d506431647978597942657547683964394a69665775453961755048536d79616578436a3137345566777237724341444d45434d67514c7942417349454f7767417a42416a4c6d7868704f3741517735735268424364324678673757754c5244376e363363307a546f7a6468487a4458776e347267514c7942417349454f7767417a42416a4945433867344d745a512b556234356a7236356e4f2b63437069552b58762f756a457533523348755662636f63465a4167576b43465951495a6741526d4342575149467042785a4b786837477669642b63534870333433562f3442663054463372682b45586c6b7a7932796366643753742b75634d435167514c7942417349454f7767417a42416a494543386a3471487a5065334f4a39345154657a42737272695037525578396d732b756a733738756a456752452f354f462f785230576b43465951495a6741526d434257514946704168574544474e78787257446332424c422b395856337638712f6275784c2f35552f78776b7666504847476f436654724341444d45434d67514c7942417349454f7767497935735961785a6667543775376e58356d30654852694a3442484c7a79525a504e433631353439496d784275436e4579776751374341444d45434d67514c79424173494f5079574d50645a65504b7045566c6258373936707465754e6e4443586433556e6e68694d77766431684169474142475949465a4167576b43465951495a6741526c2f78713630767378355967526833643068674c45462b2b38334246445a524f48756e4d654a6c7a5135667647366a7833415677514c7942417349454f7767417a42416a49454338686f37395a7764774469685a73396a433176707a643757486633732f5443303167654f5951433449466741526d434257514946704168574543475941455a627878724748764f4636346c6a77312f624635397a4e31426a63725a4a586433716a4457415042417349414d775149794241764945437767513743416a4c6c444b4235744c6f68573969463434626a416f37734863447a6166456b76664f6648786755714a326a384658645951495a6741526d434257514946704168574543475941455a523859615872693377614f7857596578706568484c317966727378506250376b7572742f6f78642b51723769446776494543776751374341444d45434d67514c79424173494f5049574d5059317632505470776d73476e736a4943376b7747503772374f753464516e5044434159684a722f7438413378467349414d775149794241764945437767513743416a492f30563838336c364a662b4a4965626635476d7866616450634e325854694849634b757a55416242457349454f7767417a42416a4945433867514c43426a62726547545a5576307a2b367531764469643076317032594d686c375365744f7a4935554e6d6159484942343366383277466345433867514c4342447349414d77514979424176494f444c574d4c5a6f76626d4b66324a312f4f367138346b5a67684e2f754c45644e63596d62446176507659764d7a594e633467374c4342447349414d775149794241764945437767513743416a434f485544774b4c5a307575727537774c724b2b2f6d6f63715449696565382b3464373536345334593879384e4d4946704168574543475941455a6767566b434261514d546657734f6e374c54423735316565633277695a477a33692f57725033726868597731414477514c4342447349414d77514979424176494543776734386768464f76754c706d507661524e4a356232547778716a4c337a4a34347032547956342b37483573513549792f38522f6a6c446773494553776751374341444d45434d67514c79424173494f5079574d50644c2b697650337a7a4f2b353374787834346459496437317a7758374833556d675365367767417a42416a4945433867514c4342447349414d77514979326f64516a4c6e376466617833527247396e5859394d4c6442536f37617178662f64485959526c66766f415454777077676d4142475949465a4167576b43465951495a6741526c7a59773256387959326a633051765044686a303638704c4568674c7358657654432f364e4a37724341444d45434d67514c7942417349454f7767417a42416a497548304b78626e30746558324e646d786e6866554c6a61326a627a376e32454a3435546e584c37522b554d6936752f743554484b484257514946704168574543475941455a6767566b4342615163666b516972453937563934594d534a7a516c4f76457550546f78666a44336e6f37467449653775353748702b7179444f79776751374341444d45434d67514c7942417349454f7767497a4d574d4f6a796b4c347572754c362b737661645059534d654a593072756e742f78777030564a712f75446776494543776751374341444d45434d67514c7942417349434e7a434d585964397a487a724249487878516d643559642b495473756e754c6833587a3574343541344c7942417349454f7767417a42416a4945433867514c43446a79466a44433964394e352f7a30646a75416e65583969734c396d4e2f392f57726e396a583463516238734964494c3769446776494543776751374341444d45434d67514c794241734947507545496f5469367a724431392f53574e58503248735464355575667259334d7a5959526b6e486a374a4852615149566841686d4142475949465a4167576b434659514d62634952516e4e69633473656f3874736e2f75733272333131482f3336625a397964424c72375562772b332b4d4f433867514c4342447349414d77514979424176494543776759323633686b632f354f43417a617550505878645a634f447a6564634e7a59414d546272594c6347674332434257514946704168574543475941455a6767566b7a4f3357384f6946712b4f625470796b4d50614772457566333348337258743064346553304a345737724341444d45434d67514c7942417349454f7767417a42416a4c6d7868704f4c472b66324a7a6778414c7a335a4d55316f337441484633677548457739655055336c387a7246644f6a6166382f712b4475367767417a42416a4945433867514c4342447349414d77514979337268627737724b4e2b7a584837373558667a4e56656537457779627a376d354448396946582f73642f3835737737757349414d77514979424176494543776751374341444d45434d6a3747766d6c644f544469376d4c776f3871354135554c72542f38306430644330354d47317a66673247644f79776751374341444d45434d67514c7942417349454f776749776a597731334a786a47316e30333352335575507537723775374f63474a6c3354332f5877556d6e56343358734838425842416a4945433867514c4342447349414d77514979356e5a72654b47374f7746734c6875506652662f37677a426f78652b6e2b764764705634394d4c644c2f364b4f79776751374341444d45434d67514c7942417349454f776749772f4a353630386e3330395a38633236316838304a33397777344d514178747046415a5765465235747653476932716648334150676c574543495941455a6767566b43426151495668417874776846474e4c70324e58662b462b4357504c3848643361336730747276413249594836382b3537753457492f76635951455a6767566b4342615149566841686d4142475949465a427a5a725746645a596c332f6572583133316e6a4d306c6e444432687a73786a2f4c43695a444a7a3777374c4342447349414d775149794241764945437767513743416a4d746a44525762432b463366334c543361306d78765a6775487547786432394e3137347166754b4f79776751374341444d45434d67514c7942417349454f776741786a446638337468422b3474767764326364486f3074324a383452574c39516d50444879656347424d35784230576b43465951495a6741526d43425751494670416857454447356247473636756b4f7a61586f752b656f48484369642b39636a724433552f7943366369484549422f4853434257514946704168574543475941455a6767566b7a4930317648415a2f744864665168657547532b2b5775653242726868424e2f39386f6e354f345247482f6c6a61384a344a466741526d434257514946704168574543475941455a482b6e39456f4166785230576b43465951495a6741526d434257514946704168574543475941455a6767566b4342615149566841686d4142475949465a4167576b43465951495a6741526d434257514946704168574543475941455a6767566b4342615149566841686d4142475949465a4167576b43465951495a6741526d434257543842316c5176396241727867794141414141456c46546b5375516d4343, NULL, '{\"referenceId\":\"request_123\",\"status\":\"created\",\"createdAt\":\"2022-01-29T19:30:25.000000Z\",\"updatedAt\":\"2022-01-29T19:30:25.000000Z\",\"value\":1007.2}', '2022-01-29 19:30:10', '2022-01-29 19:30:25');
INSERT INTO `request_payment` (`id`, `code`, `type`, `method`, `status`, `status_type`, `installments`, `installment_no_interest`, `amount`, `discount_coupon`, `discount_installment`, `discount_cart`, `shipping_type`, `shipping_value`, `shipping_days`, `shipping_message`, `link`, `qrcode`, `qrcode_hash`, `details`, `created_at`, `updated_at`) VALUES
(130, '1245729994', 'MP', 'BO', 'pending', 'AP', 1, 2, '800.30', '160.06', '0.00', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245729994&payment_method_reference_id=9914224179&caller_id=130141172&hash=d4d29a16-24e1-4bfe-8a68-26d060d5d52f', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23796888300000639193380260991422417900633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T16:10:24.395-04:00\",\"date_last_updated\":\"2022-01-29T16:10:24.395-04:00\",\"date_of_expiration\":\"2022-02-01T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_124\",\"fee_details\":[],\"id\":1245729994,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":639.19,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245729994&payment_method_reference_id=9914224179&caller_id=130141172&hash=d4d29a16-24e1-4bfe-8a68-26d060d5d52f\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9914224179\",\"total_paid_amount\":639.19,\"verification_code\":\"9914224179\"}}', '2022-01-29 20:06:39', '2022-01-29 20:10:36'),
(131, NULL, NULL, NULL, NULL, 'AP', 1, 2, '1300.00', '260.00', '0.00', '130.00', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, NULL, '2022-01-29 20:11:28', '2022-01-29 20:11:28'),
(133, '1245730046', 'MP', 'TB', 'pending', 'AP', 1, 2, '1300.30', '260.06', '0.00', '130.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245730046&payment_method_reference_id=6002348144&caller_id=130141172&hash=a2145031-13d2-425b-bcf3-4d7b8ef8e10c', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"ip_address\":\"45.191.149.84\",\"items\":[{\"category_id\":null,\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Tablet\",\"unit_price\":\"680.25\"},{\"category_id\":null,\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"id\":null,\"picture_url\":null,\"quantity\":\"1\",\"title\":\"Headset\",\"unit_price\":\"379.9599914550781\"}],\"nsu_processadora\":null,\"payer\":{\"address\":{\"street_name\":\"Rua Socialista\",\"street_number\":\"14\",\"zip_code\":\"04472205\"}}},\"authorization_code\":null,\"barcode\":{\"content\":\"23794888400001060213380260600234814400633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T16:24:57.394-04:00\",\"date_last_updated\":\"2022-01-29T16:24:57.394-04:00\",\"date_of_expiration\":\"2022-02-02T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":\"Tablet\",\"differential_pricing_id\":null,\"external_reference\":\"request_127\",\"fee_details\":[],\"id\":1245730046,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{\"id\":\"4051303990\",\"type\":\"mercadopago\"},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pec\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"checkout_pro\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1060.21,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245730046&payment_method_reference_id=6002348144&caller_id=130141172&hash=a2145031-13d2-425b-bcf3-4d7b8ef8e10c\",\"financial_institution\":\"10850221\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"6002348144\",\"total_paid_amount\":1060.21,\"verification_code\":\"6002348144\"}}', '2022-01-29 20:15:25', '2022-01-29 20:25:39'),
(134, 'E41D243A-DA16-4D1E-89EF-542E2D47F575', 'PS', 'DE', '1', 'AP', 1, 2, '1300.30', '260.06', '45.51', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"date\":\"2022-01-29T17:39:30.000-03:00\",\"code\":\"E41D243A-DA16-4D1E-89EF-542E2D47F575\",\"reference\":\"request_128\",\"recoveryCode\":\"7df5a68dd88c50bbfc4728669c81dae93a3e6dfa73b13c49\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-29T17:40:36.000-03:00\",\"paymentMethod\":{\"type\":\"7\",\"code\":\"701\"},\"grossAmount\":\"1060.21\",\"discountAmount\":\"45.51\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"50.63\"},\"netAmount\":\"963.67\",\"extraAmount\":\"-390.09\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"c9dcf2529a5f4bf66234540fbe60b74e\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"df8a6aa94e8b9dafafb2761be5c197c5\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-29 20:39:11', '2022-01-29 21:54:41'),
(135, '099C0903-054E-4212-B4A3-1CCA9AB07957', 'PS', 'BO', '1', 'AP', 1, 2, '1300.30', '260.06', '45.51', '130.03', 'PE', '150.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=13a262995107660101cb8fc7f5086cb145e9795a887a90f3e27a511f906bf2917d7f7a220ac9ecaf', NULL, NULL, '{\"date\":\"2022-01-29T19:15:08.000-03:00\",\"code\":\"099C0903-054E-4212-B4A3-1CCA9AB07957\",\"reference\":\"request_129\",\"type\":\"1\",\"status\":\"1\",\"lastEventDate\":\"2022-01-29T19:16:13.000-03:00\",\"paymentMethod\":{\"type\":\"2\",\"code\":\"202\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/booklet\\/print.jhtml?c=13a262995107660101cb8fc7f5086cb145e9795a887a90f3e27a511f906bf2917d7f7a220ac9ecaf\",\"grossAmount\":\"1060.21\",\"discountAmount\":\"45.51\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"50.63\"},\"netAmount\":\"963.67\",\"extraAmount\":\"-390.09\",\"installmentCount\":\"1\",\"itemCount\":\"2\",\"items\":{\"item\":[{\"id\":\"596239013dbdab4591cefef9be5a5f58\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"},{\"id\":\"06dea2c13dd7f20a509f3d4d411c2591\",\"description\":\"Headset | COR: Preto | TAMANHO: M\",\"quantity\":\"1\",\"amount\":\"500.00\"}]},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"150.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-29 22:11:56', '2022-01-29 22:18:26'),
(136, '1245730500', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '8000.00', '1600.00', '0.00', '800.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245730500&payment_method_reference_id=9914268779&caller_id=130141172&hash=1057dd23-e153-4204-8bc7-0d708e4bf8a9', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888300005750003380260991426877900633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T18:57:42.055-04:00\",\"date_last_updated\":\"2022-01-31T10:20:28.468-04:00\",\"date_of_expiration\":\"2022-02-01T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_130\",\"fee_details\":[],\"id\":1245730500,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":5750,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245730500&payment_method_reference_id=9914268779&caller_id=130141172&hash=1057dd23-e153-4204-8bc7-0d708e4bf8a9\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9914268779\",\"total_paid_amount\":5750,\"verification_code\":\"9914268779\"}}', '2022-01-29 22:19:27', '2022-01-31 14:20:18'),
(137, '1245729690', 'MP', 'TB', 'pending', 'AP', 1, 2, '500.00', '100.00', '0.00', '50.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245729690&payment_method_reference_id=6002348180&caller_id=130141172&hash=eda26fb1-23e1-41a4-8aaf-54e02d2ef8ff', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23799888400000500003380260600234818000633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T18:30:35.167-04:00\",\"date_last_updated\":\"2022-01-29T18:30:35.167-04:00\",\"date_of_expiration\":\"2022-02-02T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_131\",\"fee_details\":[],\"id\":1245729690,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pec\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":500,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245729690&payment_method_reference_id=6002348180&caller_id=130141172&hash=eda26fb1-23e1-41a4-8aaf-54e02d2ef8ff\",\"financial_institution\":\"10850221\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"6002348180\",\"total_paid_amount\":500,\"verification_code\":\"6002348180\"}}', '2022-01-29 22:30:06', '2022-01-29 22:30:39'),
(138, '1245730433', 'MP', 'TB', 'pending', 'AP', 1, 2, '800.30', '160.06', '71.02', '80.03', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245730433&payment_method_reference_id=6002348183&caller_id=130141172&hash=403aa2aa-6ac5-420c-bdc2-900625e5b2c5', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888400000639193380260600234818300633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T18:34:37.940-04:00\",\"date_last_updated\":\"2022-01-29T18:34:37.940-04:00\",\"date_of_expiration\":\"2022-02-02T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_132\",\"fee_details\":[],\"id\":1245730433,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"pec\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":639.19,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245730433&payment_method_reference_id=6002348183&caller_id=130141172&hash=403aa2aa-6ac5-420c-bdc2-900625e5b2c5\",\"financial_institution\":\"10850221\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"6002348183\",\"total_paid_amount\":639.19,\"verification_code\":\"6002348183\"}}', '2022-01-29 22:34:08', '2022-01-29 22:34:50'),
(139, '1245729818', 'MP', 'BO', 'cancelled', 'CA', 1, 2, '120.00', '0.00', '129.00', '12.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245729818&payment_method_reference_id=9914268609&caller_id=130141172&hash=eb7566cc-ce62-4f50-9370-b055e53eb3d8', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23792888300000129003380260991426860900633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-29T18:57:00.670-04:00\",\"date_last_updated\":\"2022-01-31T10:17:36.194-04:00\",\"date_of_expiration\":\"2022-02-01T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_133\",\"fee_details\":[],\"id\":1245729818,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"cancelled\",\"status_detail\":\"by_collector\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":129,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245729818&payment_method_reference_id=9914268609&caller_id=130141172&hash=eb7566cc-ce62-4f50-9370-b055e53eb3d8\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9914268609\",\"total_paid_amount\":129,\"verification_code\":\"9914268609\"}}', '2022-01-29 22:56:28', '2022-01-31 14:17:26'),
(140, '837B1A94-BB02-4ECF-81AD-22D07178D134', 'PS', 'DO', '3', 'PA', 1, 2, '800.30', '0.00', '72.03', '80.03', 'PE', '0.00', 5, NULL, 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=d6114b299672e478e469a5da4feeecdbac3347dcbfe98bb466c7072c3b89505a2e982c4bbd4a45df', NULL, NULL, '{\"date\":\"2022-01-31T11:58:57.000-03:00\",\"code\":\"837B1A94-BB02-4ECF-81AD-22D07178D134\",\"reference\":\"request_134\",\"type\":\"1\",\"status\":\"3\",\"lastEventDate\":\"2022-01-31T11:59:32.000-03:00\",\"paymentMethod\":{\"type\":\"3\",\"code\":\"301\"},\"paymentLink\":\"https:\\/\\/sandbox.pagseguro.uol.com.br\\/checkout\\/payment\\/eft\\/print.jhtml?c=d6114b299672e478e469a5da4feeecdbac3347dcbfe98bb466c7072c3b89505a2e982c4bbd4a45df\",\"grossAmount\":\"720.27\",\"discountAmount\":\"72.03\",\"creditorFees\":{\"intermediationRateAmount\":\"0.40\",\"intermediationFeeAmount\":\"32.35\"},\"netAmount\":\"615.49\",\"extraAmount\":\"-80.03\",\"escrowEndDate\":\"2022-02-14T11:59:32.000-03:00\",\"installmentCount\":\"1\",\"itemCount\":\"1\",\"items\":{\"item\":{\"id\":\"2302d39c909793e04e6b01806c3bd60d\",\"description\":\"Tablet | COR: Preto | TAMANHO: 12 Polegadas\",\"quantity\":\"1\",\"amount\":\"800.30\"}},\"sender\":{\"name\":\"Ryan Menezes\",\"email\":\"ryan@gmail.com\",\"phone\":{\"areaCode\":\"11\",\"number\":\"999999999\"},\"documents\":{\"document\":{\"type\":\"CPF\",\"value\":\"53881489800\"}}},\"shipping\":{\"address\":{\"street\":\"Rua Batista\",\"number\":\"21\",\"complement\":{},\"district\":\"Jardim Batista\",\"city\":\"S\\u00e3o Paulo\",\"state\":\"SP\",\"country\":\"BRA\",\"postalCode\":\"11111111\"},\"type\":\"3\",\"cost\":\"0.00\"},\"primaryReceiver\":{\"publicKey\":\"PUBFD3757E636D341E0B4BA2E83589F6498\"}}', '2022-01-31 12:44:30', '2022-01-31 21:46:52'),
(141, '1245750681', 'MP', 'CC', 'refunded', 'DE', 1, 2, '1300.30', '0.00', '0.00', '130.03', 'PE', '150.00', 5, NULL, NULL, NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{\"cardholder\":{\"identification\":{\"number\":\"53881489800\",\"type\":\"CPF\"},\"name\":\"Ryan Menezes\"},\"date_created\":\"2022-01-31T12:06:12.000-04:00\",\"date_last_updated\":\"2022-01-31T12:06:12.000-04:00\",\"expiration_month\":12,\"expiration_year\":2025,\"first_six_digits\":\"423564\",\"id\":null,\"last_four_digits\":\"5682\"},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":\"2022-01-31T12:06:12.643-04:00\",\"date_created\":\"2022-01-31T12:06:12.519-04:00\",\"date_last_updated\":\"2022-01-31T12:06:42.576-04:00\",\"date_of_expiration\":null,\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_135\",\"fee_details\":[{\"amount\":65.88,\"fee_payer\":\"collector\",\"type\":\"mercadopago_fee\"}],\"id\":1245750681,\"installments\":1,\"integrator_id\":null,\"issuer_id\":\"25\",\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":\"2022-01-31T12:06:12.643-04:00\",\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"visa\",\"payment_type_id\":\"credit_card\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[{\"adjustment_amount\":0,\"amount\":1320.27,\"date_created\":\"2022-01-31T12:06:42.576-04:00\",\"external_refund_id\":null,\"funder\":null,\"id\":1245746350,\"labels\":[],\"metadata\":{},\"partition_details\":[],\"payment_id\":1245750681,\"reason\":null,\"refund_mode\":\"standard\",\"source\":{\"id\":\"774678190\",\"name\":\"Burch Mcmillan\",\"type\":\"collector\"},\"status\":\"approved\",\"unique_sequence_number\":null}],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":\"ELECTRO\",\"status\":\"refunded\",\"status_detail\":\"refunded\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":1320.27,\"transaction_amount_refunded\":1320.27,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":null,\"financial_institution\":null,\"installment_amount\":1320.27,\"net_received_amount\":1254.39,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":null,\"total_paid_amount\":1320.27}}', '2022-01-31 16:04:57', '2022-01-31 16:06:32'),
(142, '1245762111', 'MP', 'BO', 'pending', 'AP', 1, 2, '950.00', '0.00', '50.25', '95.00', 'PE', '150.00', 5, NULL, 'https://www.mercadopago.com/mlb/payments/sandbox/ticket/helper?payment_id=1245762111&payment_method_reference_id=9915054616&caller_id=130141172&hash=cf8f747c-5b26-446a-86f8-3df681d7cd96', NULL, NULL, '{\"acquirer_reconciliation\":[],\"additional_info\":{\"authentication_code\":null,\"available_balance\":null,\"nsu_processadora\":null},\"authorization_code\":null,\"barcode\":{\"content\":\"23791888500000954753380260991505461600633330\"},\"binary_mode\":false,\"brand_id\":null,\"call_for_authorize_id\":null,\"captured\":true,\"card\":{},\"charges_details\":[],\"collector_id\":774678190,\"corporation_id\":null,\"counter_currency\":null,\"coupon_amount\":0,\"currency_id\":\"BRL\",\"date_approved\":null,\"date_created\":\"2022-01-31T21:48:03.705-04:00\",\"date_last_updated\":\"2022-01-31T21:48:03.705-04:00\",\"date_of_expiration\":\"2022-02-03T22:59:59.000-04:00\",\"deduction_schema\":null,\"description\":null,\"differential_pricing_id\":null,\"external_reference\":\"request_136\",\"fee_details\":[],\"id\":1245762111,\"installments\":1,\"integrator_id\":null,\"issuer_id\":null,\"live_mode\":false,\"marketplace_owner\":null,\"merchant_account_id\":null,\"merchant_number\":null,\"metadata\":{},\"money_release_date\":null,\"money_release_schema\":null,\"notification_url\":\"http:\\/\\/www.lojavirtual.com.br\\/notificacao\\/mercadopago\",\"operation_type\":\"regular_payment\",\"order\":{},\"payer\":{\"first_name\":null,\"last_name\":null,\"email\":\"test_user_80507629@testuser.com\",\"identification\":{\"number\":\"32659430\",\"type\":\"DNI\"},\"phone\":{\"area_code\":null,\"number\":null,\"extension\":null},\"type\":null,\"entity_type\":null,\"id\":\"130141172\"},\"payment_method_id\":\"bolbradesco\",\"payment_type_id\":\"ticket\",\"platform_id\":null,\"point_of_interaction\":{\"business_info\":{\"sub_unit\":\"sdk\",\"unit\":\"online_payments\"},\"type\":\"UNSPECIFIED\"},\"pos_id\":null,\"processing_mode\":\"aggregator\",\"refunds\":[],\"shipping_amount\":0,\"sponsor_id\":null,\"statement_descriptor\":null,\"status\":\"pending\",\"status_detail\":\"pending_waiting_payment\",\"store_id\":null,\"taxes_amount\":0,\"transaction_amount\":954.75,\"transaction_amount_refunded\":0,\"transaction_details\":{\"acquirer_reference\":null,\"external_resource_url\":\"https:\\/\\/www.mercadopago.com\\/mlb\\/payments\\/sandbox\\/ticket\\/helper?payment_id=1245762111&payment_method_reference_id=9915054616&caller_id=130141172&hash=cf8f747c-5b26-446a-86f8-3df681d7cd96\",\"financial_institution\":\"\",\"installment_amount\":0,\"net_received_amount\":0,\"overpaid_amount\":0,\"payable_deferral_period\":null,\"payment_method_reference_id\":\"9915054616\",\"total_paid_amount\":954.75,\"verification_code\":\"9915054616\"}}', '2022-02-01 01:41:18', '2022-02-01 01:47:56');

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
(587, '11111111', '22222222', '150.00', 5, 1),
(588, '33333333', '44444444', '200.00', 10, 1),
(589, '55555555', '66666666', '5.00', 5, 1),
(590, '66666666', '77777777', '6.00', 5, 1),
(591, '88888888', '99999999', '7.00', 5, 1);

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
  `type_checkout` enum('LR','LB') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LR' COMMENT 'LR - Link de Redirecionamento | LB - LightBox',
  `header_color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff',
  `elements_color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `system_mercadopago`
--

INSERT INTO `system_mercadopago` (`id`, `active`, `public_key`, `access_token`, `type_checkout`, `header_color`, `elements_color`) VALUES
(1, 1, 'TEST-b373a2b1-7f2a-4f7c-b6f7-e815ea8797a5', 'TEST-1541154418522225-012712-072f7db6f08c326e64541943194176c7-774678190', 'LB', '#449d44', '#449d44');

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
(1, 1, 'menezesryan1010@gmail.com', '97C3FCEEDB4C4AC1A8A90E17307260DA', '', '', 'LB');

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
(1, 1, '', 'menezesryan1010@gmail.com', '');

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
(1, 1, '100.00', 10, 0, 'MP', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `products_related`
--
ALTER TABLE `products_related`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de tabela `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;

--
-- AUTO_INCREMENT de tabela `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT de tabela `requests_products`
--
ALTER TABLE `requests_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de tabela `request_address`
--
ALTER TABLE `request_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de tabela `request_payment`
--
ALTER TABLE `request_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=592;

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
