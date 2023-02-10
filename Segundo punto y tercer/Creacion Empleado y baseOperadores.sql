create table empleado(
	ccEmpleado varchar(15) primary key,
    nombreEmpleado varchar(200),
    telefono varchar(13)
);
create table baseOperadores(
	ccEmpleadoBase varchar(15),
    idAtraccionBase varchar(10),
    primary key(ccEmpleadoBase,idAtraccionBase),
    foreign key (ccEmpleadoBase) references empleado(ccEmpleado),
    foreign key (idAtraccionBase) references atraccion(idAtraccion)
    );
    