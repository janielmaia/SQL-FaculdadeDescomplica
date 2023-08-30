create database Pedido;

create table Cliente(
    codCliente int not null,
    nomeCliente varchar(100) not null,

    constraint PK_Cliente primary key (codCliente)
);

create table Pedido(
    noPedido int not null,
    dataPedido datetime not null,
    codCliente int not null,

    constraint PK_Pedido primary key (noPedido),
    constraint FK_Pedido_Cliente foreign key (codCliente) references Cliente(codCliente),
);

create table Peca(
    codPeca int not null,
    descrPeca varchar(100) not null,

    constraint PK_Peca primary key (codPeca),
    constraint UN_Descr_Peca unique (descrPeca),
);

create table Pedido_Telefone(
    noPedido int not null,
    noTelefone varchar(14) not null,

    constraint PK_Pedido_Telefone primary key (noPedido, noTelefone),
    constraint FK_Pedido_Telefone foreign key (noPedido) references Pedido(noPedido),
);

create table Item_Pedido(
    noPedido int not null,
    codPeca int not null,
    quantPeca int not null,

    constraint PK_Item_Pedido primary key (noPedido, codPeca),
    constraint FK_Numero_Item_Pedido_Pedido foreign key (noPedido) references Pedido(noPedido),
    constraint FK_Codigo_Peca_Peca foreign key (codPeca) references Peca(codPeca),
);