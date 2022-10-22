# CLASE 7

Funciones Tabulares y Multisentencia
------------------------------------

Como vimos en la sección anterior, una función puede tener un output escalar (valor único) o vectorial (entrega como resultado una tabla). A este último tipo se le conoce como **función tabular**.

La sintaxis para crear una función tabular es similar a lo revisado en clases anteriores, solo que como resultado se obtiene una tabla:

    CREATE FUNCTION nombre_funcion (@param1 tipo1 ..)
    RETURNS TABLE
    AS
    RETURN
    (...codigo para generar tabla...)
    

Además, podemos crear una tabla que sea definida en una función, y que por ende usará más comandos que un `SELECT`, sino también `INSERT, DELETE, UPDATE,` etc. A este tipo de bloques se les denomina **funciones multisentencia:**

    CREATE FUNCTION nombre_funcion (@param1 tipo1 ....)
    RETURNS @tabla_retorna table(campos a retornar )
    AS BEGIN
        INSERT INTO @tabla retorna
        SELECT ...
        RETURN
    END
    

Triggers
--------

Un Trigger o desencadenador es un tipo de procedimiento almacenado que se ejecuta automáticamente cuando se produce un evento de Lenguaje de Manipulación de Datos (DML), o sea cuando se ejecuta un `INSERT, UPDATE o DELETE` en una tabla o un evento de Lenguaje de Definición de Datos (DDL) por ejemplo un `DROP TABLE`.

Un gatillo se activa cuando ocurre un evento, por ende es condicionado a que el evento ocurra. El gatillo se puede activarse antes o después de que el evento ocurra, aunque para nivel intermedio de SQL consideramos gatillos con activación posterior a la ocurrencia del evento.

Para crear un Trigger, usar la siguiente sintaxis:

    CREATE TRIGGER nombre_trigger
    ON tabla_inicial FOR tipo_evento
    AS
    BEGIN
    ...
    END
    

En este caso el tipo de evento puede ser un DML o DDL, para los DML seria `INSERT/UPDATE/DELETE`. El evento que activa el gatillo entregará un objeto `inserted/updated/deleted` que corresponderá a una tabla resultante o que recibe la acción: por ejemplo, si quiero gatillar una acción a partir de una inserción realizada, puedo obtener sus características llamando al objeto `inserted`.

Los triggers pueden ser modificados con `ALTER TRIGGER` y eliminados con `DROP TRIGGER`.

Ejecución y Programación en SQL
-------------------------------

Una ventaja importante de SQL es que no sólo es un lenguaje de consulta, sino también un lenguaje de programación: podemos crear programas que se ejecutan línea por línea, pueden iterar, agregar condicionales, etc.

En SQL Server podemos imponer condiciones sobre la ejecución de una instrucción SQL. La instrucción SQL que sigue a una palabra clave `IF` y su condición se ejecuta si se cumple la condición. La palabra clave `ELSE` opcional introduce otra instrucción SQL que se ejecuta cuando no se cumple la condición `IF`:

    IF <condicion>
        BEGIN
            Ejecucion ...
        END
    ELSE
        BEGIN
            Ejecucion ...
        END
    

Así mismo podemos almacenar conjuntos de instrucciones y ejecutarlas cuando queramos. Esto se puede hacer por medio de un **Procedimiento Almacenado**: si tiene una consulta SQL que escribe una y otra vez o tareas de DML, guárdela como un procedimiento almacenado y luego llámela para ejecutarla.

También se pueden pasar parámetros a un procedimiento almacenado, como una función (y recalcamos "como", ya que un procedimiento no exige retornar valores):

    --sintaxis
    CREATE PROCEDURE nombre_procedimiento (@param1 tipo1 ,
    @param2 tipo2 ...)
    AS
    BEGIN
    ...
    END
    --ejecute el procedimiento 
    EXEC nombre_procedimiento
    
