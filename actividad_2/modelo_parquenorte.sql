-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parque_norte
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parque_norte
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parque_norte` DEFAULT CHARACTER SET utf8 ;
USE `parque_norte` ;

-- -----------------------------------------------------
-- Table `parque_norte`.`Brazalete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Brazalete` (
  `id_brazalete` VARCHAR(25) NOT NULL,
  `precio` FLOAT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_brazalete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Cliente` (
  `id_cliente` VARCHAR(20) NOT NULL,
  `nombre_cliente` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `altura` FLOAT NULL,
  `telefono` VARCHAR(45) NULL,
  `id_brazalete` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`, `id_brazalete`),
  INDEX `fk_Cliente_Brazalete_idx` (`id_brazalete` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Brazalete`
    FOREIGN KEY (`id_brazalete`)
    REFERENCES `parque_norte`.`Brazalete` (`id_brazalete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`Operador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Operador` (
  `id_operador` VARCHAR(25) NOT NULL,
  `nombre_operador` VARCHAR(45) NULL,
  `area` FLOAT NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_operador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`Atracción`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Atracción` (
  `id_atraccion` VARCHAR(25) NOT NULL,
  `nombre_atraccion` VARCHAR(25) NULL,
  `estatura_max` FLOAT NULL,
  `estatura_min` FLOAT NULL,
  PRIMARY KEY (`id_atraccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`Proveeedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Proveeedor` (
  `id_proveedor` INT NOT NULL,
  `nombre_proveeedor` VARCHAR(25) NULL,
  `telefono` VARCHAR(20) NULL,
  `tipo` VARCHAR(25) NULL,
  `Atracción_id_atraccion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  INDEX `fk_Proveeedor_Atracción1_idx` (`Atracción_id_atraccion` ASC) VISIBLE,
  CONSTRAINT `fk_Proveeedor_Atracción1`
    FOREIGN KEY (`Atracción_id_atraccion`)
    REFERENCES `parque_norte`.`Atracción` (`id_atraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`tecnico` (
  `id_tecnico` VARCHAR(25) NOT NULL,
  `nombre_tecnico` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tecnico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`orden_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`orden_servicio` (
  `id_orden_servicio` INT NOT NULL,
  `fecha` DATE NULL,
  `duracion` DATE NULL,
  `Atracción_id_atraccion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_orden_servicio`),
  INDEX `fk_orden_servicio_Atracción1_idx` (`Atracción_id_atraccion` ASC) VISIBLE,
  CONSTRAINT `fk_orden_servicio_Atracción1`
    FOREIGN KEY (`Atracción_id_atraccion`)
    REFERENCES `parque_norte`.`Atracción` (`id_atraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`Brazalete_Atracción`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Brazalete_Atracción` (
  `Brazalete_id_brazalete` VARCHAR(25) NOT NULL,
  `Atracción_id_atraccion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Brazalete_id_brazalete`, `Atracción_id_atraccion`),
  INDEX `fk_Brazalete_has_Atracción_Atracción1_idx` (`Atracción_id_atraccion` ASC) VISIBLE,
  INDEX `fk_Brazalete_has_Atracción_Brazalete1_idx` (`Brazalete_id_brazalete` ASC) VISIBLE,
  CONSTRAINT `fk_Brazalete_has_Atracción_Brazalete1`
    FOREIGN KEY (`Brazalete_id_brazalete`)
    REFERENCES `parque_norte`.`Brazalete` (`id_brazalete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Brazalete_has_Atracción_Atracción1`
    FOREIGN KEY (`Atracción_id_atraccion`)
    REFERENCES `parque_norte`.`Atracción` (`id_atraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parque_norte`.`Operador_Atracción`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parque_norte`.`Operador_Atracción` (
  `Operador_id_operador` VARCHAR(25) NOT NULL,
  `Atracción_id_atraccion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Operador_id_operador`, `Atracción_id_atraccion`),
  INDEX `fk_Operador_has_Atracción_Atracción1_idx` (`Atracción_id_atraccion` ASC) VISIBLE,
  INDEX `fk_Operador_has_Atracción_Operador1_idx` (`Operador_id_operador` ASC) VISIBLE,
  CONSTRAINT `fk_Operador_has_Atracción_Operador1`
    FOREIGN KEY (`Operador_id_operador`)
    REFERENCES `parque_norte`.`Operador` (`id_operador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Operador_has_Atracción_Atracción1`
    FOREIGN KEY (`Atracción_id_atraccion`)
    REFERENCES `parque_norte`.`Atracción` (`id_atraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
