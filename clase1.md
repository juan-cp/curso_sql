
# CLASE 1 - Introducción a las bases de datos

Una Base de datos es un conjunto de datos pertenecientes a un mismo contexto y almacenados metodologicamente para su uso a futuro. Actualmente gracias al desarrollo tecnologico que se esta dando y a la gran cantidad de datos que se tienen, han surgido varias soluciones al almacenamiento de datos. Dichas soluciones se conocen formalmente como sistemas de gestion de bases de datos, o DBMS por sus siglas en inglés. Estos sistemas permiten gestionar las bases de datos, sus sub-componentes como tablas o consultas, y utilizan un lenguaje estándar de consulta llamado SQL que significa "Lenguaje estructurado de consultas (Structured Query Language)" Los principales Motores de bases que estan en el mercado son: ORACLE, MySQL, SQL Server, PostGreSQL, SQLite.

Nota: las bases de datos más usadas en el mercado: https://db-engines.com/en/ranking/relational+dbms

## Instalación de DBMS en máquina local

Los sistemas DBMS funcionan con un paradigma **cliente-servidor**, el cual es ampliamente frecuente en sistemas computacionales.

En este caso, por medio de la instalación de SQL Server lo que haremos será transformar nuestro PC local en un servidor de SQL (vale la pena repetir: local y además limitado a las capacidades de nuestro PC). Para hacer peticiones a este servidor, instalaremos un programa de gestión de base de datos que actuará como cliente; es decir, en nuestro PC tendremos el servidor y el cliente instalado a la vez.

Para este curso usaremos como servidor el SQL Server de Microsoft, y como clientes podremos usar SQL Server Management Studio (SSMS) o Azure Data Studio, los cuales procederemos a explicar su instalación en el PC local.

### Instalación de SQL Server + SQL Server Management Studio.

1. Lo primero que haremos será transformar nuestro PC en un servidor local de SQL. Para ello descargamos de https://www.microsoft.com/es-es/sql-server/sql-server-downloads la versión Express de SQL Server. 
2. Abrimos el archivo descargado y seleccionamos la opción "Básica" de instalación. Aceptamos los términos de la licencia y seguimos el proceso de instalación con la opción "siguiente".
3. El instalador empezará a descargar e instalar la plataforma. Asegurarse de tener una conexión estable para que el instalador
proceda sin inconvenientes. Cuando el instalador haya terminado aparecerá en la ventana "Installation has completed successfully".
4. Se nos dá la opción de instalar SSMS inmediatamente, lo podemos hacer pulsando el botón "Install SSMS" que nos llevará a la página de descarga, y seguir de manera manual las instrucciones.
5. *SSMS*: Descargamos el programa desde aquí : https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15 
6. Se iniciará la descarga del SQL Server Management Studio (archivo de más de 600 MB) Aceptamos los términos de la licencia y procedemos a instalar. 7. Al abrir SSMS nos aparecerá un dialog titulado "connect to server": en este establecemos la conexión al servidor anteriormente instalado. Importante que el programa reconozca como nombre del servidor el PC local, ya que eso indica que reconoce una instancia local de SQL server (instalada anteriormente según la primera parte de este documento). De ser así, basta con autenticación de Windows (en Authentication) para poder conectarse al servidor local.
8. Al presionar "Connect" ya estamos exitosamente conectados al servidor local de SQL y podremos trabajar en las actividades del curso.

### Alternativa: Azure data Studio

1. Ingresamos al sitio de descarga de Azure Data Studio: https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15  y bajamos la versión correspondiente a nuestro sistema.
2. Abrimos el instalador y se comenzará a instalar el programa.
3. Una vez instalado debemos crear una conexión con nuestro servidor local de SQL Server. Para ello en la ventana bienvenida de Azure
Data Studio, seleccionamos la opción "New Connection" Aparecera una ventana emergente donde ingresaremos los parámetros de la conexión:
``Server=localhost / Authentication Type=Windows Authentication / Database=<default> / Server group =<default>``


Una forma de chequear que el proceso haya sido correcto es revisando la pestaña Servers de Azure, donde debiera aparecer nuestro ``localhost`` conectado y con las subcarpetas de trabajo.

## Creando y apuntando una bbdd usando ``CREATE DATABASE``/`USE`

Procederemos a crear nuestra primera bbdd. Para ello en SSMS podemos hacer el proceso manual:

- Haga clic con el botón derecho en Bases de datos y luego seleccione Nueva base de datos.
- En Nueva base de datos, ingrese un nombre de base de datos.
- Para crear la base de datos aceptando todos los valores predeterminados, seleccione Aceptar; de lo contrario, continúe con los siguientes pasos opcionales.

Sin embargo, el proceso anterior se puede hacer mediante un **script**, el cual implica abrir una ventana de *New Query* y comenzar a codear. Al abrir una nueva ventana de scripting (queries) usamos el comando:

``CREATE DATABASE mi_base_de_datos``

Y esto creará una nueva base. De igual manera utilizando el comando

`USE mi_base_de_datos`

Implica que todas las consultas y procesos que se escriban en la ventana de script se harán sobre la base de datos apuntada. 

## Tablas

Como objeto clave de una BBDD, Una tabla es un objeto que esta formado por columnas, las cuales están interrelacionadas a través de la información que contienen. En jerga de bases de datos a una columna se le conoce como *campo*, mientras que una fila se le conoce como *registro*.

En una BBDD, las tablas tienen un nombre único. Una BBDD puede contener varias tablas, y las tablas estar relacionadas entre sí por campos que comparten, llaves (un tipo de campo que revisaremos más adelante) y relaciones de cardinalidad entre sus registros (que también veremos más adelante). El conjunto de tablas y relaciones en una BBDD se conoce como el **Esquema de una BBDD** y se puede representar gráficamente en un diagrama que se conoce como **diagrama Entidad-Relación** 

Ejemplo de diagrama ER: https://docs.staruml.io/working-with-additional-diagrams/entity-relationship-diagram







