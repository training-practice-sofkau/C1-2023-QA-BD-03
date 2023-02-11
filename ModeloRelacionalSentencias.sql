CREATE SCHEMA IF NOT EXISTS `Libreria` DEFAULT CHARACTER SET utf8 ;
USE `Libreria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Editorial` (
  `nombre` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`));
  
  CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `ISBN` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numero_paginas` VARCHAR(45) NULL,
  `nombre_editorial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_editorial_idx` (`nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_editorial`
    FOREIGN KEY (`nombre_editorial`)
    REFERENCES `mydb`.`Editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`));
  
  CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `id` VARCHAR(10) NOT NULL,
  `fecha_nacimiento` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
 CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `cedula_cliente` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`telefono`, `cedula_cliente`),
  INDEX `cedula_cliente_idx` (`cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION); 
    
CREATE TABLE IF NOT EXISTS `mydb`.`Libro_cliente` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `cedula_cliente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `cedula_cliente`),
  INDEX `cedula_cliente_idx` (`cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `ISBN_libro`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `mydb`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `mydb`.`Libro_autor` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `id_autor` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `id_autor`),
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `ISBN_libroo`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `mydb`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `mydb`.`Autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);