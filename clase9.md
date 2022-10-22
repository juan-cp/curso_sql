# CLASE 9


ETLs y automatización de ingestas
-----------------------------

Una carga de archivo plano con separadores puede hacerse usando el asistente (en SSMS) pero también por medio de instrucciones en SQL. Para ello utilizamos el comando `BULK INSERT`

    BULK INSERT tabla_receptora
    FROM 'ruta_archivo'
    WITH(FIELDTERMINATOR='sep_columnas',
    ROWTERMINATOR='sep_filas',
    FIRSTROW='fila_de_partida')
    

Algunos detalles importantes de ésta instruccion:

*   Generalmente el `FIELDTERMINATOR` son comas, mientras que el `ROWTERMINATOR` es un salto de línea (representado por `\n`).
    
*   `BULK INSERT` como instrucción carga los datos en el formato que están en el archivo de origen; por ende, debemos preocuparnos de que los datos vengan en el formato correcto y consistente con la tabla donde se hara la ingesta. Si los datos no vienen en un formato consistente con la tabla, pueden en primer lugar cargarse en una tabla temporal como texto (sólo campos `varchar(max)`) y luego utilizar funciones de conversion.

    

Tablas dinámicas
----------------

Como sabemos, el instrumento de excelencia para operar con tablas dinámicas es MsExcel. Sin embargo, cuando los volumenes de datos superan el orden de \\(10^7\\) registros, una tabla dinámica en excel comenzará a ponerse lenta e inmanejable. Para esto existe la función `PIVOT` que emula las funciones de excel mencionadas:

    SELECT  <columna_no_pivote>,
            <lista_columnas_a_pivotear>
    FROM
    (<SELECT query que produce datos>)
    AS <nombre_alias>
    PIVOT
    (
    <funcion de agregado>(<columna agregado>)
    FOR
    [<campo desde el cual sale lista_columnas_a_pivotear>]
    IN ( [ <lista_columnas_a_pivotear> ] )
    ) AS <alias_pivot>
