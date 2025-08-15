use NORTHWND;

SELECT *
FROM Categories;

SELECT*FROM	
Products;

SELECT*
FROM Suppliers;

SELECT*
FROM Customers;

SELECT*
FROM Employees;

SELECT*
FROM Shippers;

SELECT*
FROM Orders;

SELECT*
FROM [Order Details];

SELECT customerid,CompanyName,City
FROM Customers;






--Alias de columna 
SELECT Customers.CustomerID AS [Numero Cliente],
Customers.CompanyName AS [Empresa],
Customers.ContactName AS [Nombre de contacto]
FROM Customers

--Alias de columna 
SELECT CustomerID AS 'Numero Empleado',
		CompanyName Empresa,
		city AS Ciudad,
		ContactName AS [Nombre del Contacto]
FROM Customers;


--Alias de tabla
SELECT c.CustomerID AS [Numero Cliente],
c.CompanyName AS [Empresa],
c.ContactName AS [Nombre de contacto]
FROM Customers AS c;

SELECT c.CustomerID AS [Numero Cliente],
c.CompanyName AS [Empresa],
c.ContactName AS [Nombre de contacto]
FROM Customers  c;


--Campo calculado
SELECT od.OrderID AS [Numero de orden], 
od.ProductID AS [Numero de Producto] ,
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad]
,(UnitPrice * Quantity ) AS [Total]
FROM [Order Details] AS od;

--Seleccionar todos los roductos que 
--pertenezcan a la categoria 1 
SELECT*FROM 
Products WHERE CategoryID =1 ;


SELECT p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
 WHERE CategoryID =1;

 --Seleccionar todos los productos
 --de la categoria Contimens 
 SELECT*FROM Categories;
 
SELECT p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
 WHERE CategoryID =2;


 --Seleccionar todos los productos 
 --su precio sea mayor a 40.3
 --id, nombre producto,precio

 SELECT p.ProductID AS [Numero de producto],
 p.ProductName AS [Nombre de producto],
 p.UnitPrice AS [Precio]
 FROM Products AS p
 WHERE p.UnitPrice > 40.3;

  SELECT p.ProductID AS [Numero de producto],
 p.ProductName AS [Nombre de producto],
 p.UnitPrice AS [Precio]
 FROM Products AS p
 WHERE p.UnitPrice >= 40;

 --Seleccionar los productos que el numero de categoria sea diferebte a 3
  SELECT p.ProductID AS [Numero de producto],
 p.ProductName AS [Nombre de producto],
 p.UnitPrice AS [Precio]
 FROM Products AS p
 WHERE p.CategoryID <>3;  --o !=

 --Seleccionar todas las ordenes que sean de brazil - rio de janeiro
 --Mostrando solo el numero de orden, la fecha de orden 
 --Pais de envio, la ciudad y su transportista
 SELECT* FROM Orders;

 SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista]
 
 FROM Orders AS o
 WHERE O.ShipCity = 'Rio de Janeiro';

   SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 O.ShipRegion AS [Region],
 o.ShipCountry AS [Pais]
 
 FROM Orders AS o
 WHERE O.ShipRegion is NULL;

    SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 O.ShipRegion AS [Region]
 
 FROM Orders AS o
 WHERE O.ShipRegion is not NULL;

  SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 O.ShipRegion AS [Region]
 
 FROM Orders AS o
 WHERE O.ShipRegion != 'NULL';

 --SELECCIONAR TODAS LAS ORDENES ENVIADAS A BRAZIL, ALEMANIA, MEXICO
 SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 o.ShipCountry AS [Pais]
 
 FROM Orders AS o
 WHERE (O.ShipCountry='Brazil' 
 or o.ShipCountry='Germany' 
 or o.ShipCountry='Mexico')
 and o.ShipRegion is not null;

 SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 o.ShipCountry AS [Pais]
 
 FROM Orders AS o
 WHERE(o.ShipCountry ='Brazil'
 or o.ShipCountry='Germany' 
 or o.ShipCountry='Mexico')
 and o.ShipRegion is not null
 ORDER BY [Pais] ASC, o.ShipCity DESC;
 --Seleccionar todas las ordenes de francia alemania y argentina
