CREATE SCHEMA IF NOT EXISTS `Libreria` DEFAULT CHARACTER SET utf8 ;
USE `Libreria` ;

CREATE TABLE IF NOT EXISTS `Libreria`.`Editorial` (
  `NombreEditorial` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NombreEditorial`));

CREATE TABLE IF NOT EXISTS `Libreria`.`Libro` (
  `ISBN` VARCHAR(10) NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Numero_Paginas` INT NULL,
  `nombre_Editorial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_Editorial_idx` (`nombre_Editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_Editorial`
    FOREIGN KEY (`nombre_Editorial`)
    REFERENCES `Libreria`.`Editorial` (`NombreEditorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Libreria`.`Cliente` (
  `ID` VARCHAR(10) NOT NULL,
  `NombreCliente` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`ID`));

CREATE TABLE IF NOT EXISTS `Libreria`.`Libro_Cliente` (
  `ISBN_Libro_Cliente` VARCHAR(10) NOT NULL,
  `id_Cliente` VARCHAR(10) NOT NULL,
  INDEX `ISBN_Libro_Cliente_idx` (`ISBN_Libro_Cliente` ASC) VISIBLE,
  INDEX `id_Cliente_idx` (`id_Cliente` ASC) VISIBLE,
  PRIMARY KEY (`ISBN_Libro_Cliente`, `id_Cliente`),
  CONSTRAINT `ISBN_Libro_Cliente`
    FOREIGN KEY (`ISBN_Libro_Cliente`)
    REFERENCES `Libreria`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Cliente`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `Libreria`.`Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Libreria`.`Autor` (
  `CodigoAutor` VARCHAR(10) NOT NULL,
  `NombreAutor` VARCHAR(45) NOT NULL,
  `FechaNacimiento` VARCHAR(45) NULL,
  `Edad` VARCHAR(45) NULL,
  PRIMARY KEY (`CodigoAutor`));

CREATE TABLE IF NOT EXISTS `Libreria`.`Libro_Autor` (
  `ISBN_Libro` VARCHAR(10) NOT NULL,
  `ID_Autor` VARCHAR(10) NOT NULL,
  INDEX `ISBN_Libro_idx` (`ISBN_Libro` ASC) VISIBLE,
  INDEX `ID_Autor_idx` (`ID_Autor` ASC) VISIBLE,
  PRIMARY KEY (`ISBN_Libro`, `ID_Autor`),
  CONSTRAINT `ISBN_Libro`
    FOREIGN KEY (`ISBN_Libro`)
    REFERENCES `Libreria`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Autor`
    FOREIGN KEY (`ID_Autor`)
    REFERENCES `Libreria`.`Autor` (`CodigoAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Libreria`.`Telefono_Cliente` (
  `cedula_Cliente` VARCHAR(10) NOT NULL,
  `numero_Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numero_Telefono`, `cedula_Cliente`),
  INDEX `cedula_Cliente_idx` (`cedula_Cliente` ASC) VISIBLE,
  CONSTRAINT `cedula_Cliente`
    FOREIGN KEY (`cedula_Cliente`)
    REFERENCES `Libreria`.`Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);