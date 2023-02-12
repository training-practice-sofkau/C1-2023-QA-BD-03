-- Creación de la BD de parque norte 
CREATE DATABASE parque_norte; 

-- Indica cuál será la BD a la cual se le aplicarán las siguientes consultas: 
USE parque_norte; 

-- Creación de la tabla empleado técnico 
CREATE TABLE tb_empleado_tecnico (
id_tecnico VARCHAR(10) NOT NULL, 
nombre_tecnico VARCHAR(45) NOT NULL,
telefono VARCHAR(15) NOT NULL,
especialidad VARCHAR(30) NOT NULL, 
PRIMARY KEY(id_tecnico)
);

-- Creación de la tabla estado 
CREATE TABLE tb_estado (
id_estado VARCHAR(10) NOT NULL, 
nombre_estado VARCHAR(15) NOT NULL, 
PRIMARY KEY(id_estado)
);

-- Creación de la tabla brazalete 
CREATE TABLE tb_brazalete (
id_brazalete VARCHAR(10) NOT NULL, 
tipo_brazalete VARCHAR(30) NOT NULL, 
precio VARCHAR(15) NOT NULL,
PRIMARY KEY(id_brazalete)
); 

-- Creación de la tabla proveedor 
CREATE TABLE tb_proveedor (
id_proveedor VARCHAR(10) NOT NULL, 
nombre VARCHAR(45) NOT NULL, 
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(15) NOT NULL, 
correo VARCHAR(30) NOT NULL,
tipo VARCHAR(20) NOT NULL,
PRIMARY KEY(id_proveedor)
);

-- Creación de la tabla atracción 
CREATE TABLE tb_atraccion (
id_atraccion VARCHAR(10) NOT NULL, 
nombre_atraccion VARCHAR(45) NOT NULL, 
altura_maxima VARCHAR(10) NOT NULL,
altura_minimo VARCHAR(10) NOT NULL,
fabricante VARCHAR(30) NOT NULL,
id_proveedor VARCHAR(10) NOT NULL,
PRIMARY KEY(id_atraccion),
FOREIGN KEY(id_proveedor) REFERENCES tb_proveedor (id_proveedor)
);

-- Creación de la tabla orden servicio 
CREATE TABLE tb_orden_servicio (
id_orden_servicio VARCHAR(10) NOT NULL, 
numero_orden VARCHAR(15) NOT NULL,
descripcion VARCHAR(200) NOT NULL, 
fecha_emision VARCHAR(20) NOT NULL, 
fecha_cierre VARCHAR(20) NOT NULL, 
duracion VARCHAR(10) NOT NULL,
id_tecnico VARCHAR(10) NOT NULL, 
id_estado VARCHAR(10) NOT NULL, 
PRIMARY KEY(id_orden_servicio), 
FOREIGN KEY(id_tecnico) REFERENCES tb_empleado_tecnico (id_tecnico),
FOREIGN KEY(id_estado) REFERENCES tb_estado (id_estado)
); 

-- Creación de la tabla empleado operador 
CREATE TABLE tb_empleado_operador (
id_operador VARCHAR(10) NOT NULL, 
nombre_operador VARCHAR(45) NOT NULL, 
telefono VARCHAR(15) NOT NULL, 
area VARCHAR(25) NOT NULL, 
id_atraccion VARCHAR(10) NOT NULL, 
PRIMARY KEY(id_operador), 
FOREIGN KEY(id_atraccion) REFERENCES tb_atraccion (id_atraccion)
);

-- Creación de la tabla cliente 
CREATE TABLE tb_cliente (
id_cliente VARCHAR(10) NOT NULL,
nombre_cliente VARCHAR(45) NOT NULL, 
tipo_identificacion VARCHAR(30) NOT NULL,
altura VARCHAR(10) NOT NULL,
id_brazalete VARCHAR(10) NOT NULL,
PRIMARY KEY (id_cliente), 
FOREIGN KEY(id_brazalete) REFERENCES tb_brazalete (id_brazalete)
);

-- Creación de la tabla cliente teléfono 
CREATE TABLE tb_cliente_telefono (
id_cliente_telefono VARCHAR(10) NOT NULL, 
telefono VARCHAR(15) NOT NULL,
PRIMARY KEY(id_cliente_telefono, telefono),
FOREIGN KEY (id_cliente_telefono) REFERENCES tb_cliente (id_cliente)
);

-- Creación de la tabla detalle orden servicio atracción 
CREATE TABLE dll_orden_servicio_atraccion (
id_orden_servicio VARCHAR(10) NOT NULL, 
id_atraccion VARCHAR(10) NOT NULL, 
FOREIGN KEY(id_orden_servicio) REFERENCES tb_orden_servicio (id_orden_servicio),
FOREIGN KEY(id_atraccion) REFERENCES tb_atraccion (id_atraccion)
);

-- Creación de la tabla detalle atracción brazalete 
CREATE TABLE dll_atraccion_brazalete (
id_atraccion VARCHAR(10) NOT NULL, 
id_brazalete VARCHAR(10) NOT NULL, 
FOREIGN KEY(id_atraccion) REFERENCES tb_atraccion (id_atraccion),
FOREIGN KEY(id_brazalete) REFERENCES tb_brazalete (id_brazalete)
);

