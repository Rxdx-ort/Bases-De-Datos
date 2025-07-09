-- Crear base de datos
CREATE DATABASE BibliotecaG2;
USE BibliotecaG2;

-- Crear tabla Libro
CREATE TABLE Libro(
    NumLibro INT PRIMARY KEY,
    ISBN VARCHAR(20),
    Titulo VARCHAR(20),
    Autor VARCHAR(20)
);

-- Crear tabla Lector
CREATE TABLE Lector(
    NumLector INT PRIMARY KEY,
    NumMembresia INT,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20)
);

-- Crear tabla Presta (relación)
CREATE TABLE Presta(
    NumLibro INT NOT NULL,
    NumLector INT NOT NULL,
    FechaPrestamo VARCHAR(20),
    PRIMARY KEY (NumLibro, NumLector),
    FOREIGN KEY (NumLibro) REFERENCES Libro(NumLibro),
    FOREIGN KEY (NumLector) REFERENCES Lector(NumLector)
);
