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
VALUES ('Carnes fr�as'),('Vinos y licores');
--Seleccionar los datos de la categoria
SELECT*
FROM�categoria;

SELECT categorianombre
FROM categoria
WHERE categorianombre= 'Vinos y licores';

SELECT categorianombre
FROM categoria
WHERE idcategoria in (1,3);

SELECT categorianombre
FROM categoria
WHERE idcategoria= 1 or idcategoria=3;

UPDATE categoria
SET categorianombre= 'Carnes Rojas'
WHERE idcategoria=2;

SELECT *
FROM categoria;

DELETE FROM categoria
WHERE idcategoria=2;

INSERT INTO producto
VALUES (1,'Rancho viejo',3450.5, 50, 3);


INSERT INTO producto(productonombre,existencia,precio,categoriaid,idproducto)
VALUES ('Don julio', 456,43.2,3,2),
	   ('Leche nido',567,567.4,1,3);

 SELECT*
FROM�producto;