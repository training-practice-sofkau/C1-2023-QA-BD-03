CREATE DATABASE  ParqueNorteBD;

USE ParqueNorteBD;

CREATE TABLE proveedor(
	nit VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    nacionalidad VARCHAR(45) NOT NULL,
    PRIMARY KEY (nit)
);

CREATE TABLE telefono_proveedor(
	nit_proveedor VARCHAR(20) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    PRIMARY KEY (nit_proveedor, telefono),
    FOREIGN KEY (nit_proveedor) REFERENCES proveedor(nit)    
);

CREATE TABLE operador(
	cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    salario FLOAT NOT NULL,
    experiencia VARCHAR(255) NOT NULL,
    PRIMARY KEY (cedula)
);

CREATE TABLE atraccion(
	nombre_atraccion VARCHAR(45) NOT NULL,
    precio FLOAT NOT NULL,
    nit_proveedor_atraccion VARCHAR(20) NOT NULL,
    cedula_operador VARCHAR(15) NOT NULL,
    PRIMARY KEY (nombre_atraccion),
    FOREIGN KEY (nit_proveedor_atraccion) REFERENCES proveedor(nit) ,
	FOREIGN KEY (cedula_operador) REFERENCES operador(cedula)
);

CREATE TABLE cliente(
	cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (cedula)
);

CREATE TABLE brazalete(
	id_brazalete VARCHAR(50) NOT NULL,
    costo FLOAT NOT NULL,
    cedula_cliente  VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_brazalete),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)    
);

CREATE TABLE atraccion_brazalete(
	nombre_atraccion_brazalete VARCHAR(45) NOT NULL,
    id_brazalete_atraccion  VARCHAR(50) NOT NULL,
    PRIMARY KEY (nombre_atraccion_brazalete, id_brazalete_atraccion),
    FOREIGN KEY (nombre_atraccion_brazalete) REFERENCES atraccion(nombre_atraccion),  
    FOREIGN KEY (id_brazalete_atraccion) REFERENCES brazalete(id_brazalete)
);

CREATE TABLE tecnico(
	cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    salario FLOAT NOT NULL,
    PRIMARY KEY (cedula)
);

CREATE TABLE especialidad_tecnico(
	cedula_tecnico VARCHAR(15) NOT NULL,
    especialidad VARCHAR(45) NOT NULL,
    PRIMARY KEY (cedula_tecnico),
    FOREIGN KEY (cedula_tecnico) REFERENCES tecnico(cedula)    
);


CREATE TABLE orden_de_servicio(
	id_orden VARCHAR(20) NOT NULL,
    fecha VARCHAR(45) NOT NULL,
    duracion VARCHAR(45) NOT NULL,
    costo FLOAT NOT NULL,
    cedula_tecnico VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_orden),
	FOREIGN KEY (cedula_tecnico) REFERENCES tecnico(cedula)
);

CREATE TABLE atraccion_orden(
	nombre_atraccion_orden VARCHAR(45) NOT NULL,
    id_orden  VARCHAR(20) NOT NULL,
    PRIMARY KEY (nombre_atraccion_orden, id_orden),
    FOREIGN KEY (nombre_atraccion_orden) REFERENCES atraccion(nombre_atraccion),  
    FOREIGN KEY (id_orden) REFERENCES orden_de_servicio(id_orden)
);


