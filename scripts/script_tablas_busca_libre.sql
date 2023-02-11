-- ---------------------------------------------------------------------
-- Las siguientes tablas son creadas en el esquema libreria_busca_libre
-- Se crea la tabla Editorial
-- ----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria_busca_libre.Editorial (
	nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    complemento VARCHAR(45) NOT NULL,
    PRIMARY KEY (nombre));
    
-- -----------------------------------------------------------------
-- Se crea la tabla Libro
-- -----------------------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria_busca_libre.Libro (
	ISBN VARCHAR(12) NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    numero_paginas VARCHAR(45) NOT NULL,
    nombre_editorial VARCHAR(50),
    PRIMARY KEY (ISBN),
    FOREIGN KEY (nombre_editorial)
    REFERENCES libreria_busca_libre.Editorial (nombre));
    
CREATE TABLE IF NOT EXISTS libreria_busca_libre.Cliente (
	cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (cedula));
    
-- -------------------------------------------------------------------------
-- Se crea la tabla Libro_cliente, proveniente de la relación N:M entre las
-- entidades Libro y Cliente
-- --------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria_busca_libre.Libro_cliente (
	
    ISBN_libro VARCHAR(12) NOT NULL,
    cedula_cliente VARCHAR(15) NOT NULL,
    PRIMARY KEY (ISBN_libro, cedula_cliente),
    FOREIGN KEY (ISBN_libro) REFERENCES libreria_busca_libre.Libro (ISBN),
    FOREIGN KEY (cedula_cliente) REFERENCES libreria_busca_libre.Cliente (cedula));

-- --------------------------------------------------------------------------------------
-- Se crea tabla telefono_cliente, la cual proviene del atributo multivaluado teléfono 
-- de la tabla Cliente
-- --------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria_busca_libre.telefono_cliente (
	id_cliente VARCHAR(15) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES libreria_busca_libre.Cliente (cedula));
    
-- -----------------------------------------------------------------------------------------------
-- Se crea la tabla Autor
-- -------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria_busca_libre.Autor (
	codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    fecha_nacimiento VARCHAR(45) NULL,
    nacionalidad VARCHAR(45) NULL,
    PRIMARY KEY (codigo));
    
-- -----------------------------------------------------------------------------------------------
-- Se crea la tabla Libro_autor proveniente de la relación N:M entre las entidades Libro y Autor
-- ------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria_busca_libre.Libro_Autor (
    Libro_ISBN VARCHAR(12) NOT NULL,
    codigo_autor VARCHAR(10) NOT NULL,
    PRIMARY KEY (Libro_ISBN , codigo_autor),
    FOREIGN KEY (Libro_ISBN)
        REFERENCES libreria_busca_libre.Libro (ISBN),
    FOREIGN KEY (codigo_autor)
        REFERENCES libreria_busca_libre.Autor (codigo)
);
    

    

    
    