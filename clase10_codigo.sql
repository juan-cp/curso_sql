--Ejercicio 1 parte 1


CREATE TABLE series(fecha date,serie1 float,serie2 float,serie3 float, serie4 float, serie5 float)

BULK INSERT series FROM '/series_precios.csv'
WITH (FIELDTERMINATOR=';', ROWTERMINATOR='\n',FIRSTROW=2)

SELECT * FROM series

--Parte 2---
--consulta para ver cuantos meses hay
SELECT DISTINCT TRIM(STR(YEAR(fecha)))+'-'+TRIM(STR(MONTH(fecha)))+'-01' FROM series

select eomonth(a.fecha_unica,-1) as finicio,eomonth(a.fecha_unica,0) as ftermino
into #fechas
from (
select distinct convert(date,trim(concat(year(fecha),'-',month(fecha),'-01'))) 
as fecha_unica
from series) as a

select * from #fechas
--entonces la consulta final es:
SELECT EOMONTH(subquery.fech,-1) as finicio, EOMONTH(subquery.fech,0) as ftermino
INTO #fechas
FROM(
SELECT DISTINCT TRIM(STR(YEAR(fecha)))+'-'+TRIM(STR(MONTH(fecha)))+'-01' as fech FROM series
)as subquery
ORDER BY ftermino ASC

SELECT * FROM #fechas

-------P3------

SELECT B.f, 100*(B.v-A.v)/A.v as retorno 
FROM

(SELECT #fechas.finicio as f, series.serie1 as v 
FROM #fechas INNER JOIN series ON (#fechas.finicio=series.fecha)) as A 

LEFT JOIN

(SELECT #fechas.ftermino as f, series.serie1 as v 
FROM #fechas INNER JOIN series ON (#fechas.ftermino=series.fecha)) as B

ON EOMONTH(A.f,1)=B.f



--P4-----

DECLARE @nombre_serie varchar(MAX)
SET @nombre_serie='serie1'

EXEC(
'SELECT B.f,'''+@nombre_serie+''', 100*(B.v-A.v)/A.v as retorno 
INTO #prueba1
FROM

(SELECT #fechas.finicio as f, series.'+@nombre_serie+' as v 
FROM #fechas INNER JOIN series ON (#fechas.finicio=series.fecha)) as A 

LEFT JOIN

(SELECT #fechas.ftermino as f, series.'+@nombre_serie+' as v 
FROM #fechas INNER JOIN series ON (#fechas.ftermino=series.fecha)) as B

ON EOMONTH(A.f,1)=B.f'
)
DECLARE @nombre_serie varchar(MAX)
SET @nombre_serie='serie1'
SELECT B.f,@nombre_serie, 100*(B.v-A.v)/A.v as retorno 
INTO #prueba1
FROM

(SELECT #fechas.finicio as f, series.serie1 as v 
FROM #fechas INNER JOIN series ON (#fechas.finicio=series.fecha)) as A 

LEFT JOIN

(SELECT #fechas.ftermino as f, series.serie1 as v 
FROM #fechas INNER JOIN series ON (#fechas.ftermino=series.fecha)) as B

ON EOMONTH(A.f,1)=B.f

create table retornos_calculados(fecha date, rs1 float, rs2 float, rs3 float, rs4 float)
select * from retornos_calculados

insert into retornos_calculados (rs1) SELECT 100*(B.v-A.v)/A.v as retorno 
FROM

(SELECT #fechas.finicio as f, series.serie1 as v 
FROM #fechas INNER JOIN series ON (#fechas.finicio=series.fecha)) as A 

LEFT JOIN

(SELECT #fechas.ftermino as f, series.serie1 as v 
FROM #fechas INNER JOIN series ON (#fechas.ftermino=series.fecha)) as B

ON EOMONTH(A.f,1)=B.f



--CONTINUACION EJERCICIO FINAL
--p5----
select * from #fechas
select eomonth(a.fecha_unica,-1) as finicio,eomonth(a.fecha_unica,0) as ftermino
into #fechas
from (
select distinct convert(date,trim(concat(year(fecha),'-',month(fecha),'-01'))) 
as fecha_unica
from series) as a
use programbi1


SELECT B.f,100*(B.v-A.v)/A.v as retorno 
INTO #retornos_serie1
FROM(
SELECT #fechas.finicio as f, series.serie1 as v 
FROM #fechas LEFT JOIN series ON (#fechas.finicio=series.fecha)) as A LEFT JOIN
(
SELECT #fechas.ftermino as f, series.serie1 as v 
FROM #fechas LEFT JOIN series ON (#fechas.ftermino=series.fecha)) as B
ON EOMONTH(A.f,1)=B.f

select top 1 *  from #retornos_serie1
order by retorno desc

--p5
select min(subquery.retorno) from (
select top 2 *  from #retornos_serie1
order by retorno desc) as subquery

select top 1 *  from #retornos_serie1
where retorno not in (
    select top 1 retorno  from #retornos_serie1
    order by retorno desc
)
order by retorno desc



---p7----

select fecha, serie1,
case when datepart(dw,fecha)=1 or datepart(dw,fecha)=7 then 0 else 1 end as flag
 from series

 --subquery 

select avg(subquery.serie1) from
(
select fecha, serie1,
case when datepart(dw,fecha)=1 or datepart(dw,fecha)=7 then 0 else 1 end as flag
 from series
) as subquery
where subquery.flag=1

--forma shortcut

select avg(serie1)
 from series
 where case when datepart(dw,fecha)=1 or datepart(dw,fecha)=7 then 0 else 1 end =1


SELECT fecha, serie1,
CASE WHEN DATEPART(dw,fecha)=1 or DATEPART(dw,fecha)=7 THEN 0
ELSE 1
END as flag_dh
FROM series


--p8----
SELECT AVG(A.valores) FROM(
SELECT fecha as dt, serie1 as valores,
CASE WHEN DATEPART(dw,fecha)=1 or DATEPART(dw,fecha)=7 THEN 0
ELSE 1
END as flag_dh
FROM series) as A
WHERE A.flag_dh=1

SELECT AVG(A.valores) FROM(
SELECT fecha as dt, serie1 as valores,
CASE WHEN DATEPART(dw,fecha)=1 or DATEPART(dw,fecha)=7 THEN 0
ELSE 1
END as flag_dh
FROM series) as A

--p9---

INSERT INTO series VALUES('2019-12-31',4000,5000,6000,7000,8000)
INSERT INTO series VALUES('2020-01-05',4000,5000,6000,7000,8000)
INSERT INTO series VALUES('2020-01-05',5666,5000,6000,7000,8000)

DECLARE @condicion int
SET @condicion = (SELECT C.conteo 
FROM (SELECT TOP 1 fecha,
COUNT(serie1) as conteo 
FROM series GROUP BY fecha 
ORDER BY Count(Serie1) DESC) as C)

