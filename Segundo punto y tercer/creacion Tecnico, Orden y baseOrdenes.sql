create table tecnico(
	ccTecnico varchar(15) primary key,
    nombreTecnico varchar(200),
    telefono varchar(13),
    especialidad varchar(50)
);

create table orden(
	idOrden varchar(10) primary key,
    textoOrden text(300),
    ccTecnicoOrden varchar(15),
    foreign key (ccTecnicoOrden) references tecnico(ccTecnico)
);

create table baseOrdenes(
	idAtraccionesBaseOrden varchar(10),
    idOrdenBaseOrden varchar(10),
    primary key (idAtraccionesBaseOrden,idOrdenBaseOrden),
    foreign key(idAtraccionesBaseOrden) references atraccion(idAtraccion),
    foreign key(idOrdenBaseOrden) references orden(idOrden)
);