USE libreriaSQL;

-- Insertar registros en la tabla cliente
INSERT INTO cliente (cedula_cliente, nombre_cliente)
VALUES
('123456789', 'Juan Pérez'),
('987654321', 'María González');

-- Insertar registros en la tabla telefono_cliente
INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES
('123456789', '555-1234'),
('987654321', '555-5678');

-- Insertar registros en la tabla libro_cliente
INSERT INTO libro_cliente (ISBN, cedula_cliente)
VALUES
('A1B2C3', '123456789'),
('D4E5F6', '987654321');

-- Insertar registros en la tabla libro
INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES
('A1B2C3', 'Libro 1', '100', 'Editorial A'),
('D4E5F6', 'Libro 2', '200', 'Editorial B');

-- Insertar registros en la tabla editorial
INSERT INTO editorial (nombre_editorial, ciudad, complemento)
VALUES
('Editorial A', 'Ciudad 1', 'Complemento A'),
('Editorial B', 'Ciudad 2', 'Complemento B');

-- Insertar registros en la tabla autor
INSERT INTO autor (id_autor, fecha_nacimiento, nacionalidad)
VALUES
('001', '01/01/1980', 'Español'),
('002', '02/02/1985', 'Mexicano');

-- Insertar registros en la tabla libro_autor
INSERT INTO libro_autor (ISBN_libro, id_autor)
VALUES
('A1B2C3', '001'),
('D4E5F6', '002');