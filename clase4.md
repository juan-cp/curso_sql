# CLASE 4


Llave primaria y campo autoincremental
--------------------------------------

Una llave primaria (o _primary key_, `PK`) es un campo (o combinación de campos) que identifica de manera única a cada fila en una tabla

    CREATE TABLE nombre(f1 t1, f2 t2, PRIMARY KEY(campo_llave))
    --alternativa
    CREATE TABLE nombre(f1 t1 PRIMARY KEY, f2 t2...
    

La forma general de crear una tabla con un campo autoincremental es la siguiente

    CREATE TABLE nombre(f1 int IDENTITY, f2 t2,...)
    

En el caso anterior, el campo `f1` es autoincremental, y siempre es un tipo de dato `int`.

Llaves Foráneas
---------------

Una clave foránea es una columna o grupo de columnas de una tabla que contiene valores que coinciden con la clave primaria de otra tabla. Las claves foráneas se utilizan para unir tablas.

Generalmente las llaves foráneas se utilizan para construir referencias en tablas de paso (es decir, tablas que consolidan registros que relacionan 2 o más tablas).

    create table tabla2 (campo1 tipo1, campo2 tipo2, ...campollave REFERENCES tabla1(campollave))


Declaración de Variables y Funciones
------------------------------------

Podemos usar la instrucción `DECLARE` para indicar o declarar una o más variables. A partir de ahí, podemos utilizar el comando `SET` para inicializar o asignar un valor a la variable.

    DECLARE @variable tipo
    SET @variable=valor
    

Una función definida por el usuario es una rutina que acepta parámetros, realiza una acción, como un cálculo complejo, y devuelve el resultado de esa acción como un valor.

$$(x\_1,x\_2,\\ldots)\\rightarrow f(x\_1,x\_2,\\ldots)\\rightarrow output $$
El valor de retorno puede ser un valor escalar (único) o una tabla. Una sintaxis para una _función escalar_ es la siguiente:

    CREATE FUNCTION nombre_funcion(par1 t1,par2 t2...)
    RETURNS tipo_variable_salida 
    BEGIN
    ....
    returns @variable_salida
    END
    

Nota sobre el código anterior: en resumen, creamos una variable de salida dentro del código de la función, que va a recibir el resultado del procedimiento que ejecute la función.

Tablas Temporales
-----------------

Permiten generar una tabla a partir de una consulta. Se le denomina tabla temporal por que queda almacenada en memoria caché (temporal) mientras la sesión está abierta o el servidor permanece corriendo; una vez cerrada la sesión o apagado el servidor, la tabla desaparece con sus datos ingestados. La sintaxis es la siguiente:

    SELECT ....
    INTO #tablatemporal
    FROM ...
    WHERE ...
    
    

Nota: usar un # para acceso local, ## para acceso global **Importante:** La tabla temporal siempre quedará en una BBDD temporal del servidor que se llama `tempdb`; no es un objeto que quede en la BBDD que estamos usando.

