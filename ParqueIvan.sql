CREATE DATABASE IF NOT EXISTS ParqueIvan;
USE ParqueIvan;

CREATE TABLE Atraccion (
  NombreAtraccion VARCHAR(20) PRIMARY KEY,
  Duracion VARCHAR(45) NOT NULL,
  NombreProveedor VARCHAR(10) NOT NULL,
  IDOrden VARCHAR (20) NOT NULL,
  FOREIGN KEY (IDOrden) REFERENCES Orden(id),
  FOREIGN KEY (NombreProveedor) REFERENCES Proveedor(nombre)
  
);

CREATE TABLE Orden (
  id VARCHAR(20) PRIMARY KEY,
  duracion VARCHAR(20) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  idEmpleado VARCHAR(20) NOT NULL,
  FOREIGN KEY (idEmpleado) REFERENCES Tecnico(id)
);

CREATE TABLE Tecnico (
  id VARCHAR(10) PRIMARY KEY,
  nombre  VARCHAR(20) NOT NULL,
  especialidad  VARCHAR(20) NOT NULL
);

CREATE TABLE Proveedor (
  nombre VARCHAR(10) PRIMARY KEY,
  nacinalidad  VARCHAR(20) NOT NULL,
  numeroContacto  VARCHAR(20) NOT NULL
);

CREATE TABLE Manipulacion (
  empleadoID VARCHAR(20) NOT NULL,
  atraccionNombre VARCHAR(20) NOT NULL,
  PRIMARY KEY (empleadoID, atraccionNombre),
  FOREIGN KEY (empleadoID) REFERENCES Empleado(numeroEmpleado),
  FOREIGN KEY (atraccionNombre) REFERENCES Atraccion(NombreAtraccion)
);

CREATE TABLE Empleado (
  numeroEmpleado VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Brazalete (
  id VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Cliente (
  CC VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  edad VARCHAR(79) NOT NULL,
  altura VARCHAR(200) NOT NULL
);

CREATE TABLE Ingresos (
  idBrazalete VARCHAR(20) NOT NULL,
  CCcliente VARCHAR(20) NOT NULL,
  PRIMARY KEY (idBrazalete, CCcliente),
  FOREIGN KEY (idBrazalete) REFERENCES Brazalete (id),
  FOREIGN KEY (CCcliente) REFERENCES Cliente (CC)
);