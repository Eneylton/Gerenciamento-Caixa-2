-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Nov-2021 às 21:02
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_caixa2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nivel`) VALUES
(1, 'admin'),
(2, 'Assitente'),
(3, 'Coordenador'),
(4, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) DEFAULT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`id`, `data`, `valor`, `forma_pagamento_id`, `usuarios_id`) VALUES
(2, '2021-11-09 15:28:15', '367.00', 2, 0),
(3, '2021-11-10 18:26:16', '200.00', 2, 0),
(4, '2021-11-10 18:55:42', '352.00', 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `descricao`) VALUES
(1, 'Asssistente de Logística'),
(2, NULL),
(3, NULL),
(4, 'Supervisor de Operações Logísticas Interior'),
(5, 'Encarregada de Expedição'),
(6, 'Assistente da qualidade'),
(7, 'Auxiliar de Logística'),
(8, 'Diretora'),
(9, 'Assistente Financeiro'),
(10, 'Coordenadora de RH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catdespesas`
--

CREATE TABLE `catdespesas` (
  `id` int(11) NOT NULL,
  `nome` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `catdespesas`
--

INSERT INTO `catdespesas` (`id`, `nome`) VALUES
(1, 'ADITIVO'),
(2, 'BALANCIAMENTO'),
(3, 'ALINHAMENTO+ PRODUTO'),
(11, 'ALINHAMENTO'),
(15, 'ALINHAMENTO / BALANCIAMENTO'),
(16, 'ENCALHAMENTO'),
(17, 'LIMPEZA DE BICO'),
(18, 'MÃO DE OBRA '),
(19, 'MECÂNICA GERAL'),
(20, 'LIMPEZA DO MOTOR'),
(21, 'REVISÃO CARRO G'),
(22, 'REVISÃO CARRO P'),
(23, 'SERVIÇOS MECÂNICOS'),
(24, 'SUSPENSÃO'),
(25, 'TROCA DE ÓLEO + FILTRO'),
(26, 'VENDA DE BATERIAS'),
(27, 'VENDA DE PEÇAS /SERVIÇOS'),
(28, 'VENDA DE PRODUTO'),
(29, 'VENDA PEÇAS'),
(30, 'REVISÃO SIMPLES'),
(31, 'REVISÃO GERAL'),
(32, 'OLEO + FILTRO'),
(33, 'ÁGUA'),
(34, 'ALIMENTAÇÃO'),
(35, 'COMPRA DE PEÇAS'),
(36, 'MATERIAL DE ESCRITÓRIO'),
(37, 'MERCEARIA'),
(38, 'PAGAMENTO JEFSON'),
(39, 'EXAMES ADM'),
(40, 'TROCA DE ÓLEO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(2, 'Dinheiro'),
(3, 'Cartão de Crédito 1x'),
(4, 'Cartão de Crédito 2x'),
(5, 'Cartão de Crédito 3x'),
(6, 'Cartão de Crédito 4x'),
(7, 'Cartão de Débito'),
(8, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `maobra`
--

CREATE TABLE `maobra` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `cartao` decimal(10,2) DEFAULT NULL,
  `dinheiro` decimal(10,2) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `pix` decimal(10,2) DEFAULT NULL,
  `transferencia` decimal(10,2) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `veiculo` varchar(45) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `descricao` varchar(335) DEFAULT NULL,
  `servico` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `movimentacoes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `maobra`
--

INSERT INTO `maobra` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `servico`, `status`, `mecanicos_id`, `movimentacoes_id`) VALUES
(99, '2021-11-11 19:05:26', '0.00', '200.00', '0.00', '0.00', '0.00', 0, 'CORSA', 'HOT-2323', 'MÃO DE OBRA', 'SERVICOS MECANICOS', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mecanicos`
--

CREATE TABLE `mecanicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mecanicos`
--

INSERT INTO `mecanicos` (`id`, `nome`) VALUES
(1, 'ATANIEL'),
(2, 'BARRERINHAS'),
(3, 'GABRIEL'),
(4, 'PINTOR'),
(5, 'MAYCON'),
(6, 'JOSIVALDO'),
(7, 'ZORRO'),
(8, 'NETO'),
(9, 'VIANA'),
(10, 'ROBSON'),
(11, 'MATHEUS JUNIOR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `cartao` decimal(10,2) DEFAULT NULL,
  `dinheiro` decimal(10,2) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `pix` decimal(10,2) DEFAULT NULL,
  `transferencia` decimal(10,2) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `veiculo` varchar(45) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `descricao` varchar(335) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `catdespesas_id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `movimentacoescol` varchar(45) DEFAULT NULL,
  `maobra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `status`, `catdespesas_id`, `caixa_id`, `mecanicos_id`, `movimentacoescol`, `maobra`) VALUES
(61, '2021-11-09 03:00:00', '0.00', '144.00', '0.00', '0.00', '0.00', 0, '', '', 'compra de produtos p/loja', 1, 37, 2, 0, NULL, NULL),
(62, '2021-11-09 03:00:00', '0.00', '330.00', '0.00', '0.00', '0.00', 0, '', '', 'Refeição funciários', 1, 34, 2, 0, NULL, NULL),
(63, '2021-11-09 03:00:00', '0.00', '20.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 35, 2, 0, NULL, NULL),
(64, '2021-11-09 03:00:00', '0.00', '12.50', '0.00', '0.00', '0.00', 0, '', '', '', 1, 35, 2, 0, NULL, NULL),
(65, '2021-11-09 03:00:00', '0.00', '17.94', '0.00', '0.00', '0.00', 0, '', '', '', 1, 37, 2, 0, NULL, NULL),
(66, '2021-11-09 03:00:00', '0.00', '90.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 37, 2, 0, NULL, NULL),
(67, '2021-11-09 03:00:00', '80.00', '0.00', '0.00', '0.00', '0.00', 1, 'fiesta', 'HOT-2356', '', 1, 23, 2, 0, NULL, NULL),
(68, '2021-11-09 03:00:00', '1240.00', '0.00', '0.00', '0.00', '0.00', 1, 'CELTA', 'HOS-8574', '', 1, 27, 2, 0, NULL, NULL),
(69, '2021-11-09 03:00:00', '790.00', '0.00', '0.00', '0.00', '0.00', 1, 'CELTA', 'HOS-8574', '', 1, 27, 2, 0, NULL, NULL),
(70, '2021-11-09 03:00:00', '200.00', '0.00', '0.00', '150.00', '0.00', 1, 'cobalt', 'HOS-8565', '', 1, 29, 2, 0, NULL, NULL),
(71, '2021-11-09 03:00:00', '0.00', '1150.00', '0.00', '0.00', '0.00', 1, 'cruzer', 'NHU-8956', '', 1, 27, 2, 0, NULL, NULL),
(72, '2021-11-09 03:00:00', '0.00', '0.00', '220.00', '0.00', '0.00', 1, 'l-200', 'NHU-7742', '', 1, 29, 2, 0, NULL, NULL),
(73, '2021-11-09 03:00:00', '0.00', '0.00', '185.00', '0.00', '0.00', 1, 'hb20', 'Hot-2543', '', 1, 29, 2, 0, NULL, NULL),
(74, '2021-11-09 03:00:00', '0.00', '0.00', '140.00', '0.00', '0.00', 1, 'siena', 'NHU-7343', '', 1, 40, 2, 0, NULL, NULL),
(75, '2021-11-09 03:00:00', '0.00', '0.00', '140.00', '0.00', '0.00', 1, 'SIENA', 'hpl-5245', '', 1, 40, 2, 0, NULL, NULL),
(76, '2021-11-09 03:00:00', '100.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'HOR-8524', '', 1, 28, 2, 0, NULL, NULL),
(77, '2021-11-09 03:00:00', '215.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'HOS-8565', '', 1, 25, 2, 0, NULL, NULL),
(78, '2021-11-09 03:00:00', '0.00', '40.00', '0.00', '145.00', '0.00', 1, 'CLIO', 'HOS-8565', '', 1, 25, 2, 0, NULL, NULL),
(79, '2021-11-09 03:00:00', '450.00', '0.00', '0.00', '0.00', '0.00', 1, 'hb20', 'Hot-2953', '', 1, 26, 2, 0, NULL, NULL),
(80, '2021-11-09 03:00:00', '0.00', '130.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NHU-8956', '', 1, 27, 2, 0, NULL, NULL),
(81, '2021-11-09 03:00:00', '0.00', '60.00', '0.00', '0.00', '0.00', 1, 'COROLLA', 'NHU-7742', '', 1, 15, 2, 0, NULL, NULL),
(82, '2021-11-09 03:00:00', '0.00', '0.00', '425.00', '0.00', '0.00', 1, 'DUSTER', 'HOT-2356', '', 1, 27, 2, 0, NULL, NULL),
(83, '2021-11-09 03:00:00', '595.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIT', 'HOR-8524', '', 1, 23, 2, 0, NULL, NULL),
(84, '2021-11-09 03:00:00', '0.00', '0.00', '0.00', '1690.00', '0.00', 1, 'HILUX', 'NHU-9090', '', 1, 27, 2, 0, NULL, NULL),
(85, '2021-11-09 03:00:00', '0.00', '0.00', '0.00', '40.00', '0.00', 1, 'ONIX JOY', 'NHU-8956', '', 1, 23, 2, 0, NULL, NULL),
(86, '2021-11-09 03:00:00', '0.00', '0.00', '590.00', '0.00', '0.00', 1, 'PAJEIRO', 'NHU-5525', '', 1, 27, 2, 0, NULL, NULL),
(87, '2021-11-09 03:00:00', '1380.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NHU-9090', '', 1, 27, 2, 0, NULL, NULL),
(88, '2021-11-09 03:00:00', '0.00', '800.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 38, 2, 0, NULL, NULL),
(89, '2021-11-10 18:27:07', '0.00', '250.00', '0.00', '0.00', '0.00', 1, 'fiat uno', 'HOS-8565', '', 1, 23, 3, 0, NULL, NULL),
(90, '2021-11-10 18:27:38', '0.00', '250.00', '0.00', '0.00', '0.00', 1, 'siena', 'hpl-5245', '', 1, 30, 3, 0, NULL, NULL),
(91, '2021-11-10 18:28:09', '0.00', '100.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 35, 3, 0, NULL, NULL),
(92, '2021-11-10 18:28:26', '0.00', '50.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 35, 3, 0, NULL, NULL),
(93, '2021-11-10 18:56:18', '0.00', '175.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 35, 4, 0, NULL, NULL),
(94, '2021-11-10 18:57:31', '0.00', '20.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 34, 4, 0, NULL, NULL),
(95, '2021-11-10 18:58:48', '0.00', '240.00', '0.00', '0.00', '0.00', 1, 'PRISMA', 'NHU-8956', '', 1, 27, 4, 0, NULL, NULL),
(96, '2021-11-10 18:59:17', '0.00', '60.00', '0.00', '0.00', '0.00', 1, 'OROCH', 'NHU-8956', '', 1, 11, 4, 0, NULL, NULL),
(97, '2021-11-10 18:59:45', '0.00', '750.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NHU-8956', '', 1, 27, 4, 0, NULL, NULL),
(98, '2021-11-10 19:00:10', '0.00', '150.00', '0.00', '0.00', '0.00', 1, 'YARIS', 'NHU-5525', '', 1, 27, 4, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `acessos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargos_id`, `acessos_id`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$mZ.QuTVOWHefiG58kSk2K.BW3VDnDFu/l1fhYaBmRhQ5eJTJImThm', 1, 1),
(7, 'Eneylton Barros', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 2),
(13, 'ene', 'enex@gmail.com.br', '202cb962ac59075b964b07152d234b70', 1, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_caixa_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_caixa_usuarios1_idx` (`usuarios_id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `maobra`
--
ALTER TABLE `maobra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimentacoes_copy1_mecanicos1_idx` (`mecanicos_id`),
  ADD KEY `fk_maobra_movimentacoes1_idx` (`movimentacoes_id`);

--
-- Índices para tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimentacoes_catdespesas1_idx` (`catdespesas_id`),
  ADD KEY `fk_movimentacoes_caixa1_idx` (`caixa_id`),
  ADD KEY `fk_movimentacoes_mecanicos1_idx` (`mecanicos_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuarios_cargos_idx` (`cargos_id`),
  ADD KEY `fk_usuarios_acessos1_idx` (`acessos_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `maobra`
--
ALTER TABLE `maobra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `fk_caixa_forma_pagamento1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caixa_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `maobra`
--
ALTER TABLE `maobra`
  ADD CONSTRAINT `fk_maobra_movimentacoes1` FOREIGN KEY (`movimentacoes_id`) REFERENCES `movimentacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimentacoes_copy1_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD CONSTRAINT `fk_movimentacoes_caixa1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimentacoes_catdespesas1` FOREIGN KEY (`catdespesas_id`) REFERENCES `catdespesas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimentacoes_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_acessos1` FOREIGN KEY (`acessos_id`) REFERENCES `acessos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_cargos` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