SELECT *
FROM Orders
WHERE ShipCountry in ('Germany', 'France', 'Argentina')

--Seleccionar tdos los productos descontinuados o con precio mayor a 50 y ordenados por el precio
SELECT* FROM Products;

SELECT p.ProductID AS [Numero proucto],
p.Discontinued AS [descont],
p.UnitPrice AS [Precio]
FROM Products AS p
WHERE Discontinued=1 or UnitPrice > 50
ORDER BY [Precio] DESC;
--Seleccionar los empleaados que fueron contratados despues de 1994
--nombre completo y fecha de concetracion 

SELECT*
FROM Employees;

SELECT e.LastName [Apellido],
e.FirstName [Nombre],
e.HireDate
FROM Employees AS e
WHERE HireDate>= '1994';

SELECT (FirstName + ' ' + LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratacion]
FROM Employees
WHERE  HireDate > '1994-12-31';

-- SELECT MAX (HireDate) FROM Employees;
SELECT CONCAT (FirstName, '', LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratacion ], YEAR (HireDate) AS [Año de contratacion],
MONTH (HireDate) AS [Mes de contratacion], DAY (HireDate) AS [Dia de contratacion]
FROM Employees
WHERE YEAR (HireDate) >1993;

--Mostrar los empleados que fueron contrtatados en abril
SELECT CONCAT (FirstName, '', LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratacion ], DATEPART (yy,HireDate) AS [Año de contratacion],
DATEPART (mm,HireDate) AS [Mes de contratacion], DATEPART (d,HireDate) AS [Dia de contratacion],
DATEPART(QUARTER, HireDate) AS [Trimestre],
DATENAME(WEEKDAY, HireDate) AS [Dia],
DATENAME (MONTH,HireDate) AS [MES]
FROM Employees
WHERE MONTH  (HireDate) = 4;

--Selecciona los productos que no estan descontinuados
--muestra solamnete el nombre del producto y el campo de descont
SELECT*FROM	
Products;

SELECT (ProductName + ' ' + Discontinued ) AS
[Nombre del producto no discontinuado]
FROM Products 
WHERE Discontinued = 0;

SELECT p.ProductName AS [Nombre producto],
p.Discontinued AS [Descontinuado]
FROM Products AS p
WHERE Discontinued = 0;

---Sellecionar los proveedores que  o son de USA
SELECT CompanyName AS [EMPRESA],
ContactName AS [Contacto]
FROM Suppliers
WHERE Country <> 'USA'
--Seleccionar los productos caros y bajo en stock, con precios mayores a 50
-- y stock menor a 20
SELECT ProductName AS [Nombre del producto],
SupplierID AS [Proveedor],
UnitsInStock AS [Existencia],
UnitPrice AS [Precio Unitario]
FROM Products
WHERE UnitPrice > 50 and UnitsInStock < 20;

--Primera forma
SELECT ProductName AS [Nombre del producto],
Suppliers.SupplierID AS [Proveedor],
Suppliers.CompanyName AS [Nombre del proveedor],
UnitsInStock AS [Existencia],
UnitPrice AS [Precio Unitario]
FROM Products,Suppliers
WHERE (Products.SupplierID = Suppliers.SupplierID)
AND (UnitPrice > 50 and UnitsInStock < 20);
--Segunda forma
SELECT p.ProductName AS [Nombre del producto],
s.SupplierID AS [Proveedor],
s.CompanyName AS [Nombre del proveedor],
p.UnitsInStock AS [Existencia],
p.UnitPrice AS [Precio Unitario]
FROM Products AS p,Suppliers AS s
WHERE (p.SupplierID = s.SupplierID)
AND (UnitPrice > 50 and UnitsInStock < 20);
--Tercera forma
SELECT p.ProductName AS [Nombre del producto],
s.SupplierID AS [Proveedor],
s.CompanyName AS [Nombre del proveedor],
p.UnitsInStock AS [Existencia],
p.UnitPrice AS [Precio Unitario]
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE (p.SupplierID = s.SupplierID)
AND (UnitPrice > 50 and UnitsInStock < 20);

