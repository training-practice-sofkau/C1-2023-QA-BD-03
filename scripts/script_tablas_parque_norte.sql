-- -----------------------------------------------------------------------------------------
-- Script generado para crear en el esquema parque_norte las tablas Tecnico, Orden_servicio
-- Atraccion, Cliente, Brazalete, Proveedor y las tablas intermedias o de detalle
-- que surgen de las relaciones entre ellas; tecnico_telefono, Tecnico_orden_servicio,
-- proveedor_telefono, Brazalete_atraccion, cliente_correo.
-- -----------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Se crea la tabla Tecnico
-- ------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Tecnico (
	id VARCHAR(10) NOT NULL,
    especialidad VARCHAR(45) NULL,
    correo VARCHAR(45) NOT NULL,
    salario INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id));
    
-- ---------------------------------------------------------------------------------------
-- Se crea la tabla de detalle tecnico_telefono para el atributo multivaluado telefono
-- perteneciente a la tabla Tecnico
-- ---------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Tecnico_telefono (
	id_tecnico	VARCHAR(10) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_tecnico, telefono),
    FOREIGN KEY (id_tecnico) REFERENCES parque_norte.Tecnico (id));
    
-- ------------------------------------------------------------
-- Se crea la tabla Orden_servicio
-- ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Orden_servicio (
	numero_orden VARCHAR(15) NOT NULL,
    fecha_inicial VARCHAR(45) NOT NULL,
    fecha_final VARCHAR(45) NOT NULL,
    costo_mantenimiento INT NOT NULL,
    PRIMARY KEY (numero_orden));
    
-- ------------------------------------------------------------------------------------
-- Se crea la tabla intermedia Tecnico_orden_servicio para la relación N:M entre
-- Tecnico y Orde_servicio
-- --------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Tecnico_orden_servicio (
	Tecnico_id VARCHAR(10) NOT NULL,
    numero_orden_servicio VARCHAR(15) NOT NULL,
    PRIMARY KEY (Tecnico_id, numero_orden_servicio),
    FOREIGN KEY (Tecnico_id) REFERENCES parque_norte.Tecnico (id),
    FOREIGN KEY (numero_orden_servicio) REFERENCES parque_norte.Orden_servicio (numero_orden));
    
-- -----------------------------------------------------------------------
-- Se crea la tabla Proveedor
-- -------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Proveedor (
	id VARCHAR(10) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id));
    
-- -------------------------------------------------------
-- Se crea la tabla Atraccion
-- ------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Atraccion (
	id VARCHAR(10) NOT NULL,
    tipo_atraccion VARCHAR(45) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    proveedor_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (proveedor_id) REFERENCES parque_norte.Proveedor (id));
    
-- ---------------------------------------------------------------------------------------------------
-- Se crea la tabla de detalle del atributo multivaluado telefono, perteneciente a tabla Proveedor
-- ---------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Proveedor_telefono (
	id_proveedor VARCHAR(10) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_proveedor, telefono),
    FOREIGN KEY (id_proveedor) REFERENCES parque_norte.Proveedor (id));
    
-- -------------------------------------------------------------------------------------
-- Se crea la tabla Cliente
-- ------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Cliente (
	cedula VARCHAR(15) NOT NULL,
    direccion VARCHAR(45) NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (cedula));
    
-- --------------------------------------------------------------
-- Se crea la tabla Brazalete
-- ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Brazalete (
	numero VARCHAR(10) NOT NULL,
    precio INT NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    cedula_cliente VARCHAR(15) NOT NULL,
    PRIMARY KEY (numero),
    FOREIGN KEY (cedula_cliente) REFERENCES parque_norte.Cliente (cedula));
    
-- --------------------------------------------------------------------------------------
-- Se crea la tabla Brazalete_atracción, la cual es una tabla intermedia para transformar 
-- relación N:M  entre las tablas Brazalete y Atraccion
-- ------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Brazalete_atraccion (
	numero_brazalete VARCHAR(10) NOT NULL,
    id_atraccion VARCHAR(10) NOT NULL,
    PRIMARY KEY (numero_brazalete, id_atraccion),
    FOREIGN KEY (numero_brazalete) REFERENCES parque_norte.Brazalete (numero),
    FOREIGN KEY (id_atraccion) REFERENCES parque_norte.Atraccion (id));
    
-- -------------------------------------------------------------------------------
-- Se crea la tabla de detalle Cliente_correo del atributo multivaluado correo,
-- pertenenciente a la tabla Cliente
-- ----------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Cliente_correo (
	cliente_cedula VARCHAR(15) NOT NULL,
    correo VARCHAR(45) NOT NULL,
    PRIMARY KEY (cliente_cedula, correo),
    FOREIGN KEY (cliente_cedula) REFERENCES parque_norte.Cliente (cedula));
    
-- ---------------------------------------------------------------------------
-- Se crea la tabla Empleado
-- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Empleado (
	id VARCHAR(15) NOT NULL,
    salario INT NOT NULL,
    correo VARCHAR(45) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    atraccion_id VARCHAR(10),
    PRIMARY KEY (id),
    FOREIGN KEY (atraccion_id) REFERENCES parque_norte.Atraccion (id));
    
-- -------------------------------------------------------------------------------------
-- Se crea la tabla de detalle empleado_telefono para el atributo multivaluado telefono
-- perteneciente a la entidad Empleado
-- ---------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS parque_norte.Empleado_telefono (
	empleado_id VARCHAR(15) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (empleado_id, telefono),
    FOREIGN KEY (empleado_id) REFERENCES parque_norte.Empleado (id));
	