CREATE DATABASE ParqueNorteSQL;

USE ParqueNorteSQL;

CREATE TABLE proveedor(
idProveedor int,
nombre_proveedor VARCHAR(45),
PRIMARY KEY (idProveedor)
);

CREATE TABLE atraccion(
idAtraccion int,
nombre_atraccion VARCHAR(45),
idProveedor int,
PRIMARY KEY (idAtraccion),
FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
);

CREATE TABLE cliente(
cedula_cliente VARCHAR(12),
nombre_cliente VARCHAR (45),
PRIMARY KEY(cedula)
);

CREATE TABLE brazalete(
idBrazalete int,
clase VARCHAR(45),
cedula_cliente VARCHAR(12),
PRIMARY KEY(idBrazalete),
FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)
);

CREATE TABLE operador(
idOperador int,
nombre_operador VARCHAR(45),
idAtracion int,
PRIMARY KEY (idAtraccion),
FOREIGN KEY (idAtraccion) REFERENCES atraccion (idAtraccion)
);

CREATE TABLE tecnico(
cedula_tecnico VARCHAR(12),
nombre VARCHAR (45),
PRIMARY KEY (cedula_tecnico)
);

CREATE TABLE orden_servicio(
idOrden_servicio int,
duracion VARCHAR(45),
descripcion VARCHAR(45),
fecha_servicio VARCHAR(45),
idAtraccion int,
PRIMARY KEY (idOrden_servicio),
FOREIGN KEY (idAtraccion) REFERENCES atraccion(idAtraccion)
);

CREATE TABLE brazalete_cliente(
idAtraccion int,
idBrazalete int,
PRIMARY KEY (idAtraccion, IdBrazalete),
FOREIGN KEY (idAtraccion) REFERENCES atraccion(idAtraccion),
FOREIGN KEY (idBrazalete) REFERENCES brazalete(idBrazalete)
);