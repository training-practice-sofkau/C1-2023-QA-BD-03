CREATE DATABASE DB_LIBRERIA;
USE DB_LIBRERIA;

CREATE TABLE editorial(
nombre VARCHAR(50) NOT NULL PRIMARY KEY,
ciudad VARCHAR(15) NOT NULL,
complemento VARCHAR(35) NOT NULL
);

CREATE TABLE cliente(
Cedula VARCHAR(15) NOT NULL PRIMARY KEY,
nombre_cliente VARCHAR(45) NOT NULL
);

CREATE TABLE autor(
CodigoAutor VARCHAR(12) NOT NULL PRIMARY KEY ,
fechaNacimiento VARCHAR(42) NOT NULL,
nacionalidad VARCHAR(20) NOT NULL
);

CREATE TABLE libro(
ISBN VARCHAR(11) NOT NULL PRIMARY KEY,
titulo VARCHAR(45) NOT NULL,
numeroPaginas VARCHAR(5) NOT NULL,
nombre_editorial VARCHAR(50) NOT NULL,
FOREIGN KEY (nombre_editorial) REFERENCES editorial(nombre)
);

CREATE TABLE comprar (
ISBN_libro VARCHAR(11) NOT NULL,
Cedula_cliente VARCHAR(15) NOT NULL,
FOREIGN KEY (ISBN_libro) REFERENCES libro(ISBN),
FOREIGN KEY (Cedula_cliente) REFERENCES cliente(Cedula)
);

CREATE TABLE escribir (
codigoAutor_libro VARCHAR(12) NOT NULL,
ISBN_libro_autor VARCHAR(11) NOT NULL,
FOREIGN KEY (codigoAutor_libro) REFERENCES autor(codigoAutor),
FOREIGN KEY (ISBN_libro_autor) REFERENCES libro (ISBN)
);

CREATE TABLE telefono_cliente(
cedula_cliente VARCHAR (15) NOT NULL,
numero VARCHAR(20) NOT NULL,
PRIMARY KEY(cedula_cliente,numero),
FOREIGN KEY (cedula_cliente) REFERENCES cliente(Cedula)
);

INSERT INTO editorial(nombre, ciudad, complemento) VALUES ('Panamericana','Buenos Aires','carrera 46c #34b-14'),
('Norma','Cali','edificio los Arbustos');

SELECT *
FROM editorial;

INSERT INTO cliente(Cedula, nombre_cliente) VALUES ('15501902','Fermin Perez'),
('100756256','Luisita Rodriguez');

SELECT *
FROM cliente;

INSERT INTO autor(codigoAutor, fechaNacimiento,nacionalidad) VALUES ('01','05/12/1999','Colombiano'),
('02','04/09/1695','Peruano');

SELECT *
FROM autor;

INSERT INTO libro(ISBN, titulo, numeroPaginas,nombre_editorial) VALUES ('1001','La culpa es de la Vaca','230','Panamericana'),
('1002','Mas fuerte que la adversidad','175','Norma');

SELECT *
FROM libro;

INSERT INTO comprar(ISBN_libro, Cedula_cliente) VALUES ('1001','15501902'),
('1002','100756256');

SELECT *
FROM comprar;

INSERT INTO escribir(CodigoAutor_libro,ISBN_libro_autor) VALUES ('02','1002'),
('01','1001');

SELECT *
FROM escribir;

INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES ('100756256','6042747916'),
('15501902','6045968952');

SELECT *
FROM telefono_cliente;




