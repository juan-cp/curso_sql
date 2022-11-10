use programbi_nov
--LLAVE PRIMARIAS (PK)
--recrear la tabla monedas (clase pasada) con llaves primarias
select * from Monedas
order by fecha asc, Moneda_Numerador asc, moneda_denominador asc

create table monedas_2(fecha date, 
moneda_num varchar(3), 
moneda_den varchar(3), 
valor float, 
primary key (fecha, moneda_num, moneda_den))

insert into monedas_2(fecha, moneda_num, moneda_den, valor) values('2019-01-02','USD','CLP',729)
insert into monedas_2(fecha, moneda_num, moneda_den, valor) values('2019-01-02','USD','CLP',830)
insert into monedas_2(moneda_num, moneda_den, valor) values('USD','CLP',830)

select * from monedas_2
--campo autoincremental

create table monedas_3(fecha date, 
moneda_num varchar(3), 
moneda_den varchar(3), 
valor float,
contador int identity) 

insert into monedas_3(fecha, moneda_num, moneda_den, valor) values('2019-01-02','USD','CLP',830)

select * from monedas_3


--LLave Foranea (FK)
--para el caso salarios$

select * from salarios
select distinct cargo from salarios
--crear un modelo hipotetico que tenga una tabla
--que posea todos los cargos posibles
--y una nueva tabla salarios que referencia a esa tabla cargos

create table registro_cargos(cargo_reg varchar(20) primary key)
--insercion rapida
insert into registro_cargos select distinct cargo from salarios
select * from registro_cargos

create table salarios_2(
id_empleado int,
apellido varchar(25),
nombre varchar(25),
seccional varchar(25),
facultad varchar(25),
cargo varchar(20) references registro_cargos(cargo_reg),
salario float,
fch_com date,
fch_nac date)

insert into salarios_2 values(1979,'perez','juan','santiago','Ingeniería','Profesor',
324234234,'1980-05-01','1967-10-18')
insert into salarios_2 values(1979,'perez','juan','santiago','Ingeniería','Ay. Laboratorio',
324234234,'1980-05-01','1967-10-18')
--solucionarlo
insert into registro_cargos values('Profesor')
select * from salarios_2
select * from registro_cargos

--Tabla salarios
-- agrupación de salarios más altos por cargo en una facultad determinada

select * from salarios

select cargo, max(salario) as max_salario
from salarios
where facultad = 'Ingeniería'
group by cargo 

select cargo, max(salario) as max_salario
from salarios
where facultad = 'Medicina'
group by cargo 

--parametrizar
--declarar una variable 

declare @facultad varchar(20)
set @facultad = 'Ingeniería'

select cargo, max(salario) as max_salario
from salarios
where facultad = @facultad
group by cargo 

--
declare @x int
declare @y int
set @x=2
set @y=3

--print: mostrar abajo en la consola

print(@x+@y)

--declaracion de funciones 
--crear una funcion que entregue el salario promedio de una facultad 
-- hacer querytest: crear la query que me entrega ese resultado

select AVG(salario) from salarios where facultad='Medicina'


-- INPUT(entrada) : facultad (VARCHAR)
-- OUTPUT(salida): promedio de salarios (FLOAT)

CREATE FUNCTION retorna_promedio(@facultad varchar(20))
RETURNS FLOAT
BEGIN
	--crear (declarar) una variable de salida
	declare @resultado float
	set @resultado= (select avg(salario) from salarios where facultad=@facultad)
	--funcion escalar: por que sale 1 valor unidimensional 
	return @resultado 
END

--como llamar a la funcion
select dbo.retorna_promedio('Medicina')
select dbo.retorna_promedio('Ingeniería')
select dbo.retorna_promedio('Arquitectura')

--muestrame las personas de medicina donde el salario es mayor al promedio
select * from salarios
where facultad='Medicina'
and salario > dbo.retorna_promedio('Medicina')

select avg(salario) from salarios$ where facultad='Medicina'

--para cambiar o editar : alter
ALTER FUNCTION retorna_promedio
BEGIN
…...

END

--borrado
DROP FUNCTION retorna_promedio

--Crear una tabla temporal 
select salarios.*,
case
when salario>500000 then 'A'
when salario<=500000 then  'B'
end as tipo
into #salarios_temp
from salarios

select * from #salarios_temp


--backup de respaldo
select * 
into #tt
from salarios


delete from #tt
update #tt set .... 
