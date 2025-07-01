# Diccionario de Datos para la DB de "Universidad".

## Tabla Estudiante

| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                      |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | -------------------------------- |
| NumEstudiante | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del estudiante     |
| NumMatricula  | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ✅     |                       | -            | Matrícula oficial del estudiante |
| NombrePila    | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre de pila del estudiante    |
| Apellido1     | NVARCHAR     | 50     | ❌  | ❌  |      |       |                       |              |                                  |


## Tabla Inscripcion

| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a             | Descripción                            |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------------------ | -------------------------------------- |
| NumEstudiante    | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | ESTUDIANTE.NumEstudiante | Referencia al estudiante inscrito      |
| NumCurso         | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | CURSO.NumCurso           | Referencia al curso al que se inscribe |
| FechaInscripcion | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                       | -                        | Fecha en que se realizó la inscripción |


## Tabla Curso 
| Campo    | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción             |
| -------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ----------------------- |
| NumCurso | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del curso |
| Nombre   | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre del curso        |
| Codigo   | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ✅     |                       | -            | Código único del curso  |
