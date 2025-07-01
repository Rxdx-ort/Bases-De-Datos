## Diccionario de Datos de la bd de "Odontologo".

## Tabla Paciente
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                     |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ------------------------------- |
| Id\_Paciente | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del paciente      |
| Nombre       | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre del paciente             |
| Apellido1    | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Primer apellido                 |
| Apellido2    | NVARCHAR     | 50     | ❌  | ❌  | ✅    | ❌     |                       | -            | Segundo apellido                |
| CURP         | CHAR         | 18     | ❌  | ❌  | ❌    | ✅     |                       | -            | CURP del paciente               |
| Fecha\_N     | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                       | -            | Fecha de nacimiento             |
| Calle        | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Calle del domicilio             |
| Numero       | NVARCHAR     | 10     | ❌  | ❌  | ❌    | ❌     |                       | -            | Número del domicilio            |
| Colonia      | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Colonia del paciente            |
| Correo       | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ✅     |                       | -            | Correo electrónico del paciente |

## Tabla Cita
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a                | Descripción                        |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | --------------------------- | ---------------------------------- |
| Id\_Cita        | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -                           | Identificador de la cita           |
| Fecha           | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                       | -                           | Fecha de la cita                   |
| Hora            | TIME         | -      | ❌  | ❌  | ❌    | ❌     |                       | -                           | Hora de la cita                    |
| Estado          | NVARCHAR     | 30     | ❌  | ❌  | ❌    | ❌     |                       | -                           | Estado (agendada, cancelada, etc.) |
| Motivo          | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -                           | Motivo de la cita                  |
| Id\_Paciente    | INT          | -      | ❌  | ✅  | ❌    | ❌     |                       | PACIENTE.Id\_Paciente       | Paciente asociado a la cita        |
| Id\_Consultorio | INT          | -      | ❌  | ✅  | ❌    | ❌     |                       | CONSULTORIO.Id\_Consultorio | Consultorio asignado               |

## Tabla Consultorio
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                    |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ------------------------------ |
| Id\_Consultorio | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | ID único del consultorio       |
| Ubicacion       | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Ubicación del consultorio      |
| Numero          | NVARCHAR     | 10     | ❌  | ❌  | ❌    | ✅     |                       | -            | Número o clave del consultorio |
| Estado          | NVARCHAR     | 30     | ❌  | ❌  | ❌    | ❌     |                       | -            | Estado operativo               |

## Tabla Odontologo
| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a                  | Descripción                 |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ----------------------------- | --------------------------- |
| Id\_Odontologo   | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -                             | ID del odontólogo           |
| Cedula           | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ✅     |                       | -                             | Cédula profesional          |
| Nombre           | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -                             | Nombre del odontólogo       |
| Telefono         | NVARCHAR     | 15     | ❌  | ❌  | ❌    | ❌     |                       | -                             | Teléfono del odontólogo     |
| Correo           | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ✅     |                       | -                             | Correo electrónico          |
| Turno            | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ❌     |                       | -                             | Turno asignado              |
| Horario          | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -                             | Horario general             |
| Id\_Especialidad | INT          | -      | ❌  | ✅  | ❌    | ❌     |                       | ESPECIALIDAD.Id\_Especialidad | Especialidad del odontólogo |

## Tabla Especialidad
| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción               |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ------------------------- |
| Id\_Especialidad | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | ID de la especialidad     |
| Nombre\_E        | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ✅     |                       | -            | Nombre de la especialidad |

## Tabla Tratamiento
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                      |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | -------------------------------- |
| Id\_Tratamiento | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del tratamiento    |
| Nombre          | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     |                       | -            | Nombre del tratamiento           |
| Costo           | DECIMAL      | 10,2   | ❌  | ❌  | ❌    | ❌     | CHECK (Costo >= 0)    | -            | Costo del tratamiento            |
| Duracion        | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -            | Duración estimada                |
| Estatus         | NVARCHAR     | 30     | ❌  | ❌  | ❌    | ❌     |                       | -            | Estatus actual (activo/inactivo) |

## Tabla Sesion_Tratamiento
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a                | Descripción             |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | --------------------------- | ----------------------- |
| Id\_Tratamiento | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | TRATAMIENTO.Id\_Tratamiento | Tratamiento relacionado |
| Id\_Material    | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | MATERIAL.Id\_Material       | Material utilizado      |
| Cantidad        | DECIMAL      | 5,2    | ❌  | ❌  | ❌    | ❌     | CHECK (Cantidad >= 0) | -                           | Cantidad del material   |
| Observacion     | NVARCHAR     | 200    | ❌  | ❌  | ✅    | ❌     |                       | -                           | Observaciones de uso    |

## Tabla Aplicacion_Tratamiento
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a                | Descripción                          |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | --------------------------- | ------------------------------------ |
| Id\_Cita        | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | CITA.Id\_Cita               | Cita en que se aplicó el tratamiento |
| Id\_Tratamiento | INT          | -      | ✅  | ✅  | ❌    | ❌     |                       | TRATAMIENTO.Id\_Tratamiento | Tratamiento aplicado                 |
| Observaciones   | NVARCHAR     | 200    | ❌  | ❌  | ✅    | ❌     |                       | -                           | Comentarios del tratamiento          |

## Tabla Factura
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a          | Descripción                 |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | --------------------- | --------------------------- |
| Id\_Factura  | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -                     | Identificador de la factura |
| Fecha        | DATE         | -      | ❌  | ❌  | ❌    | ❌     |                       | -                     | Fecha de emisión            |
| Metodo\_Pago | NVARCHAR     | 30     | ❌  | ❌  | ❌    | ❌     |                       | -                     | Forma de pago               |
| Monto        | DECIMAL      | 10,2   | ❌  | ❌  | ❌    | ❌     | CHECK (Monto >= 0)    | -                     | Monto total de la factura   |
| Estado\_P    | NVARCHAR     | 30     | ❌  | ❌  | ❌    | ❌     |                       | -                     | Estado del pago             |
| Id\_Paciente | INT          | -      | ❌  | ✅  | ❌    | ❌     |                       | PACIENTE.Id\_Paciente | Paciente facturado          |

## Tabla Imagen
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a          | Descripción                        |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | --------------------- | ---------------------------------- |
| Id\_Imagen   | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -                     | ID de la imagen                    |
| Ruta         | NVARCHAR     | 200    | ❌  | ❌  | ❌    | ❌     |                       | -                     | Ruta de almacenamiento             |
| Tipo         | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     |                       | -                     | Tipo de imagen (radiografía, etc.) |
| Id\_Paciente | INT          | -      | ❌  | ✅  | ❌    | ❌     |                       | PACIENTE.Id\_Paciente | Paciente relacionado               |

## Tabla Material
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                   |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | ----------------------------- |
| Id\_Material | INT          | -      | ✅  | ❌  | ❌    | ✅     |                       | -            | Identificador del material    |
| Nombre       | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ✅     |                       | -            | Nombre del material           |
| Stock        | DECIMAL      | 6,2    | ❌  | ❌  | ❌    | ❌     | CHECK (Stock >= 0)    | -            | Cantidad disponible           |
| Unidad\_M    | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ❌     |                       | -            | Unidad de medida (ml, piezas) |
