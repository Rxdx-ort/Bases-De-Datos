-- SQL-LMD (INSERT, DELETE, UPDATE)

USE NORTHWND;
GO

-- SELECT * FROM

SELECT * FROM Categories;

SELECT * FROM Products;

SELECT * FROM Suppliers;

SELECT * FROM Customers;

SELECT * FROM Employees;

SELECT * FROM Shippers;

SELECT * FROM Orders;

SELECT * FROM [Order Details];

-- Proyección

SELECT customerid,CompanyName, City FROM Customers;

-- Alias de Columna
SELECT CustomerID AS 'Numero Empleado',
	CompanyName Empresa,
	city AS Ciudad,
	ContactName AS [Nombre del Contacto]
FROM Customers;


-- Alias de Tabla
SELECT Customers.CustomerID as [Número Cliente],
		Customers.CompanyName as [Empresa],
		Customers.ContactName as [Nombre del Contacto]
FROM Customers;
GO

SELECT c.CustomerID as [Número Cliente],
		c.CompanyName as [Empresa],
		c.ContactName as [Nombre del Contacto]
FROM Customers AS c;
GO

SELECT c.CustomerID as [Número Cliente],
		c.CompanyName as [Empresa],
		c.ContactName as [Nombre del Contacto]
FROM Customers c;
GO

-- Campo Calculado
SELECT *, (UnitPrice * Quantity) as [TOTAL]
FROM [Order Details];

SELECT od.OrderID AS [Número de Orden], 
od.ProductID AS [Númer del Producto],
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad],
(UnitPrice * Quantity) as [TOTAL]
FROM [Order Details] AS od;

-- Seleccionar todos los productos que pertenezcan a la categoria 1
SELECT p.ProductID AS [Número],
			p.ProductName as [Nombre],
			p.CategoryID as [Categoria],
			p.UnitPrice as [Precio],
			p.UnitsInStock as [Cantidad],
			(p.UnitPrice * p.UnitsInStock) as [COSTO]
FROM 
Products AS p
WHERE CategoryID = 1;

-- Seleccionar todos los productos
-- que su precio se mayor a 40.3

SELECT p.ProductID as [Número del Producto],
		p.ProductName as [Nombre del Producto],
		p.UnitPrice as [Precio]
FROM Products AS p
WHERE p.UnitPrice > 40.3;


-- Seleccionar todos los productos
-- que su precio se mayor o igual a 40

SELECT p.ProductID as [Número del Producto],
		p.ProductName as [Nombre del Producto],
		p.UnitPrice as [Precio]
FROM Products AS p
WHERE p.UnitPrice >= 40;

-- Selccionar donde el numero de categoria
-- sea diferente a 3
SELECT p.ProductID as [Número del Producto],
		p.ProductName as [Nombre del Producto],
		p.UnitPrice as [Precio],
		p.CategoryID as [Numero de Categoria]
FROM Products AS p
WHERE p.CategoryID <> 3;

-- Seleccionar todas las ordenes de 
-- Brasil, Rio de Janeiro mostrando solo el numero de orden,
-- la fecha de orden, el pais de envio, y la ciudad y su transportista

SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCity AS [Ciudad],
		o.ShipCountry AS [País],
		o.ShipVia AS [Transportista]
FROM Orders as o
WHERE ShipCity = 'Rio de Janeiro';


SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCity AS [Ciudad],
		o.ShipCountry AS [País],
		o.ShipVia AS [Transportista]
FROM Orders as o
WHERE ShipRegion is null;

SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCity AS [Ciudad],
		o.ShipCountry AS [País],
		o.ShipVia AS [Transportista],
		o.ShipRegion as [Región]
FROM Orders as o
WHERE ShipRegion is not null;

-- Seleccionar todas las ordenes enviadas a Brasil, Alemania y México, con region
SELECT * FROM Orders;
SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCity AS [Ciudad],
		o.ShipCountry AS [País],
		o.ShipVia AS [Transportista],
		o.ShipRegion as [Región]
FROM Orders as o
WHERE (o.ShipCountry = 'Mexico'
or o.ShipCountry = 'Germany'
or o.ShipCountry = 'Brazil') 
or o.ShipRegion is null
ORDER BY o.ShipCountry ASC, o.ShipCity DESC;