CREATE DATABASE taller3;
use taller3;
create table Editorial(
Nombre varchar(100) primary key,
Ciudad varchar(45),
Complemento varchar(45)
);

create table Libro(
ISBM varchar(10) primary key,
Titulo varchar(150),
Numero_paginas varchar(45),
foreign key(ISBM) references Editorial(Nombre) 
);

create table Autor(
ID_autor varchar(10) primary key,
Fecha_nacimiento varchar(150),
Nacionalidad varchar(45)
);

create table Libro_Autor(
Autor_ID_autor varchar(10) primary key,
Libro_ISBM varchar(10),
foreign key (Autor_ID_autor) references Autor(ID_autor),
foreign key (Libro_ISBM) references libro(ISBM)
);

create table Cliente(
Cedula varchar(100) primary key,
Nombre varchar(45)
);

create table Cliente_Libro(
Cliente_cedula varchar(100) primary key,
Libro_cliente_ISBM varchar(45),
foreign key (Cliente_cedula) references Cliente(Cedula),
foreign key (Libro_cliente_ISBM) references Libro(ISBM)
);

create table Cliente_Telefono(
Cedula_cliente varchar(100),
Telefono varchar(45) primary key,
foreign key (Cedula_cliente) references Cliente(Cedula)
);

