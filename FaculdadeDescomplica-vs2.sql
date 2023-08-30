CREATE DATABASE FaculdadeDescomplica;
GO
USE FaculdadeDescomplica;

CREATE TABLE PessoaFisica(
    CPF CHAR(11) NOT NULL,
    RG VARCHAR(05),
    DataNascimento DATE NOT NULL,
    Sexo CHAR(1),
    Nome VARCHAR(100) NOT NULL,
    Coddigo INT NOT NULL,
)

CREATE TABLE PessoaJuridica(
    CNPJ CHAR(14) NOT NULL,
    IncricaoEstadual CHAR(9),
    NomeResponsavel VARCHAR(50) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Coddigo INT NOT NULL,
)

CREATE TABLE Funcionario(
    Codigo INT NOT NULL,
    Departamento VARCHAR(30),
    Nome VARCHAR(50) NOT NULL,
    Funcao VARCHAR(30) NOT NULL,
)

CREATE TABLE Produto(
    Codigo INT NOT NULL,
    Tipo VARCHAR(20) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    PrecoCusto DECIMAL NOT NULL,
    PrecoVenda DECIMAL NOT NULL,
    QtsMin INT NOT NULL,
    QtdEstoque INT NOT NULL,
)

CREATE TABLE Venda(
    Id INT NOT NULL,
    [Data] DATETIME NOT NULL,
    FormaPagto VARCHAR(10) NOT NULL,
    Valor DECIMAL NOT NULL,
)

CREATE TABLE Endereco(
    Logradouro VARCHAR(50) NOT NULL,
    Numero INT,
    Complemento VARCHAR(50),
    Bairro VARCHAR(20) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Estado CHAR(2) NOT NULL,
    Pais CHAR(2) NOT NULL,
)

CREATE TABLE Telefone(
    Tipo VARCHAR(10) NOT NULL,
    Numero CHAR(14) NOT NULL,
)

GO

ALTER TABLE Telefone ADD
    CONSTRAINT PK_Tipo_Telefone PRIMARY KEY (Tipo)

ALTER TABLE Funcionario ADD 
    Tipo_Telefone VARCHAR(10) NULL,
    CONSTRAINT FK_Funcionario_Telefone FOREIGN KEY (Tipo_Telefone) REFERENCES Telefone(Tipo)