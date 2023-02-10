-- -----------------------------------------------------
-- Table parquenorte.cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.cliente(
id_cliente VARCHAR(12) NOT NULL,
nombre_cliente VARCHAR (45) NOT NULL,
fecha_nacimiento DATE NOT NULL,
telefono VARCHAR (12) NOT NULL,
mail VARCHAR (20) NOT NULL,
edad INT NOT NULL,
PRIMARY KEY (id_cliente)
);
-- -----------------------------------------------------
-- Table parquenorte.brazalete
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.brazalete(
id_brazalete VARCHAR(12) NOT NULL,
nivel INT NOT NULL,
precio DOUBLE,
id_brazalete_actraccion VARCHAR(12),
PRIMARY KEY (id_brazalete)
);
ALTER TABLE parquenorte.brazalete RENAME COLUMN id_brazalete_actraccion  TO idAtraccion;
ALTER TABLE parquenorte.brazalete  ADD FOREIGN KEY (idAtraccion) REFERENCES parquenorte.atraccion(id);

-- -----------------------------------------------------
-- Table parquenorte.cliente_brazalete
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.cliente_brazalete(
id VARCHAR(12) PRIMARY KEY,
fecha_compra DATE,
idCliente VARCHAR(12) NOT NULL,
idBrazalete VARCHAR(12) NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (idBrazalete) REFERENCES brazalete(id_brazalete)
);
-- -----------------------------------------------------
-- Table parquenorte.proveedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.proveedor(
Nit VARCHAR(12),
nombre VARCHAR(45),
nacionalidad VARCHAR(30),
telefono VARCHAR(12),
email VARCHAR(20),
PRIMARY KEY (Nit)
);

-- -----------------------------------------------------
-- Table parquenorte.operador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.operario(
id VARCHAR(12),
cedula VARCHAR(15),
nombre VARCHAR (45),
PRIMARY KEY (id)
);
-- -----------------------------------------------------
-- Table parquenorte.atraccion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.atraccion(
id VARCHAR(12),
nombre VARCHAR(45) NOT NULL,
idProveedor VARCHAR (12) NOT NULL,
idOperario VARCHAR (12) NOT NULL,
	FOREIGN KEY (idProveedor) REFERENCES proveedor(Nit),
	FOREIGN KEY (idOperario) REFERENCES operario(id)	
);
ALTER TABLE parquenorte.atraccion ADD PRIMARY KEY (id);
CREATE INDEX idx_atraccion_id ON parquenorte.atraccion(id);
-- -----------------------------------------------------
-- Table parquenorte.ordenServicio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.ordenServicio(
id VARCHAR(12),
fechaOrden DATE,
descripcionFalla VARCHAR(80),
prioridad VARCHAR (45),
PRIMARY KEY (id)
);
-- -----------------------------------------------------
-- Table parquenorte.tecnico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.tecnico(
id VARCHAR(12),
nombreTecnico VARCHAR(50),
empresaContratista VARCHAR(45),
telefono VARCHAR(12),
mail VARCHAR (20),
PRIMARY KEY (id)
);
-- -----------------------------------------------------
-- Table parquenorte.servicioTecnico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parquenorte.servicioTecnico(
id VARCHAR(12),
idOrden VARCHAR (12),
idTecnico VARCHAR (12),
horaInicio DATETIME,
horaFin DATETIME,
duracionMantenimiento TIME,
PRIMARY KEY (id),
	FOREIGN KEY (idOrden) REFERENCES ordenServicio(id),
	FOREIGN KEY (idTecnico) REFERENCES tecnico(id)	

);