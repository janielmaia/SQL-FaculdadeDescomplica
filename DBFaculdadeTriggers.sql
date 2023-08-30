create or alter TRIGGER TGR_Media_Insert on Item_matricula after update
as
begin
    IF(UPDATE(nota2))
    begin
        declare @id int, @codigo int, @nota1 decimal(4,2), @nota2 decimal(4,2), @media decimal (4,2)

        select @id = id, @codigo = codigo, @nota1 = nota1, @nota2 = nota2 from inserted

        set @media = (@nota1 + @nota2) / 2

        update Item_Matricula set media = @media where id = @id and codigo = @codigo
    end
end;
go

create or alter TRIGGER TGR_Situacao on Item_Matricula after update
as
begin
    IF(UPDATE(media))
    begin
        declare @id int, @codigo int, @media decimal(4,2), @situacao varchar(19)

        select @id = id, @codigo = codigo, @media = media, @situacao = situacao from inserted

        set @situacao = CASE
            when (@media >= 5) then 'Aprovado'
            else 'Reprovado por nota'
        end

        update Item_Matricula set situacao = @situacao where id = @id and codigo = @codigo
    end
end;
go

create or alter TRIGGER TGR_Verifica_Faltas on Item_Matricula after update
as
begin
    IF(UPDATE(faltas))
    begin
        declare @id int, @codigo int, @faltas int, @carga_horaria int, @situacao varchar(19), @media decimal(4,2)

        SELECT @id = id, @codigo = codigo, @faltas = faltas from inserted

        select @situacao = situacao, @media = media from Item_Matricula where id = @id and codigo = @codigo

        select @carga_horaria = carga_horaria from Disciplina where codigo = @codigo

        if(@faltas > (@carga_horaria / 2))
        begin
            UPDATE Item_Matricula set situacao = 'Reprovado por falta' where id = @id and codigo = @codigo
        end
        
        if(@faltas < (@carga_horaria / 2) and @situacao = 'Reprovado por falta' and @media >= 5)
        begin
            UPDATE Item_Matricula set situacao = 'Aprovado' where id = @id and codigo = @codigo
        end

        if(@faltas < (@carga_horaria / 2) and @situacao = 'Reprovado por falta' and @media <= 5)
        begin
            UPDATE Item_Matricula set situacao = 'Reprovado por nota' where id = @id and codigo = @codigo
        end
    end
end;
go

update Item_Matricula set faltas = 2 where id = 3 and codigo = 1

select * from Item_Matricula

update Item_Matricula set nota1 = 6, nota2 = 6 where id = 3 and codigo = 1
update Item_Matricula set faltas = 5 where id = 3 and codigo = 1