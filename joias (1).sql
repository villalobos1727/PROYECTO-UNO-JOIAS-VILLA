-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Fev-2023 às 20:56
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `joias`
--
CREATE DATABASE IF NOT EXISTS `joias` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `joias`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `codigoproduto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` double NOT NULL,
  `quantcompra` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nomecategoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nomecategoria`) VALUES
(1, 'mochila'),
(2, 'roupa'),
(3, 'suplemento'),
(4, 'acessórios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `registro` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `sexo` char(1) NOT NULL,
  `cpf` char(14) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `datanascimento` date NOT NULL,
  `cep` char(9) NOT NULL,
  `numerocasa` smallint(6) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`registro`, `nome`, `telefone`, `sexo`, `cpf`, `rg`, `datanascimento`, `cep`, `numerocasa`, `complemento`, `foto`, `email`, `senha`, `status`) VALUES
(1, 'Maria das Graças da Silva', '(21)99886-1055', 'F', '123456893-10', '12555', '2001-08-01', '23085-610', 31, 'ap 102', 'vazio', 'maria@gmail.com', '$2y$10$im0jB8.c.gP0PaUEdCH3B.4IwD8OqIjfT7Bdocr5AmxfYEYbvIecu', 'A'),
(2, 'Pedro', '(21)99999-1055', 'M', '123456789-10', '00012', '1997-10-20', '26551-090', 100, 'fundos', 'vazio', 'pdro@gmail.com', '123', 'A'),
(3, 'Priscila', '(21)99999-9999', 'F', '111.111.111-11', '6565656', '2000-01-01', '23085-610', 100, 'casa', 'fotos/63d93f20ac9ea.png', 'priscila@gmail.com', '$2y$10$d7UaAkDuNw6klWSujVCABOQdwUe4OKhOCDgh7uUf7T5DZCCnc//Be', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cpffuncionario` char(14) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `sexo` char(1) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `cep` char(9) NOT NULL,
  `numerocasa` smallint(6) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cpffuncionario`, `nome`, `telefone`, `sexo`, `rg`, `cep`, `numerocasa`, `complemento`, `foto`, `email`, `senha`) VALUES
('123', 'Mário Silva', '(21)9999-8888', 'M', '0001', '23085-610', 40, 'ap 202', 'vazio', '', ''),
('456', 'Gabriel Silva', '(21)9999-7777', 'M', '0002', '26551-090', 100, 'casa', 'vazio', '', ''),
('789', 'Mariana Souza', '(21)9999-5555', 'F', '1234', '23085-610', 1820, 'casa', 'vazio', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `iditem` int(11) NOT NULL,
  `idvenda` int(11) NOT NULL,
  `codigoproduto` int(11) NOT NULL,
  `quantcompra` int(11) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`iditem`, `idvenda`, `codigoproduto`, `quantcompra`, `valor`) VALUES
(1, 28, 6, 1, 100),
(2, 29, 6, 1, 100),
(3, 29, 5, 1, 120),
(4, 29, 5, 3, 120),
(5, 30, 6, 3, 100),
(6, 30, 5, 2, 120),
(7, 30, 6, 2, 100),
(8, 31, 6, 3, 100),
(9, 31, 6, 5, 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigoproduto` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cor` varchar(30) NOT NULL,
  `valor` double NOT NULL,
  `tamanho` char(2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codigoproduto`, `nome`, `cor`, `valor`, `tamanho`, `quantidade`, `idcategoria`, `foto`) VALUES
(1, 'mochila Paloma', 'rosa', 150, 'un', 20, 1, 'produtos/63daa69add605.jpg'),
(2, 'mochila Raissa', 'azul', 120, 'un', 30, 2, 'produtos/63daa6af278c1.jpg'),
(3, 'mochila amanda', 'preta', 50.85, 'M', 30, 1, 'produtos/63d964567a504.jpg'),
(4, 'mochila agatha', 'azul', 100.6, 'G', 10, 1, 'produtos/63d9649fb4542.jpg'),
(5, 'whey blend protein', 'preto', 120, '90', 0, 3, 'produtos/63e294fc5fdb2.jpg'),
(6, 'whey waxi', 'preto', 100, '90', 35, 3, 'produtos/63e2951504167.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL,
  `data` date NOT NULL,
  `valor` double NOT NULL,
  `registro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idvenda`, `data`, `valor`, `registro`) VALUES
(3, '2023-02-08', 220, 1),
(4, '2023-02-08', 220, 1),
(5, '2023-02-08', 220, 1),
(6, '2023-02-08', 220, 1),
(7, '2023-02-08', 220, 1),
(8, '2023-02-08', 220, 1),
(9, '2023-02-08', 220, 1),
(10, '2023-02-08', 220, 1),
(11, '2023-02-08', 220, 1),
(12, '2023-02-08', 220, 1),
(13, '2023-02-08', 220, 1),
(14, '2023-02-08', 580, 1),
(15, '2023-02-08', 580, 1),
(16, '2023-02-08', 580, 1),
(17, '2023-02-08', 580, 1),
(18, '2023-02-08', 580, 1),
(19, '2023-02-08', 580, 1),
(20, '2023-02-08', 580, 1),
(21, '2023-02-08', 580, 1),
(22, '2023-02-08', 580, 1),
(23, '2023-02-08', 580, 1),
(24, '2023-02-08', 580, 1),
(25, '2023-02-08', 580, 1),
(26, '2023-02-08', 580, 1),
(27, '2023-02-08', 580, 1),
(28, '2023-02-08', 580, 1),
(29, '2023-02-08', 580, 1),
(30, '2023-02-09', 740, 1),
(31, '2023-02-09', 800, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`registro`),
  ADD KEY `cep` (`cep`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cpffuncionario`),
  ADD KEY `cep` (`cep`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`iditem`),
  ADD KEY `fc_produto` (`codigoproduto`),
  ADD KEY `fc_venda` (`idvenda`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigoproduto`),
  ADD KEY `fk_categoria` (`idcategoria`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idvenda`),
  ADD KEY `fc_aluno` (`registro`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `iditem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigoproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idvenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fc_produto` FOREIGN KEY (`codigoproduto`) REFERENCES `produto` (`codigoproduto`),
  ADD CONSTRAINT `fc_venda` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fc_aluno` FOREIGN KEY (`registro`) REFERENCES `cliente` (`registro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
