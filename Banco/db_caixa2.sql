-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Nov-2021 às 21:10
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

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
(20, '2021-11-24 12:59:55', '340.80', 2, 0);

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
(40, 'TROCA DE ÓLEO'),
(41, 'COMBUSTIVEL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `extra`
--

CREATE TABLE `extra` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `extra`
--

INSERT INTO `extra` (`id`, `nome`) VALUES
(2, 'LIMPEZA DO MOTOR'),
(3, 'GORJETAS'),
(4, 'LIMPEZA DE BICO'),
(5, 'ENCALHAMENTO');

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
  `status` int(11) DEFAULT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL,
  `catdespesas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `maobra`
--

INSERT INTO `maobra` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `status`, `mecanicos_id`, `caixa_id`, `catdespesas_id`) VALUES
(113, '2021-11-24 14:13:59', NULL, '35.00', NULL, NULL, NULL, 0, 'kics', 'não informado', '', 0, 9, 20, 3);

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
(11, 'MATHEUS JUNIOR'),
(14, 'NENHUM');

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
  `maobra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `status`, `catdespesas_id`, `caixa_id`, `mecanicos_id`, `maobra`) VALUES
(141, '2021-11-24 13:00:25', '0.00', '37.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 36, 20, 14, '0.00'),
(142, '2021-11-24 13:01:35', '0.00', '140.00', '0.00', '0.00', '0.00', 1, 'clio', 'não informado', '', 1, 32, 20, 6, '0.00'),
(143, '2021-11-24 14:12:03', '40.00', '0.00', '0.00', '0.00', '0.00', 1, 'fox', 'não informado', '', 1, 20, 20, 5, '0.00'),
(144, '2021-11-24 14:12:41', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'siena', 'não informado', '', 1, 29, 20, 1, '0.00'),
(145, '2021-11-24 14:13:59', '0.00', '110.00', '0.00', '0.00', '0.00', 1, 'kics', 'não informado', '', 1, 3, 20, 9, '70.00'),
(146, '2021-11-24 14:15:06', '0.00', '20.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 41, 20, 14, '0.00'),
(147, '2021-11-24 14:24:05', '0.00', '119.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 33, 20, 14, '0.00'),
(148, '2021-11-24 14:24:31', '0.00', '150.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 34, 20, 14, '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT current_timestamp(),
  `valor` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `caixa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `data`, `valor`, `status`, `caixa_id`) VALUES
(10, '2021-11-24', '35.00', 0, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT current_timestamp(),
  `data1` timestamp NULL DEFAULT current_timestamp(),
  `extra_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `data`, `data1`, `extra_id`, `mecanicos_id`, `valor`) VALUES
(12, '2021-11-01', '2021-11-23 17:46:13', 2, 2, '20.00'),
(13, '2021-11-01', '2021-11-23 17:46:38', 2, 2, '20.00'),
(14, '2021-11-01', '2021-11-23 17:47:07', 2, 3, '20.00'),
(15, '2021-11-13', '2021-11-23 17:48:17', 2, 9, '20.00'),
(16, '2021-11-04', '2021-11-23 17:48:41', 2, 5, '20.00'),
(17, '2021-11-04', '2021-11-23 17:49:04', 3, 1, '10.00'),
(18, '2021-11-05', '2021-11-23 17:50:52', 3, 1, '10.00'),
(19, '2021-11-08', '2021-11-23 17:51:25', 2, 5, '40.00'),
(20, '2021-11-08', '2021-11-23 17:51:44', 2, 1, '20.00'),
(21, '2021-11-09', '2021-11-23 17:52:16', 3, 10, '15.00'),
(22, '2021-11-10', '2021-11-23 17:54:14', 2, 5, '20.00'),
(23, '2021-11-11', '2021-11-23 17:54:37', 2, 5, '40.00'),
(24, '2021-11-13', '2021-11-23 17:55:06', 2, 5, '20.00'),
(25, '2021-11-16', '2021-11-23 17:55:46', 3, 5, '10.00'),
(26, '2021-11-16', '2021-11-23 17:56:30', 2, 5, '20.00'),
(27, '2021-11-04', '2021-11-23 17:56:50', 3, 3, '30.00'),
(28, '2021-11-13', '2021-11-23 17:57:08', 3, 8, '5.00'),
(29, '2021-11-19', '2021-11-23 17:57:45', 2, 1, '20.00'),
(30, '2021-11-20', '2021-11-23 17:57:58', 2, 3, '20.00'),
(31, '2021-11-19', '2021-11-23 17:58:18', 2, 9, '20.00'),
(32, '2021-11-13', '2021-11-23 17:58:40', 2, 10, '20.00'),
(33, '2021-11-01', '2021-11-23 17:58:54', 2, 3, '20.00'),
(34, '2021-11-04', '2021-11-23 17:59:06', 2, 2, '20.00'),
(35, '2021-11-04', '2021-11-23 17:59:25', 2, 7, '20.00'),
(36, '2021-11-22', '2021-11-23 18:00:49', 3, 11, '25.00'),
(37, '2021-11-20', '2021-11-23 18:01:27', 2, 3, '20.00'),
(38, '2021-11-17', '2021-11-23 18:01:52', 2, 3, '20.00'),
(39, '2021-11-19', '2021-11-23 18:02:08', 2, 3, '20.00'),
(40, '2021-11-19', '2021-11-23 18:02:31', 2, 9, '20.00'),
(41, '2021-11-11', '2021-11-23 18:08:50', 2, 5, '20.00'),
(42, '2021-11-17', '2021-11-23 18:09:29', 2, 8, '20.00'),
(43, '2021-11-19', '2021-11-23 18:10:31', 2, 10, '30.00'),
(44, '2021-11-13', '2021-11-23 18:12:58', 2, 9, '20.00'),
(45, '2021-11-23', '2021-11-23 18:13:15', 2, 9, '20.00');

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
-- Índices para tabela `extra`
--
ALTER TABLE `extra`
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
  ADD KEY `fk_maobra_caixa_idx` (`caixa_id`),
  ADD KEY `fk_maobra_catdespesas1_idx` (`catdespesas_id`);

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
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pagamento_caixa1_idx` (`caixa_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicos_extra1_idx` (`extra_id`),
  ADD KEY `fk_servicos_mecanicos1_idx` (`mecanicos_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `extra`
--
ALTER TABLE `extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `maobra`
--
ALTER TABLE `maobra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `maobra`
--
ALTER TABLE `maobra`
  ADD CONSTRAINT `fk_maobra_caixa` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_maobra_catdespesas1` FOREIGN KEY (`catdespesas_id`) REFERENCES `catdespesas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_caixa1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `fk_servicos_extra1` FOREIGN KEY (`extra_id`) REFERENCES `extra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicos_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
