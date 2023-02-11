-- Creación de la base de datos librería 
CREATE DATABASE db_libreria;

-- Indica cuál será la BD a la cual se le aplicarán las siguientes consultas: 
USE db_libreria; 

-- Creación de la tabla editorial
CREATE TABLE tb_editorial (
nombre_editorial VARCHAR(50) NOT NULL,
ciudad VARCHAR(45) NOT NULL, 
complemento_direccion VARCHAR (45),
PRIMARY KEY (nombre_editorial)
);

-- Creación de la tabla libro
CREATE TABLE tb_libro (
ISBN_libro VARCHAR(10) NOT NULL, 
titulo VARCHAR(45) NOT NULL,
numero_paginas VARCHAR(45) NOT NULL,
nombre_editorial VARCHAR(50) NOT NUll, 
PRIMARY KEY (ISBN_libro),
FOREIGN KEY (nombre_editorial) REFERENCES tb_editorial (nombre_editorial)
);

-- Creación de la tabla cliente 
CREATE TABLE tb_cliente (
cedula_cliente VARCHAR(10) NOT NULL, 
nombre_cliente VARCHAR (45) NOT NULL,
PRIMARY KEY (cedula_cliente)
);

-- Creación de la tabla autor 
CREATE TABLE tb_autor (
codigo_autor varchar(10) NOT NULL, 
fecha_nacimiento VARCHAR(45) NOT NULL, 
nacionalidad VARCHAR(45) NOT NULL, 
PRIMARY KEY (codigo_autor)
);

-- Creación de la tabla teléfono/cliente 
CREATE TABLE tb_telefono_cliente (
cedula VARCHAR(15) NOT NULL, 
telefono VARCHAR(15) NOT NULL,
PRIMARY KEY (cedula, telefono),
FOREIGN KEY (cedula) REFERENCES tb_cliente (cedula_cliente)
);

-- Creación tabla de detalle entre libro y autor 
CREATE TABLE dll_libro_autor (
ISBN_libro VARCHAR(10) NOT NULL, 
codigo_autor varchar(10) NOT NULL,
FOREIGN KEY (ISBN_libro) REFERENCES tb_libro (ISBN_libro),
FOREIGN KEY (codigo_autor) REFERENCES tb_autor (codigo_autor)
);

-- Creación tabla de detalle entre libro y cliente 
CREATE TABLE dll_libro_cliente (
ISBN_libro VARCHAR(10) NOT NULL, 
cedula_cliente VARCHAR(10) NOT NULL,
FOREIGN KEY (ISBN_libro) REFERENCES tb_libro(ISBN_libro),
FOREIGN KEY (cedula_cliente) REFERENCES tb_cliente(cedula_cliente)
);

-- Se insertan 2 datos por cada tabla 
-- Insertar datos a la tabla editorial 
INSERT INTO tb_editorial (nombre_editorial, ciudad, complemento_direccion)
VALUES ('SM', 'medellín', 'cra 45 #79'), ('kokinos', 'medellín', 'cll 36 #67');

-- Insertar datos a la tabla libro 
INSERT INTO tb_libro (ISBN_libro, titulo, numero_paginas, nombre_editorial)
VALUES ('1544454', 'el principito', '110', 'SM'), ('3459872', 'cien años de soledad', '175', 'kokinos');

-- Insertar datos a la tabla cliente 
INSERT INTO tb_cliente (cedula_cliente, nombre_cliente)
VALUES ('43256794', 'Adriana Taborda Pérez'), ('42178698', 'María Morales Giraldo');

-- Insertar datos a la tabla autor 
INSERT INTO tb_autor (codigo_autor, fecha_nacimiento, nacionalidad)
VALUES ('42684599', '10/01/1989', 'colombiano'), ('47127537', '12/12/1991', 'canadiense');

-- Insertar datos a la tabla teléfono/cliente 
INSERT INTO tb_telefono_cliente (cedula, telefono)
VALUES ('43256794', '320745684'), ('42178698', '3114893645');

-- Insertar datos en la tabla detalle entre libro y autor 
INSERT INTO dll_libro_autor (ISBN_libro, codigo_autor)
VALUES ('1544454', '42684599'), ('3459872', '47127537');

-- Insertar datos en la tabla detalle entre libro y cliente 
INSERT INTO dll_libro_cliente (ISBN_libro, cedula_cliente)
VALUES ('1544454', '43256794'), ('3459872', '42178698');

-- Mostrar información de todas las tablas 
SELECT * 
FROM tb_editorial;

SELECT * 
FROM tb_libro;

SELECT * 
FROM tb_cliente;

SELECT * 
FROM tb_autor;

SELECT * 
FROM tb_telefono_cliente;