insert into Aluno values (1, 'Janiel')

insert into Aluno (nome, ra) values ('Clara', 2)

insert into Aluno values (3, 'Carlos')

SELECT * from Aluno order by nome desc

SELECT ra, nome from Aluno order by 2 desc

insert into Disciplina values (1, 'Banco de Dados', 80), (2, 'IA', 80), (3, 'SO', 60)

insert into Matricula values (1, 2023, 1)

insert into Matricula values (2, 2023, 1)

insert into Matricula values (3, 2023, 1)

select * from Matricula

update Disciplina set nome = 'Inteligencia Artificial', carga_horaria = 100 where codigo = 2

SELECT * from Disciplina

begin TRANSACTION commit;

update Disciplina set nome = 'Inteligencia Artificial', carga_horaria = 100

begin TRANSACTION ROLLBACK;

delete from Disciplina where carga_horaria <= 80

--Disciplinas da Matricula de cada aluno
insert into Item_Matricula (id, codigo, faltas, situacao) values (1, 1, 0, 'Matriculado')
insert into Item_Matricula (id, codigo, faltas, situacao) values (1, 2, 0, 'Matriculado')
insert into Item_Matricula (id, codigo, faltas, situacao) values (1, 3, 0, 'Matriculado')

insert into Item_Matricula (id, codigo, faltas, situacao) values (2, 1, 0, 'Matriculado')

insert into Item_Matricula (id, codigo, faltas, situacao) values (3, 1, 0, 'Matriculado')

select * from Item_Matricula

select a.Nome, m.ano, m.semestre, d.nome 
from Aluno a join Matricula m on a.ra = m.ra
join Item_Matricula im on m.id = im.id
join Disciplina d on im.codigo = d.codigo

update Item_Matricula set nota1 = 3, nota2 = 7, sub = 6 where id = 1 and codigo = 1
update Item_Matricula set nota1 = 6, nota2 = 9, sub = 4 where id = 1 and codigo = 2
update Item_Matricula set nota1 = 2, nota2 = 5, sub = 4 where id = 1 and codigo = 3

select a.Nome, m.ano, m.semestre, d.nome, nota1, nota2, sub, case
    when nota1 > sub and Nota2 > sub then (nota1 + nota2) / 2
    when nota1 < sub and Nota2 > Nota1 then (sub + nota2) / 2
    when nota2 < sub and Nota1 > Nota2 then (nota1 + sub) / 2
    end as 'Media'
from Aluno a join Matricula m on a.RA = m.RA
join Item_Matricula im on m.id = im.id
join Disciplina d on im.codigo = d.codigo
where im.id = 1

alter table Item_Matricula add media decimal (4,2)