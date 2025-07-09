-- Crear la base de datos RentaVehiculosG2
CREATE DATABASE RentaVehiculosG2;
GO

-- Usar la base de datos
USE RentaVehiculosG2;
GO

-- Crear tabla Cliente
CREATE TABLE Cliente(
    NumCliente INT PRIMARY KEY,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(20) NOT NULL,
    Apellido2 NVARCHAR(20),
    Curp CHAR(18) NOT NULL,
    Telefono NCHAR(12),
    Calle NVARCHAR(50),
    Numero INT,
    Ciudad NVARCHAR(20)
);
GO

-- Crear tabla Sucursal
CREATE TABLE Sucursal(
    NumSucursal INT PRIMARY KEY,
    Nombre NVARCHAR(20) NOT NULL,
    Ubicacion NVARCHAR(20)
);
GO

-- Crear tabla Vehiculo
CREATE TABLE Vehiculo(
    NumVehiculo INT PRIMARY KEY,
    Placa NCHAR(10) NOT NULL,
    Marca NVARCHAR(15) NOT NULL,
    Modelo NVARCHAR(20),
    Anio INT,
    NumClienteFK INT,
    NumSucursalFK INT,
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (NumClienteFK) REFERENCES Cliente(NumCliente),
    CONSTRAINT FK_Vehiculo_Sucursal FOREIGN KEY (NumSucursalFK) REFERENCES Sucursal(NumSucursal)
);
GO
