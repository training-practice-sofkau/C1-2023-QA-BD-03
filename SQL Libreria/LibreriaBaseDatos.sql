CREATE DATABASE  LibreriaBD;

USE libreriaBD;

CREATE TABLE cliente(
	cedulaCliente VARCHAR(13),
    nombreCliente VARCHAR(45),
    PRIMARY KEY (cedulaCliente)
);

CREATE TABLE telefonoCliente(
	cedula_cliente VARCHAR(13),
    telefono VARCHAR(45),
    PRIMARY KEY (cedula_cliente, telefono),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedulaCliente)    
);

CREATE TABLE editorial (
  nombre_editorial VARCHAR(80) PRIMARY KEY,
  ciudad VARCHAR(45),
  complemento VARCHAR(45)
);

CREATE TABLE libro (
	ISBN VARCHAR(10) PRIMARY KEY,
    titulo VARCHAR(45),
    numeroPaginas VARCHAR(45),
	nombreEditorial VARCHAR(80),
    FOREIGN KEY (nombreEditorial) REFERENCES editorial(nombre_editorial)
);

CREATE TABLE autor (
  id_Autor VARCHAR(10) PRIMARY KEY,
  fechaNacimiento VARCHAR(45),
  nacionalidad VARCHAR(45)
);

CREATE TABLE libro_autor (
    idAutor VARCHAR(13),
    ISBN_libro VARCHAR(10),
    PRIMARY KEY (idAutor, ISBN_libro),
    FOREIGN KEY (idAutor) REFERENCES autor(id_Autor),
    FOREIGN KEY (ISBN_libro) REFERENCES libro(ISBN)
);

CREATE TABLE libro_cliente (
  idCliente VARCHAR(13),
  ISBN_libro_cliente VARCHAR(10),
  PRIMARY KEY (idCliente, ISBN_libro_Cliente),
  FOREIGN KEY (idCliente) REFERENCES cliente(cedulaCliente),
  FOREIGN KEY (ISBN_libro_cliente) REFERENCES libro(ISBN)
);


