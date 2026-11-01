# Reto principal
## 1. Funcionamiento de la tabla lógica `inserted`

En Microsoft SQL Server, las tablas virtuales **`inserted`** y `deleted` son estructuras temporales creadas automáticamente por el motor de base de datos durante la ejecución de operaciones DML (`INSERT`, `UPDATE`). 

* **Naturaleza Espejo:** La tabla `inserted` posee exactamente la misma estructura de columnas y restricciones que la tabla principal (`Ventas`). Contiene una "fotografía instantánea" de los registros que intentan ser insertados.
* **Comportamiento Masivo:** No importa si la instrucción afecta a una sola fila o a miles de forma simultánea, **todos** los registros nuevos residen temporalmente de manera conjunta en `inserted` mientras el disparador (`trigger`) entra en ejecución.
* **Ciclo de vida efímero:** Su existencia se limita estrictamente al ámbito de la transacción del trigger; al finalizar la ejecución, la tabla se borra de la memoria de forma automática.
