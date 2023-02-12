-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Editorial` (
  `nombre` VARCHAR(80) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `ISBN` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numeroPaginas` VARCHAR(45) NOT NULL,
  `nombreEditorial` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombreEditorial_idx` (`nombreEditorial` ASC) VISIBLE,
  CONSTRAINT `nombreEditorial`
    FOREIGN KEY (`nombreEditorial`)
    REFERENCES `mydb`.`Editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cedula` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro_Cliente` (
  `ISBN_libro_cliente` VARCHAR(10) NOT NULL,
  `cedulaCliente` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`ISBN_libro_cliente`, `cedulaCliente`),
  INDEX `cedulaCliente_idx` (`cedulaCliente` ASC) VISIBLE,
  CONSTRAINT `ISBN_libro_cliente`
    FOREIGN KEY (`ISBN_libro_cliente`)
    REFERENCES `mydb`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaCliente`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `id` VARCHAR(10) NOT NULL,
  `fechaNacimiento` VARCHAR(45) NOT NULL,
  `nacionalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro_Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro_Autor` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `IdAutor` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `IdAutor`),
  INDEX `IdAutor_idx` (`IdAutor` ASC) VISIBLE,
  CONSTRAINT `ISBN_libro`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `mydb`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdAutor`
    FOREIGN KEY (`IdAutor`)
    REFERENCES `mydb`.`Autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TelefonoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TelefonoCliente` (
  `cedulaCliente` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedulaCliente`, `telefono`),
  CONSTRAINT `cedulaCliente_telefono`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
