use programbi_nov

select * from Salarios
--borrando primera columna
alter table salarios drop column column1

--ejemplos de wildcards o patrones
-- encontrar apellidos que partan con la letra d
select * from salarios where apellido like 'd%'
-- apellidos que partan con "DI" y tengan 2 caracteres mas (xej Diaz o Diez) 
select * from salarios where apellido like 'di__'

--eliminar los espacios en los bordes: comando TRIM()
select * from salarios where trim(apellido) like 'di__'

--ejemplo: apellidos que partan con A, B, o C
select * from salarios 
where trim(apellido) like 'a%' 
or trim(apellido) like 'b%' 
or trim(apellido) like 'c%'
-- forma corta
select * from salarios where trim(apellido) like '[a,b,c]%'
-- ejemplo: apellidos que partan con A,B,C,D,E,F,G
select * from salarios where trim(apellido) like '[a,b,c,d,e,f,g]%'
--forma mas corta
select * from salarios where trim(apellido) like '[a-g]%'
-- apellidos que partan con A y terminen con vocal
select * from salarios where trim(apellido) like 'A%[a,e,i,o,u]'


--GROUP BY
select * from salarios
--total de sueldos por cargo y facultad

--as al lado de una columna: nombrar columna
select cargo, facultad, sum(salario) as suma_sueldos
from salarios
group by cargo, facultad

--buscar maximo salario por cargo en la escuela de ingeniería
select cargo, max(salario) as max_salario
from salarios
where facultad = 'Ingeniería'
group by cargo

--contar cuantas facultades hay 

select count(facultad) from salarios
--operadores de agregación pueden usar un distinct dentro 
-- y con ello agregar sin duplicados
select count(distinct facultad) from salarios
select distinct facultad from salarios

-- DELETE / UPDATE

select * from productos
--borrar todo
DELETE FROM productos
TRUNCATE TABLE productos
--borrar con cantidad menor a 50
DELETE FROM productos WHERE cantidad < 50

select * from salarios

-- UPDATE : duplicar el salario de todos 
UPDATE salarios set salario=2*salario
--este cambio es reversible
UPDATE salarios set salario=salario/2

select * from salarios

--Update de cambiar nombre de cargo "Docente" a "Profesor"
update salarios set cargo='Profesor' where cargo='Docente'

--es reversible?
update salarios set cargo='Docente' where cargo='Profesor'

--Ej: desvincular al empleado 1011
delete from salarios where id_empleado=1011

-- INSTRUCCION CASE - WHEN
select * from salarios
-- nueva columna que diga A si salario > 500000, B si salario <=500000
-- cuando queremos seleccionar todos los campos => *
-- cuando queremos seleccionar todos los campos, y agregar uno adicional => TABLA.*

select salarios.* , 
case
when salario>500000 then 'A'
when salario<=500000 then  'B'
end as tipo,
case when nombre like 'l%' then 'SI' else 'NO' end as parte_L
 from salarios

-- mostrar nombre, apellido y nueva columna si es que nombre parte con 'L'

create view vista_salarios1 as
select salarios.* , 
case
when salario>500000 then 'A'
when salario<=500000 then  'B'
end as tipo,
case when nombre like 'l%' then 'SI' else 'NO' end as parte_L
 from salarios

select * from dbo.vista_salarios1




















