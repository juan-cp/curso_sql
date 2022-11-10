# ProgramBI SQL-Entrega 3
Profesor: Juan Carrasco Pastrián <br>
> **Entrega de evaluación**: Enviar un mail a juanoale@gmail.com donde el asunto sea "E3 Noviembre 2022 - NombreyApellido". 
> Se recibirán archivos hasta el Martes 06-12-2022 a las 23:59. <br>
**Puntaje Máximo**: 100 puntos.  
## Data

El archivo worldcitiespop.csv (descargable en https://drive.google.com/file/d/1RBcln52DHn4AHbbuUWd2wEGp_jKZeHIZ/view) contiene un amplio registro de ciudades a nivel mundial. Realizaremos distintas consultas sobre estos datos, pero en principio debemos identificar algunos de los campos relevantes: Country (código país), City (ciudad), AccentCity (nombre ciudad con caracteres especiales), Region (region del país a la que pertenece la ciudad, es un identificador, mas no la numeración real que pueda tener dicha región en el país), Population (población, no se tienen todos los datos), Latitude (+90 NP / 0= Ecuador / −90 SP), Longitude, (−180 a 0 al oeste del meridiano 0, 0 a +180 al este del meridiano 0)
Cargar los datos en una tabla en SQL Server (usando Bulk load) y elaborar las consultas para analizar cada uno de los siguientes problemas.


## Enunciado

¿Es Santiago el centro de Chile? a partir de los datos determinar una ciudad representativa del centro del país. Para ello resolveremos primero las siguientes preguntas:

- (30 puntos) Encontrar la latitud máxima y mínima del país (recuerde que para el caso de chile serán números negativos) y calcular el punto medio del país de norte a sur usando la fórmula (longitud máx + longitud mín)/2 (sumar y dividir por 2, promedio simple).

- (30 puntos) Almacenar el punto medio en una variable y utilizarla para encontrar las ciudades que se ubican en el rango de latitud punto medio-0.1 y punto medio+0.1.

- (10 puntos) Al analizar el campo Population en Chile, se aprecia que no todas las ciudades tienen este dato. De la muestra obtenida en el item anterior, ¿Cuál(es) ciudad(es) tiene(n) el dato de población incluído? Concluya a partir de este filtro cuál es la ciudad centro de Chile.

## Rúbrica de puntaje

- Carga de datos por medio de BULK INSERT: 30 puntos
- Resolución de preguntas: 70 puntos


## Entrega

Entregar un archivo Power Point (ppt o pptx) con pantallazos que incluyan:
- La carga de los datos dentro de su base en SSMS o Azure Data Studio.
- Pantallazo(s) de la carga en SSMS / Azure Data Studio.
- Pantallazo(s) de cada una de las preguntas solicitadas corriendo y mostrando resultados en SSMS / Azure Data Studio.
