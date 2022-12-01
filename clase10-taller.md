# Ejercicio Final

El archivo series_precios.csv contiene los precios diarios de 5 indices ampliamente utilizados en el mercado financiero. En el se incluyen además los días no hábiles, en cuyo caso se repite el precio de cierre del último día hábil disponible. Respecto a este archivo:

- Construya una tabla temporal #fechas que tenga la fecha de fin de mes anterior (fecha inicio) y la fecha de fin de mes (fecha término) para todos los meses que dispone la data.

- Construya una consulta que entregue el retorno mensual de una de las series (por ejemplo, serie1), donde sus campos sean la fecha de término del mes y el retorno, el cual calcularemos usando la expresión 

$$Retorno=100*\left(\frac{Precio Final-Precio Inicial}{Precio Inicial}\right)$$

- Utilice la consulta realizada en (3) para construir una consulta dinámica donde al cambiar el nombre de la serie, se obtenga una tabla de retornos.

- Elabore una consulta que obtenga el máximo retorno para una serie, y en qué mes se da.

- Elabore una consulta para obtener el segundo mayor retorno (sólo el retorno, sin fecha)

- Para la serie1 de precios, elaborar un flag(o campo binario) donde valga 1 si el día es hábil y 0 si no

- Calcular el promedio para los días hábiles (sólo serie de precios)

- Elabore un control que permita detectar si hay precios duplicados.