--Clientes de mexico y españa
SELECT c.CompanyName AS [Cliente],
       c.City AS [Ciudad],
	   c.Country AS [Pais],
	   c.Region AS [Region]
FROM Customers AS c
WHERE (Country = 'Mexico' OR Country ='Spain') AND Region is NOT NULL;

--Productos que no estan descontinuados y tienen inventario
SELECT p.ProductName AS [Nombre del Producto], p.UnitsInStock AS [Existencia],
       p.UnitPrice AS [Precio], p.Discontinued,
	   (p.UnitPrice * p.UnitsInStock) AS [Precio del Inventario]
FROM Products AS p
WHERE p.Discontinued = 1 AND UnitsInStock >0;
--proveedores que no son de Estados Unidos ni de Reino Unido
SELECT s.CompanyName [Empresa], s.City AS [Ciudad],
s.Country AS [Pais] 
FROM Suppliers AS s
WHERE Country != 'USA' and s.Country!= 'UK'

SELECT s.CompanyName [Empresa], s.City AS [Ciudad],
s.Country AS [Pais] 
FROM Suppliers AS s
WHERE NOT(s.Country = 'USA' or s.Country= 'UK');

--Order By

--Seleccionar todos los proveedores mostrando el nombre del provedor el pais
-- la ciudad ordenadapor Pais de menor a mayor
SELECT s.CompanyName AS [Empresa], s.Country AS [Pais],
s.City AS [Ciudad]
FROM Suppliers AS s
ORDER BY Country DESC, City ASC

select getdate();
SELECT DATEPART (year,'2025-07-23');
SELECT DATEPART (year,getdate());
SELECT DATEPART (yy,getdate());
SELECT DATEPART (yyyy,getdate());
SELECT DATEPART (q,getdate());

--Sleccionar todas aquellas ordenes que se realizaron en 1998

select MAX(year(OrderDate))
FROM Orders;

SELECT OrderID, OrderDate,ShipCity,ShipCountry,
DATEPART (yyyy,OrderDate) AS [Año]
FROM Orders
WHERE DATEPART (yy,OrderDate) =1998;

SELECT *
FROM Orders;
--Seleccionar todas las ordenes que se hicieron en el trimestre del año
SELECT OrderID, OrderDate,ShipCity,ShipCountry,
 DATEPART (yyyy,OrderDate) AS [Año]
FROM Orders
WHERE DATEPART (q,OrderDate) =3;

--------------------------------------------------------------------------------
SELECT OrderID, OrderDate,ShipCity,ShipCountry,
 DATEPART (yyyy,OrderDate) AS [Año],
 DateName(month,OrderDate) AS 'Nombre del Mes',
 DATEPART(month, OrderDate) AS 'Numero de mes',
 DATENAME(DAY, OrderDate) AS 'Nombre de dia'
FROM Orders
WHERE Month (OrderDate) =7 or Month (OrderDate) =8 
or Month (OrderDate) =9;

--------------------------------------------------------------------------------
--Seleccionar los paises dde nestro cliente
SELECT DISTINCT Country
FROM Customers
ORDER BY Country;

--Seleccionar todos los paises y ciudades unicas de los proveedores
SELECT DISTINCT Country,City
FROM Suppliers;

--SELECCIONAR LAS FECHAS DISTINTAS DE COMPRA
SELECT DISTINCT OrderDate
FROM Orders;

---Mostrar lascategorias distintas de productos
SELECT DISTINCT CategoryID
FROM Products;

