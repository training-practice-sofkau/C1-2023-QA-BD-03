

-- -----------------------------------------------------
-- Schema libreria_buscalibre
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libreria_buscalibre
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libreria_buscalibre` DEFAULT CHARACTER SET utf8 ;
USE `libreria_buscalibre` ;

-- -----------------------------------------------------
-- Table `libreria_buscalibre`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_buscalibre`.`cliente` (
  `id_cliente` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_buscalibre`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_buscalibre`.`Editorial` (
  `nombre` VARCHAR(45) NOT NULL,
  `cuidad` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `libreria_buscalibre`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_buscalibre`.`Libro` (
  `ISBN` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(25) NULL,
  `numero_paginas` INT NULL,
  `año` YEAR NULL,
  `nombre_editorial` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_editorial_idx` (`nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_editorial`
    FOREIGN KEY (`nombre_editorial`)
    REFERENCES `libreria_buscalibre`.`Editorial` (`nombre`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_buscalibre`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_buscalibre`.`autor` (
  `codigo_autor` VARCHAR(45) NOT NULL,
  `nombre_autor` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `edad` INT NULL,
  PRIMARY KEY (`codigo_autor`),
  UNIQUE INDEX `codigo_autor_UNIQUE` (`codigo_autor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_buscalibre`.`autor_Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_buscalibre`.`autor_Libro` (
  `Libro_ISBN` VARCHAR(45) NOT NULL,
  `autor_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Libro_ISBN`, `autor_codigo`),
  INDEX `fk_Libro_has_Libro_Libro1_idx` (`Libro_ISBN` ASC) VISIBLE,
  INDEX `fk_autor_Libro_autor1_idx` (`autor_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_has_Libro_Libro1`
    FOREIGN KEY (`Libro_ISBN`)
    REFERENCES `libreria_buscalibre`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autor_Libro_autor1`
    FOREIGN KEY (`autor_codigo`)
    REFERENCES `libreria_buscalibre`.`autor` (`codigo_autor`)
    
   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_buscalibre`.`cliente_has_Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_buscalibre`.`cliente_has_Libro` (
  `id_cliente` VARCHAR(10) NOT NULL,
  `Libro_ISBN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`, `Libro_ISBN`),
  INDEX `fk_cliente_has_Libro_Libro1_idx` (`Libro_ISBN` ASC) VISIBLE,
  INDEX `fk_cliente_has_Libro_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_Libro_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `libreria_buscalibre`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_Libro_Libro1`
    FOREIGN KEY (`Libro_ISBN`)
    REFERENCES `libreria_buscalibre`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
