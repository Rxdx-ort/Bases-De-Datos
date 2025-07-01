# Diccionario de Datos para la DB de "Hospital".

## Tabla Doctores

| Campo     | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                  |
| --------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ---------------------------- |
| NumDoctor | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del doctor     |
| NombreP   | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre del doctor            |
| Apellido1 | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Primer apellido del doctor   |
| Apellido2 | NVARCHAR     | 50     | ❌  | ❌  | ✅    | ❌     |                       | -            | Segundo apellido del doctor  |
| NumCedula | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ✅     |                       | -            | Número de cédula profesional |

## Tabla Atender 

| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                            |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | -------------------- | -------------------------------------- |
| NumDoctor       | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | DOCTORES.NumDoctor   | Doctor que atendió                     |
| NumPaciente     | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | PACIENTE.NumPaciente | Paciente atendido                      |
| Fecha\_Consulta | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                       | -                    | Fecha de la consulta médica            |
| Diagnostico     | NVARCHAR     | 100    | ❌  | ❌  | ✅    | ❌     |                       | -                    | Diagnóstico específico de esa consulta |

## Tabla Paciente 

| Campo       | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                      |
| ----------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | -------------------------------- |
| NumPaciente | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del paciente       |
| Diagnostico | NVARCHAR     | 100    | ❌  | ❌  | ✅    | ❌     |                       | -            | Diagnóstico general del paciente |
| NombreP     | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre del paciente              |
| Apellido1   | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Primer apellido del paciente     |
| Apellido2   | NVARCHAR     | 50     | ❌  | ❌  | ✅    | ❌     |                       | -            | Segundo apellido del paciente    |
