--INNER JOIN 
SELECT r.Nombre, r.Jefe, r.Cuota, r.Ventas,r.Fecha_Contrato,
o.Ciudad
FROM Representantes AS r
INNER JOIN 
OFICINAS AS o
ON o.Oficina=r.Oficina_Rep
WHERE (o.Ciudad in ( 'Navarra','Castellón','Daimiel')) 
OR (r.Jefe is NULL AND   r.Fecha_Contrato>='1998-06-01' ) OR 
( r.ventas >r.Cuota AND NOT r.Ventas>600000)
ORDER BY r.Ventas DESC;

-----------------------------------------------------------------
SELECT p.Num_Pedido AS [Numero Pedido], 
p.Importe AS [Importe],
c.Empresa AS [Nombre],
c.Limite_Credito AS [Limite Credito]
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON c.Num_Cli=p.Cliente
WHERE Limite_Credito BETWEEN 25000 AND 50000
AND Empresa LIKE 'A%'
ORDER BY Importe DESC
-----------------------------------------------------------------
USE NORTHWND;
--Seleccionar los productos incluyendo su categoria y el provvedor que lo surte
SELECT  ProductName,UnitPrice, UnitsInStock,CategoryID,SupplierID
FROM Products --Consulta simple

SELECT  ProductID AS [Numero de prducto]
,ProductName AS [Nombre de Producto],
UnitPrice AS [Pecio del producto], 
UnitsInStock AS [Existencia],
CategoryID AS [Categoria],
SupplierID AS [Proveedor]
FROM Products

SELECT *
FROM Products
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID


SELECT pr.ProductID AS [Numero de prducto]
, pr.ProductName AS [Nombre de Producto]
,pr.UnitPrice AS [Pecio del Producto]
,pr.UnitsInStock AS [Existencia]
,ca.CategoryName AS [Categoria]
,su.CompanyName AS [Proveedor]
FROM Products AS [pr]
INNER JOIN Categories AS [ca]
ON pr.CategoryID=ca.CategoryID
INNER JOIN Suppliers AS [su]
ON pr.SupplierID=su.SupplierID

----------------------------------------------------------------------------------------------
USE pruebajoins;
SELECT*
FROM Productos;

SELECT*
FROM Categorias;

DELETE Categorias WHERE idcategoria=5;
--Inner join
SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio
FROM Categorias AS c
INNER JOIN Productos AS p
ON c.idcategoria=p.idcategoria

--Left join
SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio, p.idproducto
FROM Categorias AS c
LEFT OUTER JOIN Productos AS p
ON c.idcategoria=p.idcategoria

---Mostrarv todas las categorias 
SELECT c.idcategoria,c.Nombre AS [Categoria],
p.Nombre AS [Producto],p.Precio, p.idproducto
FROM Categorias AS c
LEFT  JOIN Productos AS p
ON c.idcategoria=p.idcategoria
WHERE p.idproducto IS NULL;

SELECT c.idcategoria,c.Nombre AS [Categoria],
p.Nombre AS [Producto],p.Precio, p.idproducto
FROM Productos AS p
 FULL JOIN Categorias AS c
ON c.idcategoria=p.idcategoria

USE BDEJEMPLO2
--Listar las oficinas y los nombres y puestos de sus jefes

SELECT r.Nombre,r.Puesto,o.Oficina,r.Num_Empl
FROM Oficinas AS [o]
INNER JOIN Representantes AS r
ON r.Num_Empl=o.Jef

-------------------------
--Listar las oficinas y los nombres y los puestos de sus jefes con el objetivo superior a 600,000
SELECT r.Nombre,r.Puesto,o.Oficina,o.Objetivo,o.Ciudad
FROM Oficinas AS [o]
INNER JOIN Representantes AS r
ON r.Num_Empl=o.Jef
WHERE o.Objetivo>=600000
------------
--Listar todos los pedidos mostrando el numero de pedidos 
--el importe y la descripcion de los productos

SELECT p.Num_Pedido,p.Importe, pr.Descripcion
FROM Productos AS pr
INNER JOIN Pedidos AS p
ON pr.Id_producto =p.Producto AND pr.Id_fab=p.Fab


