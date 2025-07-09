-- Crear base de datos
CREATE DATABASE Empresa;
USE Empresa;

-- Crear tabla Employee
CREATE TABLE Employee(
    SSN INT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address INT,
    BirthDate INT,
    Salary DOUBLE,
    Sex VARCHAR(20),
    NumberDeptFK INT,
    SupervisorFK INT
);

-- Crear tabla Department
CREATE TABLE Department(
    NumberDept INT PRIMARY KEY,
    NameDept VARCHAR(20) NOT NULL,
    SSNFK INT,
    StartDate INT,
    FOREIGN KEY (SSNFK) REFERENCES Employee(SSN)
);

-- Crear tabla DeptLocation
CREATE TABLE DeptLocation(
    NumberDeptFK INT NOT NULL,
    DLocation VARCHAR(20),
    PRIMARY KEY (NumberDeptFK, DLocation),
    FOREIGN KEY (NumberDeptFK) REFERENCES Department(NumberDept)
);

-- Crear tabla Project
CREATE TABLE Project(
    NumberProject INT PRIMARY KEY,
    NameProject VARCHAR(20),
    Location VARCHAR(20),
    NumberDeptFK INT,
    FOREIGN KEY (NumberDeptFK) REFERENCES Department(NumberDept)
);

-- Crear tabla Dependent
CREATE TABLE Dependent(
    SSNFK INT NOT NULL,
    Name VARCHAR(20),
    Relationship VARCHAR(20),
    Sex VARCHAR(20),
    BirthDate INT,
    PRIMARY KEY (SSNFK, Name),
    FOREIGN KEY (SSNFK) REFERENCES Employee(SSN)
);

-- Crear tabla WorkOn
CREATE TABLE WorkOn(
    SSNFK INT NOT NULL,
    NumberProjectFK INT NOT NULL,
    Hours INT,
    PRIMARY KEY (SSNFK, NumberProjectFK),
    FOREIGN KEY (SSNFK) REFERENCES Employee(SSN),
    FOREIGN KEY (NumberProjectFK) REFERENCES Project(NumberProject)
);
