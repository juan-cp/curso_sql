use programbi_nov

--Ejemplo: crear una tabla productos con 4 campos: codigo (entero), nombre, precio (no necesariamente)
-- entero y un cantidad (entero)

create table productos(codigo int, nombre_producto varchar(30), precio float, cantidad int)
--insertar registros

insert into productos values(1,'mesa',40000,100)
insert into productos values(2,'pantalla',150000,100)
insert into productos values(3,'TV',200000,50)
insert into productos values(4,'Telefono',90000,10)
insert into productos values(5,'Notebook',200000,5)

--vaciar tabla
truncate table productos
--borrar tabla
drop table productos


select * from productos 
select codigo, nombre_producto from productos

select * from Monedas
select fecha, moneda_numerador, moneda_denominador, valor from Monedas
select Valor from Monedas


--seleccionar todo *
select * from productos
--seleccionar algunas
select nombre_producto, precio from productos

--ej: productos con más de 10 items en inventario
select * from productos where cantidad > 10
--ej: productos con 10 items o más en inventario
select * from productos where cantidad >= 10
--ej: items con mas de 10 en inventario y valor mayor a 100000
select * from productos where cantidad > 10 and precio > 100000 
--ej: items con mas de 50 o menos de 20 en inventario
select * from productos where cantidad > 50 or cantidad < 20

-- Moneda Num = USD y Moneda Denom = CLP
  select distinct fecha, Moneda_Numerador, Moneda_denominador, valor from Monedas
  where moneda_numerador = 'USD' and moneda_denominador='CLP'
  order by fecha desc

  select distinct * from Monedas
  where moneda_numerador = 'USD' and moneda_denominador='CLP'
  order by fecha desc

select distinct fecha, Moneda_Numerador, Moneda_denominador, valor from Monedas
  where moneda_numerador = 'USD' and --moneda_denominador in ('CLP','COP')
   (moneda_denominador='CLP' or
  moneda_denominador='COP')
  order by fecha desc
--EQUIVALENTEMENTE
select distinct fecha, Moneda_Numerador, Moneda_denominador, valor from Monedas
  where moneda_numerador = 'USD' and moneda_denominador in ('CLP','COP')
  order by fecha desc

    select distinct fecha, Moneda_Numerador, Moneda_denominador, valor from Monedas
  where moneda_numerador = 'USD' and moneda_denominador='CLP'
  and (valor >=600 and valor <=700)
  order by fecha desc
--EQUIVALENTE
    select distinct fecha, Moneda_Numerador, Moneda_denominador, valor from Monedas
  where moneda_numerador = 'USD' and moneda_denominador='CLP'
  and valor between 600 and 700
  order by fecha desc
--TAMBIEN SIRVE PARA FILTRAR FECHAS 
   select distinct fecha, Moneda_Numerador, Moneda_denominador, valor from Monedas
  where moneda_numerador = 'USD' and moneda_denominador='CLP'
  and fecha between '2019-08-01' and '2019-08-30'
  order by fecha desc

