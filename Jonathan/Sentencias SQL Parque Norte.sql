CREATE SCHEMA IF NOT EXISTS `parquenorte` DEFAULT CHARACTER SET utf8 ;
USE `parquenorte` ;

CREATE TABLE IF NOT EXISTS `parquenorte`.`Brazalete` (
  `idBrazalete` VARCHAR(10) NOT NULL,
  `Tipo` VARCHAR(25) NOT NULL,
  `FechaCompra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBrazalete`));

CREATE TABLE IF NOT EXISTS `parquenorte`.`Atraccion` (
  `NombreAtraccion` VARCHAR(45) NOT NULL,
  `Npuestos` INT NOT NULL,
  `FechaAdquisicion` VARCHAR(45) NOT NULL,
  `brazaleteAtraccionID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`NombreAtraccion`),
  INDEX `brazaleteAtraccionID_idx` (`brazaleteAtraccionID` ASC) VISIBLE,
  CONSTRAINT `brazaleteAtraccionID`
    FOREIGN KEY (`brazaleteAtraccionID`)
    REFERENCES `parquenorte`.`Brazalete` (`idBrazalete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `parquenorte`.`Proveedor` (
  `CodigoProveedor` VARCHAR(10) NOT NULL,
  `NombreProveedor` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodigoProveedor`));


CREATE TABLE IF NOT EXISTS `parquenorte`.`Atraccion_Proveedor` (
  `codigo_Proveedor` VARCHAR(10) NOT NULL,
  `nombre_Atraccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_Proveedor`, `nombre_Atraccion`),
  INDEX `nombre_Atraccion_idx` (`nombre_Atraccion` ASC) VISIBLE,
  CONSTRAINT `codigo_Proveedor`
    FOREIGN KEY (`codigo_Proveedor`)
    REFERENCES `parquenorte`.`Proveedor` (`CodigoProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_Atraccion`
    FOREIGN KEY (`nombre_Atraccion`)
    REFERENCES `parquenorte`.`Atraccion` (`NombreAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `parquenorte`.`Empleado` (
  `idEmpleado` VARCHAR(10) NOT NULL,
  `PrimerNombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `nombreAtraccion_empleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `Atraccion_Empleado_idx` (`nombreAtraccion_empleado` ASC) VISIBLE,
  CONSTRAINT `nombreAtraccion_empleado`
    FOREIGN KEY (`nombreAtraccion_empleado`)
    REFERENCES `parquenorte`.`Atraccion` (`NombreAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `parquenorte`.`Clientes` (
  `CC` VARCHAR(15) NOT NULL,
  `NombreCliente` VARCHAR(45) NOT NULL,
  `Edad` INT NOT NULL,
  `IDBrazalete_Cliente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CC`),
  INDEX `IDBrazalete_Cliente_idx` (`IDBrazalete_Cliente` ASC) VISIBLE,
  CONSTRAINT `IDBrazalete_Cliente`
    FOREIGN KEY (`IDBrazalete_Cliente`)
    REFERENCES `parquenorte`.`Brazalete` (`idBrazalete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `parquenorte`.`Orden_de_Servicio` (
  `NoOrden` INT NOT NULL,
  `FechaInicio` VARCHAR(20) NOT NULL,
  `FechaFin` VARCHAR(20) NOT NULL,
  `Duracion` VARCHAR(20) NOT NULL,
  `name_Atraccion_Orden` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NoOrden`),
  INDEX `name_Atraccion_Orden_idx` (`name_Atraccion_Orden` ASC) VISIBLE,
  CONSTRAINT `name_Atraccion_Orden`
    FOREIGN KEY (`name_Atraccion_Orden`)
    REFERENCES `parquenorte`.`Atraccion` (`NombreAtraccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `parquenorte`.`Tecnicos` (
  `codigo_Tecnico` VARCHAR(10) NOT NULL,
  `NombreTecnico` VARCHAR(25) NOT NULL,
  `Especialidad` VARCHAR(25) NOT NULL,
  `ordenServicioAsignada` INT NOT NULL,
  PRIMARY KEY (`codigo_Tecnico`),
  INDEX `ordenServicioAsignada_idx` (`ordenServicioAsignada` ASC) VISIBLE,
  CONSTRAINT `ordenServicioAsignada`
    FOREIGN KEY (`ordenServicioAsignada`)
    REFERENCES `parquenorte`.`Orden_de_Servicio` (`NoOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `parquenorte`.`Telefonos_Proveedor` (
  `Codigo_Proveedor_Telefono` VARCHAR(10) NOT NULL,
  `Telefono_Proveedor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codigo_Proveedor_Telefono`, `Telefono_Proveedor`),
  CONSTRAINT `Codigo_Proveedor_Telefono`
    FOREIGN KEY (`Codigo_Proveedor_Telefono`)
    REFERENCES `parquenorte`.`Proveedor` (`CodigoProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `parquenorte`.`Ubicaciones_Proveedor` (
  `Codigo_ProveedorUbicacion` VARCHAR(10) NOT NULL,
  `Ubicacion_Proveedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codigo_ProveedorUbicacion`, `Ubicacion_Proveedor`),
  CONSTRAINT `Codigo_ProveedorUbicacion`
    FOREIGN KEY (`Codigo_ProveedorUbicacion`)
    REFERENCES `parquenorte`.`Proveedor` (`CodigoProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
