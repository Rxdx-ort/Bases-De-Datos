/*
===BASE DE DATOS BDG2===
Realizar una base de datos con dos tablas para ejemplificar el uso de SQL server
*/
--SQL -LDD
--Construir la base de datos bdg2
CREATE DATABASE bdg2;
--Utilizar la base de datos
USE bdg2;
CREATE TABLE categoria(
 idcategoria int not null identity(1,1),
 categorianombre nvarchar (20) not null,
 constraint pk_categoria
 primary key (idcategoria)
);
CREATE TABLE producto(
idproducto int not null,
productonombre nvarchar(20) not null,
precio money not null,
existencia int not null,
categoriaid int,
constraint pk_producto
primary key (idproducto),
constraint fk_producto_categoria
foreign key (categoriaid)
references categoria(idcategoria)
);
--SQL-LMD
--Agregar registros
INSERT INTO categoria(categorianombre)
VALUES ('Lacteos');
INSERT INTO categoria(categorianombre)
VALUES ('Carnes frías'),('Vinos y licores');
--Seleccionar los datos de la categoria
SELECT*
FROM categoria;

SELECT categorianombre
FROM categoria
WHERE categorianombre= 'Vinos y licores';