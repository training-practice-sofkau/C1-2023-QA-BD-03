CREATE DATABASE ParqueNorteSQL;

USE ParqueNorteSQL;

CREATE TABLE proveedor(
idProveedor int,
nombre_proveedor VARCHAR(45),
PRIMARY KEY (idProveedor)
);

CREATE TABLE tecnico(
cedula_tecnico VARCHAR(12),
nombre VARCHAR (45),
PRIMARY KEY (cedula_tecnico)
);

CREATE TABLE cliente(
cedula_cliente VARCHAR(12),
nombre_cliente VARCHAR (45),
PRIMARY KEY(cedula_cliente)
);

CREATE TABLE atraccion(
idAtraccion int,
nombre_atraccion VARCHAR(45),
idProveedor int,
PRIMARY KEY (idAtraccion),
FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
);





CREATE TABLE brazalete(
idBrazalete int,
clase VARCHAR(45),
cedula_cliente VARCHAR(12),
PRIMARY KEY(idBrazalete),
FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula_cliente)
);

CREATE TABLE operador(
idOperador int,
nombre_operador VARCHAR(45),
idAtraccion int,
PRIMARY KEY (idOperador),
FOREIGN KEY (idAtraccion) REFERENCES atraccion (idAtraccion)
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


INSERT INTO proveedor (idProveedor, nombre_proveedor) VALUES (1, 'Proveedor 1'), (2, 'Proveedor 2'), (3, 'Proveedor 3');

INSERT INTO tecnico (cedula_tecnico, nombre) VALUES ('123456', 'Técnico 1'), ('789012', 'Técnico 2'), ('345678', 'Técnico 3');

INSERT INTO cliente (cedula_cliente, nombre_cliente) VALUES ('456789', 'Cliente 1'), ('901234', 'Cliente 2'), ('567890', 'Cliente 3');

INSERT INTO atraccion (idAtraccion, nombre_atraccion, idProveedor) VALUES (1, 'Atracción 1', 1), (2, 'Atracción 2', 2), (3, 'Atracción 3', 3);

INSERT INTO brazalete (idBrazalete, clase, cedula_cliente) VALUES (1, 'Clase 1', '456789'), (2, 'Clase 2', '901234'), (3, 'Clase 3', '567890');

INSERT INTO operador (idOperador, nombre_operador, idAtraccion) VALUES (1, 'Operador 1', 1), (2, 'Operador 2', 2), (3, 'Operador 3', 3);

INSERT INTO orden_servicio (idOrden_servicio, duracion, descripcion, fecha_servicio, idAtraccion) VALUES (1, '1 hora', 'Servicio 1', '2023-02-09', 1), (2, '2 horas', 'Servicio 2', '2023-02-10', 2), (3, '3 horas', 'Servicio 3', '2023-02-11', 3);

INSERT INTO brazalete_cliente (idAtraccion, idBrazalete) VALUES (1, 1), (2, 2), (3, 3);