CREATE SCHEMA `segundaActividad`;
CREATE TABLE `segundaActividad`.`Proveedor` (
	CódigoProveedor varchar(20) primary key,
    NombreProveedor varchar(255),
    Dirección varchar(255),
    Email varchar(127),
    Origen varchar(255)
);
CREATE TABLE `segundaActividad`.`TeléfonoProveedor` (
	CódigoProveedorT varchar(20),
    TeléfonoProveedor varchar(15),
    primary key(CódigoProveedorT, TeléfonoProveedor),
    foreign key(CódigoProveedorT) references Proveedor(CódigoProveedor)
);
CREATE TABLE `segundaActividad`.`Brazalete` (
	IDBrazalete varchar(20) primary key,
    Tipo varchar(255),
    FechaCompra varchar(511),
    Precio float(15)
);
CREATE TABLE `segundaActividad`.`Cliente` (
	CC varchar(20) primary key,
    NombreCliente varchar(255),
    FechaNacimiento varchar(511),
    IDBrazaleteCliente varchar(20),
    foreign key(IDBrazaleteCliente) references Brazalete(IDBrazalete)
);
CREATE TABLE `segundaActividad`.`Atracción` (
	NombreAtracción varchar(255) primary key,
    DescripciónAtracción varchar(511),
    FechaAdquisición varchar(511),
    IDBrazaleteAtracción varchar(20),
    foreign key(IDBrazaleteAtracción) references Brazalete(IDBrazalete),
    CódigoProveedorAtracción varchar(20),
    foreign key(CódigoProveedorAtracción) references Proveedor(CódigoProveedor)
);
CREATE TABLE `segundaActividad`.`Operador` (
	CódigoEmpleado varchar(20) primary key,
    NombreEmpleado varchar(255),
    NombreAtracciónOperador varchar(255),
    foreign key(NombreAtracciónOperador) references Atracción(NombreAtracción)
);
CREATE TABLE `segundaActividad`.`TeléfonoOperador` (
	CódigoOperadorT varchar(20),
    TeléfonoOperador varchar(15),
    primary key(CódigoOperadorT, TeléfonoOperador),
    foreign key(CódigoOperadorT) references Operador(CódigoEmpleado)
);
CREATE TABLE `segundaActividad`.`OrdenDeServicio` (
	ID varchar(20) primary key,
    FechaInicio varchar(511),
    FechaFin varchar(511),
    DescripciónOrden varchar(511),
    NombreAtracciónOrden varchar(255),
    foreign key(NombreAtracciónOrden) references Atracción(NombreAtracción)
);
CREATE TABLE `segundaActividad`.`Técnico` (
	CódigoTécnico varchar(20) primary key,
    NombreTécnico varchar(255),
    Especialidad varchar(255),
    IDServicio varchar(20),
    foreign key(IDServicio) references OrdenDeServicio(ID)
);
CREATE TABLE `segundaActividad`.`Celular` (
	CódigoTécnicoC varchar(20),
    Celular varchar(15),
    primary key(CódigoTécnicoC, Celular),
    foreign key(CódigoTécnicoC) references Técnico(CódigoTécnico)
);