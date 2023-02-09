CREATE DATABASE  LibreriaSQL;

USE libreriaSQL;



-- Relacion entre cliente y telefono
CREATE TABLE cliente(
	cedula_cliente VARCHAR(10),
    nombre_cliente VARCHAR(45),
    PRIMARY KEY (cedula_cliente)
);

-- relacion de la tabla creada entre el libro y el cliente
-- Relacion entre libro y editorial

CREATE TABLE libro (
	ISBN VARCHAR(10),
    titulo VARCHAR(45),
    numero_paginas VARCHAR(45),
    nombre_editorial VARCHAR(50),
    PRIMARY KEY (ISBN)
-- FOREIGN KEY (nombre_editorial) REFERENCES editorial (nombre_editorial)
);
-- se crea un indice para la tabla editorial
ALTER TABLE editorial ADD INDEX (nombre_editorial);
ALTER TABLE libro
ADD FOREIGN KEY (nombre_editorial)
REFERENCES editorial (nombre_editorial);


CREATE TABLE editorial(
	nombre_editorial VARCHAR(50),
    ciudad VARCHAR (45),
    complemento VARCHAR(45)
);

CREATE TABLE autor(
	id_autor VARCHAR(10),
    fecha_nacimiento VARCHAR (45),
    nacionalidad VARCHAR(45),
    PRIMARY KEY (id_autor)
);

-- se crean de ultima porque hacen referencia a tablas que deben estar creadas en un principio

CREATE TABLE libro_autor(
	ISBN_libro VARCHAR(10),
    id_autor VARCHAR(10),
	PRIMARY KEY (ISBN_libro, id_autor),
	FOREIGN KEY (ISBN_libro) REFERENCES libro (ISBN),
    FOREIGN KEY (id_autor) REFERENCES autor (id_autor)
);

CREATE TABLE libro_cliente(
	ISBN VARCHAR(10),
    cedula_cliente VARCHAR(10),
	PRIMARY KEY (ISBN, cedula_cliente),
	FOREIGN KEY (ISBN) REFERENCES libro (ISBN),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente (cedula_cliente)
);

CREATE TABLE telefono_cliente(
	cedula_cliente VARCHAR(10),
    numero VARCHAR(45),
    PRIMARY KEY (cedula_cliente, numero),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula_cliente)
);
