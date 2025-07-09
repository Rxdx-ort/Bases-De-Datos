-- Crear base de datos
CREATE DATABASE HospitalG2;
USE HospitalG2;

-- Crear tabla Doctor
CREATE TABLE Doctor(
    Id_Doctor INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    ApellidoPaterno VARCHAR(20),
    ApellidoMaterno VARCHAR(20)
);

-- Crear tabla Paciente
CREATE TABLE Paciente(
    Id_Paciente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(20),
    ApellidoMaterno VARCHAR(20),
    Edad INT
);

-- Crear tabla Registro
CREATE TABLE Registro(
    Id_DoctorFK INT NOT NULL,
    Id_PacienteFK INT NOT NULL,
    Fecha CHAR(8),
    Diagnostico VARCHAR(60),
    PRIMARY KEY (Id_DoctorFK, Id_PacienteFK),
    FOREIGN KEY (Id_DoctorFK) REFERENCES Doctor(Id_Doctor),
    FOREIGN KEY (Id_PacienteFK) REFERENCES Paciente(Id_Paciente)
);
