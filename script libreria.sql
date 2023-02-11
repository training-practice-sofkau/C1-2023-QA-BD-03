CREATE DATABASE libreria;

USE libreria;

CREATE TABLE editorial (
  nombre VARCHAR(50) NOT NULL PRIMARY KEY,
  ciudad VARCHAR(45) NOT NULL,
  complemento VARCHAR(45) NOT NULL
  );

CREATE TABLE libro (
  ISBN VARCHAR(10) NOT NULL PRIMARY KEY,
  titulo VARCHAR(45) NOT NULL,
  numero_paginas VARCHAR(5) NOT NULL,
  nombre_editorial VARCHAR(45) NOT NULL,
  FOREIGN KEY (nombre_editorial) REFERENCES editorial (nombre)
  );

CREATE TABLE cliente (
  id VARCHAR(15) NOT NULL PRIMARY KEY,
  nombre_cliente VARCHAR(50) NOT NULL
);

CREATE TABLE libro_cliente (
  ISBN_libro VARCHAR(10) NOT NULL,
  id_cliente VARCHAR(45) NOT NULL,
  FOREIGN KEY (ISBN_libro) REFERENCES libro (ISBN),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id)
 );

CREATE TABLE telefono_cliente (
  id_cliente VARCHAR(15) NOT NULL,
  numero VARCHAR(15) NOT NULL,
  PRIMARY KEY (id_cliente, numero),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

CREATE TABLE autor (
  codigo_autor VARCHAR(10) NOT NULL PRIMARY KEY,
  fecha_de_nacimiento VARCHAR(45) NOT NULL,
  nacionalidad VARCHAR(20) NOT NULL
);

CREATE TABLE libro_autor (
  ISBN_libro_autor VARCHAR(10) NOT NULL,
  codigo_autor_libro VARCHAR(10) NOT NULL,
  FOREIGN KEY (ISBN_libro_autor) REFERENCES libro (ISBN),
  FOREIGN KEY (codigo_autor_libro) REFERENCES autor (codigo_autor)
 );

INSERT INTO editorial (nombre, ciudad, complemento)
VALUES ('Planeta', 'Bogotá', 'Cl. 73 #7-60'), ('Critica', 'Barcelona', 'Avenida Diagonal, 662');

SELECT *
FROM editorial;

INSERT INTO autor (codigo_autor, fecha_de_nacimiento, nacionalidad)
VALUES ('100', '9 de Nov 1934', 'estadounidense'), ('200', '8 de Ene 1942', 'Ingles');

SELECT *
FROM autor;

INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES ('1111', 'El mundo y sus demonios', '489','Planeta'), ('2222', 'Breve historia del tiempo','258','Critica');

SELECT *
FROM libro;

INSERT INTO cliente (id, nombre_cliente)
VALUES ('1090494364', 'Jesús Miguel Molina Mendoza'), ('1092584352', 'Maria Fernanda Vera Omaña');

SELECT *
FROM cliente;

INSERT INTO telefono_cliente (id_cliente, numero)
VALUES ('1090494364','3125848043'),('1092584352','3205482157');

SELECT *
FROM telefono_cliente;

INSERT INTO libro_cliente (ISBN_libro, id_cliente)
VALUES ('1111','1090494364'),('2222','1092584352');

SELECT *
FROM libro_cliente;

INSERT INTO libro_autor (ISBN_libro_autor, codigo_autor_libro)
VALUES ('1111','100'),('2222','200');

SELECT *
FROM libro_autor;