# CLASE 8


Cursores y Loops
--------

Una introducción a los objetos iterativos en programación en SQL son los cursores. El cursor es un objeto de base de datos para recuperar datos de un conjunto de resultados una fila a la vez, en lugar de los comandos vistos hasta ahora que operan en todas las filas del conjunto de resultados a la vez. En consecuencia, **el cursor es el unico objeto que recorre una consulta línea por línea.**

    DECLARE nombre_cursor CURSOR
    FOR especificacion_consulta
    --activar_cursor
    OPEN nombre_cursor
    --recorrer fila por fila
    FETCH NEXT FROM nombre:cursor INTO variables_cursor
    WHILE @@FETCH_STATUS = 0
        BEGIN
        ...
        FETCH NEXT FROM nombre:cursor INTO variables_cursor
        END
    CLOSE nombre_cursor --cierra cursor
    DEALLOCATE nombre_cursor -- desposicionar
    

Instrucciones Dinámicas
-----------------------

Se puede ejecutar una instruccion SQL a partir de una cadena de texto que esté parametrizada

    EXEC ('Instruccion como cadena de texto')
    

NOTA: esto habilita para crear instrucciones dinámicas que puedan usar funciones de texto.

Consultando al esquema
----------------------

Lo anterior puede usarse para hacer subrutinas que recorran toda la BBDD. Para obtener información de la BBDD que estamos usando, podemos consultar al `INFORMATION_SCHEMA`

    --obtiene tablas
    SELECT * FROM nombre_bbdd.INFORMATION_SCHEMA.TABLES
    --obtiene tablas y sus columnas
    SELECT * FROM nombre_bbdd.INFORMATION_SCHEMA.COLUMNS
    --Contar numero de tablas en bbdd
    SELECT COUNT(TABLE_NAME) FROM nombre_bbdd.INFORMATION_SCHEMA.TABLES
    

Comandos de conversión e IIF
----------------------------

La función CONVERT () convierte un valor (de cualquier tipo) en un tipo de datos específico.

    CONVERT(tipodato, dato)
    -- sintaxis alternativa
    CAST(valor AS tipo_datos)
    

Además de los comandos case-when, existe una sintaxis simple para un if dentro de un campo determinado, para esto se usa el comando IIF

    IF(condicion, valor_if_true, valor_if_false)
    

Una forma astuta de reemplazar el siguiente case-when

    case when var=x then 'a'
    when var=y then 'b' 
    else 'c'
    end
    

Es la siguiente:

    iif(var=x,'a',iif(var=y,'b','c'))
    

Es decir podemos anidar para aprovechar la sintaxis resumida de la instruccion `iif`.

Funciones de Texto/Fecha
------------------------

Existen una gran cantidad de funciones para operar con texto en SQL, que están ampliamente documentadas. Aquí mencionaremos las más importantes:

*   `CHARINDEX()`: La función `CHARINDEX()` busca una subcadena en una cadena y devuelve la posición `CHARINDEX(substring, string, start)`
    
*   `CONCAT:` La función `CONCAT()` agrega dos o más cadenas juntas. `CONCAT(string1, string2, ...., string_n)`
    
*   `LEFT/RIGHT`: La función `LEFT ()/RIGHT ()` extrae varios caracteres de una cadena (empezando por la izquierda/derecha). `LEFT/RIGHT(string, no_caracteres)`
    
*   `LTRIM/RTRIM` elimina los espacios iniciales de una cadena.  
    `LTRIM/RTRIM(string)`
    
*   `REPLACE:` reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena. `REPLACE(string, vieja_subcadena, nueva_subcadena)`
    
*   `STUFF`: elimina una parte de una cadena y luego inserta otra parte en la cadena, comenzando en una posición especificada.  
    `STUFF(string, partida, largo, nuevo_string)`
    
*   `LOWER/UPPER` : lleva todo a minúsculas o mayúsculas respectivamente
    
*   `SUBSTRING:` La función extrae algunos caracteres de una cadena. `SUBSTRING(string, partida, largo)`
    

Análogamente, entre las funciones de fecha a destacar tenemos:

*   `CURRENT_TIMESTAMP` entrega la fecha y hora actual
    
*   `DATEDIFF(unidad, fecha1, fecha2)` entrega la diferencia entre 2 fechas en la unidad especificada (por ejemplo 'd' días, 'm' meses, 'yy' años, 'ww' semanas, etc.)
    
*   `DATEADD(unidad, cantidad, fecha)` agrega a la fecha una cantidad de unidades de fecha (análogo a anterior)
    
*   `EOMONTH(fecha,meses_agregar)`, entrega la fecha de fin de mes para una cantidad de meses atras (-) o adelante (+); si quiere el fin del mes actual, `meses_agregar=0`
    
*   `DAY(),MONTH(),YEAR()` obtiene día, mes, y año de una fecha en particular.
    
*   `ISDATE()` permite verificar si un texto es fecha o no.
    
*   `@@DATEFIRST` es una constante del sistema que define cual es el primer día de la semana.
    
*   `DATEPART(unidad,fecha)` entrega una parte de la fecha según definición. Por ejemplo para saber qué día de la semana es, colocar 'dw'
    
