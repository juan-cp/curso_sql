
use programbi1
--CURSOR
--usar tabla registro cargos e imprimir en pantalla por cada cargo la frase
--UN TIPO DE CARGO EXISTENTE ES: <cargo>
select * from registro_cargos
--crear el cursor y se�alar la tabla/consulta que recorrer�
declare micursor cursor
for select * from registro_cargos
--activar el objeto 
open micursor
--empezar a recorrer
--primero tengo que crear una variable receptora (almacenar la data que extrae el cursor)
declare @cargo varchar(25)
--empieza el recorrido
-- primera instruccion: extraer data con el cursor (FETCH)
fetch next from micursor into @cargo
--pasamos a iterar
while @@FETCH_STATUS=0 
--@@FETCH_STATUS una variable de sistema que vale 1 
--si la tabla de extracci�n se acaba, 0 si no
begin
	print('un tipo de cargo existente es:' + @cargo) --lo que hace (imprimir y mostrar)
	fetch next from micursor into @cargo --pasa a siguiente fila
end
--cierre y desposicionamiento 
close micursor --desactivo
deallocate micursor -- desposicionar 


--CONVERT/IIF

SELECT 25.65+25.75
SELECT CONVERT(varchar,25.65)+CONVERT(varchar,25.75)
select CONVERT(date,'2019-01-02 14:50:00')

--ejemplo: entregar fecha desde texto formato latinoamericano
select '28-07-2020' --texto
select right('28-07-2020',4)
select left('28-07-2020',2)
select substring('28-07-2020',charindex('-','28-07-2020')+1,2)

select concat(right('28-07-2020',4),'-', substring('28-07-2020',charindex('-','28-07-2020')+1,2),'-',left('28-07-2020',2))

--creando una funcion

alter function conversion_fecha(@fecha varchar(max))
returns date 
AS
BEGIN
    declare @fecha_salida DATE
    set @fecha_salida = (select convert(date,concat(right(@fecha,4),'-', substring(@fecha,charindex('-',@fecha)+1,2),'-',left(@fecha,2))))
    
    return @fecha_salida
END

select dbo.conversion_fecha('31-07-2022')



 '2020-07-28' --date7


SELECT 25.65+25.75+CONVERT(varchar,21.55)
SELECT IIF(500<1000,'Y','N')
----Funciones de texto
SELECT CHARINDEX('te','cliente')
SELECT CHARINDEX('te','cliente',0)
SELECT CONCAT(25.65,25.75,21.55)
SELECT LEFT('program bi',3)
SELECT RIGHT('program bi',3)
SELECT LEN('programbi')
SELECT '   hola  '
SELECT LTRIM('   hola  ')
SELECT LEN(LTRIM('   hola  '))
SELECT RTRIM('   hola  ')
SELECT LEN(RTRIM('   hola  '))
SELECT TRIM('    hola     ')
SELECT LEN(TRIM('    hola     '))
SELECT REPLACE('Tutorial','T','S')
SELECT UPPER('sql')
SELECT SUBSTRING('Tutorial SQL',1,3)
SELECT REPLACE('Tutorial de SQL','SQL','HTML')

--Funciones de fecha

SELECT CURRENT_TIMESTAMP  --especificamente un datetime
SELECT CONVERT(date,CURRENT_TIMESTAMP)
--diferencia de fechas en dias (d), meses (m) semanas (ww)
SELECT DATEDIFF(d,'2022-01-01',CONVERT(date,CURRENT_TIMESTAMP))
SELECT DATEDIFF(m,'2022-01-01',CONVERT(date,CURRENT_TIMESTAMP))
SELECT DATEDIFF(ww,'2022-01-01',CONVERT(date,CURRENT_TIMESTAMP))
--agregar a fecha de hoy 3 meses / 1 año más
--(d,m,ww,yy)
SELECT DATEADD(m,3,CONVERT(date,CURRENT_TIMESTAMP))
SELECT DATEADD(yy,1,CONVERT(date,CURRENT_TIMESTAMP))
SELECT DATEADD(m,-3,CONVERT(date,CURRENT_TIMESTAMP))
--fin de mes actual
SELECT EOMONTH(CONVERT(date,CURRENT_TIMESTAMP),0)
--fin de mes anterior
SELECT EOMONTH(CONVERT(date,CURRENT_TIMESTAMP),-1)
--fin del próximo mes
SELECT EOMONTH(CONVERT(date,CURRENT_TIMESTAMP),+1)

select day(CONVERT(date,CURRENT_TIMESTAMP))
select month(CONVERT(date,CURRENT_TIMESTAMP))
select year(CONVERT(date,CURRENT_TIMESTAMP))

--que dia de la semana es hoy?
--DATEPART(d,...) <=> day()
--DATEPART(m,...) <=> month()
--DATEPART(yy,...) <=> year()
--datepart(ww,...) <=> semana del año que esta una fecha
--datepart(dw,...) <=> dia de la semana para una fecha 

SELECT DATEPART(dw,CONVERT(date,CURRENT_TIMESTAMP))


--ETL : Extraccion-Transformacion-Carga(Load)
--Extraccion de datos de alguna fuente (CSV, TXT, XLS, JSON...etc.) 
--Datos vienen en forma RAW 
--(en bruto, sin procesar)

--TRANSFORMAR : convertir datos al formato SQL, usar convenciones 

--CARGA : con la data procesada

-- Ejercicio: usar convert y funciones de texto para un BULK insert sin el bloc de notas
--ETL--

--EXTRACCION
--CREAR UNA TABLA TEMPORAL QUE RECIBA LA DATA RAW
--LOS CAMPOS DE LA TT SON TODOS TEXTO
use programbi1

create table carga_salarios_bu (id_empleado varchar(max), 
apellido varchar(max),
nombre varchar(max),
seccional varchar(max), 
facultad varchar(max),
cargo varchar(max),
salario varchar(max), 
fecha_comienzo varchar(max),
fecha_nacimiento varchar(max))

--mover a directorio del container para acceder al archivo
--docker cp /Users/jcarrap/Desktop/Base_salarios_2.csv 5083b1a3b25e:/Base_salarios_2.csv
--
BULK INSERT carga_salarios_bu 
FROM '/Base_salarios_2.csv'
WITH(FIELDTERMINATOR=';',ROWTERMINATOR='\n',FIRSTROW=2)

SELECT * FROM carga_salarios_bu

TRUNCATE TABLE salarios$
SELECT * FROM salarios$

create table salarios (id_empleado int, 
apellido varchar(max),
nombre varchar(max),
seccional varchar(max), 
facultad varchar(max),
cargo varchar(max),
salario float, 
fecha_comienzo date,
fecha_nacimiento date)


INSERT INTO salarios select 
CONVERT(int,trim(id_empleado)),
TRIM(apellido),
TRIM(nombre),
TRIM(Seccional),
TRIM(Facultad),
TRIM(Cargo),
CONVERT(float,salario),
CONVERT(date,right(trim(fecha_comienzo),4)+'-'+substring(trim(fecha_comienzo),4,2)+'-'+left(trim(fecha_comienzo),2)),
CONVERT(date,right(trim(fecha_nacimiento),4)+'-'+substring(trim(fecha_nacimiento),4,2)+'-'+left(trim(fecha_nacimiento),2))
FROM #carga_salarios

select * from salarios













