
--ETL--
--extraccion, transformacion y carga (load)
--data raw: data en bruto (sin procesar)
--EXTRACCION
--CREAR UNA TABLA TEMPORAL QUE RECIBA LA DATA RAW
--LOS CAMPOS DE LA TT SON TODOS TEXTO

use programbi_nov

drop table #carga_salarios
create table #carga_salarios (id_empleado varchar(max), 
apellido varchar(max),
nombre varchar(max),
seccional varchar(max), 
facultad varchar(max),
cargo varchar(max),
salario varchar(max), 
fecha_comienzo varchar(max),
fecha_nacimiento varchar(max))

BULK INSERT #carga_salarios
FROM '/Base_salarios_2.csv'
WITH(FIELDTERMINATOR=';',
ROWTERMINATOR='\n',FIRSTROW=2)

select * from #carga_salarios

SELECT * FROM carga_salarios_bu
SELECT * FROM salarios

create table salarios2 (id_empleado int, 
apellido varchar(max),
nombre varchar(max),
seccional varchar(max), 
facultad varchar(max),
cargo varchar(max),
salario float, 
fecha_comienzo date,
fecha_nacimiento date)

--TRANSFORMACION Y CARGA

INSERT INTO salarios2 select 
CONVERT(int,trim(id_empleado)),
TRIM(apellido),
TRIM(nombre),
TRIM(Seccional),
TRIM(Facultad),
TRIM(Cargo),
CONVERT(float,salario),
dbo.conversion_fecha(fecha_comienzo),
dbo.conversion_fecha(fecha_nacimiento)
FROM #carga_salarios

select * from salarios2

--INSTRUCCIONES DINÁMICAS

EXEC('select * from salarios2')

-- Crear una instruccion dinámica que lea todas las tablas
-- Si quiero ver cuantas tablas hay en mi base de datos, utilizo INFORMATION_SCHEMA


select distinct table_name from Programbi1.INFORMATION_SCHEMA.TABLES

--cursor que alimente la variable tabla, e itere
DECLARE @tabla varchar(max)
set @tabla = 'employees'
EXEC('SELECT COUNT(*) FROM '+@tabla)
--procedimiento de carga con instruccion dinámica
declare @sql varchar(max)
set @sql='BULK INSERT #carga_salarios FROM '''+@ruta+'''WITH(FIELDTERMINATOR='';'',ROWTERMINATOR=''\n'',FIRSTROW=2)'
EXEC(@sql)

