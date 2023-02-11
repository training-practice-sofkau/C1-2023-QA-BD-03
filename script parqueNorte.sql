CREATE DATABASE parqueNorte;

USE parqueNorte;


CREATE TABLE tecnico (
cedula_tecnico VARCHAR(15) NOT NULL PRIMARY KEY,
nombre_tecnico VARCHAR(50) NOT NULL,
especialidad VARCHAR(50) NOT NULL,
fecha_contratacion_tecnico VARCHAR(50) NOT NULL
);

CREATE TABLE telefono_tecnico (
cedula_tecnico_telefono VARCHAR(15) NOT NULL,
numero_tecnico VARCHAR(15) NOT NULL,
PRIMARY KEY (cedula_tecnico_telefono, numero_tecnico),
FOREIGN KEY (cedula_tecnico_telefono) REFERENCES tecnico (cedula_tecnico)
);

CREATE TABLE operador (
cedula_operador VARCHAR(15) NOT NULL PRIMARY KEY,
nombre_operador VARCHAR(50) NOT NULL,
fecha_contratacion_operador VARCHAR(50) NOT NULL
);

CREATE TABLE telefono_operador (
cedula_operador_telefono VARCHAR(15) NOT NULL,
numero_operador VARCHAR(15) NOT NULL,
PRIMARY KEY (cedula_operador_telefono, numero_operador),
FOREIGN KEY (cedula_operador_telefono) REFERENCES operador (cedula_operador)
);

CREATE TABLE proveedor (
id_proveedor VARCHAR(15) NOT NULL PRIMARY KEY,
nombre_proveedor VARCHAR(50) NOT NULL
);

CREATE TABLE direccion_proveedor (
id_proveedor_direccion VARCHAR(15) NOT NULL,
direccion VARCHAR(50) NOT NULL,
PRIMARY KEY (id_proveedor_direccion, direccion),
FOREIGN KEY (id_proveedor_direccion) REFERENCES proveedor (id_proveedor)
);

CREATE TABLE atraccion (
id_atraccion VARCHAR(15) NOT NULL PRIMARY KEY,
nombre_atraccion VARCHAR(50) NOT NULL,
id_proveedor_atraccion VARCHAR(15) NOT NULL,
cedula_operador_atraccion VARCHAR(15) NOT NULL,
FOREIGN KEY (id_proveedor_atraccion) REFERENCES proveedor (id_proveedor),
FOREIGN KEY (cedula_operador_atraccion) REFERENCES operador (cedula_operador)
);

CREATE TABLE brazalete_atraccion (
id_brazalete_atraccion VARCHAR(15) NOT NULL,
id_atraccion_brazalete VARCHAR(15) NOT NULL,
FOREIGN KEY (id_brazalete_atraccion) REFERENCES brazalete (id_brazalete),
FOREIGN KEY (id_atraccion_brazalete) REFERENCES ATRACCION (id_atraccion)
);

CREATE TABLE brazalete (
id_brazalete VARCHAR(15) NOT NULL PRIMARY KEY,
tipo_brazalete VARCHAR(50) NOT NULL
);

CREATE TABLE cliente (
id_cliente VARCHAR(15) NOT NULL PRIMARY KEY,
nombre_cliente VARCHAR(50) NOT NULL,
id_brazalete_cliente VARCHAR(15) NOT NULL,
FOREIGN KEY (id_brazalete_cliente) REFERENCES brazalete (id_brazalete)
);

CREATE TABLE orden_servicio (
id_orden VARCHAR(15) NOT NULL PRIMARY KEY,
fecha_orden VARCHAR(50) NOT NULL,
duracion VARCHAR(20) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
id_atraccion_orden VARCHAR(15) NOT NULL,
FOREIGN KEY (id_atraccion_orden) REFERENCES atraccion (id_atraccion)
);

CREATE TABLE orden_tecnico (
id_orden_tecnico VARCHAR(15) NOT NULL,
cedula_tecnico_orden VARCHAR(15) NOT NULL,
FOREIGN KEY (id_orden_tecnico) REFERENCES orden_servicio (id_orden),
FOREIGN KEY (cedula_tecnico_orden) REFERENCES tecnico (cedula_tecnico)
);

INSERT INTO tecnico (cedula_tecnico, nombre_tecnico, especialidad, fecha_contratacion_tecnico)
VALUES ('1111111111','alberto mendoza','electrico','02 de diciembre del 2016'),('2222222222','diego garcia','mecanico','22 de octubre del 2018');

INSERT INTO telefono_tecnico (cedula_tecnico_telefono, numero_tecnico)
VALUES ('1111111111','3201234567'),('2222222222','3151234567');

INSERT INTO operador (cedula_operador, nombre_operador, fecha_contratacion_operador)
VALUES ('3333333333','pedro gonzales','10 de enero del 2017'),('4444444444','jairo parada','15 de febrero del 2017');

INSERT INTO telefono_operador (cedula_operador_telefono, numero_operador)
VALUES ('3333333333','3181111111'),('4444444444','3112222222');

INSERT INTO proveedor (id_proveedor,nombre_proveedor)
VALUES ('1111','Maquinas divertidas'),('2222','Los mejores');

INSERT INTO direccion_proveedor (id_proveedor_direccion,direccion)
VALUES ('1111','av 5 calle 2'),('1111','av 3 calle 10'),('2222','av 15 calle 20'),('2222','av 30 calle 1');

INSERT INTO atraccion (id_atraccion,nombre_atraccion,id_proveedor_atraccion,cedula_operador_atraccion)
VALUES ('000','invasión','1111','3333333333'),('555','gas station','2222','4444444444');

INSERT INTO brazalete (id_brazalete,tipo_brazalete)
VALUES ('123123','Extremo'),('456456','Fusión'),('789789','Aventura');

INSERT INTO cliente (id_cliente,nombre_cliente,id_brazalete_cliente)
VALUES ('963','camilo sanchez','123123'),('741','oscar prada','456456');

INSERT INTO orden_servicio (id_orden,fecha_orden,duracion,descripcion,id_atraccion_orden)
VALUES ('999','10 de abril','2 dias','falla electrica','000'),('888','22 de julio','5 dias','falla mecanica','555')