-- Crear base de datos
CREATE DATABASE Empresa;
GO

-- Usar base de datos
USE Empresa;
GO

-- Crear tabla Employee
CREATE TABLE Employee(
    SSN INT PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Address INT,
    BirthDate INT,
    Salary FLOAT,
    Sex NVARCHAR(20),
    NumberDeptFK INT,
    SupervisorFK INT
);
GO

-- Crear tabla Department
CREATE TABLE Department(
    NumberDept INT PRIMARY KEY,
    NameDept NVARCHAR(20) NOT NULL,
    SSNFK INT,
    StartDate INT,
    CONSTRAINT FK_Department_Manager FOREIGN KEY (SSNFK) REFERENCES Employee(SSN)
);
GO

-- Crear tabla DeptLocation
CREATE TABLE DeptLocation(
    NumberDeptFK INT NOT NULL,
    DLocation NVARCHAR(20),
    CONSTRAINT PK_DeptLocation PRIMARY KEY (NumberDeptFK, DLocation),
    CONSTRAINT FK_DeptLocation_Department FOREIGN KEY (NumberDeptFK) REFERENCES Department(NumberDept)
);
GO

-- Crear tabla Project
CREATE TABLE Project(
    NumberProject INT PRIMARY KEY,
    NameProject NVARCHAR(20),
    Location NVARCHAR(20),
    NumberDeptFK INT,
    CONSTRAINT FK_Project_Department FOREIGN KEY (NumberDeptFK) REFERENCES Department(NumberDept)
);
GO

-- Crear tabla Dependent
CREATE TABLE Dependent(
    SSNFK INT NOT NULL,
    Name NVARCHAR(20),
    Relationship NVARCHAR(20),
    Sex NVARCHAR(20),
    BirthDate INT,
    CONSTRAINT PK_Dependent PRIMARY KEY (SSNFK, Name),
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (SSNFK) REFERENCES Employee(SSN)
);
GO

-- Crear tabla WorkOn (relación)
CREATE TABLE WorkOn(
    SSNFK INT NOT NULL,
    NumberProjectFK INT NOT NULL,
    Hours INT,
    CONSTRAINT PK_WorkOn PRIMARY KEY (SSNFK, NumberProjectFK),
    CONSTRAINT FK_WorkOn_Employee FOREIGN KEY (SSNFK) REFERENCES Employee(SSN),
    CONSTRAINT FK_WorkOn_Project FOREIGN KEY (NumberProjectFK) REFERENCES Project(NumberProject)
);
GO
