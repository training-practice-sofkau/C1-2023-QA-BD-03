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
-- Table `mydb`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`editorial` (
  `nombre` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libro` (
  `ISBN` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numeroPaginas` VARCHAR(45) NOT NULL,
  `nombreEditorial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombreEditorial_idx` (`nombreEditorial` ASC) VISIBLE,
  CONSTRAINT `nombreEditorial`
    FOREIGN KEY (`nombreEditorial`)
    REFERENCES `mydb`.`editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `codAutor` VARCHAR(15) NOT NULL,
  `fechaNacimiento` VARCHAR(45) NOT NULL,
  `edad` SMALLINT(3) NOT NULL,
  `nacionalidad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`baseAutores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`baseAutores` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `codAutor` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `codAutor`),
  INDEX `codAutor_idx` (`codAutor` ASC) VISIBLE,
  CONSTRAINT `ISBN_libro`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `mydb`.`libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codAutor`
    FOREIGN KEY (`codAutor`)
    REFERENCES `mydb`.`autor` (`codAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`baseClientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`baseClientes` (
  `ISBN_libroVendido` VARCHAR(10) NOT NULL,
  `cedulaCliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ISBN_libroVendido`, `cedulaCliente`),
  INDEX `cedulaCliente_idx` (`cedulaCliente` ASC) VISIBLE,
  CONSTRAINT `ISBN_libroVendido`
    FOREIGN KEY (`ISBN_libroVendido`)
    REFERENCES `mydb`.`libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaCliente`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefonoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefonoCliente` (
  `cedulaCliente` VARCHAR(15) NOT NULL,
  `numero` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`cedulaCliente`, `numero`),
  CONSTRAINT `cedulaCliente`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
