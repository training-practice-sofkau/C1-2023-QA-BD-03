CREATE DATABASE IF NOT EXISTS LibreriaSanty;
USE LibreriaSanty;

CREATE TABLE Autor (
  CCAutor VARCHAR(45) PRIMARY KEY,
  Apellido VARCHAR(45) NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  FechaNacimiento VARCHAR(45) NOT NULL
);

CREATE TABLE Editorial (
  Nombre VARCHAR(45) PRIMARY KEY,
  Ciudad VARCHAR(45) NOT NULL,
  Complemento VARCHAR(45) NOT NULL
);

CREATE TABLE Libro (
  ISBN VARCHAR(45) PRIMARY KEY,
  NombreEditorial VARCHAR(45) NOT NULL,
  NumeroPaginas INT NOT NULL,
  FechaPublicacion DATE NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  FOREIGN KEY (NombreEditorial) REFERENCES Editorial(Nombre)
);
CREATE TABLE Escribir (
  ISBNLibroEscribir VARCHAR(45) NOT NULL,
  CCAutorEscribir VARCHAR(45) NOT NULL,
  PRIMARY KEY (ISBNLibroEscribir, CCAutorEscribir),
  FOREIGN KEY (ISBNLibroEscribir) REFERENCES Libro(ISBN),
  FOREIGN KEY (CCAutorEscribir) REFERENCES Autor(CCAutor)
);

CREATE TABLE Cliente (
  IdCliente VARCHAR(45) PRIMARY KEY,
  FechaNacimiento DATE NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Comprar (
  ISBNLibroComprar VARCHAR(45) NOT NULL,
  IdClienteComprar VARCHAR(45) NOT NULL,
  PRIMARY KEY (ISBNLibroComprar, IdClienteComprar),
  FOREIGN KEY (ISBNLibroComprar) REFERENCES Libro (ISBN),
  FOREIGN KEY (IdClienteComprar) REFERENCES Cliente (IdCliente)
);

CREATE TABLE TelefonoCliente (
  TelefonoCliente VARCHAR(45) NOT NULL,
  IdCliente VARCHAR(45) NOT NULL,
  PRIMARY KEY (TelefonoCliente),
  FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente)
);


----------
-- Tabla Autor
INSERT INTO Autor (CCAutor, Apellido, Nombre, FechaNacimiento)
VALUES 
("A001", "Martinez", "Juan", "1980-01-01"),
("A002", "Gonzalez", "Pedro", "1982-03-05"),
("A003", "Rodriguez", "Miguel", "1983-04-08"),
("A004", "Perez", "Luis", "1981-02-11"),
("A005", "Sanchez", "Jorge", "1979-12-25");

-- Tabla Editorial
INSERT INTO Editorial (Nombre, Ciudad, Complemento)
VALUES
("Editorial 1", "Madrid", "España"),
("Editorial 2", "Barcelona", "España"),
("Editorial 3", "Valencia", "España"),
("Editorial 4", "Sevilla", "España"),
("Editorial 5", "Bilbao", "España");

-- Tabla Libro
INSERT INTO Libro (ISBN, NombreEditorial, NumeroPaginas, FechaPublicacion, Titulo)
VALUES
("L001", "Editorial 1", 300, "2010-01-01", "Libro 1"),
("L002", "Editorial 2", 250, "2011-02-01", "Libro 2"),
("L003", "Editorial 3", 200, "2012-03-01", "Libro 3"),
("L004", "Editorial 4", 350, "2013-04-01", "Libro 4"),
("L005", "Editorial 5", 400, "2014-05-01", "Libro 5");

-- Tabla Escribir
INSERT INTO Escribir (ISBNLibroEscribir, CCAutorEscribir)
VALUES
("L001", "A001"),
("L002", "A002"),
("L003", "A003"),
("L004", "A004"),
("L005", "A005");

-- Tabla Cliente
INSERT INTO Cliente (IdCliente, FechaNacimiento, Apellido, Nombre)
VALUES
("C001", "1985-01-01", "Lopez", "Juan"),
("C002", "1986-02-01", "Garcia", "Pedro"),
("C003", "1987-03-01", "Ruiz", "Miguel"),
("C004", "1988-04-01", "Jimenez", "Luis"),
("C005", "1989-05-01", "Ramirez", "Jorge");

-- Tabla Comprar
INSERT INTO Comprar (ISBNLibroComprar, IdClienteComprar)
VALUES
("L001", "C001"),
("L002", "C002"),
("L003", "C003"),
("L004", "C004"),
("L005", "C005");

-- Tabla TelefonoCliente 
INSERT INTO TelefonoCliente (TelefonoCliente, IdCliente)
 VALUES
("555-555-5555", "C001"),
("555-555-5556", "C002"),
("555-555-5557", "C003"),
("555-555-5558", "C004"),
("555-555-5559", "C005");

