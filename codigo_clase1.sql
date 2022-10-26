-- Hola, este es un comentario
-- comentario1
-- comentario2

create database programbi_nov
use programbi_nov

--borrar base de datos
drop database programbi_nov

--ejemplo: crear nuestra primera tabla
create table mitabla (nombre varchar(20), edad int, fecha_nacimiento date)
--borrar tabla 
drop table mitabla
--alter : modificar una tabla 
-- agregar un campo nuevo
alter table mitabla add apellido varchar(20)
-- borrar una columna 
alter table mitabla drop column edad
