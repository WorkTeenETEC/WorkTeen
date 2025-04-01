-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 01, 2025 at 02:37 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admId` int NOT NULL,
  `admNome` varchar(150) DEFAULT NULL,
  `admEmail` varchar(150) DEFAULT NULL,
  `admSenha` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `aluId` int NOT NULL,
  `aluLoginId` int DEFAULT NULL,
  `aluCpf` varchar(15) NOT NULL,
  `aluNome` varchar(150) NOT NULL,
  `aluEmail` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `aluDtNascimento` date NOT NULL,
  `aluTelefone` varchar(14) NOT NULL,
  `aluEndereco` varchar(150) NOT NULL,
  `aluCidade` varchar(150) NOT NULL,
  `aluEscola` varchar(150) DEFAULT NULL,
  `aluSerie` varchar(10) DEFAULT NULL,
  `aluAtivo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidatos`
--

CREATE TABLE `candidatos` (
  `canId` int NOT NULL,
  `canAluId` int DEFAULT NULL,
  `canCurId` int DEFAULT NULL,
  `canVagId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curriculos`
--

CREATE TABLE `curriculos` (
  `curId` int NOT NULL,
  `curAlunoId` int DEFAULT NULL,
  `curCaminho` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `empId` int NOT NULL,
  `empLoginId` int DEFAULT NULL,
  `empNome` varchar(150) NOT NULL,
  `empCnpj` varchar(20) NOT NULL,
  `empEmail` varchar(150) NOT NULL,
  `empTelefone` varchar(14) NOT NULL,
  `empEndereco` varchar(150) NOT NULL,
  `empCidade` varchar(150) NOT NULL,
  `empEstado` char(2) NOT NULL,
  `empRamo` varchar(150) NOT NULL,
  `empAtivo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loginaluno`
--

CREATE TABLE `loginaluno` (
  `LogId` int NOT NULL,
  `LogEmail` varchar(255) NOT NULL,
  `LogSenha` varchar(255) NOT NULL,
  `LogUsuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loginaluno`
--

INSERT INTO `loginaluno` (`LogId`, `LogEmail`, `LogSenha`, `LogUsuario`) VALUES
(5, 'suportwoorkteen@gmail.com', '$2y$10$tMWtRenVScDBLcqG7oUCtOit10utcdQJFnYEtws6IEqV9p/NV3GkK', 'Daniel Zanata'),
(6, 'aodaodsO@gmail.com', '$2y$10$0VoD5bnVQIw8xSCJ8YMSQuMYFo1fYqmkS722aBeglK8Wyca3Lj44q', 'Gordao da xj'),
(7, 'pedro.freitas90@etec.sp.gov.br', '$2y$10$IQlKYQVT.HIzkqWQkl3OpOP5asXWkMfWlPQJqTQ9Iieq..ZQc3VWi', 'Pedro Freitas'),
(8, 'daniel.zanata@educacao.sp.gov.br', '$2y$10$TRP.RjyT4cBtUC1q5bpveefu427aX1zVLU7ybSoGonYnN5l/KOHZy', 'Daniel Gaudensi');

-- --------------------------------------------------------

--
-- Table structure for table `loginempresa`
--

CREATE TABLE `loginempresa` (
  `logeId` int NOT NULL,
  `logeCnpj` varchar(15) NOT NULL,
  `logeSenha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logeNomeEmpresa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vagas`
--

CREATE TABLE `vagas` (
  `vagId` int NOT NULL,
  `vagEmpId` int DEFAULT NULL,
  `vagDtInicio` date NOT NULL,
  `vagDtTermino` date NOT NULL,
  `vagTitulo` varchar(150) NOT NULL,
  `vagDesc` varchar(500) NOT NULL,
  `vagRequisitos` varchar(500) DEFAULT NULL,
  `vagModalidade` enum('presencial','remoto','hibrido') DEFAULT NULL,
  `vagCargaHoraria` int DEFAULT NULL,
  `vagSalario` varchar(150) DEFAULT NULL,
  `vagAtivo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admId`);

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`aluId`),
  ADD UNIQUE KEY `aluCpf` (`aluCpf`),
  ADD KEY `aluLoginId` (`aluLoginId`);

--
-- Indexes for table `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`canId`),
  ADD KEY `canAluId` (`canAluId`),
  ADD KEY `canCurId` (`canCurId`),
  ADD KEY `canVagId` (`canVagId`);

--
-- Indexes for table `curriculos`
--
ALTER TABLE `curriculos`
  ADD PRIMARY KEY (`curId`),
  ADD KEY `curAlunoId` (`curAlunoId`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empId`),
  ADD UNIQUE KEY `empCnpj` (`empCnpj`),
  ADD KEY `empLoginId` (`empLoginId`);

--
-- Indexes for table `loginaluno`
--
ALTER TABLE `loginaluno`
  ADD PRIMARY KEY (`LogId`);

--
-- Indexes for table `loginempresa`
--
ALTER TABLE `loginempresa`
  ADD PRIMARY KEY (`logeId`),
  ADD UNIQUE KEY `logeCnpj` (`logeCnpj`);

--
-- Indexes for table `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`vagId`),
  ADD KEY `vagEmpId` (`vagEmpId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `aluId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `canId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curriculos`
--
ALTER TABLE `curriculos`
  MODIFY `curId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `empId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loginaluno`
--
ALTER TABLE `loginaluno`
  MODIFY `LogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `loginempresa`
--
ALTER TABLE `loginempresa`
  MODIFY `logeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vagas`
--
ALTER TABLE `vagas`
  MODIFY `vagId` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`aluLoginId`) REFERENCES `loginaluno` (`LogId`);

--
-- Constraints for table `candidatos`
--
ALTER TABLE `candidatos`
  ADD CONSTRAINT `candidatos_ibfk_1` FOREIGN KEY (`canAluId`) REFERENCES `alunos` (`aluId`),
  ADD CONSTRAINT `candidatos_ibfk_2` FOREIGN KEY (`canCurId`) REFERENCES `curriculos` (`curId`),
  ADD CONSTRAINT `candidatos_ibfk_3` FOREIGN KEY (`canVagId`) REFERENCES `vagas` (`vagId`);

--
-- Constraints for table `curriculos`
--
ALTER TABLE `curriculos`
  ADD CONSTRAINT `curriculos_ibfk_1` FOREIGN KEY (`curAlunoId`) REFERENCES `alunos` (`aluId`);

--
-- Constraints for table `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`empLoginId`) REFERENCES `loginempresa` (`logeId`);

--
-- Constraints for table `vagas`
--
ALTER TABLE `vagas`
  ADD CONSTRAINT `vagas_ibfk_1` FOREIGN KEY (`vagEmpId`) REFERENCES `empresas` (`empId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
