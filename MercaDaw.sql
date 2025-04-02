DROP DATABASE IF EXISTS MercaDaw;
CREATE DATABASE IF NOT EXISTS MercaDaw;
USE MercaDaw;

create table tipo_producto(
id_tipo int primary key auto_increment,
nombre varchar(40)
);

create table productos(
id int primary key auto_increment,
referencia varchar(6),
nombre varchar(40),
descripcion varchar(50),
cantidad int,
precio double,
descuento int,
iva int,
aplicarDto boolean,
id_tipo int,
nombre_tipo varchar(40),
foreign key (id_tipo) references tipo_producto (id_tipo)
);

INSERT INTO tipo_producto (id_tipo, nombre) VALUES (1, 'Electrónica');
INSERT INTO tipo_producto (id_tipo, nombre) VALUES (2, 'Hogar');
INSERT INTO tipo_producto (id_tipo, nombre) VALUES (3, 'Ropa');
INSERT INTO tipo_producto (id_tipo, nombre) VALUES (4, 'Jardinería');
INSERT INTO tipo_producto (id_tipo, nombre) VALUES (5, 'Libros');


INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('ELE001', 'Monitor LED', 'Monitor LED de 24 pulgadas Full HD', 15, 249.99, 5, 19, true, 1);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('HOG001', 'Batidora', 'Batidora de mano con 5 velocidades', 20, 79.99, 10, 19, true, 2);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('ROP001', 'Chaqueta', 'Chaqueta impermeable para hombre', 30, 89.99, 15, 19, true, 3);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('JAR001', 'Cortacésped', 'Cortacésped eléctrico 1500W', 8, 199.99, 0, 19, false, 4);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('LIB001', 'Novela', 'Novela de ciencia ficción bestseller', 50, 24.99, 5, 4, true, 5);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('ELE002', 'Teclado', 'Teclado mecánico retroiluminado', 25, 59.99, 0, 19, false, 1);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('HOG002', 'Cafetera', 'Cafetera automática programable', 12, 129.99, 8, 19, true, 2);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('ROP002', 'Zapatillas', 'Zapatillas deportivas para correr', 40, 69.99, 10, 19, true, 3);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('JAR002', 'Tijeras', 'Tijeras de podar profesionales', 18, 34.99, 0, 19, false, 4);

INSERT INTO productos (referencia, nombre, descripcion, cantidad, precio, descuento, iva, aplicarDto, id_tipo) 
VALUES ('LIB002', 'Diccionario', 'Diccionario enciclopédico ilustrado', 15, 49.99, 5, 4, true, 5);

select * from productos;
