CREATE SCHEMA `primeraActividad`;
CREATE TABLE `primeraActividad`.`Editorial` (
	Nombre varchar(255) primary key,
    Ciudad varchar(255),
    Complemento varchar(255)
);
CREATE TABLE `primeraActividad`.`Libro` (
	ISBN varchar(15) primary key,
    Título varchar(255),
    NPáginas varchar(4),
    Precio float(15),
    NombreEditorial varchar(255),
    foreign key(NombreEditorial) references Editorial(Nombre)
);
CREATE TABLE `primeraActividad`.`Autor` (
	Código varchar(20) primary key,
    Nacionalidad varchar(255),
    FechaNacimiento varchar(511)
);
CREATE TABLE `primeraActividad`.`Cliente` (
	ID varchar(20) primary key,
    PrimerNombre varchar(127)
);
CREATE TABLE `primeraActividad`.`Teléfono` (
	IDCliente varchar(20),
    Teléfono varchar(15),
    primary key(IDCliente, Teléfono),
    foreign key(IDCliente) references Cliente(ID)
);
CREATE TABLE `primeraActividad`.`Comprar` (
	ISBNLibro varchar(15),
    IDClienteCompra varchar(20),
    primary key(ISBNLibro, IDClienteCompra),
    foreign key(ISBNLibro) references Libro(ISBN),
    foreign key(IDClienteCompra) references Cliente(ID)
);
CREATE TABLE `primeraActividad`.`Escribir` (
	ISBNLibroEscrito varchar(15),
    CódigoAutor varchar(20),
    primary key(ISBNLibroEscrito, CódigoAutor),
    foreign key(ISBNLibroEscrito) references Libro(ISBN),
    foreign key(CódigoAutor) references Autor(Código)
);