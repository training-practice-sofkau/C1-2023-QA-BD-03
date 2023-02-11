-- -----------------------------------------------------
-- Table parquenorte.cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS libreria.editorial(
id VARCHAR (12),
nombreEditorial VARCHAR(50),
ciudad VARCHAR(45),
complemento VARCHAR(45),
PRIMARY KEY (id)
);
-- -----------------------------------------------------
-- Table parquenorte.libro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS libreria.libro(
ISBN VARCHAR(10),
titulo VARCHAR(45),
numeroPaginas INT,
idEditorial VARCHAR(50),
PRIMARY KEY (ISBN),
	  FOREIGN KEY (idEditorial) REFERENCES editorial(id)
);
-- -----------------------------------------------------
-- Table parquenorte.cliente
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria.cliente(
id VARCHAR(10),
cedula VARCHAR(15),
nombre VARCHAR(45),
apellido VARCHAR (45),
PRIMARY KEY (id)
);
-- -----------------------------------------------------
-- Table parquenorte.telefonoCliente
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS libreria.telefonoCliente(
telefono VARCHAR(15),
idCliente VARCHAR(10),
	FOREIGN KEY (idCliente) REFERENCES cliente(id)
); 
-- -----------------------------------------------------
-- Table parquenorte.libroCliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS libreria.libroCliente(
ISBN_libroCliente VARCHAR(10),
idCliente VARCHAR (10),
	FOREIGN KEY (ISBN_libroCliente) REFERENCES libro(ISBN),
    FOREIGN KEY (idCliente) REFERENCES cliente(id)
);
-- -----------------------------------------------------
-- Table librera.autor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS libreria.autor(
	id VARCHAR(10),
    fechaNacimiento DATE,
    nacionalidad VARCHAR(45),
    PRIMARY KEY (id)
);
-- -----------------------------------------------------
-- Table librera.libroAutor
-- -----------------------------------------------------
CREATE TABLE  IF NOT EXISTS libreria.libroAutor(
	ISBN_libroAutor VARCHAR (10),
    idAutor VARCHAR(10),
		FOREIGN KEY (ISBN_libroAutor) REFERENCES libro(ISBN),
		FOREIGN KEY (idAutor) REFERENCES autor(id)
);