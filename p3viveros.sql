/*  Comandos usados para crear 10 bases de datos: 
      1. Viveros
      2. Zona
      3. Empleado
      4. DiaProducido
      5. Cliente
      6. DiaTrabajado
      7. Producto
      8. CompraMensual
      9. Bonificacion
      10.BonificacionCliente

    Modo de uso:
      1. sudo su postgres
      2. psql
      \i p3viveros.sql
*/

/* Borrar todas las tablas en el esquema 'public' */
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/* Borra las tablas si existen */
DROP TABLE IF EXISTS Vivero;
DROP TABLE IF EXISTS Zona;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS DiaProducido;
DROP TABLE IF EXISTS Cliente;

DROP TABLE IF EXISTS DiaTrabajado;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS CompraMensual;
DROP TABLE IF EXISTS Bonificacion;
DROP TABLE IF EXISTS BonificacionCliente;


/* Ahora creamos las 10 tablas que necesita esta base de datos */

/* Creamos la tabla 1 Vivero */
CREATE TABLE Vivero (
    id_vivero SERIAL PRIMARY KEY,
    nombre_vivero VARCHAR(50) NOT NULL
);

/* Creamos la tabla 2 Zona */
CREATE TABLE Zona (
    id_zona SERIAL PRIMARY KEY,
    id_vivero INT NOT NULL REFERENCES Vivero(id_vivero),
    nombre_zona VARCHAR(20) NOT NULL,
    latitud NUMERIC(7, 5) NOT NULL,
    longitud NUMERIC(7, 5) NOT NULL,
    fecha_inicio DATE NOT NULL
);

/* Creamos la tabla 3 Empleado */
CREATE TABLE Empleado (
    id_empleado VARCHAR(9) PRIMARY KEY,
    id_zona INT NOT NULL REFERENCES Zona(id_zona),
    nombre_empleado VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    epoca_ano VARCHAR(9) NOT NULL
);

/* Creamos la tabla 4 DiaProducido */
CREATE TABLE DiaProducido (
    fecha DATE,
    id_zona INT NOT NULL REFERENCES Zona(id_zona),
    productividad NUMERIC(5, 2) NOT NULL CHECK(productividad <= 100.00 AND productividad >= 0.00),
    PRIMARY KEY (fecha, id_zona)
);

/* Creamos la tabla 5 Cliente */
CREATE TABLE Cliente (
    id_cliente VARCHAR(9) PRIMARY KEY,
    id_empleado VARCHAR(9) NOT NULL REFERENCES Empleado(id_empleado),
    nombre_cliente VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    vip BOOLEAN NOT NULL
);

/* Creamos la tabla 6 DiaTrabajado */
CREATE TABLE DiaTrabajado (
    fecha DATE,
    id_empleado VARCHAR(9) NOT NULL REFERENCES Empleado(id_empleado),
    productividad NUMERIC(5, 2) NOT NULL CHECK(productividad <= 100.00 AND productividad >= 0.00),
    PRIMARY KEY(fecha, id_empleado)
);

/* Creamos la tabla 7 Producto */
CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    id_zona INT NOT NULL REFERENCES Zona(id_zona),
    id_cliente VARCHAR(9) NOT NULL REFERENCES Cliente(id_cliente),
    nombre_producto VARCHAR(50) NOT NULL,
    stock INT NOT NULL CHECK(stock >= 0)
);

/* Creamos la tabla 8 CompraMensual */
CREATE TABLE CompraMensual (
    fecha DATE,
    id_cliente VARCHAR(9) NOT NULL REFERENCES Cliente(id_cliente),
    num_compras INT NOT NULL CHECK(num_compras >= 0),
    PRIMARY KEY (fecha, id_cliente)
);

/* Creamos la tabla 9 Bonificacion */
CREATE TABLE Bonificacion (
    id_bonificacion SERIAL PRIMARY KEY,
    descripcion TEXT
);

/* Creamos la tabla 10 BonificacionCliente */
CREATE TABLE BonificacionCliente (
    id_bonificacion_cliente SERIAL,
    id_cliente VARCHAR(9) NOT NULL REFERENCES Cliente(id_cliente),
    id_bonificacion INT NOT NULL REFERENCES Bonificacion(id_bonificacion),
    PRIMARY KEY (id_bonificacion_cliente, id_cliente, id_bonificacion)
);




/* Ahora metemos 5 filas por cada una de las 10 tablas */
/* Introducimos las 5 filas de la tabla 1 Vivero */
INSERT INTO Vivero (nombre_vivero) VALUES 
  ('La Laguna'),
  ('Santa Cruz'),
  ('Tacoronte'),
  ('Puerto De La Cruz'),
  ('El Médano');

