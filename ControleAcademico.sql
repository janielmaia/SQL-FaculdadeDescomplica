CREATE DATABASE ControleAcademico
GO
USE ControleAcademico

CREATE TABLE Aluno (
    RA INT NOT NULL,
    Nome VARCHAR(120) NOT NULL,

    CONSTRAINT PK_Aluno PRIMARY KEY (RA),
)
GO

CREATE TABLE Disciplina (
    Codigo INT NOT NULL,
    Nome VARCHAR(120) NOT NULL,
    CargaHoraria INT NOT NULL,

    CONSTRAINT PK_Disciplina PRIMARY KEY (Codigo),
)
GO

CREATE TABLE Matricula (
    ID INT NOT NULL,
    RA INT NOT NULL,
    Ano VARCHAR(4),
    Semestre VARCHAR(2),

    CONSTRAINT PK_Matricula PRIMARY KEY (ID),
    CONSTRAINT FK_Matricula_Aluno FOREIGN KEY (RA) REFERENCES Aluno (RA),
)
GO

CREATE TABLE ItemMatricula (
    ID INT NOT NULL,
    Codigo INT NOT NULL,
    Nota1 DECIMAL,
    Nota2 DECIMAL,
    Sub DECIMAL,
    Situacao varchar(30),
    Falta INT,

    CONSTRAINT PK_Item_Matricula PRIMARY KEY (ID, Codigo),
    CONSTRAINT FK_Item_Matricula_Matricula FOREIGN KEY (ID) REFERENCES Matricula (ID),
    CONSTRAINT FK_Item_Matricula_Disciplina FOREIGN KEY (Codigo) REFERENCES Disciplina (Codigo),
);