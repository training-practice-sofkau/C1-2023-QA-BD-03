CREATE DATABASE LibreriaDB;
USE libreriaDB;

CREATE TABLE Editorial (
  Id_Editorial VARCHAR(50) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Ciudad VARCHAR(45) NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  Complemento VARCHAR(45) NOT NULL
  );
  
  CREATE TABLE Libro (
  ISBN VARCHAR(10) NOT NULL PRIMARY KEY,
  titulo VARCHAR(45) NOT NULL,
  numero_paginas VARCHAR(5) NOT NULL,
  Id_Editorial_FK VARCHAR(45) NOT NULL,
  FOREIGN KEY (Id_Editorial_FK) REFERENCES Editorial (Id_Editorial)
  );
  
  CREATE TABLE Cliente (
  Id_Cliente VARCHAR(15) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Libro_Cliente (
  ISBN_FK VARCHAR(10) NOT NULL,
  Id_cliente_FK VARCHAR(45) NOT NULL,
  FOREIGN KEY (ISBN_FK) REFERENCES Libro (ISBN),
  FOREIGN KEY (Id_cliente_FK) REFERENCES Cliente (Id_Cliente)
 );
 
 CREATE TABLE Telefono_Cliente (
  Id_cliente VARCHAR(15) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  PRIMARY KEY (Id_Cliente, Telefono),
  FOREIGN KEY (Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

CREATE TABLE Autores (
  Id_Autor VARCHAR(10) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(20) NOT NULL,
  fecha_de_nacimiento VARCHAR(45) NOT NULL,
  Nacionalidad VARCHAR(20) NOT NULL
);

CREATE TABLE libro_Autores (
  ISBN_FK VARCHAR(10) NOT NULL,
  Id_Autores_FK VARCHAR(10) NOT NULL,
  FOREIGN KEY (ISBN_FK) REFERENCES Libro (ISBN),
  FOREIGN KEY (Id_Autores_FK) REFERENCES Autores (Id_Autor)
 );

INSERT INTO Autores (Id_Autor, Nombre, fecha_de_nacimiento, Nacionalidad)
VALUES ('1', 'Rafael Chaparro' ,'23 de noviembre de 1996', 'Colombiano'), 
('2', 'Dante Alighieri', '17 de septiembre de 2005', 'Colombiana'), 
('3', 'Patrick Süskind', '6 de Septiembre de 2002', 'Colombiana');
SELECT *
FROM Autores;


INSERT INTO Libro (ISBN, titulo, numero_paginas, Id_Editorial_FK)
VALUES ('122334', 'Opio en las Nubes', '181', '1'), ('143212', 'La divina Comedia', '300', '2');
SELECT *
FROM Libro;

INSERT INTO Editorial (Id_Editorial, Nombre, Ciudad, Direccion, Complemento)
VALUES ('1', 'Gato Malo', 'Medellin', 'Cra8aw 15a-47', 'piso 17'), ('2', 'Semana', 'Medellin', 'avenida 4 24-64', 'piso 21');
SELECT *
FROM Editorial;

INSERT INTO Cliente (Id_Cliente, Nombre)
VALUES ('1035436119', 'Pedro Pablo Leon Jaramillo'), ('50909134', 'Homero Simpson');
SELECT *
FROM Cliente;

INSERT INTO Telefono_Cliente (Id_cliente, Telefono)
VALUES ('1035436119', '3103567822'), ('50909134', '3216549824');
SELECT *
FROM Telefono_Cliente;







  
  
