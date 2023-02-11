CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor` (
  `identificacion` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(50) NULL,
  `direccion` VARCHAR(50) NULL,
  PRIMARY KEY (`identificacion`));
  
  CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `identificacion_proveedor` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`identificacion_proveedor`, `telefono`),
  CONSTRAINT `identificacion_proveedor`
    FOREIGN KEY (`identificacion_proveedor`)
    REFERENCES `mydb`.`Proveedor` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Operador` (
  `cc` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cc`));
  
  CREATE TABLE IF NOT EXISTS `mydb`.`Atraccion` (
  `idAtraccion` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_adq` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `identificacion_prov` VARCHAR(10) NOT NULL,
  `cc_operador` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idAtraccion`),
  INDEX `identificacion_prov_idx` (`identificacion_prov` ASC) VISIBLE,
  INDEX `cc_operador_idx` (`cc_operador` ASC) VISIBLE,
  CONSTRAINT `identificacion_prov`
    FOREIGN KEY (`identificacion_prov`)
    REFERENCES `mydb`.`Proveedor` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cc_operador`
    FOREIGN KEY (`cc_operador`)
    REFERENCES `mydb`.`Operador` (`cc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
 CREATE TABLE IF NOT EXISTS `mydb`.`Orden_servicio` (
  `numero_servicio` VARCHAR(10) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `costo` VARCHAR(45) NOT NULL,
  `id_atraccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numero_servicio`),
  INDEX `id_atraccion_idx` (`id_atraccion` ASC) VISIBLE,
  CONSTRAINT `id_atraccion`
    FOREIGN KEY (`id_atraccion`)
    REFERENCES `mydb`.`Atraccion` (`idAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Tecnico` (
  `cc` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cc`));
  
  CREATE TABLE IF NOT EXISTS `mydb`.`Asignar` (
  `cc_tecnico` VARCHAR(10) NOT NULL,
  `numero_servicio` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`cc_tecnico`, `numero_servicio`),
  INDEX `numero_servicio_idx` (`numero_servicio` ASC) VISIBLE,
  CONSTRAINT `cc_tecnico`
    FOREIGN KEY (`cc_tecnico`)
    REFERENCES `mydb`.`Tecnico` (`cc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_servicio`
    FOREIGN KEY (`numero_servicio`)
    REFERENCES `mydb`.`Orden_servicio` (`numero_servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NULL,
  `fecha_nacimiento` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`));
  
  CREATE TABLE IF NOT EXISTS `mydb`.`Brazalete_cliente` (
  `consecutivo` VARCHAR(10) NOT NULL,
  `fecha_visita` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `cc_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`consecutivo`),
  INDEX `cc_cliente_idx` (`cc_cliente` ASC) VISIBLE,
  CONSTRAINT `cc_cliente`
    FOREIGN KEY (`cc_cliente`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Acceder` (
  `id_atraccionn` VARCHAR(10) NOT NULL,
  `consecutivo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_atraccionn`, `consecutivo`),
  INDEX `consecutivo_idx` (`consecutivo` ASC) VISIBLE,
  CONSTRAINT `id_atraccionn`
    FOREIGN KEY (`id_atraccionn`)
    REFERENCES `mydb`.`Atraccion` (`idAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `consecutivo`
    FOREIGN KEY (`consecutivo`)
    REFERENCES `mydb`.`Brazalete_cliente` (`consecutivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);