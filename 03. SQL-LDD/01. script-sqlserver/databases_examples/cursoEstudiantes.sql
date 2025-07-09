-- Crear la base de datos CursosEstudiantesG2
CREATE DATABASE CursosEstudiantesG2;
GO

-- Usar la base de datos
USE CursosEstudiantesG2;
GO

-- Crear tabla Estudiante
CREATE TABLE Estudiante(
    Id_Estudiante INT PRIMARY KEY,
    Nombre NVARCHAR(20) NOT NULL,
    ApellidoPaterno NVARCHAR(20) NOT NULL,
    ApellidoMaterno NVARCHAR(20),
    Matricula NVARCHAR(10)
);
GO

-- Crear tabla Curso
CREATE TABLE Curso(
    Id_Curso INT PRIMARY KEY,
    Nombre NVARCHAR(30) NOT NULL,
    Codigo NCHAR(10)
);
GO

-- Crear tabla Inscripcion (relación)
CREATE TABLE Inscripcion(
    Id_Estudiante INT NOT NULL,
    Id_Curso INT NOT NULL,
    CONSTRAINT PK_Inscripcion PRIMARY KEY (Id_Estudiante, Id_Curso),
    CONSTRAINT FK_Inscripcion_Estudiante FOREIGN KEY (Id_Estudiante) REFERENCES Estudiante(Id_Estudiante),
    CONSTRAINT FK_Inscripcion_Curso FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);
GO
