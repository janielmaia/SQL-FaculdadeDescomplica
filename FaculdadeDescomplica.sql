-- Criando e usando o banco de dados
USE master

CREATE DATABASE FaculdadeDescomplica
GO
USE FaculdadeDescomplica

-- ###### Criando tabelas ###### --
CREATE TABLE Pessoa (
    codigo UNIQUEIDENTIFIER NOT NULL,
    nome varchar(120) NOT NULL,

    CONSTRAINT PK_Pessoa PRIMARY KEY (codigo)
)
GO

CREATE TABLE PessoaJuridica (
    codigo UNIQUEIDENTIFIER NOT NULL,
    CNPJ varchar(14) NOT NULL,
    IncricaoEstadual CHAR(9),
    NomeResponsavel VARCHAR(50) NOT NULL,

    CONSTRAINT PK_Pessoa_Juridica PRIMARY KEY (CNPJ, codigo),
    constraint FK_Pessoa_Juridica_Pessoa FOREIGN KEY (codigo) REFERENCES Pessoa (codigo),
)
GO

CREATE TABLE PessoaFisica (
    codigo UNIQUEIDENTIFIER NOT NULL,
    CPF varchar(11) NOT NULL,
    RG varchar(9),
    sexo char(1) NOT NULL,
    DataNascimento Date NOT NULL,

    CONSTRAINT PK_Pessoa_Fisica PRIMARY KEY (CPF, codigo),
    CONSTRAINT FK_Pessoa_Fisica_Pessoa FOREIGN KEY (codigo) REFERENCES Pessoa (codigo),
)
GO

CREATE TABLE EnderecoPessoa (
    codigo UNIQUEIDENTIFIER NOT NULL,
    Logradouro VARCHAR(50) NOT NULL,
    Numero INT,
    Complemento VARCHAR(50),
    Bairro VARCHAR(20) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Estado CHAR(2) NOT NULL,
    Pais CHAR(2) NOT NULL,

    CONSTRAINT PK_Endereco_Pessoa PRIMARY KEY (codigo),
    CONSTRAINT FK_Endereco_Pessoa_Pessoa FOREIGN KEY (codigo) REFERENCES Pessoa (codigo),
)
GO

CREATE TABLE TelefonePessoa (
    codigo UNIQUEIDENTIFIER NOT null,
    numero varchar(14) NOT NULL,
    tipo varchar(10) NOT NULL,

    CONSTRAINT PK_Telefone_Pessoa PRIMARY KEY (numero, codigo),
    constraint FK_Telefone_Pessoa_Pessoa FOREIGN KEY (codigo) REFERENCES Pessoa (codigo),
)
GO

CREATE TABLE Funcionario (
    codigo UNIQUEIDENTIFIER NOT NULL,
    nome varchar (120) NOT NULL,

    CONSTRAINT PK_Codigo_Funcionario PRIMARY KEY (codigo),
)
GO

CREATE TABLE EnderecoFuncionario (
    codigo UNIQUEIDENTIFIER NOT NULL,
    Logradouro VARCHAR(50) NOT NULL,
    Numero INT,
    Complemento VARCHAR(50),
    Bairro VARCHAR(20) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Estado CHAR(2) NOT NULL,
    Pais CHAR(2) NOT NULL,

    CONSTRAINT PK_Endereco_Funcionario PRIMARY KEY (codigo),
    CONSTRAINT FK_Endereco_Funcionario_Funcionario FOREIGN KEY (codigo) REFERENCES Funcionario (codigo),
)
GO

CREATE TABLE TelefoneFuncionario (
    codigo UNIQUEIDENTIFIER NOT null,
    numero varchar(14) NOT NULL,
    tipo varchar(10) NOT NULL,

    CONSTRAINT PK_Telefone_Funcionario PRIMARY KEY (numero, codigo),
    constraint FK_Telefone_Funcionario_Funcionario FOREIGN KEY (codigo) REFERENCES Funcionario (codigo),
)
GO

CREATE TABLE Venda (
    numero int NOT NULL,
    DataVenda DateTime NOT NULL,
    formaPagamento varchar (10) NOT NULL,
    valorVenda DECIMAL NOT NULL
)
GO

CREATE TABLE Produto (
    codigo UNIQUEIDENTIFIER NOT NULL,
    descricao varchar (150) NOT NULL,
    quantidadeMin int NOT NULL,
    quantidadeMax int NOT NULL,
    tipo varchar (15) NOT NULL,
    precoCusta DECIMAL NOT NULL,
    precoVenda DECIMAL NOT NULL,

    CONSTRAINT PK_Produto PRIMARY KEY (codigo)
)
GO

-- ###### Criando as Procedures de insert ###### --

CREATE OR ALTER PROC InsertPessoa @Nome varchar (120)
AS
BEGIN
    INSERT INTO Pessoa ([Codigo],[Nome]) VALUES(
        NEWID(),
        @Nome
    )
END;
GO

-- EXEC.InsertPessoa 'Matheus Oliveira'

CREATE OR ALTER PROC InsertPessoaFisica @codigo UNIQUEIDENTIFIER, @CPF varchar (11), @RG varchar(9), @Sexo char(1), @DataNascimento Date
AS
BEGIN
    INSERT INTO PessoaFisica ([codigo], [CPF], [RG], [Sexo], [DataNascimento]) VALUES (
        @codigo,
        @CPF,
        @RG,
        @Sexo,
        @DataNascimento
    )
END;
GO

-- EXEC.InsertPessoaFisica 'f3bf3b8e-bcdd-4794-ab0e-c89baf069b33', '49249249249', '585894328', 'M', '2000-07-06'

CREATE OR ALTER PROC InsertPessoaJuridica @codigo UNIQUEIDENTIFIER, @CNPJ varchar (14), @InscricaoEstadual char(9), @NomeResponsavel varchar(50)
AS
BEGIN
    INSERT INTO PessoaJuridica ([codigo], [CNPJ], [IncricaoEstadual], [NomeResponsavel]) VALUES (
        @codigo,
        @CNPJ,
        @InscricaoEstadual,
        @NomeResponsavel
    )
END;
GO

-- EXEC.InsertPessoaJuridica 'd603085a-345a-4b8d-8ea5-d5e1f90045ee', '12345678910234', 'ASDASDASD', 'Matheus Santos'

CREATE OR ALTER PROC InsertEnderecoPessoa @Codigo UNIQUEIDENTIFIER, @Logradouro varchar(50), @Numero int, @Complemento varchar(50), @Bairro varchar(50), @CEP varchar(8), @Cidade varchar(30), @Estado char(2), @Pais char(2)
AS
BEGIN
    INSERT INTO EnderecoPessoa([codigo], [Logradouro], [Numero], [Complemento], [Bairro], [CEP], [Cidade], [Estado], [Pais]) VALUES (
        @Codigo,
        @Logradouro,
        @Numero,
        @Complemento,
        @Bairro,
        @CEP,
        @Cidade,
        @Estado,
        @Pais
    )
END;
GO

-- EXEC.InsertEnderecoPessoa 'f3bf3b8e-bcdd-4794-ab0e-c89baf069b33', 'Rua Jornalista', '183', 'Casa', 'Nova Guariba', '14840000', 'Guariba', 'SP', 'BR'