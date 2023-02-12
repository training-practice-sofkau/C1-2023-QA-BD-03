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
-- Table `mydb`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROVEEDOR` (
  `NIT` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `nacionalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OPERADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OPERADOR` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  `experiencia` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ATRACCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ATRACCION` (
  `nombre_atraccion` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `NIT_proveedor_atraccion` VARCHAR(20) NOT NULL,
  `cedula_operador` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`nombre_atraccion`),
  INDEX `NIT_proveedor_idx` (`NIT_proveedor_atraccion` ASC) VISIBLE,
  INDEX `cedula_operador_idx` (`cedula_operador` ASC) VISIBLE,
  CONSTRAINT `NIT_proveedor`
    FOREIGN KEY (`NIT_proveedor_atraccion`)
    REFERENCES `mydb`.`PROVEEDOR` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_operador`
    FOREIGN KEY (`cedula_operador`)
    REFERENCES `mydb`.`OPERADOR` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BRAZALETE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BRAZALETE` (
  `ID_brazalete` VARCHAR(50) NOT NULL,
  `costo` FLOAT NOT NULL,
  `cedula_cliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_brazalete`),
  INDEX `cedula_cliente_idx` (`cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `mydb`.`CLIENTE` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ATRACCION_BRAZALETE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ATRACCION_BRAZALETE` (
  `nombre_atraccion_brazalete` VARCHAR(45) NOT NULL,
  `ID_brazalete_atraccion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`nombre_atraccion_brazalete`, `ID_brazalete_atraccion`),
  INDEX `ID_brazalete_idx` (`ID_brazalete_atraccion` ASC) VISIBLE,
  CONSTRAINT `nombre_atraccion`
    FOREIGN KEY (`nombre_atraccion_brazalete`)
    REFERENCES `mydb`.`ATRACCION` (`nombre_atraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_brazalete`
    FOREIGN KEY (`ID_brazalete_atraccion`)
    REFERENCES `mydb`.`BRAZALETE` (`ID_brazalete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TELEFONO_PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TELEFONO_PROVEEDOR` (
  `NIT_proveedor` VARCHAR(20) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIT_proveedor`),
  CONSTRAINT `NIT_proveedor_telefono`
    FOREIGN KEY (`NIT_proveedor`)
    REFERENCES `mydb`.`PROVEEDOR` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TECNICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TECNICO` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDEN_DE_SERVICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ORDEN_DE_SERVICIO` (
  `id_orden` VARCHAR(20) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `costo` FLOAT NOT NULL,
  `cedula_tecnico` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `cedula_tecnico_idx` (`cedula_tecnico` ASC) VISIBLE,
  CONSTRAINT `cedula_tecnico`
    FOREIGN KEY (`cedula_tecnico`)
    REFERENCES `mydb`.`TECNICO` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ATRACCION_ORDEN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ATRACCION_ORDEN` (
  `nombre_atraccion_orden` VARCHAR(45) NOT NULL,
  `id_orden` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nombre_atraccion_orden`, `id_orden`),
  INDEX `id_orden_idx` (`id_orden` ASC) VISIBLE,
  CONSTRAINT `nombre_atraccion_orden`
    FOREIGN KEY (`nombre_atraccion_orden`)
    REFERENCES `mydb`.`ATRACCION` (`nombre_atraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_orden`
    FOREIGN KEY (`id_orden`)
    REFERENCES `mydb`.`ORDEN_DE_SERVICIO` (`id_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESPECIALIDAD TECNICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESPECIALIDAD TECNICO` (
  `cedula_tecnico` VARCHAR(15) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_tecnico`),
  CONSTRAINT `cedula_tecnico_especialidad`
    FOREIGN KEY (`cedula_tecnico`)
    REFERENCES `mydb`.`TECNICO` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
