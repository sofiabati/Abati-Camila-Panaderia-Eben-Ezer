DROP DATABASE IF EXISTS eben_ezer;
CREATE DATABASE eben_ezer;

USE eben_ezer;

-- CREACIÓN DE TABLAS

CREATE TABLE eben_ezer.producto(
id_producto INT NOT NULL auto_increment PRIMARY KEY,
nombre varchar(100) NOT NULL,
descripcion varchar(100) NOT NULL,
precio decimal NOT NULL,
unidad_medida varchar(10) NOT NULL);

CREATE TABLE eben_ezer.materia_prima(
id_materia_prima INT NOT NULL auto_increment PRIMARY KEY,
descripcion varchar(100) NOT NULL,
unidad_medida varchar(10) NOT NULL);

CREATE TABLE eben_ezer.proveedor(
id_proveedor INT NOT NULL auto_increment PRIMARY KEY,
cuit int NOT NULL,
razon_social varchar(100) NOT NULL,
encargado varchar(50) NOT NULL);

CREATE TABLE eben_ezer.categoria_personal(
id_categoria INT NOT NULL auto_increment PRIMARY KEY,
desxripcion varchar(50) NOT NULL);

CREATE TABLE eben_ezer.personal(
id_personal INT NOT NULL auto_increment PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
mail varchar(50) NOT NULL unique,
cuil int NOT NULL, 
id_categoria int NOT NULL);

CREATE TABLE eben_ezer.local(
id_local INT NOT NULL auto_increment PRIMARY KEY,
descripcion varchar(100) NOT NULL,
direccion varchar(100) NOT NULL,
telefono int NOT NULL);

CREATE TABLE eben_ezer.cliente(
id_cliente INT NOT NULL auto_increment PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
mail varchar(50) NOT NULL unique);

CREATE TABLE eben_ezer.materia_prima_proveedor(
id_materia_prima_proveedor INT NOT NULL auto_increment PRIMARY KEY,
id_proveedor int NOT NULL,
id_materia_prima int NOT NULL,
cantidad decimal NOT NULL);

CREATE TABLE eben_ezer.producto_materia_prima(
id_producto_materia_prima INT NOT NULL auto_increment PRIMARY KEY,
id_producto int NOT NULL,
id_materia_prima int NOT NULL,
cantidad decimal NOT NULL);

CREATE TABLE eben_ezer.producto_venta(
id_producto_venta INT NOT NULL auto_increment PRIMARY KEY,
id_producto int NOT NULL,
id_venta int NOT NULL,
cantidad decimal NOT NULL);

CREATE TABLE eben_ezer.venta(
id_venta INT NOT NULL auto_increment PRIMARY KEY,
id_producto int NOT NULL,
id_cliente int NOT NULL,
id_personal int NOT NULL,
id_local int NOT NULL,
fecha datetime default(current_timestamp));

-- AGREGA FK

ALTER TABLE eben_ezer.materia_prima_proveedor
ADD CONSTRAINT fk_proveedor_materia_prima
FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor);

ALTER TABLE eben_ezer.materia_prima_proveedor
ADD CONSTRAINT fk_materia_prima_proveedor
FOREIGN KEY(id_materia_prima) REFERENCES materia_prima(id_materia_prima);

ALTER TABLE eben_ezer.producto_materia_prima
ADD CONSTRAINT fk_materia_prima_producto
FOREIGN KEY(id_materia_prima) REFERENCES materia_prima(id_materia_prima);

ALTER TABLE eben_ezer.producto_materia_prima
ADD CONSTRAINT fk_producto_materia_prima
FOREIGN KEY(id_producto) REFERENCES producto(id_producto);

ALTER TABLE eben_ezer.producto_venta
ADD CONSTRAINT fk_producto_venta
FOREIGN KEY(id_producto) REFERENCES producto(id_producto);

ALTER TABLE eben_ezer.producto_venta
ADD CONSTRAINT fk_venta_producto
FOREIGN KEY(id_venta) REFERENCES venta(id_venta);

ALTER TABLE eben_ezer.personal
ADD CONSTRAINT fk_personal_categoria
FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria);

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_producto_venta
FOREIGN KEY(id_producto_venta) REFERENCES producto_venta(id_producto_venta);

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_personal
FOREIGN KEY(id_personal) REFERENCES personal(id_personal);

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_local
FOREIGN KEY(id_local) REFERENCES local(id_local);
