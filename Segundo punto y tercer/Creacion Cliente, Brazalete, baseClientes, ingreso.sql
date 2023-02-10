create table cliente(
	ccCliente varchar(15) primary key,
    nombre varchar(200),
    telefono varchar(13)
);

create table brazalete(
	idBrazalete varchar(10) primary key,
    precio int not null,
    permisos varchar (100) not null
);

create table baseClientes(
	ccClienteBaseClientes varchar(15),
    idBrazaleteBaseClientes varchar(10),
    primary key(ccClienteBaseClientes,idBrazaleteBaseClientes),
    foreign key(ccClienteBaseClientes) references cliente(ccCliente),
    foreign key(idBrazaleteBaseClientes) references brazalete(idBrazalete)
);

create table ingreso(
	idBrazaleteIngreso varchar(10),
    idAtraccionIngreso varchar(10),
    primary key(idBrazaleteIngreso,idAtraccionIngreso),
    foreign key(idBrazaleteIngreso) references brazalete(idBrazalete),
    foreign key(idAtraccionIngreso) references atraccion(idAtraccion)
);