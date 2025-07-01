# DICCIONARIO DE DATOS DE LA DB DE "BIBLIOTECA"

## Tabla Libro

| Campo    | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción             |
| -------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ----------------------- |
| NumLibro | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del libro |
| Titulo   | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Título del libro        |
| Autor    | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Autor del libro         |
| ISBN     | NVARCHAR     | 20     | ❌  | ❌  | ✅    | ✅     |                       | -            | Código ISBN del libro   |


## Tabla Presta

| Campo     | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a     | Descripción                      |
| --------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ---------------- | -------------------------------- |
| NumLibro  | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | LIBRO.NumLibro   | Referencia al libro prestado     |
| NumLector | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | LECTOR.NumLector | Referencia al lector que lo tomó |



## Tabla Lector

| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                 |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | --------------------------- |
| NumLector    | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del lector    |
| Nombre       | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre del lector           |
| Apellido1    | NVARCHAR     | 50     | ❌  | ❌  | ✅    | ❌     |                       | -            | Primer apellido del lector  |
| Apellido2    | NVARCHAR     | 50     | ❌  | ❌  | ✅    | ❌     |                       | -            | Segundo apellido del lector |
| NumMembresia | NVARCHAR     | 20     | ❌  | ❌  | ✅    | ✅     |                       | -            | Número de membresía         |
