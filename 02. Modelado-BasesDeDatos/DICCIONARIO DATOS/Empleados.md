# Diccionario de datos de la bd de "Project".

## Tabla Employee
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK    | Referencia a           | Descripción                          |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------ | ---------------------- | ------------------------------------ |
| SSN           | CHAR         | 9      | ✅  | ❌  | ❌    | ✅     |                          | -                      | Número de seguro social del empleado |
| FirstName     | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                          | -                      | Nombre del empleado                  |
| LastName      | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                          | -                      | Apellido del empleado                |
| Address       | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                          | -                      | Dirección del empleado               |
| BirthDate     | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                          | -                      | Fecha de nacimiento                  |
| Salary        | DECIMAL      | 10,2   | ❌  | ❌  | ❌    | ❌     | CHECK (Salary > 0)       | -                      | Salario del empleado                 |
| Sex           | CHAR         | 1      | ❌  | ❌  | ❌    | ❌     | CHECK (Sex IN ('M','F')) | -                      | Sexo del empleado                    |
| NumberDepto   | INT          | -      | ❌  | ✅  | ❌    | ❌     |                          | DEPARTMENT.NumberDepto | Departamento en el que trabaja       |
| SupervisorSSN | CHAR         | 9      | ❌  | ✅  | ✅    | ❌     |                          | EMPLOYEE.SSN           | SSN del jefe directo (auto-relación) |

## Tabla Department
| Campo          | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                       |
| -------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | --------------------------------- |
| NumberDepto    | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Número identificador del depto    |
| NameDepartment | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ✅     |                       | -            | Nombre del departamento           |
| SSNManager     | CHAR         | 9      | ❌  | ✅  | ❌    | ❌     |                       | EMPLOYEE.SSN | SSN del gerente del departamento  |
| StartDate      | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                       | -            | Fecha en la que empezó el gerente |

## Project 
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a           | Descripción                  |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ---------------------- | ---------------------------- |
| NumberProject | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -                      | Identificador del proyecto   |
| NameProject   | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ✅     |                       | -                      | Nombre del proyecto          |
| Location      | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -                      | Ubicación del proyecto       |
| NumberDepto   | INT          | -      | ❌  | ✅  | ❌    | ❌     |                       | DEPARTMENT.NumberDepto | Departamento que lo gestiona |

## Dependent
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK    | Referencia a | Descripción                         |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | ------------------------ | ------------ | ----------------------------------- |
| SSN          | CHAR         | 9      | ✅  | ✅  | ❌    | ❌     |                          | EMPLOYEE.SSN | Empleado del cual depende           |
| Name         | NVARCHAR     | 50     | ✅  | ❌  | ❌    | ❌     |                          | -            | Nombre del dependiente              |
| Relationship | NVARCHAR     | 30     | ❌  | ❌  | ❌    | ❌     |                          | -            | Relación con el empleado            |
| Sex          | CHAR         | 1      | ❌  | ❌  | ❌    | ❌     | CHECK (Sex IN ('M','F')) | -            | Sexo del dependiente                |
| BirthDate    | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                          | -            | Fecha de nacimiento del dependiente |

## Work_On
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a          | Descripción                         |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | --------------------- | ----------------------------------- |
| SSN           | CHAR         | 9      | ✅  | ✅  | ❌    | ❌     |                       | EMPLOYEE.SSN          | Empleado que trabaja en el proyecto |
| NumberProject | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | PROJECT.NumberProject | Proyecto en el que trabaja          |
| Hours         | DECIMAL      | 4,1    | ❌  | ❌  | ❌    | ❌     | CHECK (Hours >= 0)    | -                     | Horas asignadas al proyecto         |

## DeptoLocation
| Campo       | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a           | Descripción                          |
| ----------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ---------------------- | ------------------------------------ |
| NumberDepto | INT          | ✅      | ✅  | ✅  | ❌    | ❌     |                       | DEPARTMENT.NumberDepto | Departamento al que pertenece        |
| DLocation   | NVARCHAR     | 100    | ✅  | ❌  | ❌    | ❌     |                       | -                      | Ubicación adicional del departamento |
