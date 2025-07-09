-- Crear base de datos
CREATE DATABASE RentaVehiculosG2;
USE RentaVehiculosG2;

-- Crear tabla Cliente
CREATE TABLE Cliente(
    NumCliente INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20),
    Curp CHAR(18) NOT NULL,
    Telefono CHAR(12),
    Calle VARCHAR(50),
    Numero INT,
    Ciudad VARCHAR(20)
);

-- Crear tabla Sucursal
CREATE TABLE Sucursal(
    NumSucursal INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Ubicacion VARCHAR(20)
);

-- Crear tabla Vehiculo
CREATE TABLE Vehiculo(
    NumVehiculo INT PRIMARY KEY,
    Placa CHAR(10) NOT NULL,
    Marca VARCHAR(15) NOT NULL,
    Modelo VARCHAR(20),
    Anio INT,
    NumClienteFK INT,
    NumSucursalFK INT,
    FOREIGN KEY (NumClienteFK) REFERENCES Cliente(NumCliente),
    FOREIGN KEY (NumSucursalFK) REFERENCES Sucursal(NumSucursal)
);
