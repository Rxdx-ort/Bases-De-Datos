# Ventas Vehiculos 


## Tabla Sucursal

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| NumeroSucursal     | INT          | -      | ✅  | ❌  |  ❌  | ✅     |                                       | -                                | Identificador de sucursal              |
| NombreSucursal        | NVARCHAR      | 20    | ❌  | ❌  | ❌   |   ✅   |              | -                                | Nombre de la Sucursal             |
| Ubicacion          | NVARCHAR          | 20      | ❌  | ❌  | ❌   |   ✅   |          | -                                |Ubicacion de la Sucursal                        


## Tablas clientes 

Tabla Cliente

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| NumeroCliente     | INT          | -      | ✅  | ❌  |  ❌  | ✅     |                                       | -                                | Identificador del cliente             |
| Nombre       | NVARCHAR      | 20    | ❌  | ❌  | ❌   |   ✅   |              | -                                |   Nombre de el cliente            |
| Curp         | NVARCHAR          | 20      | ❌  | ❌  | ❌   |   ✅   |          |   |
 | calle           | NVARCHAR        | 20      |❌  | ❌  | ❌   |   ✅   |           |   |                      |
  | Ciudad           | NVARCHAR        |20      |❌  | ❌  | ❌   |   ✅   |            |   |                     |


## Tabla de Vehiculos 

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| NumeroVehiculo    | INT          | -      | ✅  | ❌  |  ❌  | ✅     |                                       | -                                | Identificador de Vehiculo             |
| NumSucursal        | INT       | -     | ❌  | ✅  | ❌   |   ❌   |              | -                                | Nombre de la Sucursal            |
| Marca          | NVARCHAR          | 20      | ❌  | ❌  | ❌   |   ✅   |          | -                                |Marca del coche 
| Modelo         | NVARCHAR          | 20     |  ❌ | ❌  |  ❌  | ✅     |                                       | -                                | Modelo del Vehiculo             |
| Color              | NVARCHAR       | 20    | ❌  | ❌  | ❌   |   ✅   |              | -                                | Color del Vehiculo           |
| Placas          | NVARCHAR          | 20      | ❌  | ❌  | ❌   |   ✅   |          | -                                |Placas del coche 


## Tabla de Renta


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| NumeroCliente   | INT          | -      | ✅  | ✅  |  ❌  | ❌     |                                       | -                                | Identificador de Cliente            |
| NumVehiculo        | INT       | -     | ✅  | ✅  | ❌   |   ❌   |              | -                                | Identificador del Vehiculo           |
| fechaInicio          | INT          | -     | ❌  | ❌  | ❌   |   ✅   |          | -                                |fecha de Inicio de la renta 
| fechaFin         | INT          | -   |  ❌ | ❌  |  ❌  | ✅     |                                       | -                                | fecha de Fin de la Renta             |
| Lugar de entrega              | NVARCHAR       | 20    | ❌  | ❌  | ❌   |   ✅   |              | -                                | Lugar de entrega del Vehiculo           |