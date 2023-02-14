-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Jan-2023 às 01:30
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
-- Banco de dados: `Joias villa`
--
CREATE DATABASE IF NOT EXISTS `Joias villa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Joias villa`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cadastro` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `sexo` char(1) NOT NULL,
  `cpf` char(14) NOT NULL,
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
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `cliente` (`cadastro`,`nome`, `telefone`, `sexo`, `cpf`, `datanascimento`, `cep`, `numerocasa`, `complemento`, `foto`, `email`, `senha`, `status`) VALUES
(1, 'Mariam Lopez Ruiz', '(21)99886-1055', 'F', '123456893-10', '2001-08-01', '23085-610', 31, 'ap 102', 'vazio', 'maria@gmail.com', '1234', 'A'),
(2, 'Pedro Gonzalez', '(21)99999-1055', 'M', '123456789-10', '00012', '1997-10-20', '26551-090', 100, 'fundos', 'vazio', 'pdro@gmail.com', '123', 'A');

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
(1, 'conjunto coiar', 'azul', 30, 'un', 20, 1, 'produtos/imagens/congunto azul.jpg'),


-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
