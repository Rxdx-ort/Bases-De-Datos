-- Crear la base de datos HospitalG2
CREATE DATABASE HospitalG2;
GO

-- Usar la base de datos
USE HospitalG2;
GO

-- Crear tabla Doctor
CREATE TABLE Doctor(
    Id_Doctor INT PRIMARY KEY,
    Nombre NVARCHAR(20) NOT NULL,
    ApellidoPaterno NVARCHAR(20),
    ApellidoMaterno NVARCHAR(20)
);
GO

-- Crear tabla Paciente
CREATE TABLE Paciente(
    Id_Paciente INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    ApellidoPaterno NVARCHAR(20),
    ApellidoMaterno NVARCHAR(20),
    Edad INT
);
GO

-- Crear tabla Registro (relación)
CREATE TABLE Registro(
    Id_DoctorFK INT NOT NULL,
    Id_PacienteFK INT NOT NULL,
    Fecha NCHAR(8),
    Diagnostico NVARCHAR(60),
    CONSTRAINT PK_Registro PRIMARY KEY (Id_DoctorFK, Id_PacienteFK),
    CONSTRAINT FK_Registro_Doctor FOREIGN KEY (Id_DoctorFK) REFERENCES Doctor(Id_Doctor),
    CONSTRAINT FK_Registro_Paciente FOREIGN KEY (Id_PacienteFK) REFERENCES Paciente(Id_Paciente)
);
GO
