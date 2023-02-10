-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ParqueNorte
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ParqueNorte
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ParqueNorte` DEFAULT CHARACTER SET utf8 ;
USE `ParqueNorte` ;

-- -----------------------------------------------------
-- Table `ParqueNorte`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `nombre_proveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`Atraccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Atraccion` (
  `idAtraccion` INT NOT NULL,
  `nombre_atraccion` VARCHAR(45) NULL,
  `idProveedor` INT NULL,
  PRIMARY KEY (`idAtraccion`),
  INDEX `PK_idProveedor_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `FK_idProveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `ParqueNorte`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Cliente` (
  `cedula` VARCHAR(12) NOT NULL,
  `nombre_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`Brazalete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Brazalete` (
  `idBrazalete` INT NOT NULL,
  `clase` VARCHAR(45) NULL,
  `cedula_cliente` VARCHAR(12) NULL,
  PRIMARY KEY (`idBrazalete`),
  INDEX `PK_idCedula_idx` (`cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `FK_idCedula`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `ParqueNorte`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`Operador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Operador` (
  `idOperador` INT NOT NULL,
  `nombre_operador` VARCHAR(45) NULL,
  `idAtraccion` INT NULL,
  PRIMARY KEY (`idOperador`),
  INDEX `PK_idAtraccion_idx` (`idAtraccion` ASC) VISIBLE,
  CONSTRAINT `FK_idAtraccion`
    FOREIGN KEY (`idAtraccion`)
    REFERENCES `ParqueNorte`.`Atraccion` (`idAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`Tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Tecnico` (
  `cedula_tecnico` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula_tecnico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`OrdenServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`OrdenServicio` (
  `idOrden_servicio` INT NOT NULL,
  `duracion` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `fecha_servicio` VARCHAR(45) NULL,
  `idAtraccion` INT NULL,
  `cedula_tecnico` VARCHAR(12) NULL,
  PRIMARY KEY (`idOrden_servicio`),
  INDEX `PK_idAtraccion_idx` (`idAtraccion` ASC) VISIBLE,
  INDEX `FK_cedula_tecnico_idx` (`cedula_tecnico` ASC) VISIBLE,
  CONSTRAINT `FK_idAtraccion`
    FOREIGN KEY (`idAtraccion`)
    REFERENCES `ParqueNorte`.`Atraccion` (`idAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_cedula_tecnico`
    FOREIGN KEY (`cedula_tecnico`)
    REFERENCES `ParqueNorte`.`Tecnico` (`cedula_tecnico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParqueNorte`.`Brazaleta_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParqueNorte`.`Brazaleta_cliente` (
  `idAtraccion` INT NOT NULL,
  `idBrazalete` INT NOT NULL,
  PRIMARY KEY (`idAtraccion`, `idBrazalete`),
  INDEX `PK_idBrazalete_idx` (`idBrazalete` ASC) VISIBLE,
  CONSTRAINT `FK_idAtraccion`
    FOREIGN KEY (`idAtraccion`)
    REFERENCES `ParqueNorte`.`Atraccion` (`idAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_idBrazalete`
    FOREIGN KEY (`idBrazalete`)
    REFERENCES `ParqueNorte`.`Brazalete` (`idBrazalete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
