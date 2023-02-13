CREATE DATABASE PARQUENORTE;
USE PARQUENORTE;

CREATE TABLE tecnico(
id_tecnico VARCHAR(20) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
especialidad VARCHAR(50) NOT NULL
);


CREATE TABLE proveedor (
Id_Proveedor VARCHAR(20) NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
direccion VARCHAR(50) NOT NULL,
ciudad VARCHAR(60) NOT NULL,
pais VARCHAR(50) NOT NULL
);


CREATE TABLE Operador (
Id_operador VARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
Telefono VARCHAR (15) NOT NULL
);

CREATE TABLE atraccion(
Id_atraccion VARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
Id_proveedor_FK VARCHAR(20) NOT NULL,
Id_Operador_FK VARCHAR(10) NOT NULL,
Id_orden_servicio_FK VARCHAR(10) NOT NULL,
FOREIGN KEY (Id_proveedor_FK) REFERENCES proveedor(Id_Proveedor),
FOREIGN KEY (Id_Operador_FK) REFERENCES Operador (id_operador),
FOREIGN KEY (Id_orden_servicio_FK) REFERENCES orden_servicio (Id_orden_servicio)
);

CREATE TABLE brazalete (
Id_brazalete VARCHAR(15) NOT NULL PRIMARY KEY,
precio int NOT NULL,
tipo int NOT NULL
);


CREATE TABLE cliente(
Id_cliente VARCHAR(11) NOT NULL PRIMARY KEY,
nombre VARCHAR(11) NOT NULL,
apellido VARCHAR(11) NOT NULL,
fecha_Nacimiento VARCHAR(11) NOT NULL
);


CREATE TABLE orden_servicio(
Id_orden_servicio VARCHAR(10) NOT NULL PRIMARY KEY,
hora_inicio VARCHAR(8) NOT NULL,
hora_fin VARCHAR(8) NOT NULL,
duracion VARCHAR(10) NOT NULL
);

CREATE TABLE tecnico_ordenServicio(
Id_orden_servicio_FK VARCHAR(10) NOT NULL,
Id_tecnico_FK VARCHAR(10) NOT NULL,
FOREIGN KEY (Id_orden_servicio_FK) REFERENCES tecnico(Id_tecnico),
FOREIGN KEY (Id_tecnico_FK) REFERENCES orden_servicio(Id_orden_servicio)
);

CREATE TABLE telefono_tecnico(
id_tecnico VARCHAR(20) NOT NULL,
telefono VARCHAR(20) NOT NULL,
PRIMARY KEY(id_tecnico, telefono),
FOREIGN KEY(id_tecnico) REFERENCES tecnico(id_tecnico)
);

CREATE TABLE telefono_cliente(
Id_cliente VARCHAR(5) NOT NULL,
Telefono VARCHAR(20) NOT NULL,
PRIMARY KEY(Id_cliente, Telefono ),
FOREIGN KEY(Id_cliente) REFERENCES cliente(Id_cliente)
);


CREATE TABLE telefono_proveedor(
Id_proveedor VARCHAR(20) NOT NULL,
Telefono  VARCHAR(15) NOT NULL,
PRIMARY KEY (Id_proveedor,Telefono),
FOREIGN KEY (Id_proveedor) REFERENCES proveedor(Id_proveedor)
);

CREATE TABLE atraccion_brazalete(
Id_brazalete_FK VARCHAR(15) not null,
Id_atraccion_FK VARCHAR(6) NOT NULL,
FOREIGN KEY (Id_brazalete_FK) REFERENCES brazalete(Id_brazalete),
FOREIGN KEY (Id_atraccion_FK) REFERENCES atraccion(Id_atraccion)
);

INSERT INTO tecnico (id_tecnico, nombre, especialidad)
VALUES
("T1", "Juan Perez", "Mecánico"),
("T2", "Maria Rodriguez", "Electricista");
SELECT *
FROM tecnico;

INSERT INTO proveedor (Id_Proveedor, nombre, direccion, ciudad, pais)
VALUES
("P1", "Proveedor A", "Calle 123", "Medellín", "Colombia"),
("P2", "Proveedor B", "Avenida 456", "Bogotá", "Colombia");
SELECT *
FROM proveedor;

INSERT INTO Operador (Id_operador, nombre, Telefono)
VALUES
("O1", "Operador A", "3001234567"),
("O2", "Operador B", "3012345678");
SELECT *
FROM Operador;


INSERT INTO atraccion (Id_atraccion, nombre, Id_proveedor_FK, Id_Operador_FK, Id_orden_servicio_FK)
VALUES
("A1", "Montaña Rusa", "P1", "O1", "S1"),
("A2", "Tiovivo", "P2", "O2", "S2");
SELECT *
FROM atraccion;


INSERT INTO brazalete (Id_brazalete, precio, tipo)
VALUES
("B1", 25000, 1),
("B2", 30000, 2);
SELECT *
FROM brazalete;

INSERT INTO cliente (Id_cliente, nombre, apellido, fecha_Nacimiento)
VALUES
("C1", "Pedro", "Martinez", "01/01/2000"),
("C2", "Ana", "Gonzalez", "02/02/1999");
SELECT *
FROM cliente;

INSERT INTO orden_servicio (Id_orden_servicio, hora_inicio, hora_fin, duracion)
VALUES
("S1", "10:00", "12:00", "2 horas"),
("S2", "14:00", "16:00", "2 horas");
SELECT *
FROM orden_servicio;

INSERT INTO tecnico_ordenServicio (Id_orden_servicio_FK, Id_tecnico_FK)
VALUES
("S1", "T1"),
("S2", "T2");
SELECT *
FROM tecnico_ordenServicio;

INSERT INTO telefono_tecnico (id_tecnico, telefono)
VALUES
("T1", "300000000"),
("T2", "300000001");
SELECT *
FROM telefono_tecnico;


INSERT INTO telefono_cliente (Id_cliente, Telefono)
VALUES
("C1", "300000002"),
("C2", "300000003");
SELECT *
FROM telefono_Cliente;

INSERT INTO telefono_proveedor (Id_proveedor, Telefono)
VALUES
("P1", "300000004"),
("P2", "300000005");
SELECT *
FROM telefono_proveedor;

INSERT INTO atraccion_brazalete (Id_brazalete_FK, Id_atraccion_FK)
VALUES
("B1", "A1"),
("B2", "A2");
SELECT *
FROM atraccion_brazalete;
