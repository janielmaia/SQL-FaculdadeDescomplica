/*Criação do DBFacDescomplica*/
create database DBFacDescomplica;
GO
use DBFacDescomplica;
go
create table Aluno(

    ra int not null,

    nome varchar(100) not null,

    constraint PK_Aluno primary key (ra)

);

GO

/*Criação da Tabela Disciplina*/
create table Disciplina (

    codigo int,

    nome varchar(30) not null,

    carga_horaria int not null,

    constraint PK_Disciplina primary key (codigo)

)

GO

/*Criação da Tabela Matricula*/
create table Matricula(

    id int IDENTITY(1,1),

    ra int not null,

    ano int not null,

    semestre int not null,

    constraint PK_Matricula primary key (id),

    constraint FK_Matricula_Aluno foreign key (ra) references Aluno(ra),

    constraint UN_Matricula unique (ra, ano, semestre)

)

GO


/*Criação da Tabela Item Matricula*/
create table Item_Matricula (

    id int not null,

    codigo int not null,

    nota1 decimal(4,2),

    nota2 decimal(4,2),

    sub decimal(4,2),

    faltas int not null,

    situacao varchar(19) not null,

    constraint PK_Item_Matricula primary key (id, codigo),

    constraint FK_Item_Matricula_Matricula foreign key (id) references Matricula (id),

    constraint FK_Item_Matricula_Disciplina foreign key (codigo) references Disciplina --Está implícito que é com a PK

)

GO