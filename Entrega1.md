# ProgramBI SQL-Entrega 1
Profesor: Juan Carrasco Pastrián <br>
> **Entrega de evaluación**: Enviar un mail a juanoale@gmail.com donde el asunto sea "E1 Noviembre 2022 - NombreyApellido". 
> Se recibirán archivos hasta el Martes 15-11-2022 a las 23:59. <br>
**Puntaje Máximo**: 100 puntos.  

En una empresa de software y capacitaciones se está desarrollando un sistema de evaluación  como parte de un paquete de e-learning comercial. En este sistema, los tests consisten de 1 ó más preguntas con alternativas. Se cuenta con el siguiente modelo de datos relacional para modelar los tests:

`test(tnum INT, titulo VARCHAR,curso VARCHAR,descripcion VARCHAR,autor VARCHAR)`<br>
`preg(tnum INT,pnum INT,enunciado VARCHAR)`<br>
`pregalt(tnum INT,pnum INT,alt CHAR,texto VARCHAR,correcta BIT)`  <br>

Responder la consulta SQL que resuelve las siguientes preguntas:<br>
- Sobrescribir el test X con el test Y (X, Y son tnum).
- Número de tests por curso.
- Determinar los tests con falencias. Un test tiene falencias si no tiene preguntas, si su primera pregunta (pnum) no está numerada 1, si las preguntas no son consecutivas (ej. 1,2,4,5,8), si hay preguntas con 1 ó menos alternativas3, si todas las alternativas son verdaderas o si todas las alternativas son falsas. 
