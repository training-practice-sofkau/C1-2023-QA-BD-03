CREATE DATABASE PARQUENORTE;
USE PARQUENORTE;

CREATE TABLE tecnico(
id_tecnico VARCHAR(5) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
especializacion VARCHAR(50) NOT NULL,
telefono VARCHAR(15) NOT NULL,
email VARCHAR(60) NOT NULL,
fechaNac VARCHAR(50) NOT NULL
);

ALTER TABLE tecnico
DROP telefono;

CREATE TABLE proveedor (
nit VARCHAR(20) NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
telefono VARCHAR(15) NOT NULL,
email VARCHAR(60) NOT NULL
);

ALTER TABLE proveedor
DROP telefono;

CREATE TABLE operario (
id_operario VARCHAR(6) NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
arl VARCHAR(50) NOT NULL,
cargo VARCHAR(50) NOT NULL,
correo VARCHAR(60) NOT NULL
);

CREATE TABLE atracciones(
id_atraccion VARCHAR(6) NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
clase VARCHAR(45) NOT NULL,
nit_proveedor VARCHAR(20) NOT NULL,
id_operario_atraccion VARCHAR(6) NOT NULL,
FOREIGN KEY (nit_proveedor) REFERENCES proveedor(nit),
FOREIGN KEY (id_operario_atraccion) REFERENCES operario (id_operario)
);

CREATE TABLE brazalete (
color VARCHAR(15) NOT NULL PRIMARY KEY,
precio int NOT NULL
);


CREATE TABLE cliente(
id_cliente VARCHAR(11) NOT NULL PRIMARY KEY,
nombre VARCHAR(11) NOT NULL,
direccion VARCHAR(11) NOT NULL,
fecha_Nacimiento VARCHAR(11) NOT NULL
);

ALTER TABLE cliente
ADD color_brazalete_cliente VARCHAR(15) NOT NULL,
ADD FOREIGN KEY (color_brazalete_cliente ) REFERENCES brazalete(color);

CREATE TABLE orden_servicio(
num_orden VARCHAR(5) NOT NULL PRIMARY KEY,
fecha VARCHAR(26) NOT NULL,
duracion VARCHAR(30) NOT NULL,
id_atraccion_orden VARCHAR(6) NOT NULL
);
ALTER TABLE orden_servicio
ADD id_atraccion_orden VARCHAR(6) NOT NULL,
ADD FOREIGN KEY (id_atraccion_orden) REFERENCES atracciones(id_atraccion);

CREATE TABLE tecnico_orden(
id_tecnico_orden VARCHAR(5) NOT NULL,
num_orden_tecnico VARCHAR(10) NOT NULL,
FOREIGN KEY (id_tecnico_orden) REFERENCES tecnico(id_tecnico),
FOREIGN KEY (num_orden_tecnico) REFERENCES orden_servicio(num_orden)
);

CREATE TABLE telefono_tecnico(
id_tecnico_telefono VARCHAR(5) NOT NULL,
numero_tecnico VARCHAR(20) NOT NULL,
PRIMARY KEY(id_tecnico_telefono,numero_tecnico),
FOREIGN KEY(id_tecnico_telefono) REFERENCES tecnico(id_tecnico)
);

CREATE TABLE telefono_cliente(
id_cliente_telefono VARCHAR(5) NOT NULL,
numero_cliente VARCHAR(20) NOT NULL,
PRIMARY KEY(id_cliente_telefono, numero_cliente),
FOREIGN KEY(id_cliente_telefono) REFERENCES cliente(id_cliente)
);


CREATE TABLE telefono_proveedor(
nit_telefono_proveedor VARCHAR(20) NOT NULL,
numero_proveedor  VARCHAR(15) NOT NULL,
PRIMARY KEY (nit_telefono_proveedor,numero_proveedor),
FOREIGN KEY (nit_telefono_proveedor) REFERENCES proveedor(nit)
);

CREATE TABLE atraccion_brazalete(
color_atraccion_brazalete VARCHAR(15) not null,
id_atraccion_brazalete VARCHAR(6) NOT NULL,
FOREIGN KEY (color_atraccion_brazalete) REFERENCES brazalete(color),
FOREIGN KEY (id_atraccion_brazalete) REFERENCES atracciones(id_atraccion)
);

INSERT INTO tecnico (id_tecnico,nombre,especializacion,email,fechaNac) VALUES('0101','Pedro Pelaez','mecanica industrial','pedrito@hotmail.com','01/02/1995'),
('0102','Camila Cordoba','electricista','camiCordo05@gmail.com','28/09/2000');

SELECT *
FROM tecnico;
INSERT INTO proveedor(nit,nombre,email) VALUES ('4589623','Fabricio Rodriguez','fabrir05@microplast.com'),
('8596230','Laura Posada','laurap01@emsa.com.co');

SELECT *
FROM proveedor;

INSERT INTO operario(id_operario,nombre,arl,cargo,correo)VALUES ('1001','carlos meneses','sura','Operador de carros chocones','carlos1005@gmail.com'),
('1002','estela sepulveda ','colmena','Operador de montaña rusa','estelita@gmail.com');

SELECT  *
FROM operario;

INSERT INTO brazalete (color,precio) VALUES ('rojo',37000),('azul',15000);
SELECT *
FROM brazalete;

INSERT INTO cliente(id_cliente,nombre,direccion,fecha_Nacimiento, color_brazalete_cliente) VALUES ('1','Salome Mesa','avenida3','03/09/2001','rojo'),
('2','Carlos Diaz','comuna1','11/11/2005','azul');
SELECT *
FROM cliente;

INSERT INTO atracciones(id_atraccion, nombre,clase,nit_proveedor,id_operario_atraccion) VALUES('01A','Montaña Rusa','terrestre','8596230','1001'),
('01B','carros chocones','terrestre','4589623','1002');
SELECT *
FROM atracciones;

INSERT INTO orden_servicio(num_orden,fecha,duracion,id_atraccion_orden) VALUES ('A1','10/02/2023','5 dias','01A'),
('A2','11/02/2023','6 dias','01B');
SELECT *
FROM orden_servicio;

INSERT INTO tecnico_orden(id_tecnico_orden, num_orden_tecnico) VALUES('0101','A1'),('0102','A2');
SELECT *
FROM tecnico_orden;

INSERT INTO telefono_tecnico(id_tecnico_telefono,numero_tecnico) VALUES ('0102','3127526320'),('0101','3112450021');
SELECT *
FROM telefono_tecnico;

INSERT telefono_cliente(id_cliente_telefono,numero_cliente) VALUES ('2','6045968962'),('1','3125840017');
SELECT *
FROM telefono_cliente;

INSERT telefono_proveedor(nit_telefono_proveedor,numero_proveedor) VALUES ('8596230','3100020360'),('4589623','3120050200');
SELECT *
FROM telefono_proveedor;

INSERT INTO atraccion_brazalete(color_atraccion_brazalete,id_atraccion_brazalete) VALUES ('rojo','01B'),('azul','01A');
SELECT *
FROM atraccion_brazalete;


