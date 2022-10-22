
# CLASE 2

Inserción de registros y populating
-----------------------------------

`INSERT` crea una fila con cada columna establecida en su valor predeterminado

    INSERT INTO tbl_name ( campos...) VALUES( valores...);
    

Es decir, se cargan una lista de campos determinados (que pueden ser todos) y sus valores respectivos. Un valor de un campo también se le conoce como _Instancia_.

Para poblar tablas desde archivos externos, los datos deben respetar las convenciones geográficas del cliente(PC) que hace la carga.

*   Las cadenas de texto siempre deben ir entre comillas.
    
*   Por ejemplo las fechas en SQL son en formato yyyy-mm-dd. Deben ir entre comillas como cadenas de texto.
    
*   Los números decimales separan el número con la parte decimal con un punto.
    

Desde SSMS se pueden importar archivos excel, planos de texto (txt) o separados por comas (csv) por medio de un asistente. Acceder a un asistente se puede utilizando el _boton derecho del mouse sobre la base de datos &rarr; Import Data o Import Flat File._

En el caso de Azure Data Studio, se puede importar instalando una extensión llamada _SQL Server Import_ que permitirá hacer tareas similares al asistente de SSMS. Más info en [https://docs.microsoft.com/en-us/sql/azure-data-studio/extensions/sql-server-import-extension?view=sql-server-ver15](https://docs.microsoft.com/en-us/sql/azure-data-studio/extensions/sql-server-import-extension?view=sql-server-ver15)

Consultas en SQL
----------------

La sintaxis clásica de una consulta en SQL es la siguiente (vamos a revisar sus partes en las próximas slides)

    --Sintaxis consulta
    SELECT campo1, campo2, ...
    FROM tabla
    WHERE condicion
    ORDER BY campo1 ASC/DESC
    --Seleccionar toda una tabla
    SELECT * FROM tabla
    

Adicionalmente puedo copiar valores de una tabla\_1 a otra tabla\_2 utilizando una sintaxis combinada de `INSERT` y `SQL`:

    --copia de tabla_1 a tabla_2
    INSERT INTO tabla_2 SELECT * FROM tabla_1
    

Condicionales en cláusula WHERE
-------------------------------

La cláusula `WHERE` involucra condiciones. En general una condicion es una proposición lógica, es decir un enunciado cuyo valor es verdadero o falso. Siendo `WHERE` una instrucción en bloque (como `SELECT` también), evaluará qué registros de un campo cumplen con la condición, y los filtrará del bloque final.

    --CONDICIONALES
    --operadores
    WHERE campo > valor -- mayor que
    WHERE campo < valor --menor que
    WHERE campo >= valor --mayor o igual
    WHERE campo <= valor --menor o igual
    WHERE campo <> valor -- distinto
    WHERE campo = valor --igual
    WHERE campo LIKE patron (veremos en Seccion 2)
    WHERE campo IN (valor1, valor2...)--si el campo esta en un conjunto de valores
    WHERE campo BETWEEN rangomin AND rangomax --si el campo esta entre rangomin y rango max
    WHERE campo IS NULL -- filas en donde el campo seleccionado es null
    WHERE campo IS NOT NULL --filas donde el campo no es null (vacio)
    

Respecto a lo anterior, entenderemos los valores `NULL`, como un dato vacío que posee algún campo para un registro específico en un tabla. Es decir, una celda donde no hay nada (ni siquiera espacios en blanco, por lo que una celda en blanco podría no ser `NULL`; en general las celdas vacías mostrarán un `NULL` para evitar confusiones).

Como `WHERE` evalúa proposiciones lógicas, sus valores de verdad pueden ser sujeto a los operadores tradicionales lógicos (de conjunción, disyunción, negación).

    -Operadores Logicos
    --operador AND
    SELECT campo1, campo2, ...
    FROM tabla
    WHERE condicion1 AND condicion2 AND condicion3...
    --operador OR
    SELECT campo1, campo2, ...
    FROM tabla
    WHERE condicion1 OR condicion2 OR condicion3...
    --operador NOT
    SELECT campo1, campo2, ...
    FROM tabla
    WHERE NOT condicion;
    
Comando ORDER BY
----------------

Cuando usa la instrucción `SELECT` para consultar datos de una tabla, el conjunto de resultados no se ordena. Significa que las filas del conjunto de resultados pueden estar en cualquier orden.

Para ordenar el conjunto de resultados, agrega la cláusula `ORDER BY` a la instrucción `SELECT`. A continuación se ilustra la sintaxis de la cláusula `ORDER BY`:

    SELECT 
       (lista)
    FROM 
       tabla_nombre
    WHERE ...
    ORDER BY columna1 ASC columna2 DESC
    

Comando DISTINCT
----------------

Dentro de una tabla, una columna a menudo contiene muchos valores duplicados; a veces solo desea enumerar los valores distintos. El comando `DISTINCT` elimina repeticiones de una tupla de datos en una fila.

    SELECT DISTINCT columna1, columna2, ...
    FROM tabla_nombre;
    
    
