-- crea bd
CREATE DATABASE bdmorgan;
GO

-- Usar BD
USE bdmorgan;
GO

-- Crear tabla empleado
CREATE TABLE empleado(
IdEmpleado INT not null IDENTITY (1,1),
Nombre VARCHAR(50) not null,
Apellido1 VARCHAR(20) not null,
Apellido2 VARCHAR(20),
edad INT not null,
estatus CHAR(1) not null DEFAULT 'A',
IdDepto INT not null
);
GO

-- Agregar campo
ALTER TABLE empleado
ADD jef INT;
GO

-- Restricciones
ALTER TABLE empleado
ADD CONSTRAINT pk_empleado
PRIMARY KEY (IdEmpleado);
GO

ALTER TABLE empleado
ADD CONSTRAINT chk_edad
CHECK (edad between 18 and 60);
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_empleadoJefe
FOREIGN KEY (jef)
REFERENCES empleado(IdEmpleado)

-- Crear Tabla departamentos

CREATE TABLE Departamentos(
IdDepart INT not null IDENTITY (1,1),
NombreDepto VARCHAR(20) not null,
CONSTRAINT pk_depto
PRIMARY KEY(IdDepart)
);
GO

