-- Crear base de datos
CREATE DATABASE CursosEstudiantesG2;
USE CursosEstudiantesG2;

-- Crear tabla Estudiante
CREATE TABLE Estudiante(
    Id_Estudiante INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    ApellidoPaterno VARCHAR(20) NOT NULL,
    ApellidoMaterno VARCHAR(20),
    Matricula VARCHAR(10)
);

-- Crear tabla Curso
CREATE TABLE Curso(
    Id_Curso INT PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Codigo CHAR(10)
);

-- Crear tabla Inscripcion (relación)
CREATE TABLE Inscripcion(
    Id_Estudiante INT NOT NULL,
    Id_Curso INT NOT NULL,
    PRIMARY KEY (Id_Estudiante, Id_Curso),
    FOREIGN KEY (Id_Estudiante) REFERENCES Estudiante(Id_Estudiante),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);
