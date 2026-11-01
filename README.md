# Reto principal
## 1. Funcionamiento de la tabla lógica `inserted`

En Microsoft SQL Server, las tablas virtuales **`inserted`** y `deleted` son estructuras temporales creadas automáticamente por el motor de base de datos durante la ejecución de operaciones DML (`INSERT`, `UPDATE`). 

* **Naturaleza Espejo:** La tabla `inserted` posee exactamente la misma estructura de columnas y restricciones que la tabla principal (`Ventas`). Contiene una "fotografía instantánea" de los registros que intentan ser insertados.
* **Comportamiento Masivo:** No importa si la instrucción afecta a una sola fila o a miles de forma simultánea, **todos** los registros nuevos residen temporalmente de manera conjunta en `inserted` mientras el disparador (`trigger`) entra en ejecución.
* **Ciclo de vida efímero:** Su existencia se limita estrictamente al ámbito de la transacción del trigger; al finalizar la ejecución, la tabla se borra de la memoria de forma automática.

## 2. Descripción del Procesamiento por Conjuntos (*Set-Based Processing*)
El paradigma relacional de SQL está diseñado nativamente para operar bajo el principio de **procesamiento por conjuntos** (*set-based processing*), a diferencia de la programación imperativa tradicional que procesa elementos de manera secuencial (fila por fila).

* **Operaciones de bloque:** En lugar de aislar elementos individuales mediante iteraciones o variables escalares, el procesamiento por conjuntos toma colecciones completas de datos y las manipula en una sola operación atómica.
* **Optimización del Motor:** El optimizador de consultas de SQL Server puede evaluar los planes de ejecución de manera masiva, aplicando indexación y paralelismo de forma mucho más eficiente que si se procesara registro por registro.

## 3. Comparativa: Operaciones Fila a Fila vs. Procesamiento por Conjuntos

Para justificar la solución del Reto Principal, se contrastan ambos enfoques técnicos aplicados al diseño de triggers:

| Dimensión de Análisis | Enfoque Tradicional (Fila a Fila / Scalar Variables) | Enfoque Masivo (Basado en Conjuntos / Set-Based) |
| :--- | :--- | :--- |
| **Manejo de la tabla `inserted`** | Asigna una variable escalar (`SELECT @ID = ID FROM inserted`) guardando únicamente un valor. | Transfiere el bloque completo mediante subconsultas directas (`SELECT ... FROM inserted`). |
| **Comportamiento ante Inserciones Múltiples** | **Falla o trunca datos:** Si entran múltiples filas, solo procesa la última de forma arbitraria ignorando el resto. | **Robusto y Escalable:** Procesa de forma nativa e íntegra el 100% de los registros insertados simultáneamente. |
| **Rendimiento y Eficiencia** | Ineficiente, introduce cuellos de botella conceptuales similares a un bucle implícito. | Altamente optimizado por el motor relacional de SQL Server para operaciones en bloque. |
| **Alineación con el Paradigma SQL** | Antipatrón en bases de datos relacionales. | Cumple con los estándares formales de diseño y bases de datos relacionales. |
