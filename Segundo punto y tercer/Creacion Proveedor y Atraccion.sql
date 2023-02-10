create table proveedor(
	ccProveedor varchar(10) primary key,
    nombreProveedor varchar(150),
    telefono varchar(13)
);
create table atraccion(
	idAtraccion varchar(10) primary key,
    nombreAtraccion varchar(50),
    tipoAtraccion varchar(25),
    ccProveedorAtraccion varchar(10),
    foreign key(ccProveedorAtraccion) references proveedor(ccProveedor)
);