create table Cliente(
    id int not null,
    nome varchar(150) not null,
    cpf char(11) not null,

    constraint Pk_Cliente primary key (id),
    constraint UN_Cliente_CPF unique (cpf),
);

create table Cliente_Fone(
    id_cliente int not null,
    numero varchar,
    tipo int not null,

    constraint PK_Cliente_Fone primary key (id_cliente, numero),
    constraint FK_Cliente_Fone_Cliente foreign key (id_cliente) references Cliente (id),
);

insert into Cliente (id, nome, cpf) values (1, 'Matheus', '12345678900')
insert into Cliente values (2, 'Çivia', '12345612345')

select id, nome, cpf from cliente

select * from Cliente_Fone

insert into Cliente_Fone values (1, '1', 1)
insert into Cliente_Fone values (2, '2', 1)

-- join faz a consulta no servidor
select Cliente.nome, Cliente_Fone.numero from Cliente join Cliente_Fone on Cliente.id = Cliente_Fone.id_cliente

-- where faz a consulta na maquina do cliente
select Cliente.nome, Cliente_Fone.numero from Cliente, Cliente_Fone where Cliente.id = Cliente_Fone.id_cliente

select Cliente.nome, Cliente_Fone.numero from Cliente join Cliente_Fone on Cliente.id = Cliente_Fone.id_cliente where Cliente.id = 1

-- create trigger Mensagem_Cliente on Cliente after insert as begin print('Cadastro executado com sucesso!') end

create trigger Mensagem_Cliente on Cliente after insert as begin print('Cadastro executado com sucesso!') end

insert into Cliente (id, nome, cpf) values (5, 'Matheus Olivera', '123456')