--Seleccionar todas las ordenes con mas de 30 dias de la fecha requierida 
--hasta la fecha de pedidos
SELECT OrderDate, RequiredDate,
datediff (day,OrderDate,RequiredDate) as 'DIA'
FROM Orders
WHERE datediff (day,OrderDate,RequiredDate) > 30;

--Seleccionar todos los productos cuyo precio unitario sean 
-- con un impuesto unitario de 20% sea mayor a 30

SELECT * FROM Products
WHERE UnitPrice * 1.20 > 30;

--Seleccionar todas las ordenes cuyo total es mayor a 100

SELECT (UnitPrice*Quantity) AS 'Total'
FROM [Order Details]
WHERE (UnitPrice*Quantity) >100

--Test de rango Between 
--Seleccionar los productos con un precio entre 30 y 
SELECT * FROM Products
WHERE UnitPrice >20 and UnitPrice <=30;

SELECT *
FROM Products
WHERE UnitPrice between 20 and 30


--UTILIZAR BDEJEMPLO2
USE BDEJEMPLO2;

--LISTAR LOS DIFERENTES PUESTOS DE LOS REPRESENTANTES
SELECT DISTINCT Puesto
FROM Representantes; --El DISTINCT ayuda a no poder datos repetidos 

SELECT  DISTINCT country
FROM customers;

--El DISTINCT afecta a ambas columnas
SELECT DISTINCT city, country
FROM customers
ORDER BY country;

-- Listar los 5 pedidos con el impporte mas alto
SELECT TOP 5 Num_Pedido,Fecha_Pedido,Fab,Producto,Cantidad,Importe
FROM Pedidos
ORDER BY  Importe DESC
--En mysql no existe el TOP seria LIMIT 5

SELECT TOP 5 Num_Pedido,Fecha_Pedido,Fab,Producto,
Cantidad,Importe AS [Total]
FROM Pedidos
ORDER BY  Importe DESC

--MySQL
--SELECT  Num_Pedido,Fecha_Pedido,Fab,Producto,
--Cantidad,Importe
--FROM Pedidos
--ORDER BY  pedido DESC
--LIMIT 5;

--Test de Encaje de Patrones
--Seleccionar todos los clientes que comiencen con A

SELECT *
FROM Clientes
WHERE Empresa like 'A%' --Que inice con A

SELECT *
FROM Clientes
WHERE Empresa like '%er%' --que tenga er en cualqier lugar

SELECT *
FROM Clientes
WHERE Empresa like '_A%' --Que su segunda letra sea A y lo demas no importa

SELECT *
FROM Clientes
WHERE Empresa like '[A-D]%'

SELECT *
FROM Clientes
WHERE Empresa like '[abcx]'

SELECT *
FROM Clientes
WHERE Empresa like '[^abcx]%'

SELECT *
FROM Clientes
WHERE Empresa like '_organ' --Solo tiene que tener 6 letras la primera no importa

insert into Clientes
values (2126, 'Morgan',108,678),
(2127,'Porgan',108,778);

--Hallar todos los representante que o bien
--a) trabajan en Daimiel, Navarra o Castellon
--b) No tienen jefe, y estan contratados desde junio de 1998
--c)Superan su cuota pero tienen ventas de 600,000 o menos 
SELECT Nombre, Jefe, Cuota, Ventas,Fecha_Contrato, Oficina_Rep
FROM Representantes
WHERE (Oficina_Rep in ( 22 ,11 , 12)) 
or (Jefe is NULL AND   Fecha_Contrato>='1998' )or  ( ventas >Cuota AND NOT Ventas>600000)
ORDER BY Ventas DESC;

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

--Listar todos los pedidos, mostrando el numero de pedido, importe,
--nombre, y limite de credito del cliente

SELECT*FROM Clientes

SELECT* FROM Pedidos
-----------------------------------------------------------------------------
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