-----------------
--Listar los pedidos superiores a 25000 incluyendo el numero de pedido
--importe el nombre del representante que tomo la nota del pedido y el nombre del cliente
SELECT p.Num_Pedido,p.Importe, r.Nombre,c.Empresa
FROM Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl=p.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli=p.Cliente
WHERE p.Importe>25000

--------------------
--Listar los pediudos superiores a 25000, mostrando el numero de pedido
 --el nombre del cliente que lo encarga y el nombre del representante 
 --asignado al cliente
 SELECT p.Num_Pedido AS [Número de pedido],
		c.Empresa AS [Nombre del cliente], 
		r.Nombre AS [Nombre del representante]
 FROM Pedidos AS p
 INNER JOIN Representantes as r
 ON r.Num_Empl = p.Rep
 INNER JOIN Clientes as c
 ON p.Cliente = c.Num_Cli
 WHERE p.Importe>25000
 -----------------------
 --Lista los pedidos superiores a 25000, mostrando el numero de pedido
 --el nombre del cliente que lo encargo, el representante del cliente y 
 --la oficina en la que trabaja el representante
  SELECT p.Num_Pedido AS [Número de pedido],
		c.Empresa AS [Nombre del cliente], 
		r.Nombre AS [Nombre del representante],
		o.Oficina AS [Oficina del representante]
 FROM Pedidos AS p
 INNER JOIN Clientes as c
 ON p.Cliente = c.Num_Cli
 INNER JOIN Representantes as r
 ON r.Num_Empl = p.Rep
 INNER JOIN Oficinas AS o
 ON o.Oficina=r.Oficina_Rep
 WHERE p.Importe>25000
SELECT
*FROM Clientes
----------------------------
--CONSULTAS DE AGREGADO (Max, Min,AVG, COUNT(*),COUNT(CAMPO))

--¿Cuál es el rendimiento medio de la cuota de los representantes?

SELECT AVG (cuota) AS [Rendimiento medio de las coutas]
FROM Representantes

--Cual es la cuota mayor
SELECT MAX (cuota) AS [Couta Mayor]
FROM Representantes

---Cual es la couta menor}
SELECT MIN (cuota) AS [Couta Menor]
FROM Representantes

--cual es la couta menor y la cuta mayor
SELECT MIN (cuota) AS [Couta Menor],
 MIN (cuota) AS [Couta Menor]
FROM Representantes

--Seleccionar la fecha de pedido mas antigua

SELECT MIN (Fecha_Pedido) AS [Antigua]
FROM Pedidos

--Calcular el rendimiento en ventas de los representantes
SELECT 100 * (VENTAS/CUOTA) AS [Rendimiento de Ventas]
FROM Representantes
WHERE 100* (VENTAS/CUOTA) IS NOT NULL

--CALCULAR EL RENDIMIENTO MEDIO EN VENTAS
SELECT AVG ( 100 *  (VENTAS/CUOTA)) AS [Rendimiento de Ventas]
FROM Representantes
WHERE 100* (VENTAS/CUOTA) IS NOT NULL

--CUALES SON LAS COUTAS Y VENTAS TOTALES DE TODOS LOS RERPRESENTANTES
SELECT SUM (Cuota), SUM( Ventas)
FROM Representantes

--CUAL ES EL IMPORTA TOTAL DE BRUNO ARTEAGA
SELECT r.Nombre ,SUM( p.Importe) AS [Total]
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl=p.Rep
WHERE r.Nombre='Bruno Arteaga'
Group by r.Nombre
--------TODOS LOS REPRESENTANTES
SELECT r.Nombre ,SUM( p.Importe) AS [Total]
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl=p.Rep
Group by r.Nombre

--Cuantos representantes exceden su cuota (count)
SELECT count (*), count (cuota)
FROM  Representantes
WHERE Ventas>Cuota;

--cuantos pedidos de mas 25000 hay
SELECT Count (Num_Pedido)
FROM Pedidos
WHERE Importe>25000

--Cuantos puestos tiene los representantes
SELECT  Count ( DISTINCT Puesto)
FROM Representantes

---Cula es el importe medio de los pedidos de cada uno
--de los representantes
SELECT r.Nombre ,AVG( p.Importe) AS [Total]
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl=p.Rep
Group by r.Nombre

