DROP DATABASE IF EXISTS Workteen;

CREATE DATABASE WorkTeen;

Use WorkTeen;

CREATE TABLE loginAluno (
    logId int PRIMARY key AUTO_INCREMENT,
    logEmail varchar(255) NOT NULL,
    logSenha varchar(255) NOT NULL,
    logUsuario varchar(255) NOT NULL
  );
  
INSERT INTO loginaluno (`LogId`, `LogEmail`, `LogSenha`, `LogUsuario`) VALUES
(5, 'suportwoorkteen@gmail.com', '$2y$10$tMWtRenVScDBLcqG7oUCtOit10utcdQJFnYEtws6IEqV9p/NV3GkK', 'Daniel Zanata'),
(6, 'aodaodsO@gmail.com', '$2y$10$0VoD5bnVQIw8xSCJ8YMSQuMYFo1fYqmkS722aBeglK8Wyca3Lj44q', 'Gordao da xj'),
(7, 'pedro.freitas90@etec.sp.gov.br', '$2y$10$IQlKYQVT.HIzkqWQkl3OpOP5asXWkMfWlPQJqTQ9Iieq..ZQc3VWi', 'Pedro Freitas'),
(8, 'daniel.zanata@educacao.sp.gov.br', '$2y$10$TRP.RjyT4cBtUC1q5bpveefu427aX1zVLU7ybSoGonYnN5l/KOHZy', 'Daniel Gaudensi');


CREATE TABLE LoginEmpresa(
	logeid INT PRIMARY KEY AUTO_INCREMENT,
	logeCnpj VARCHAR(20) UNIQUE NOT NULL,
	logesenha VARCHAR(255) NOT NULL ,
	logenomeempresa VARCHAR(255) NOT NULL
);

CREATE TABLE Alunos (
	aluId INT PRIMARY KEY AUTO_INCREMENT,
	aluLoginId int,
	aluCpf VARCHAR(15) UNIQUE NOT NULL,
	aluNome VARCHAR(150) Not Null,
	aluDtNascimento DATE Not Null,
	aluGenero ENUM('masculino','feminino','prefiro não dizer')NOT NULL,
	aluTelefone VARCHAR(14) Not Null,
	aluEndereco VARCHAR(150) Not Null,
	aluCidade VARCHAR(150) Not Null,
	aluEscola VARCHAR(150),
	aluSerie VARCHAR(10),
	aluAtivo BOOLEAN DEFAULT 1,
	FOREIGN KEY (aluLoginId) REFERENCES Loginaluno(LogId)
	);
	
CREATE TABLE Empresas (
	empId int PRIMARY KEY AUTO_INCREMENT,
	empLoginId int,
	empNome varchar(150) not null,
	empCnpj varchar(20) UNIQUE not null,
	empEmail varchar(150) not null,
	empTelefone varchar(14) not null, 
	empEndereco VARCHAR(150) Not Null,
	empCidade VARCHAR(150) Not Null,
	empEstado CHAR(2) Not Null,
	empRamo varchar(150) not null,
	empAtivo boolean default 1,
	FOREIGN KEY (empLoginId) REFERENCES LoginEmpresa(logeid)
	);

CREATE TABLE Curriculos (
	curId int primary key AUTO_INCREMENT,
	curAlunoId int,
	curCaminho varchar(255),
	FOREIGN key (curAlunoId) REFERENCES Alunos(aluId)
	);
	
CREATE TABLE Vagas (
	vagId int primary key AUTO_INCREMENT,
	vagEmpId int,
	vagDtInicio DATE not null,
	vagDtTermino DATE not null,
	vagTitulo varchar (150) not null,
	vagDesc VARCHAR(500) not null,
	vagRequisitos varchar(500),
	vagModalidade enum('presencial','remoto','hibrido'),
	vagCargaHoraria int,
	vagSalario varchar (150),
	vagAtivo boolean default 1,
	FOREIGN KEY (vagEmpId) REFERENCES Empresas(empId)
	);
	
CREATE TABLE Candidatos(
	canId INT AUTO_INCREMENT primary key,
	canAluId int,
	canCurId int,
	canVagId int,
	FOREIGN key (canAluId) REFERENCES Alunos(aluId),
	FOREIGN key (canCurId) REFERENCES Curriculos(curId),
	FOREIGN key (canVagId) REFERENCES Vagas(vagId)	
	);
	
CREATE TABLE Admins (
	admId int PRIMARY key AUTO_INCREMENT,
	admNome varchar(150),
	admEmail varchar(150),
	admSenha varchar(150)
	);
