# ProgramBI SQL-Entrega 2
Profesor: Juan Carrasco Pastrián <br>
> **Entrega de evaluación**: Enviar un mail a juanoale@gmail.com donde el asunto sea "E2 Noviembre 2022 - NombreyApellido". 
> Se recibirán archivos hasta el Jueves 24-11-2022 a las 23:59. <br>
**Puntaje Máximo**: 100 puntos.  
## Data

Se disponen de datos respecto a la aparición en noticias del ex presidente de Estados Unidos, Donald Trump durante los primeros 8 meses de mandato, entre enero y agosto de 2017. La data está disponible en el siguiente archivo csv 

https://raw.githubusercontent.com/GoogleTrends/data/master/09252017_TrumpNewsEventsIndexedTogether.csv

En el archivo linkeado arriba se tiene una columna para cada noticia, y sus apariciones por fecha (primera columna). En un **segundo archivo**, que se disponibiliza en el siguiente link:

https://drive.google.com/file/d/1ckZJ8CMEGRcNXee-gaGYDfOuGbSqP7yZ/view?usp=sharing

Se tiene la misma data procesada a forma normal, es decir, con 3 columnas que representan la fecha, un codigo de la noticia (c_1 noticia de primera columna, c_2 segunda columna y así) y las apariciones en cada una. 

## Enunciado

Para la resolución de la entrega 2 se solicita cargar los archivos csv en una tabla de su base de datos de trabajo local (la carga es la Parte 0 y tiene un puntaje de 30 puntos, de un total de 100), y resolver las siguientes preguntas:

- (Parte 1: 60 puntos de 100) Obtener a través de queries las 5 noticias donde hubo mayores apariciones del nombre 'Donald Trump' Hint: investigue el INFORMATION_SCHEMA y construya una tabla de paso para hacer un cruce con la data en forma normal. 
- (Parte 2: 10 puntos de 100) Obtener una query que permita agregar (sumar) las apariciones por año_mes y determinar el mes con mayores apariciones. 

## Entrega

Entregar un archivo Power Point (ppt o pptx) con pantallazos que incluyan:
- La carga de los datos dentro de su base en SSMS o Azure Data Studio.
- Pantallazo(s) de la Parte 1 solicitada corriendo y mostrando resultados en SSMS / Azure Data Studio.
- Pantallazo(s) de la Parte 2 solicitada corriendo y mostrando resultados en SSMS / Azure Data Studio.