---Especifico
SELECT r.Nombre ,AVG( p.Importe) AS [Total]
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON r.Num_Empl=p.Rep
WHERE Nombre='Tomás Saz', 'María Jiménez','Pablo Cruz')
Group by r.Nombre
-------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_pruebaconsulta
@fechaInicial date,
@fechaFinal date
AS
BEGIN 
SELECT Nombre, AVG(Importe) AS [Importe Medio]
From Pedidos AS p
INNER JOIN
Representantes AS r
ON P.Rep=R.Num_Empl
WHERE Fecha_Pedido between @fechaInicial and @fechaFinal
Group by Nombre
ORDER BY Nombre
END 

exec sp_pruebaconsulta '1990-01-01','1990-04-06'

--Cual es el rango de las coutas asignadas de cada oficina(ciudad)
SELECT o.Ciudad,MAX(cuota) AS [Maximo Cuota], MIN (cuota) [MINIMO Cuota], (MAX (cuota) - MIN (cuota)) AS [Rango]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl=o.Jef
Group by o.Ciudad, r.Nombre
ORDER BY o.Ciudad;
go

USE BDEJEMPLO2

SELECT 
* FROM Pedidos

USE NORTHWND;


/* 
1) Seleccionar el ingreso total por cliente en 1997 y ordenado por el ingreso de forma descendente
*/

SELECT c.CompanyName AS [Cliente]
,SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Ingreso]
FROM
[Order Details] AS od
	INNER JOIN
Orders AS o 
ON o.OrderID = od.OrderID
	INNER JOIN
Customers AS c
ON O.CustomerID = c.CustomerID
WHERE YEAR (o.OrderDate) = 1997
GROUP BY c.CompanyName;

SELECT c.CompanyName AS [Cliente]
,SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Ingreso]
FROM
[Order Details] AS od
	INNER JOIN
Orders AS o 
ON o.OrderID = od.OrderID
	INNER JOIN
Customers AS c
ON O.CustomerID = c.CustomerID
WHERE DATEPART (yy, o.OrderDate) = 1997
GROUP BY c.CompanyName;

SELECT c.CompanyName AS [Cliente]
,ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)),2) AS [Ingreso]
FROM
[Order Details] AS od
	INNER JOIN
Orders AS o 
ON o.OrderID = od.OrderID
	INNER JOIN
Customers AS c
ON O.CustomerID = c.CustomerID
WHERE DATEPART (yy, o.OrderDate) = 1997
GROUP BY c.CompanyName;

SELECT  TOP 10 c.CompanyName AS [Cliente]
,ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)),2) AS [Ingreso]
FROM
[Order Details] AS od
	INNER JOIN
Orders AS o 
ON o.OrderID = od.OrderID
	INNER JOIN
Customers AS c
ON O.CustomerID = c.CustomerID
WHERE DATEPART (yy, o.OrderDate) = 1997
GROUP BY c.CompanyName
ORDER BY [Ingreso] DESC;
GO

SELECT * FROM [Order Details]

/*
 2) SELCCIONAR LOS PRODUCTOS POR CATEGORIA MAS VENDIDOS (UNIDADES),
	ENVIADOS A ALEMANIA ORDENADOS POR CATEGORIA ASC Y DENTRO DE CATEGORIA 
	POR UNIDAD DE FORMA DESCENDENTE
*/

SELECT c.CategoryName AS [Categoria],
p.ProductName AS [Producto]
	,SUM (od.Quantity) AS [Unidades]
FROM [Order Details] AS od
INNER JOIN
Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN 
Products AS p
ON P.ProductID = od.ProductID
INNER JOIN
Categories AS c
ON c.CategoryID = p.CategoryID
WHERE o.ShipCountry = 'Germany'
GROUP BY c.CategoryName, p.ProductName
ORDER BY 1, [Unidades] DESC;

/*
  3) Seleccionar empleados con mas pedidos realizados po año,
  ordenados por año y por numero de pedidos
*/

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS [Empleado],
DATEPART (year, o.OrderDate) AS [Año],
COUNT(*) AS [Numero Pedidos]
FROM Orders AS o
INNER JOIN Employees AS e
ON o.EmployeeID = e.EmployeeID
GROUP BY CONCAT(e.FirstName, ' ', e.LastName), DATEPART(year, o.OrderDate)
ORDER BY [Año], [Numero Pedidos] DESC;


