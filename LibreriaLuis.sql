CREATE DATABASE IF NOT EXISTS LibreriaLuis;
USE LibreriaLuis;

CREATE TABLE Autor (
  codigo VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  fechaNacimiento VARCHAR(10) NOT NULL,
  nacionalidad VARCHAR (20) NOT NULL
);

CREATE TABLE Editorial (
  Nombre VARCHAR(45) PRIMARY KEY
);

CREATE TABLE Libro (
  ISBN VARCHAR(10) PRIMARY KEY,
  titulo VARCHAR(20) NOT NULL,
  nombre_editorial VARCHAR(45) NOT NULL,
  numero_paginas VARCHAR(100) NOT NULL,
  fecha_publicacion VARCHAR(10) NOT NULL,
  FOREIGN KEY (nombre_editorial) REFERENCES Editorial(Nombre)
);
CREATE TABLE Escribir (
  isbn_libro VARCHAR(10) NOT NULL,
  autor_codigo VARCHAR(20) NOT NULL,
  PRIMARY KEY (isbn_libro, autor_codigo),
  FOREIGN KEY (isbn_libro) REFERENCES Libro(ISBN),
  FOREIGN KEY (autor_codigo) REFERENCES Autor(codigo)
);

CREATE TABLE Cliente (
  Cedula VARCHAR(20) PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Comprar (
  libro_isbn VARCHAR(10) NOT NULL,
  cliente_cedula VARCHAR(20) NOT NULL,
  PRIMARY KEY (libro_isbn, cliente_cedula),
  FOREIGN KEY (libro_isbn) REFERENCES Libro (ISBN),
  FOREIGN KEY (cliente_cedula) REFERENCES Cliente (Cedula)
);

----------
-- Tabla Autor
INSERT INTO Autor (codigo, nombre, fechaNacimiento, nacionalidad )
VALUES 
("1122", "Juan","1930-01-01", "Colombiano"),
("2211","Hugo", "2000-03-05", "Colombiano"),
("3344", "Miguel", "1898-04-08", "Colombiano"),
("4433", "Luis", "1981-02-11", "Colombiano");

-- Tabla Editorial
INSERT INTO Editorial (Nombre)
VALUES
("Editorial 1"),
("Editorial 2");

-- Tabla Libro
INSERT INTO Libro (ISBN, titulo, nombreEditorial, numeroPaginas, fechaPublicacion)
VALUES
("L001", "Libro1", "Editorial 1", "34", "2011-02-01"),
("L002", "Libro2", "Editorial 2", "54", "2011-02-01");

-- Tabla Escribir
INSERT INTO Escribir (isbn_libro, autor_codigo)
VALUES
("L001", "1122"),
("L002", "2211");

-- Tabla Cliente
INSERT INTO Cliente (Cedula, Nombre)
VALUES
("C001", "Juan"),
("C002", "Lis");

-- Tabla Comprar
INSERT INTO Comprar (libro_isbn, cliente_cedula)
VALUES
("L001", "C001"),
("L002", "C002");

