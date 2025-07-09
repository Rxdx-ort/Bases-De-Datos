-- Crear la base de datos BibliotecaG2
CREATE DATABASE BibliotecaG2;
GO

-- Usar la base de datos
USE BibliotecaG2;
GO

-- Crear tabla Libro
CREATE TABLE Libro(
    NumLibro INT PRIMARY KEY,
    ISBN NVARCHAR(20),
    Titulo NVARCHAR(20),
    Autor NVARCHAR(20)
);
GO

-- Crear tabla Lector
CREATE TABLE Lector(
    NumLector INT PRIMARY KEY,
    NumMembresia INT,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(20) NOT NULL,
    Apellido2 NVARCHAR(20)
);
GO

-- Crear tabla Presta (relación)
CREATE TABLE Presta(
    NumLibro INT NOT NULL,
    NumLector INT NOT NULL,
    FechaPrestamo NVARCHAR(20),
    CONSTRAINT PK_Presta PRIMARY KEY (NumLibro, NumLector),
    CONSTRAINT FK_Presta_Libro FOREIGN KEY (NumLibro) REFERENCES Libro(NumLibro),
    CONSTRAINT FK_Presta_Lector FOREIGN KEY (NumLector) REFERENCES Lector(NumLector)
);
GO