-- Se agregan 3 registros en cada tabla 
-- Insertar datos en la tabla empleado técnico 
INSERT INTO tb_empleado_tecnico (id_tecnico, nombre_tecnico, telefono, especialidad)
VALUES ('421895477', 'Alfonso López Morales', '3146587964', 'electricista'), ('43178149', 'Jairo Monsalve', '3128746985', 'logistico'), ('415987159', 'Camila Pérez Castro', '3194587845', 'mecánico'); 

-- Insertar datos en la tabla estado 
INSERT INTO tb_estado (id_estado, nombre_estado)
VALUES ('1', 'activo'), ('2', 'inactivo'), ('3', 'activo');

-- Insertar datos a la tabla brazalete 
INSERT INTO tb_brazalete (id_brazalete, tipo_brazalete, precio)
VALUES ('1', 'Brazalete Extremo', '38700'), ('2', 'Brazalete Fusión', '29500'), ('3', 'Brazalete Aventura', '25500');

-- Insertar datos en la tabla proveedor 
INSERT INTO tb_proveedor (id_proveedor, nombre, direccion, telefono, correo, tipo)
VALUES ('46844', 'Alejandro Serna', 'Cll 43 #78-75', '3214879654', 'alejo@gmail.com', 'nacional'), ('45978', 'Jorge Monsalve Cardona', 'Cra 79 #18-45', '31789654789', 'jorge@gmail.com', 'internacional'), ('71264', 'Adriana Rendón Ramírez', 'Cll 19 #19-37', '3187594736', 'adri@gmail.com', 'nacional');

-- Insertar datos en la tabla atracción 
INSERT INTO tb_atraccion (id_atraccion, nombre_atraccion, altura_maxima, altura_minimo, fabricante, id_proveedor)
VALUES ('458', 'Invasión', '1,25 m', '80 cm', 'Materiales diversión', '46844'), ('397', 'Mini Crash', '1,25 m', '80 cm', 'Pintu', '45978'), ('674', 'Gas Station', '1,25 m', '80 cm', 'Pintu', '71264'); 

-- Insertar datos en la tabla orden servicio 
INSERT INTO tb_orden_servicio (id_orden_servicio, numero_orden, descripcion, fecha_emision, fecha_cierre, duracion, id_tecnico, id_estado)
VALUES ('1', '16445', 'mantenimiento', '12/12/2022', '03/01/2023', '2 horas', '421895477', '1'), ('2', '69425', 'mantenimiento', '11/10/2022', '03/11/2023', '3 horas', '43178149', '2'), ('3', '41978', 'mantenimiento', '28/12/2022', '02/01/2023', '1 hora', '415987159', '3');

-- Insertar datos en la tabla operador
INSERT INTO tb_empleado_operador (id_operador, nombre_operador, telefono, area, id_atraccion)
VALUES ('43254789', 'Juan Cardona Taborda', '3115785495', 'vigilancia', '458'), ('48954781', 'Cristina Pérez Morales', '3749862475', 'administrativa', '397'), ('49125470', 'Angela Agudelo Monsalve', '3748956412', 'administrativa', '674');

-- Insertar datos en la tabla cliente 
INSERT INTO tb_cliente (id_cliente, nombre_cliente, tipo_identificacion, altura, id_brazalete)
VALUES ('65147301', 'Adriana Hurtado Pérez', 'CC', '1.60', '1'), ('74869541', 'Mónica Marín Agudelo', 'CC', '1.75', '2'), ('67485145', 'Sara Loaiza Rendón', 'CC', '1.58', '3');

-- Insertar datos en la tabla cliente teléfono 
INSERT INTO tb_cliente_telefono (id_cliente_telefono, telefono)
VALUES ('65147301', '32048725478'), ('74869541', '3107314502'), ('67485145', '3114520397'); 

-- Insertar datos en la tabla detalle orden servicio atracción 
INSERT INTO dll_orden_servicio_atraccion (id_orden_servicio, id_atraccion)
VALUES ('1', '458'), ('2', '397'), ('3', '674');

-- Insertar datos de la tabla detalle atracción brazalete 
INSERT INTO dll_atraccion_brazalete (id_atraccion, id_brazalete)
VALUES ('458','1'), ('397','2'), ('674','3'); 

-- Mostrar información de todas las tablas 
SELECT * 
FROM tb_empleado_tecnico;

SELECT * 
FROM tb_estado; 

SELECT *
FROM tb_brazalete; 

SELECT * 
FROM tb_proveedor;

SELECT * 
FROM tb_atraccion; 

SELECT * 
FROM tb_orden_servicio; 

SELECT * 
FROM tb_empleado_operador; 

SELECT * 
FROM tb_cliente; 

SELECT * 
FROM tb_cliente_telefono;

SELECT * 
FROM dll_orden_servicio_atraccion;

SELECT *
FROM dll_atraccion_brazalete;