/* Introducimos las 5 filas de la tabla 2 Zona */
INSERT INTO Zona (id_vivero, nombre_zona, latitud, longitud, fecha_inicio) VALUES
(1, 'Norte', 12.34567, 23.45678, '2023-05-01'),
(1, 'Oeste', 12.34567, 23.45678, '2022-02-02'),
(2, 'Sur', 12.34567, 23.45678, '2021-11-03'),
(3, 'Este', 12.34567, 23.45678, '2020-09-04'),
(4, 'Noreste', 12.34567, 23.45678, '2012-06-05');

/* Introducimos las 5 filas de la tabla 3 Empleado */
INSERT INTO Empleado (id_empleado, id_zona, nombre_empleado, apellido, epoca_ano) VALUES
('12345678G', 1, 'Juan', 'Pérez', 'Primavera'),
('23456789H', 1, 'María', 'González', 'Otoño'),
('34567890K', 2, 'Carlos', 'López', 'Verano'),
('45678901L', 3, 'Ana', 'Martínez', 'Invierno'),
('56789012S', 4, 'Pedro', 'Rodríguez', 'Primavera');

/* Introducimos las 5 filas de la tabla 4 DiaProducido */
INSERT INTO DiaProducido (fecha, id_zona, productividad) VALUES
('2023-01-01', 1, 80.50),
('2023-01-02', 1, 75.20),
('2023-01-03', 2, 85.70),
('2023-01-04', 3, 92.30),
('2023-01-05', 4, 78.90);

/* Introducimos las 5 filas de la tabla 5 Cliente */
INSERT INTO Cliente (id_cliente, id_empleado, nombre_cliente, apellido, vip) VALUES
('12345678A', '12345678G', 'Luis', 'Gómez', TRUE),
('23456789B', '23456789H', 'Elena', 'Hernández', FALSE),
('34567890C', '34567890K', 'Javier', 'Fernández', TRUE),
('45678901D', '45678901L', 'Laura', 'Díaz', FALSE),
('56789012E', '56789012S', 'Miguel', 'Sánchez', TRUE);

/* Introducimos las 5 filas de la tabla 6 DiaTrabajado */
INSERT INTO DiaTrabajado (fecha, id_empleado, productividad) VALUES
('2023-01-01', '12345678G', 90.50),
('2023-01-02', '23456789H', 85.20),
('2023-01-03', '34567890K', 92.70),
('2023-01-04', '45678901L', 88.30),
('2023-01-05', '56789012S', 94.90);

/* Introducimos las 5 filas de la tabla 7 Producto */
INSERT INTO Producto (id_zona, id_cliente, nombre_producto, stock) VALUES
(1, '12345678A', 'Manzana', 100),
(2, '23456789B', 'Zanahoria', 150),
(3, '34567890C', 'Brocoli', 200),
(4, '45678901D', 'Patata', 120),
(1, '56789012E', 'Pera', 80);

/* Introducimos las 5 filas de la tabla 8 CompraMensual */
INSERT INTO CompraMensual (fecha, id_cliente, num_compras) VALUES
('2023-01-01', '12345678A', 5),
('2023-02-01', '23456789B', 3),
('2023-03-01', '34567890C', 8),
('2023-04-01', '45678901D', 6),
('2023-05-01', '56789012E', 7);

/* Introducimos las 5 filas de la tabla 9 Bonificacion */
INSERT INTO Bonificacion (descripcion) VALUES
('Descuento del 10% en próxima compra'),
('Envío gratuito en la siguiente compra'),
('Descuento especial para clientes VIP'),
('Regalo sorpresa en la próxima compra'),
('Puntos de recompensa para canjear en futuras compras');

/* Introducimos las 5 filas de la tabla 10 BonificacionCliente */
INSERT INTO BonificacionCliente (id_cliente, id_bonificacion) VALUES
('12345678A', 1),
('23456789B', 2),
('34567890C', 3),
('45678901D', 4),
('56789012E', 5);


/* Ahora mostramos las 10 tablas */
/* Select tabla 1 Vivero */
SELECT * FROM Vivero;

/* Select tabla 2 Zona */
SELECT * FROM Zona;

/* Select tabla 3 Empleado */
SELECT * FROM Empleado;

/* Select tabla 4 DiaProducido */
SELECT * FROM DiaProducido;

/* Select tabla 5 Cliente */
SELECT * FROM Cliente;

/* Select tabla 6 DiaTrabajado */
SELECT * FROM DiaTrabajado;

/* Select tabla 7 Producto */
SELECT * FROM Producto;

/* Select tabla 8 CompraMensual */
SELECT * FROM CompraMensual;

/* Select tabla 9 Bonificacion */
SELECT * FROM Bonificacion;

/* Select tabla 10 BonificacionCliente */
SELECT * FROM BonificacionCliente;
