create or alter proc CalculaMedia @id int, @codigo int
as
begin
    declare @media decimal(4,2), @nota1 decimal(4,2), @nota2 decimal(4,2)

    select @nota1 = nota1, @nota2 = nota2 from Item_Matricula where id = @id and codigo = @codigo

    set @media = (@nota1 + @nota2) / 2

    update Item_Matricula set media = @media where id = @id and codigo = @codigo
end;
go

create or alter proc IniciarSemestre
as
begin
    update Item_matricula set nota1 = null, nota2 = null, sub = null, faltas = 0, media = null, situacao = 'Matriculado'

    update Item_Matricula set situacao = 'Matriculado' where id = 1
end;
go

create or alter proc MatricularAluno @id int, @codigo int
as
begin
    declare @idAluno int

    select @idAluno = id from Matricula where id = @id

    if(@idAluno is null)
        print('Não existe esse aluno matriculado!')
    else
    begin
        insert into Item_Matricula (id, codigo, situacao, faltas) values (@id, @codigo, 'Matriculado', 0)
        print('Aluno matriculado com sucesso!')
    end
end;
go

create or alter proc CadastrarAluno @nome varchar(100)
as
begin
    declare @id int

    select @id = ra from Aluno

    set @id = @id + 1

    insert into Aluno (ra, nome) values (@id, @nome)
end;
go

create or alter proc CadastrarAlunoMatricula @nome varchar(100), @ano int, @semestre int
as
begin
    declare @ra int
    SELECT top 1 @ra = ra from Aluno WHERE nome = @nome order by ra desc

    insert into Matricula (ra, ano, semestre) values (@ra, @ano, @semestre)
end;
go

EXEC.IniciarSemestre

EXEC.MatricularAluno 2, 3

EXEC.CadastrarAluno 'Marcela'

EXEC.CadastrarAlunoMatricula 'Marcela', 2023, 1

--update Item_matricula set nota1 = null, nota2 = null, sub = null, faltas = 0, media = null, situacao = 'Matriculado'

--update Item_Matricula set situacao = 'Matriculado' where id = 1

select * from Item_matricula
select * from Matricula
select * from Aluno