-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Abr-2025 às 15:51
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `workteen`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admins`
--

CREATE TABLE `admins` (
  `admId` int(11) NOT NULL,
  `admNome` varchar(150) DEFAULT NULL,
  `admEmail` varchar(150) DEFAULT NULL,
  `admSenha` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `aluId` int(11) NOT NULL,
  `aluLoginId` int(11) DEFAULT NULL,
  `aluCpf` varchar(15) NOT NULL,
  `aluNome` varchar(150) NOT NULL,
  `aluDtNascimento` date NOT NULL,
  `aluGenero` enum('masculino','feminino','prefiro não dizer') NOT NULL,
  `aluTelefone` varchar(14) NOT NULL,
  `aluEndereco` varchar(150) NOT NULL,
  `aluCidade` varchar(150) NOT NULL,
  `aluEscola` varchar(150) DEFAULT NULL,
  `aluSerie` varchar(10) DEFAULT NULL,
  `aluAtivo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidatos`
--

CREATE TABLE `candidatos` (
  `canId` int(11) NOT NULL,
  `canAluId` int(11) DEFAULT NULL,
  `canCurId` int(11) DEFAULT NULL,
  `canVagId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curriculos`
--

CREATE TABLE `curriculos` (
  `curId` int(11) NOT NULL,
  `curAlunoId` int(11) DEFAULT NULL,
  `curCaminho` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `empId` int(11) NOT NULL,
  `empLoginId` int(11) DEFAULT NULL,
  `empNome` varchar(150) NOT NULL,
  `empCnpj` varchar(20) NOT NULL,
  `empEmail` varchar(150) NOT NULL,
  `empTelefone` varchar(14) NOT NULL,
  `empEndereco` varchar(150) NOT NULL,
  `empCidade` varchar(150) NOT NULL,
  `empEstado` char(2) NOT NULL,
  `empRamo` varchar(150) NOT NULL,
  `empAtivo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loginaluno`
--

CREATE TABLE `loginaluno` (
  `logId` int(11) NOT NULL,
  `logEmail` varchar(255) NOT NULL,
  `logSenha` varchar(255) NOT NULL,
  `logUsuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `loginaluno`
--

INSERT INTO `loginaluno` (`logId`, `logEmail`, `logSenha`, `logUsuario`) VALUES
(5, 'suportwoorkteen@gmail.com', '$2y$10$tMWtRenVScDBLcqG7oUCtOit10utcdQJFnYEtws6IEqV9p/NV3GkK', 'Daniel Zanata'),
(6, 'aodaodsO@gmail.com', '$2y$10$0VoD5bnVQIw8xSCJ8YMSQuMYFo1fYqmkS722aBeglK8Wyca3Lj44q', 'Gordao da xj'),
(7, 'pedro.freitas90@etec.sp.gov.br', '$2y$10$IQlKYQVT.HIzkqWQkl3OpOP5asXWkMfWlPQJqTQ9Iieq..ZQc3VWi', 'Pedro Freitas'),
(8, 'daniel.zanata@educacao.sp.gov.br', '$2y$10$TRP.RjyT4cBtUC1q5bpveefu427aX1zVLU7ybSoGonYnN5l/KOHZy', 'Daniel Gaudensi');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loginempresa`
--

CREATE TABLE `loginempresa` (
  `logeid` int(11) NOT NULL,
  `logeCnpj` varchar(20) NOT NULL,
  `logesenha` varchar(255) NOT NULL,
  `logenomeempresa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas`
--

CREATE TABLE `vagas` (
  `vagId` int(11) NOT NULL,
  `vagEmpId` int(11) DEFAULT NULL,
  `vagDtInicio` date NOT NULL,
  `vagDtTermino` date NOT NULL,
  `vagTitulo` varchar(150) NOT NULL,
  `vagDesc` varchar(500) NOT NULL,
  `vagRequisitos` varchar(500) DEFAULT NULL,
  `vagModalidade` enum('presencial','remoto','hibrido') DEFAULT NULL,
  `vagCargaHoraria` int(11) DEFAULT NULL,
  `vagSalario` varchar(150) DEFAULT NULL,
  `vagAtivo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admId`);

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`aluId`),
  ADD UNIQUE KEY `aluCpf` (`aluCpf`),
  ADD KEY `aluLoginId` (`aluLoginId`);

--
-- Índices para tabela `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`canId`),
  ADD KEY `canAluId` (`canAluId`),
  ADD KEY `canCurId` (`canCurId`),
  ADD KEY `canVagId` (`canVagId`);

--
-- Índices para tabela `curriculos`
--
ALTER TABLE `curriculos`
  ADD PRIMARY KEY (`curId`),
  ADD KEY `curAlunoId` (`curAlunoId`);

--
-- Índices para tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empId`),
  ADD UNIQUE KEY `empCnpj` (`empCnpj`),
  ADD KEY `empLoginId` (`empLoginId`);

--
-- Índices para tabela `loginaluno`
--
ALTER TABLE `loginaluno`
  ADD PRIMARY KEY (`logId`);

--
-- Índices para tabela `loginempresa`
--
ALTER TABLE `loginempresa`
  ADD PRIMARY KEY (`logeid`),
  ADD UNIQUE KEY `logeCnpj` (`logeCnpj`);

--
-- Índices para tabela `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`vagId`),
  ADD KEY `vagEmpId` (`vagEmpId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admins`
--
ALTER TABLE `admins`
  MODIFY `admId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `aluId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `canId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curriculos`
--
ALTER TABLE `curriculos`
  MODIFY `curId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `empId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `loginaluno`
--
ALTER TABLE `loginaluno`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `loginempresa`
--
ALTER TABLE `loginempresa`
  MODIFY `logeid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `vagId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`aluLoginId`) REFERENCES `loginaluno` (`logId`);

--
-- Limitadores para a tabela `candidatos`
--
ALTER TABLE `candidatos`
  ADD CONSTRAINT `candidatos_ibfk_1` FOREIGN KEY (`canAluId`) REFERENCES `alunos` (`aluId`),
  ADD CONSTRAINT `candidatos_ibfk_2` FOREIGN KEY (`canCurId`) REFERENCES `curriculos` (`curId`),
  ADD CONSTRAINT `candidatos_ibfk_3` FOREIGN KEY (`canVagId`) REFERENCES `vagas` (`vagId`);

--
-- Limitadores para a tabela `curriculos`
--
ALTER TABLE `curriculos`
  ADD CONSTRAINT `curriculos_ibfk_1` FOREIGN KEY (`curAlunoId`) REFERENCES `alunos` (`aluId`);

--
-- Limitadores para a tabela `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`empLoginId`) REFERENCES `loginempresa` (`logeid`);

--
-- Limitadores para a tabela `vagas`
--
ALTER TABLE `vagas`
  ADD CONSTRAINT `vagas_ibfk_1` FOREIGN KEY (`vagEmpId`) REFERENCES `empresas` (`empId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
