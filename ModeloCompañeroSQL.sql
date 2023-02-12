CREATE DATABASE taller3_actividad2;
use taller3_actividad2;

create table Cliente(
Numero_identificacion varchar(100) primary key,
Nombre_cliente varchar(100),
Telefono_cliente varchar(45),
Correo_cliente varchar(50)
);

create table Brazalete(
ID varchar(10) primary key,
Costo varchar(150),
Tipo varchar(45),
Numero_identificacion_cliente varchar(50),
foreign key(Numero_identificacion_cliente) references Cliente(Numero_identificacion) 
);

create table Brazalete_atraccion(
ID_brazalete varchar(10) primary key,
ID_atraccion_brazalete varchar(100),
foreign key(ID_brazalete) references Brazalete(ID),
foreign key(ID_atraccion_brazalete) references Atraccion(ID_atraccion) 
);


create table Tecnico(
Licencia_profesional varchar(10) primary key,
Telefono_tecnico varchar(150),
Nombre_tecnico varchar(45),
Especialidad varchar(50),
Correo_tecnico varchar(50)
);

create table orden_servicio_tecnico(
Licencia_profesional_tecnico varchar(10) primary key,
Numero_orden_tecnico varchar(50),
foreign key (Licencia_profesional_tecnico) references Tecnico(Licencia_profesional),
foreign key (Numero_orden_tecnico) references Orden_servicio(Numero_orden)
);


create table Orden_servicio(
Numero_orden	 varchar(10) primary key,
Fecha_orden varchar(10),
Duracion varchar(50),
ID_atraccion_orden varchar(100),
foreign key (ID_atraccion_orden) references Atraccion(ID_atraccion)
);

create table Atraccion(
ID_atraccion varchar(100) primary key,
Nombre_atraccion varchar(45),
Capacidad_atraccion varchar(50),
Limite_estatura varchar(50),
ID_proveedor_atraccion varchar(50),
foreign key (ID_proveedor_atraccion) references Proveedor(ID_proveedor)
);

create table Proveedor(
ID_proveedor varchar(100) primary key,
Correo_proveedor varchar(45),
Telefono_proveedor varchar(50),
Direccion_proveedor varchar(50)
);

create table Operador(
ID_operador varchar(100)primary key,
Nombre_operador varchar(45),
Correo_operador varchar(45),
Telefono_operador varchar(45),
ID_atraccion_operador varchar(100),
foreign key (ID_atraccion_operador) references Atraccion(ID_atraccion)
);
