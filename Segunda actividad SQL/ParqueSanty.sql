CREATE DATABASE IF NOT EXISTS ParqueSanty;
USE ParqueSanty;

CREATE TABLE Tecnico (
    TecnicoID varchar(20) PRIMARY KEY,
    Nombre varchar(20) NOT NULL,
    Telefono varchar(20) NOT NULL
);

CREATE TABLE OrdenServicio (
    IdOrden varchar(20) PRIMARY KEY,
    Fecha varchar(20) NOT NULL,
    Duracion varchar(20) NOT NULL,
    TecnicoID varchar(20) NOT NULL,
    FOREIGN KEY (TecnicoID) REFERENCES Tecnico(TecnicoID)
);

CREATE TABLE Reparar (
    IdOrden varchar(20) NOT NULL,
    IdAtraccion varchar(20) NOT NULL,
    PRIMARY KEY (IdOrden, IdAtraccion),
    FOREIGN KEY (IdOrden) REFERENCES OrdenServicio(IdOrden),
    FOREIGN KEY (IdAtraccion) REFERENCES Atraccion(IdAtraccion)
);

CREATE TABLE Atraccion (
    IdAtraccion varchar(20) PRIMARY KEY,
    Marca varchar(20) NOT NULL,
    Costo varchar(20) NOT NULL,
    Nombre varchar(20) NOT NULL,
    FechaAdquision varchar(20) NOT NULL,
    IdEmpleado varchar(20) NOT NULL,
    IdProveedor varchar(20) NOT NULL,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor)
);


CREATE TABLE Empleado (
    IdEmpleado varchar(20) PRIMARY KEY,
    Telefono varchar(20) NOT NULL,
    Nombre varchar(20) NOT NULL,
    Direccion varchar(20) NOT NULL,
    AreaTrabajo varchar(20) NOT NULL
);

CREATE TABLE Proveedor (
    IdProveedor varchar(20) PRIMARY KEY,
    Nombre varchar(20) NOT NULL,
    Direccion varchar(20) NOT NULL,
    Telefono varchar(20) NOT NULL
);

CREATE TABLE Nacionalidad (
    IdNacionalidad varchar(20) PRIMARY KEY,
    Colombia varchar(20) NOT NULL,
    Mexico varchar(20) NOT NULL,
    FOREIGN KEY (IdNacionalidad) REFERENCES Proveedor(IdProveedor)
);

CREATE TABLE Entrar (
    IdEntrar varchar(20) PRIMARY KEY,
    IdBrazalete varchar(20) NOT NULL,
	IdAtraccion varchar(20) NOT NULL,
    FechaIngreso varchar(20),
    FOREIGN KEY (IdAtraccion) REFERENCES Atraccion(IdAtraccion),
    FOREIGN KEY (IdBrazalete) REFERENCES Brazalete(IdBrazalete)
);

CREATE TABLE Brazalete (
  IdBrazalete VARCHAR(20) PRIMARY KEY,
  Precio VARCHAR(20),
  FechaCompra VARCHAR(20),
  Tipo VARCHAR(20),
  IdCliente VARCHAR(20),
  FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);

CREATE TABLE Cliente (
  IdCliente VARCHAR(20) PRIMARY KEY,
  Edad VARCHAR(20),
  Altura VARCHAR(20),
  Nombre VARCHAR(20)
);



INSERT INTO Tecnico (TecnicoID, Nombre, Telefono) VALUES ('1', 'Juan Perez', '3001234567');
INSERT INTO Tecnico (TecnicoID, Nombre, Telefono) VALUES ('2', 'Maria Rodriguez', '3002345678');

INSERT INTO OrdenServicio (IdOrden, Fecha, Duracion, TecnicoID) VALUES ('1', '2022-01-01', '5 horas', '1');
INSERT INTO OrdenServicio (IdOrden, Fecha, Duracion, TecnicoID) VALUES ('2', '2022-02-01', '7 horas', '2');

INSERT INTO Reparar (IdOrden, IdAtraccion) VALUES ('1', '1');
INSERT INTO Reparar (IdOrden, IdAtraccion) VALUES ('2', '2');

INSERT INTO Atraccion (IdAtraccion, Marca, Costo, Nombre, FechaAdquision, IdEmpleado, IdProveedor) VALUES ('1', 'Disney', '1000000', 'Montaña Rusa', '2020-01-01', '1', '1');
INSERT INTO Atraccion (IdAtraccion, Marca, Costo, Nombre, FechaAdquision, IdEmpleado, IdProveedor) VALUES ('2', 'Universal', '2000000', 'Piscina de olas', '2021-01-01', '2', '2');

INSERT INTO Empleado (IdEmpleado, Telefono, Nombre, Direccion, AreaTrabajo) VALUES ('1', '3009876543', 'Pedro Martinez', 'Calle 123', 'Mantenimiento');
INSERT INTO Empleado (IdEmpleado, Telefono, Nombre, Direccion, AreaTrabajo) VALUES ('2', '3006789012', 'Sofia Gomez', 'Calle 456', 'Atención al cliente');

INSERT INTO Proveedor (IdProveedor, Nombre, Direccion, Telefono) VALUES ('1', 'Proveedor 1', 'Calle 789', '3003456789');
INSERT INTO Proveedor (IdProveedor, Nombre, Direccion, Telefono) VALUES ('2', 'Proveedor 2', 'Calle 101112', '3004567890');

INSERT INTO Nacionalidad (IdNacionalidad, Colombia, Mexico) VALUES ('1', 'Si', 'No');
INSERT INTO Nacionalidad (IdNacionalidad, Colombia, Mexico) VALUES ('2', 'No', 'Si');

INSERT INTO Entrar (IdEntrar, IdAtraccion, IdBrazalete) VALUES ('1', '1', '1');
INSERT INTO Entrar (IdEntrar, IdAtraccion, IdBrazalete) VALUES ('2', '2', '2');

