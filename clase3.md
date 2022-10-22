
# CLASE 3
Wildcards o patrones
--------------------

Como mencionamos anteriormente, el comparador `LIKE` se utiliza para encontrar patrones o declarar filtros que permiten de forma eficiente obtener sub-conjuntos de los datos. Para representar patrones que serán utilizados en un comparador `LIKE`, se utilizan los siguientes caracteres:

*   `%`: Representa cero o más caracteres
    
*   `_`: Representa 1 sólo caracter
    
*   `[]`: Representa un conjunto o intervalo de caracteres, según lo que se especifique dentro de los corchetes.
    

De esta manera podemos encontrar algunos ejemplos como los siguientes:

    WHERE campo LIKE 'a%' --Busca cualquier valor que comience con "a"
    WHERE campo LIKE '%a' --Encuentra cualquier valor que termine con "a"
    WHERE campo LIKE '%or%' --Busca cualquier valor que tenga "o" en cualquier posicion
    WHERE campo LIKE '_r%' --Encuentra cualquier valor que tenga "r" en la segunda posicion
    
    WHERE campo LIKE 'a__%' --Busca cualquier valor que comience con "a" y tenga al menos 3 caracteres de longitud
    WHERE campo LIKE 'a%o'  --Busca cualquier valor que comience con "a" y termine con "o"
    

Cláusula GROUP BY y funciones
-----------------------------

La declaración `GROUP BY` agrupa las filas que tienen los mismos valores en un campo determinado, como "encontrar el número de clientes en cada país". La instrucción `GROUP BY` se utiliza a menudo con funciones de agregado ( `COUNT(), MAX(), MIN(), SUM(), AVG()`) y agrupando el conjunto de resultados de una o más columnas.

    SELECT *, funcion de agregado
    FROM tabla
    WHERE condicion
    GROUP BY *
    

Nota: importante que al especificar una función de agregado según un lote de campos previos, el lote de campos deberá ser escrito en GROUP BY, que es lo que se señala con \* en la query anterior.


Borrar y actualizar registros
-----------------------------

Como parte de las operaciones de escritura (que deben estar debidamente autorizadas) se pueden borrar filas o actualizar filas según una condicion en particular. La sintaxis de estas operaciones es la siguiente:

    --Borrar registro
    DELETE FROM tabla WHERE condicion
    -- Actualizar registro
    UPDATE tabla SET campo1=..,campo2=..
    WHERE condicion
    

Recomendación: trabaje con esta programación en ambientes de desarrollo, ya que puede perder datos irreversiblemente si lo hace en un ambiente de producción.

Nota: Cuando usamos comando `DELETE` en nuestras tablas es necesariamente un cambio irreversible. Mientras que algunas operaciones con `UPDATE` pueden ser reversibles (matemáticamente u operacionalmente); por ejemplo, duplicar una fila con un `UPDATE` puede ser deshecho con otro `UPDATE` que divida a la mitad.

Condicionales usando CASE-WHEN
------------------------------

La instrucción `CASE` pasa por condiciones y devuelve un valor cuando ante la primera condición que se cumpla. Entonces, una vez que una de las condiciones es verdadera, dejará de leer y devolverá el resultado. Si no se cumple ninguna condición, devuelve el valor de la cláusula `ELSE`. Una sintaxis para un `CASE-WHEN` es la siguiente:

    SELECT campo1, campo2, ....
    CASE WHEN condicion1 THEN resultado1
    WHEN condicion2 THEN resultado2 
    
    ...
    
    ELSE resultadoN
    END
    FROM tabla
    

Introducción a las Vistas
-------------------------

En SQL, una vista es una tabla virtual basada en el conjunto de resultados de una declaración SQL. Una vista contiene filas y columnas, como una tabla real. Los campos de una vista son campos de una o más tablas reales de la base de datos.

Puede agregar sentencias y funciones SQL a una vista y presentar los datos como si vinieran de una sola tabla. Se crea una vista con la instrucción `CREATE VIEW`. También se puede modificar una vista (con `ALTER VIEW`) o eliminarla con `DROP VIEW`

    CREATE VIEW nombre_vista AS
    ..query con inputs de vista
    --SE PUEDE USAR ALTER/DROP
    DROP VIEW nombre_vista
    ALTER VIEW nombre_vista AS
    ...query con cambios
    

Notas importantes sobre las vistas: - Si se modifican los datos de una tabla, la vista alimentada por dicha tabla se actualizará automáticamente (ya que es una query almacenada que se ejecuta cuando se usa). - Puedo ver cómo está constituída una vista en SSMS, botón derecho en la vista &rarr; opción "Design".
